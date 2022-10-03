Return-Path: <abdellatif.elkhlifi@arm.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04A9C4167B
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.65.1664802078277677046
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A030A16F8;
	Mon,  3 Oct 2022 06:01:24 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9969C3F73B;
	Mon,  3 Oct 2022 06:01:15 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 06/12] arm-bsp/trusted-services: corstone1000: add secure
 partitions support
Date: Mon,  3 Oct 2022 14:00:45 +0100
Message-Id: <20221003130051.28934-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3900

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

support for ts-smm-gateway and ts-se-proxy secure partitions

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |    4 +
 ...corstone1000-platform-to-drivers-arm.patch |   36 +
 ...on-applying-lowercase-project-conven.patch |   33 -
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch |   32 -
 ...0003-corstone1000-port-crypto-config.patch |  234 --
 ...proxy-dts-add-se-proxy-as-child-node.patch |   46 -
 ...te-mm-comm-buffer-region-in-dts-file.patch |   59 -
 .../0005-Configure-NV-storage-macro.patch     |   26 -
 .../corstone1000/0006-Use-device-region.patch |   53 -
 ...7-Add-openamp-to-SE-proxy-deployment.patch |  259 --
 ...iver-and-the-OpenAmp-conversion-laye.patch | 1093 -------
 .../0009-Add-openamp-rpc-caller.patch         | 1197 --------
 ...-add-psa-client-definitions-for-ff-m.patch |  299 --
 ...mon-service-component-to-ipc-support.patch |  295 --
 .../0012-Add-secure-storage-ipc-backend.patch |  523 ----
 ...storage-ipc-and-openamp-for-se_proxy.patch |   63 -
 ...d-uefi-variable-append-write-support.patch | 1162 --------
 ...riable-support-for-QueryVariableInfo.patch |  830 ------
 .../0016-Add-uefi-test-deployment.patch       |  248 --
 ...-parameter-setting-in-sp-ffarpc_call.patch |   33 -
 ...-call-requests-with-no-shared-buffer.patch |  109 -
 .../corstone1000/0019-Run-psa-arch-test.patch |   86 -
 ...0020-Use-address-instead-of-pointers.patch |  169 --
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  267 --
 ...d-as-openamp-rpc-using-secure-storag.patch |  164 --
 .../0023-add-psa-ipc-crypto-backend.patch     | 2586 -----------------
 ...MM-gateway-UEFI-variable-macro-value.patch |   34 -
 ...ub-capsule-update-service-components.patch |  436 ---
 ...-logs-to-functions-in-SMM-gateway-SP.patch |  248 --
 .../0027-Configure-storage-size.patch         |   41 -
 ...d-uefi-variable-append-write-support.patch | 1219 --------
 ...-Change-UID-of-variable-index-in-SMM.patch |   31 -
 ...-Add-missing-features-to-setVariable.patch |   73 -
 ...rameter-check-in-getNextVariableName.patch |   55 -
 ...teway-add-checks-for-null-attributes.patch |   81 -
 .../0033-Enhance-mbedtls-fetch-process.patch  |  258 --
 ...x-format-specifier-in-logging_caller.patch |   41 -
 ...for-mbedtls-and-psa-arch-tests-for-v.patch |   64 -
 ...n-verify-message-and-hash-operations.patch | 1080 -------
 ...nst-uninitialised-multi-part-transac.patch |  123 -
 ...038-Integrate-AEAD-operation-support.patch |  521 ----
 ...eration-to-one-shot-cipher-operation.patch |   96 -
 ...-Fix-multi-part-termination-on-error.patch |  241 --
 ...tion-if-client-provided-buffer-is-to.patch |   49 -
 ...g-to-updated-t_cose-version-fc3a4b2c.patch |   94 -
 .../0043-pass-sysroot_yocto.patch             |  110 -
 ...face-structure-aligned-with-tf-m-cha.patch |   29 -
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ----
 ...et_key_usage_flags-definition-to-the.patch |   40 -
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  120 -
 ...-UEFI-get_variable-with-small-buffer.patch |  407 ---
 ...mic-outline-to-fix-build-for-opemamp.patch |   44 -
 .../trusted-services/ts-corstone1000.inc      |  130 +-
 .../ts-sp-se-proxy_%.bbappend                 |    4 +
 .../ts-sp-smm-gateway_%.bbappend              |    4 +
 55 files changed, 54 insertions(+), 16019 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-proje=
ct-conven.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.pat=
ch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.pa=
tch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0005-Configure-NV-storage-macro.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0006-Use-device-region.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conver=
sion-laye.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0009-Add-openamp-rpc-caller.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0011-Add-common-service-component-to-ipc-support=
.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0012-Add-secure-storage-ipc-backend.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_p=
roxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0014-Add-uefi-variable-append-write-support.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariable=
Info.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0016-Add-uefi-test-deployment.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ff=
arpc_call.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared=
-buffer.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0019-Run-psa-arch-test.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0020-Use-address-instead-of-pointers.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secu=
re-storag.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0023-add-psa-ipc-crypto-backend.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-va=
lue.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0025-Add-stub-capsule-update-service-components.=
patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.pat=
ch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0027-Configure-storage-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0028-Revert-Add-uefi-variable-append-write-suppo=
rt.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0030-Add-missing-features-to-setVariable.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVaria=
bleName.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.=
patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-te=
sts-for-v.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-opera=
tions.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-par=
t-transac.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operat=
ion.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buf=
fer-is-to.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0043-pass-sysroot_yocto.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with=
-tf-m-cha.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.pat=
ch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definiti=
on-to-the.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.p=
atch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0048-Fix-UEFI-get_variable-with-small-buffer.pat=
ch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp=
.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
se-proxy_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
smm-gateway_%.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 44a9a56c..fd659a4c 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -40,6 +40,10 @@ EXTRA_IMAGEDEPENDS +=3D "optee-os"
 OPTEE_ARCH =3D "arm64"
 OPTEE_BINARY =3D "tee-pager_v2.bin"
=20
+# Include smm-gateway and se-proxy SPs into optee-os binary
+MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
+TS_PLATFORM =3D "arm/corstone1000"
+
 # External System(Cortex-M3)
 EXTRA_IMAGEDEPENDS +=3D "external-system"
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0026-plat-add-corstone1000-platform-to-drivers-arm.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-=
platform-to-drivers-arm.patch
new file mode 100644
index 00000000..3b15c721
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-pl=
at-add-corstone1000-platform-to-drivers-arm.patch
@@ -0,0 +1,36 @@
+From d262ab277a87c1cda4f71137f6bb963066ba6997 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Tue, 13 Sep 2022 16:46:14 +0100
+Subject: [PATCH 26/27] plat: add corstone1000 platform to drivers/arm
+
+This change is to add corstone1000 platform cmake. Smm gateway
+uses SE proxy to route the calls for any NV storage.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/providers/arm/corstone1000/platform.cmake | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+ create mode 100644 platform/providers/arm/corstone1000/platform.cmake
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+new file mode 100644
+index 00000000..14a9f6b0
+--- /dev/null
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -0,0 +1,12 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++# Platform definition for the corstone1000 platform.
++#----------------------------------------------------------------------=
---------
++
++target_compile_definitions(${TGT} PRIVATE
++	SMM_GATEWAY_NV_STORE_SN=3D"sn:ffa:46bb39d1-b4d9-45b5-88ff-040027dab249=
:1"
++)
++
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-conv=
en.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0001-tools-cmake-common-applying-lowercase-project-conven=
.patch
deleted file mode 100644
index 83c7b545..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0001-tools-cmake-common-applying-lowercase-project-conven.patc=
h
+++ /dev/null
@@ -1,33 +0,0 @@
-From 73c27b917e15eb04f39eedac9b79e5011e8a754f Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Sat, 13 Nov 2021 07:47:44 +0000
-Subject: [PATCH] tools/cmake/common: applying lowercase project conventi=
on
-
-Lowercase convention should only apply on the paths inside TS
-source-code.
-Host build paths should not be lowercased. Otherwise, builds
-with uppercase paths will break.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-
----
- tools/cmake/common/AddPlatform.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/cmake/common/AddPlatform.cmake b/tools/cmake/common/A=
ddPlatform.cmake
-index ae34c6e4..31bcd8ca 100644
---- a/tools/cmake/common/AddPlatform.cmake
-+++ b/tools/cmake/common/AddPlatform.cmake
-@@ -37,8 +37,8 @@ function(add_platform)
- 	set(TGT ${MY_PARAMS_TARGET} CACHE STRING "")
-=20
- 	# Ensure file path conforms to lowercase project convention
--	string(TOLOWER "${TS_PLATFORM_ROOT}/${TS_PLATFORM}/platform.cmake" _pl=
atdef)
--	include(${_platdef})
-+	string(TOLOWER "${TS_PLATFORM}/platform.cmake" _platdef)
-+	include(${TS_PLATFORM_ROOT}/${_platdef})
- 	set(CMAKE_CONFIGURE_DEPENDS ${_platdef})
-=20
- 	unset(TGT CACHE)
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch b/meta-arm-b=
sp/recipes-security/trusted-services/secure-partitions/corstone1000/0002-=
fix-EARLY_TA_PATHS-env-variable.patch
deleted file mode 100644
index f56b4553..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 146f4dfa73aa316d611188f63e3530cffe9200af Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Sat, 13 Nov 2021 07:51:53 +0000
-Subject: [PATCH] fix EARLY_TA_PATHS env variable
-
-Yocto cleans up environment varaibles at build time.
-EARLY_TA_PATHS should be set a separate rule for securepartitions
-to be included into optee-os image
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-
----
- environments/opteesp/sp.mk.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/environments/opteesp/sp.mk.in b/environments/opteesp/sp.mk.=
in
-index c44ad59e..d67e2dca 100644
---- a/environments/opteesp/sp.mk.in
-+++ b/environments/opteesp/sp.mk.in
-@@ -14,7 +14,8 @@ ifeq (,${@EXPORT_SP_UUID@-included})
- endif
-=20
- ifeq (embedded,${SP_PACKAGING_METHOD})
--OPTEE_OS_COMMON_EXTRA_FLAGS+=3DEARLY_TA_PATHS+=3D${TS_INSTALL_PREFIX}/o=
pteesp/bin/@EXPORT_SP_UUID@.stripped.elf
-+EARLY_TA_PATHS+=3D${TS_INSTALL_PREFIX}/bin/@EXPORT_SP_UUID@.stripped.el=
f
-+OPTEE_OS_COMMON_EXTRA_FLAGS+=3D${EARLY_TA_PATHS}
- TS_SP_DTSI_LIST+=3D"\\n\#include \"${TS_INSTALL_PREFIX}/opteesp/manifes=
t/@EXPORT_SP_UUID@.dtsi\""
- else ifeq (fip,${SP_PACKAGING_METHOD})
- TS_SP_JSON_LIST+=3D${TS_INSTALL_PREFIX}/opteesp/json/@EXPORT_SP_NAME@.j=
son
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0003-corstone1000-port-crypto-config.patch b/meta-arm-b=
sp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-=
corstone1000-port-crypto-config.patch
deleted file mode 100644
index 3b26b77a..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0003-corstone1000-port-crypto-config.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From f86f5b42d853d2a65f6753362361bbb95aac1800 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sat, 11 Dec 2021 11:06:57 +0000
-Subject: [PATCH] corstone1000: port crypto config
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-%% original patch: 0003-corstone1000-port-crypto-config.patch
----
- .../nspe/pal_crypto_config.h                  | 83 +++++++++++++++----
- 1 file changed, 66 insertions(+), 17 deletions(-)
-
-diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h
-index 844cd2e..c936bdd 100755
---- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
-+++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
-@@ -1,5 +1,5 @@
- /** @file
-- * Copyright (c) 2021, Arm Limited or its affiliates. All rights reserv=
ed.
-+ * Copyright (c) 2019-2020, Arm Limited or its affiliates. All rights r=
eserved.
-  * SPDX-License-Identifier : Apache-2.0
-  *
-  * Licensed under the Apache License, Version 2.0 (the "License");
-@@ -34,10 +34,14 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_RSA
- #define ARCH_TEST_RSA_1024
- #define ARCH_TEST_RSA_2048
- #define ARCH_TEST_RSA_3072
-+#endif
-+#endif
-=20
- /**
-  * \def  ARCH_TEST_ECC
-@@ -50,11 +54,17 @@
-  * Requires: ARCH_TEST_ECC
-  * Comment macros to disable the curve
-  */
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_ECC
- #define ARCH_TEST_ECC_CURVE_SECP192R1
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_ECC_CURVE_SECP224R1
-+#endif
- #define ARCH_TEST_ECC_CURVE_SECP256R1
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_ECC_CURVE_SECP384R1
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_AES
-@@ -78,10 +88,10 @@
-  *
-  * Comment macros to disable the types
-  */
--#define ARCH_TEST_DES
--#define ARCH_TEST_DES_1KEY
--#define ARCH_TEST_DES_2KEY
--#define ARCH_TEST_DES_3KEY
-+//#define ARCH_TEST_DES
-+//#define ARCH_TEST_DES_1KEY
-+//#define ARCH_TEST_DES_2KEY
-+//#define ARCH_TEST_DES_3KEY
-=20
- /**
-  * \def  ARCH_TEST_RAW
-@@ -104,7 +114,7 @@
-  *
-  * Enable the ARC4 key type.
-  */
--#define ARCH_TEST_ARC4
-+//#define ARCH_TEST_ARC4
-=20
- /**
-  * \def ARCH_TEST_CIPHER_MODE_CTR
-@@ -113,7 +123,11 @@
-  *
-  * Requires: ARCH_TEST_CIPHER
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CIPHER_MODE_CTR
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CIPHER_MODE_CFB
-@@ -138,7 +152,11 @@
-  *
-  * Requires: ARCH_TEST_CIPHER, ARCH_TEST_AES, ARCH_TEST_CIPHER_MODE_CTR
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CTR_AES
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CBC_AES
-@@ -157,7 +175,11 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CBC_NO_PADDING
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CFB_AES
-@@ -177,11 +199,15 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_PKCS1V15
- #define ARCH_TEST_RSA_PKCS1V15_SIGN
- #define ARCH_TEST_RSA_PKCS1V15_SIGN_RAW
- #define ARCH_TEST_RSA_PKCS1V15_CRYPT
- #define ARCH_TEST_RSA_OAEP
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CBC_PKCS7
-@@ -190,7 +216,11 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CBC_PKCS7
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_ASYMMETRIC_ENCRYPTION
-@@ -227,21 +257,27 @@
-  *
-  * Comment macros to disable the types
-  */
--// #define ARCH_TEST_MD2
--// #define ARCH_TEST_MD4
--#define ARCH_TEST_MD5
--#define ARCH_TEST_RIPEMD160
--#define ARCH_TEST_SHA1
-+//#define ARCH_TEST_MD2
-+//#define ARCH_TEST_MD4
-+//#define ARCH_TEST_MD5
-+//#define ARCH_TEST_RIPEMD160
-+//#define ARCH_TEST_SHA1
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_SHA224
-+#endif
- #define ARCH_TEST_SHA256
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_SHA384
- #define ARCH_TEST_SHA512
--// #define ARCH_TEST_SHA512_224
--// #define ARCH_TEST_SHA512_256
--// #define ARCH_TEST_SHA3_224
--// #define ARCH_TEST_SHA3_256
--// #define ARCH_TEST_SHA3_384
--// #define ARCH_TEST_SHA3_512
-+#endif
-+#endif
-+//#define ARCH_TEST_SHA512_224
-+//#define ARCH_TEST_SHA512_256
-+//#define ARCH_TEST_SHA3_224
-+//#define ARCH_TEST_SHA3_256
-+//#define ARCH_TEST_SHA3_384
-+//#define ARCH_TEST_SHA3_512
-=20
- /**
-  * \def ARCH_TEST_HKDF
-@@ -261,7 +297,12 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CMAC
-+#endif
-+#endif
-+//#define ARCH_TEST_GMAC
- #define ARCH_TEST_HMAC
-=20
- /**
-@@ -281,7 +322,11 @@
-  * Requires: ARCH_TEST_AES
-  *
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_GCM
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_TRUNCATED_MAC
-@@ -300,7 +345,9 @@
-  *
-  * Requires: ARCH_TEST_ECC
-  */
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_ECDH
-+#endif
-=20
- /**
-  * \def ARCH_TEST_ECDSA
-@@ -308,7 +355,9 @@
-  * Enable the elliptic curve DSA library.
-  * Requires: ARCH_TEST_ECC
-  */
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_ECDSA
-+#endif
-=20
- /**
-  * \def ARCH_TEST_DETERMINISTIC_ECDSA
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
deleted file mode 100644
index bb4fc82e..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0ec1b3d20d612325b9c55baa2539d080eb6a72a8 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Sat, 13 Nov 2021 08:34:42 +0000
-Subject: [PATCH] se-proxy:dts: add se-proxy as child node
-
-se-proxy sp string should be added for se-proxy node to be
-read properly.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-
----
- .../se-proxy/opteesp/default_se-proxy.dts.in  | 20 ++++++++++---------
- 1 file changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/depl=
oyments/se-proxy/opteesp/default_se-proxy.dts.in
-index 961071ad..9f5cf712 100644
---- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-+++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-@@ -7,13 +7,15 @@
- @DTS_TAG@
-=20
- @DTS_NODE@ {
--	compatible =3D "arm,ffa-manifest-1.0";
--	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
--	uuid =3D <@EXPORT_SP_UUID_DT@>;
--	description =3D "SE Proxy";
--	execution-ctx-count =3D <1>;
--	exception-level =3D <1>; /* S-EL0 */
--	execution-state =3D <0>; /* AArch64 */
--	xlat-granule =3D <0>; /* 4KiB */
--	messaging-method =3D <0>; /* Direct messaging only */
-+	se-proxy {
-+		compatible =3D "arm,ffa-manifest-1.0";
-+		ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
-+		uuid =3D <@EXPORT_SP_UUID_DT@>;
-+		description =3D "SE Proxy";
-+		execution-ctx-count =3D <1>;
-+		exception-level =3D <1>; /* S-EL0 */
-+		execution-state =3D <0>; /* AArch64 */
-+		xlat-granule =3D <0>; /* 4KiB */
-+		messaging-method =3D <0>; /* Direct messaging only */
-+	};
- };
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch b/m=
eta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1=
000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
deleted file mode 100644
index 9ceb176c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 97b4f3cd0216c30c39f6ece4f68d8faf3901fded Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Wed, 17 Nov 2021 15:31:09 +0000
-Subject: [PATCH] Update mm-comm-buffer region in dts file
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- .../opteesp/default_smm-gateway.dts.in        | 35 ++++++++++---------
- 1 file changed, 18 insertions(+), 17 deletions(-)
-
-diff --git a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in =
b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
-index 0ad7878b..183c38a7 100644
---- a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
-+++ b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
-@@ -7,23 +7,24 @@
- @DTS_TAG@
-=20
- @DTS_NODE@ {
--	compatible =3D "arm,ffa-manifest-1.0";
--	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
--	uuid =3D <@EXPORT_SP_UUID_DT@>;
--	description =3D "SMM Gateway";
--	execution-ctx-count =3D <1>;
--	exception-level =3D <1>; /* S-EL0 */
--	execution-state =3D <0>; /* AArch64 */
--	xlat-granule =3D <0>; /* 4KiB */
--	messaging-method =3D <0>; /* Direct messaging only */
--
--	memory-regions {
--		compatible =3D "arm,ffa-manifest-memory-regions";
--
--		mm-comm-buffer {
--			base-address =3D <@MM_COMM_BUFFER_ADDRESS@>;
--			pages-count =3D <@MM_COMM_BUFFER_PAGE_COUNT@>;
--			attributes =3D <0xb>;  /* ns access-read-write */
-+	smm-gateway{
-+		compatible =3D "arm,ffa-manifest-1.0";
-+		ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
-+		uuid =3D <@EXPORT_SP_UUID_DT@>;
-+		description =3D "SMM Gateway";
-+		execution-ctx-count =3D <1>;
-+		exception-level =3D <1>; /* S-EL0 */
-+		execution-state =3D <0>; /* AArch64 */
-+		xlat-granule =3D <0>; /* 4KiB */
-+		messaging-method =3D <0>; /* Direct messaging only */
-+		device-regions {
-+          compatible =3D "arm,ffa-manifest-device-regions";
-+          mm-comm-buffer {
-+              /* Armv8 A Foundation Platform values */
-+              base-address =3D <0x00000000 0x02000000>;
-+              pages-count =3D <1>;
-+              attributes =3D <0x3>; /* read-write */
-+              };
- 		};
- 	};
- };
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0005-Configure-NV-storage-macro.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/secure-partitions/corstone1000/0005-Confi=
gure-NV-storage-macro.patch
deleted file mode 100644
index 8d2d62bf..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0005-Configure-NV-storage-macro.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a11b23dd5f0c4124a5c6c2fcab0ea623bc76f4ba Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Wed, 17 Nov 2021 15:32:04 +0000
-Subject: [PATCH] Configure NV storage macro
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- deployments/smm-gateway/smm_gateway.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gat=
eway/smm_gateway.c
-index 4884a040..7828b3af 100644
---- a/deployments/smm-gateway/smm_gateway.c
-+++ b/deployments/smm-gateway/smm_gateway.c
-@@ -13,6 +13,8 @@
-=20
- /* Build-time default configuration */
-=20
-+#define SMM_GATEWAY_NV_STORE_SN "sn:ffa:46bb39d1-b4d9-45b5-88ff-040027d=
ab249:1"
-+
- /* Default to using the Protected Storage SP */
- #ifndef SMM_GATEWAY_NV_STORE_SN
- #define SMM_GATEWAY_NV_STORE_SN		"sn:ffa:751bf801-3dde-4768-a514-0f10ae=
ed1790:0"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0006-Use-device-region.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/secure-partitions/corstone1000/0006-Use-device-reg=
ion.patch
deleted file mode 100644
index eba1338e..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0006-Use-device-region.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ae22f5077d35e6acf3feb8a84a8ef7f599261b00 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Wed, 17 Nov 2021 15:32:46 +0000
-Subject: [PATCH] Use device region
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- deployments/smm-gateway/opteesp/smm_gateway_sp.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/deployments/smm-gateway/opteesp/smm_gateway_sp.c b/deployme=
nts/smm-gateway/opteesp/smm_gateway_sp.c
-index 6f138850..0bc09023 100644
---- a/deployments/smm-gateway/opteesp/smm_gateway_sp.c
-+++ b/deployments/smm-gateway/opteesp/smm_gateway_sp.c
-@@ -10,7 +10,7 @@
- #include <config/loader/sp/sp_config_loader.h>
- #include "components/rpc/mm_communicate/endpoint/sp/mm_communicate_call=
_ep.h"
- #include "components/service/smm_variable/frontend/mm_communicate/smm_v=
ariable_mm_service.h"
--#include "platform/interface/memory_region.h"
-+#include "platform/interface/device_region.h"
- #include <ffa_api.h>
- #include <sp_api.h>
- #include <sp_messaging.h>
-@@ -25,7 +25,7 @@ static int sp_init(uint16_t *own_sp_id);
-=20
- void __noreturn sp_main(struct ffa_init_info *init_info)
- {
--	struct memory_region mm_comm_buffer_region =3D { 0 };
-+	struct device_region mm_comm_buffer_region =3D { 0 };
- 	struct rpc_interface *gateway_iface =3D NULL;
- 	struct smm_variable_mm_service smm_var_service =3D { 0 };
- 	struct mm_service_interface *smm_var_service_interface =3D NULL;
-@@ -42,7 +42,7 @@ void __noreturn sp_main(struct ffa_init_info *init_inf=
o)
- 	config_ramstore_init();
- 	sp_config_load(init_info);
-=20
--	if (!config_store_query(CONFIG_CLASSIFIER_MEMORY_REGION, CONFIG_NAME_M=
M_COMM_BUFFER_REGION,
-+	if (!config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, CONFIG_NAME_M=
M_COMM_BUFFER_REGION,
- 				0, &mm_comm_buffer_region, sizeof(mm_comm_buffer_region))) {
- 		EMSG(CONFIG_NAME_MM_COMM_BUFFER_REGION " is not set in SP configurati=
on");
- 		goto fatal_error;
-@@ -57,7 +57,7 @@ void __noreturn sp_main(struct ffa_init_info *init_inf=
o)
- 	/* Initialize MM communication layer */
- 	if (!mm_communicate_call_ep_init(&mm_communicate_call_ep,
- 					 (void *)mm_comm_buffer_region.base_addr,
--					 mm_comm_buffer_region.region_size))
-+					 mm_comm_buffer_region.io_region_size))
- 		goto fatal_error;
-=20
- 	/* Attach SMM variable service to MM communication layer */
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/00=
07-Add-openamp-to-SE-proxy-deployment.patch
deleted file mode 100644
index eb51ef71..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
+++ /dev/null
@@ -1,259 +0,0 @@
-From 90712f624c7b676e5b9a2d95cbe97d2b63fddcc9 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 16:36:51 +0000
-Subject: [PATCH] Add openamp to SE proxy deployment
-
-Openamp is required to communicate between secure partitions(running on
-Cortex-A) and trusted-firmware-m(running on Cortex-M).
-These changes are to fetch libmetal and openamp from github repo's
-and build it.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- deployments/se-proxy/opteesp/CMakeLists.txt | 14 ++++
- deployments/se-proxy/opteesp/lse.S          | 19 +++++
- external/openamp/libmetal.cmake             | 81 ++++++++++++++++++++
- external/openamp/openamp.cmake              | 82 +++++++++++++++++++++
- 4 files changed, 196 insertions(+)
- create mode 100644 deployments/se-proxy/opteesp/lse.S
- create mode 100644 external/openamp/libmetal.cmake
- create mode 100644 external/openamp/openamp.cmake
-
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index 4e2069a5..248bd7e3 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -89,6 +89,7 @@ add_components(TARGET "se-proxy"
- target_sources(se-proxy PRIVATE
- 	se_proxy_sp.c
- 	service_proxy_factory.c
-+	lse.S
- )
-=20
- #----------------------------------------------------------------------=
---------
-@@ -108,6 +109,19 @@ include(../../../external/nanopb/nanopb.cmake)
- target_link_libraries(se-proxy PRIVATE nanopb::protobuf-nanopb-static)
- protobuf_generate_all(TGT "se-proxy" NAMESPACE "protobuf" BASE_DIR "${T=
S_ROOT}/protocols")
-=20
-+# libmetal
-+list(APPEND LIBMETAL_EXTERNAL_INCLUDE_PATHS ${SP_DEV_KIT_INCLUDE_DIR})
-+set(LIBMETAL_EXTRA_INCLUDE_PATHS ${LIBMETAL_EXTRA_INCLUDE_PATHS}
-+	CACHE STRING "" FORCE)
-+include(../../../external/openamp/libmetal.cmake)
-+
-+# OpenAMP
-+list(APPEND OPENAMP_EXTERNAL_INCLUDE_PATHS ${SP_DEV_KIT_INCLUDE_DIR})
-+set(OPENAMP_EXTRA_INCLUDE_PATHS ${OPENAMP_EXTRA_INCLUDE_PATHS}
-+	CACHE STRING "" FORCE)
-+include(../../../external/openamp/openamp.cmake)
-+target_link_libraries(se-proxy PRIVATE openamp libmetal)
-+
- #################################################################
-=20
- target_compile_definitions(se-proxy PRIVATE
-diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/o=
pteesp/lse.S
-new file mode 100644
-index 00000000..840683a6
---- /dev/null
-+++ b/deployments/se-proxy/opteesp/lse.S
-@@ -0,0 +1,19 @@
-+// SPDX-License-Identifier: BSD-3-Clause
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ */
-+
-+.text
-+.globl __aarch64_cas4_acq_rel
-+
-+__aarch64_cas4_acq_rel:
-+	mov	w16, w0
-+	ldaxr	w0, [x2]
-+	cmp	w0, w16
-+0:	bne	1f
-+
-+	stlxr	w17, w1, [x2]
-+	cbnz	w17, 0b
-+1:	ret
-+
-+
-diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal=
.cmake
-new file mode 100644
-index 00000000..3a647e69
---- /dev/null
-+++ b/external/openamp/libmetal.cmake
-@@ -0,0 +1,81 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021 Linaro Limited
-+# Copyright (c) 2021, Arm Limited. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+set (LIBMETAL_URL "https://github.com/OpenAMP/libmetal.git" CACHE STRIN=
G "libmetal repository URL")
-+set (LIBMETAL_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/libmetal_instal=
l" CACHE PATH "libmetal installation directory")
-+set (LIBMETAL_PACKAGE_PATH "${LIBMETAL_INSTALL_PATH}/libmetal/cmake" CA=
CHE PATH "libmetal CMake package directory")
-+set (LIBMETAL_TARGET_NAME "libmetal")
-+set (LIBMETAL_VERSION "f252f0e007fbfb8b3a52b1d5901250ddac96baad"  CACHE=
 STRING "The version of libmetal to use")
-+
-+if(NOT LIBMETAL_DEBUG)
-+	set(LIBMETAL_BUILD_TYPE "Release")
-+else()
-+	set(LIBMETAL_BUILD_TYPE "Debug")
-+endif()
-+
-+include(FetchContent)
-+
-+# Checking git
-+find_program(GIT_COMMAND "git")
-+if (NOT GIT_COMMAND)
-+	message(FATAL_ERROR "Please install git")
-+endif()
-+
-+FetchContent_Declare(
-+	libmetal
-+	GIT_REPOSITORY ${LIBMETAL_URL}
-+	GIT_TAG ${LIBMETAL_VERSION}
-+)
-+
-+# FetchContent_GetProperties exports libmetal_SOURCE_DIR and libmetal_B=
INARY_DIR variables
-+FetchContent_GetProperties(libmetal)
-+if(NOT libmetal_POPULATED)
-+	message(STATUS "Fetching libmetal")
-+	FetchContent_Populate(libmetal)
-+endif()
-+
-+# Ensure list of include paths is separated correctly
-+string(REPLACE ";" "\\;" LIBMETAL_EXTERNAL_INCLUDE_PATHS "${LIBMETAL_EX=
TERNAL_INCLUDE_PATHS}")
-+
-+#Configure the library
-+execute_process(COMMAND
-+	${CMAKE_COMMAND}
-+			-DCMAKE_BUILD_TYPE=3D${LIBMETAL_BUILD_TYPE}
-+			-DCMAKE_C_COMPILER=3D${CMAKE_C_COMPILER}
-+			-DCMAKE_C_COMPILER_ID=3D${CMAKE_C_COMPILER_ID}
-+			-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
-+			-DCMAKE_INSTALL_PREFIX=3D${LIBMETAL_INSTALL_PATH}
-+			-DCMAKE_C_FLAGS_DEBUG=3D${CMAKE_C_FLAGS_DEBUG}
-+			-DCMAKE_C_FLAGS=3D${CMAKE_C_FLAGS}
-+			-DCMAKE_C_OUTPUT_EXTENSION=3D.o
-+			-DCMAKE_C_COMPILER_WORKS=3Dtrue
-+			-DCMAKE_SYSTEM_PROCESSOR=3Darm
-+			-DWITH_DOC=3Doff
-+			-DWITH_TESTS=3Doff
-+			-DWITH_EXAMPLES=3Doff
-+			-DWITH_DEFAULT_LOGGER=3Doff
-+			-DEXTERNAL_INCLUDE_PATHS=3D${LIBMETAL_EXTERNAL_INCLUDE_PATHS}
-+			-DMACHINE=3Dtemplate
-+			${libmetal_SOURCE_DIR}
-+	WORKING_DIRECTORY
-+			${libmetal_BINARY_DIR}
-+)
-+
-+# Build the library
-+execute_process(COMMAND
-+    ${CMAKE_COMMAND} --build ${libmetal_BINARY_DIR} -- install
-+		RESULT_VARIABLE _exec_error
-+	)
-+if (_exec_error)
-+	message(FATAL_ERROR "Build step of libmetal failed with ${_exec_error}=
.")
-+endif()
-+
-+#Create an imported target to have clean abstraction in the build-syste=
m.
-+add_library(libmetal STATIC IMPORTED)
-+set_property(TARGET libmetal PROPERTY IMPORTED_LOCATION "${LIBMETAL_INS=
TALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}metal${CMAKE_STATIC_LIBRARY_=
SUFFIX}")
-+set_property(TARGET libmetal PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${=
LIBMETAL_INSTALL_PATH}/include")
-diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.c=
make
-new file mode 100644
-index 00000000..aae13bad
---- /dev/null
-+++ b/external/openamp/openamp.cmake
-@@ -0,0 +1,82 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021 Linaro Limited
-+# Copyright (c) 2021, Arm Limited. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+set (OPENAMP_URL "https://github.com/OpenAMP/open-amp.git" CACHE STRING=
 "OpenAMP repository URL")
-+set (OPENAMP_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/openamp_install"=
 CACHE PATH "OpenAMP installation directory")
-+set (OPENAMP_PACKAGE_PATH "${OPENAMP_INSTALL_PATH}/openamp/cmake" CACHE=
 PATH "OpenAMP CMake package directory")
-+set (OPENAMP_TARGET_NAME "openamp")
-+set (OPENAMP_VERSION "347397decaa43372fc4d00f965640ebde042966d"  CACHE =
STRING "The version of openamp to use")
-+
-+
-+if(NOT OPENAMP_DEBUG)
-+	set(OPENAMP_BUILD_TYPE "Release")
-+else()
-+	set(OPENAMP_BUILD_TYPE "Debug")
-+endif()
-+
-+include(FetchContent)
-+
-+# Checking git
-+find_program(GIT_COMMAND "git")
-+if (NOT GIT_COMMAND)
-+	message(FATAL_ERROR "Please install git")
-+endif()
-+
-+FetchContent_Declare(
-+	openamp
-+	GIT_REPOSITORY ${OPENAMP_URL}
-+	GIT_TAG ${OPENAMP_VERSION}
-+)
-+
-+# FetchContent_GetProperties exports openamp_SOURCE_DIR and openamp_BIN=
ARY_DIR variables
-+FetchContent_GetProperties(openamp)
-+if(NOT openamp_POPULATED)
-+	message(STATUS "Fetching openamp")
-+	FetchContent_Populate(openamp)
-+endif()
-+
-+# Ensure list of include paths is separated correctly
-+get_target_property(_libmetal_inc libmetal INTERFACE_INCLUDE_DIRECTORIE=
S)
-+set (_openam_external_include_paths ${_libmetal_inc} ${OPENAMP_EXTERNAL=
_INCLUDE_PATHS})
-+string(REPLACE ";" "\\;" OPENAMP_EXTERNAL_INCLUDE_PATHS "${_openam_exte=
rnal_include_paths}")
-+
-+#Configure the library
-+execute_process(COMMAND
-+	${CMAKE_COMMAND}
-+			-DCMAKE_BUILD_TYPE=3D${OPENAMP_BUILD_TYPE}
-+			-DCMAKE_C_COMPILER=3D${CMAKE_C_COMPILER}
-+			-DCMAKE_C_COMPILER_ID=3D${CMAKE_C_COMPILER_ID}
-+			-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
-+			-DCMAKE_INSTALL_PREFIX=3D${OPENAMP_INSTALL_PATH}
-+			-DCMAKE_C_FLAGS_DEBUG=3D${CMAKE_C_FLAGS_DEBUG}
-+			-DLIBMETAL_INCLUDE_DIR=3D${CMAKE_CURRENT_BINARY_DIR}/libmetal/lib/in=
clude
-+			-DLIBMETAL_LIB=3D${CMAKE_CURRENT_BINARY_DIR}/libmetal/lib
-+			-DCMAKE_C_OUTPUT_EXTENSION=3D.o
-+			-DCMAKE_C_COMPILER_WORKS=3Dtrue
-+			-DCMAKE_SYSTEM_PROCESSOR=3Darm
-+			-DEXTERNAL_INCLUDE_PATHS=3D${OPENAMP_EXTERNAL_INCLUDE_PATHS}
-+			-DMACHINE=3Dtemplate
-+			-DRPMSG_BUFFER_SIZE=3D512
-+			${openamp_SOURCE_DIR}
-+	WORKING_DIRECTORY
-+			${openamp_BINARY_DIR}
-+)
-+
-+# Build the library
-+execute_process(COMMAND
-+    ${CMAKE_COMMAND} --build ${openamp_BINARY_DIR} -- install
-+		RESULT_VARIABLE _exec_error
-+	)
-+if (_exec_error)
-+	message(FATAL_ERROR "Build step of OpenAMP failed with ${_exec_error}.=
")
-+endif()
-+
-+#Create an imported target to have clean abstraction in the build-syste=
m.
-+add_library(openamp STATIC IMPORTED)
-+set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTA=
LL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY=
_SUFFIX}")
-+set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${O=
PENAMP_INSTALL_PATH}/include")
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-la=
ye.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye=
.patch
deleted file mode 100644
index 47ca59ff..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patc=
h
+++ /dev/null
@@ -1,1093 +0,0 @@
-From 993a3c3cb08a723f5b5eb07cf38d70e9acf52e7f Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 18:00:46 +0000
-Subject: [PATCH] Implement mhu driver and the OpenAmp conversion layer.
-
-This commit adds an mhu driver (v2.1 and v2) to the secure
-partition se_proxy and a conversion layer to communicate with
-the secure enclave using OpenAmp.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../se-proxy/opteesp/default_se-proxy.dts.in  |  16 +
- .../drivers/arm/mhu_driver/component.cmake    |  12 +
- platform/drivers/arm/mhu_driver/mhu_v2.h      | 391 ++++++++++++
- platform/drivers/arm/mhu_driver/mhu_v2_x.c    | 602 ++++++++++++++++++
- .../providers/arm/corstone1000/platform.cmake |  10 +
- 5 files changed, 1031 insertions(+)
- create mode 100644 platform/drivers/arm/mhu_driver/component.cmake
- create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2.h
- create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2_x.c
- create mode 100644 platform/providers/arm/corstone1000/platform.cmake
-
-diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/depl=
oyments/se-proxy/opteesp/default_se-proxy.dts.in
-index 9f5cf712..f351a592 100644
---- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-+++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-@@ -17,5 +17,21 @@
- 		execution-state =3D <0>; /* AArch64 */
- 		xlat-granule =3D <0>; /* 4KiB */
- 		messaging-method =3D <0>; /* Direct messaging only */
-+
-+		device-regions {
-+			compatible =3D "arm,ffa-manifest-device-regions";
-+			mhu-sender {
-+				/* Armv8 A Foundation Platform values */
-+				base-address =3D <0x00000000 0x1b820000>;
-+				pages-count =3D <16>;
-+				attributes =3D <0x3>; /* read-write */
-+			};
-+			mhu-receiver {
-+				/* Armv8 A Foundation Platform values */
-+				base-address =3D <0x00000000 0x1b830000>;
-+				pages-count =3D <16>;
-+				attributes =3D <0x3>; /* read-write */
-+			};
-+		};
- 	};
- };
-diff --git a/platform/drivers/arm/mhu_driver/component.cmake b/platform/=
drivers/arm/mhu_driver/component.cmake
-new file mode 100644
-index 00000000..77a5a50b
---- /dev/null
-+++ b/platform/drivers/arm/mhu_driver/component.cmake
-@@ -0,0 +1,12 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+# Add source files for using mhu driver
-+target_sources(${TGT}
-+	PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/mhu_v2_x.c"
-+)
-diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers=
/arm/mhu_driver/mhu_v2.h
-new file mode 100644
-index 00000000..2e4ba80f
---- /dev/null
-+++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
-@@ -0,0 +1,391 @@
-+/*
-+ * Copyright (c) 2021 Arm Limited
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+/**
-+ * \file mhu_v2_x.h
-+ * \brief Driver for Arm MHU v2.0 and v2.1
-+ */
-+
-+#ifndef __MHU_V2_X_H__
-+#define __MHU_V2_X_H__
-+
-+#include <stdint.h>
-+#include <stdbool.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#define MHU_2_X_INTR_NR2R_OFF             (0x0u)
-+#define MHU_2_X_INTR_R2NR_OFF             (0x1u)
-+#define MHU_2_1_INTR_CHCOMB_OFF           (0x2u)
-+
-+#define MHU_2_X_INTR_NR2R_MASK            (0x1u << MHU_2_X_INTR_NR2R_OF=
F)
-+#define MHU_2_X_INTR_R2NR_MASK            (0x1u << MHU_2_X_INTR_R2NR_OF=
F)
-+#define MHU_2_1_INTR_CHCOMB_MASK          (0x1u << MHU_2_1_INTR_CHCOMB_=
OFF)
-+
-+enum mhu_v2_x_frame_t {
-+    MHU_V2_X_SENDER_FRAME   =3D 0x0u,
-+    MHU_V2_X_RECEIVER_FRAME =3D 0x1u,
-+};
-+
-+enum mhu_v2_x_supported_revisions {
-+     MHU_REV_READ_FROM_HW =3D 0,
-+     MHU_REV_2_0,
-+     MHU_REV_2_1,
-+};
-+
-+struct mhu_v2_x_dev_t {
-+    uint32_t base;
-+    enum mhu_v2_x_frame_t frame;
-+    uint32_t subversion;    /*!< Hardware subversion: v2.X */
-+    bool is_initialized;    /*!< Indicates if the MHU driver
-+                             *   is initialized and enabled
-+                             */
-+};
-+
-+/**
-+ * \brief MHU v2 error enumeration types.
-+ */
-+enum mhu_v2_x_error_t {
-+    MHU_V_2_X_ERR_NONE                =3D  0,
-+    MHU_V_2_X_ERR_NOT_INIT            =3D -1,
-+    MHU_V_2_X_ERR_ALREADY_INIT        =3D -2,
-+    MHU_V_2_X_ERR_UNSUPPORTED_VERSION =3D -3,
-+    MHU_V_2_X_ERR_INVALID_ARG         =3D -4,
-+    MHU_V_2_X_ERR_GENERAL             =3D -5
-+};
-+
-+/**
-+ * \brief Initializes the driver
-+ *
-+ * \param[in] dev   MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] rev   MHU revision (if can't be identified from HW)
-+ *
-+ * Reads the MHU hardware version
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note MHU revision only has to be specified when versions can't be r=
ead
-+ *       from HW (ARCH_MAJOR_REV reg reads as 0x0).
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_driver_init(struct mhu_v2_x_dev_t *dev,
-+     enum mhu_v2_x_supported_revisions rev);
-+
-+/**
-+ * \brief Returns the number of channels implemented.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * Returns the number of channels implemented.
-+ *
-+ * \return Returns the number of channels implemented.
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+uint32_t mhu_v2_x_get_num_channel_implemented(
-+         const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Sends the value over a channel.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Channel to send the value over.
-+ * \param[in] val         Value to send.
-+ *
-+ * Sends the value over a channel.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_send(const struct mhu_v2_x_dev_t=
 *dev,
-+     uint32_t channel, uint32_t val);
-+
-+/**
-+ * \brief Clears the channel after the value is send over it.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Channel to clear.
-+ *
-+ * Clears the channel after the value is send over it.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_clear(const struct mhu_v2_x_dev_=
t *dev,
-+     uint32_t channel);
-+
-+/**
-+ * \brief Receives the value over a channel.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in]  channel     Channel to receive the value from.
-+ * \param[out] value       Pointer to variable that will store the valu=
e.
-+ *
-+ * Receives the value over a channel.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_receive(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t *valu=
e);
-+
-+/**
-+ * \brief Sets bits in the Channel Mask.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's mask to set.
-+ * \param[in] mask        Mask to be set over a receiver frame.
-+ *
-+ * Sets bits in the Channel Mask.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_set(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)=
;
-+
-+/**
-+ * \brief Clears bits in the Channel Mask.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's mask to clear.
-+ * \param[in] mask        Mask to be clear over a receiver frame.
-+ *
-+ * Clears bits in the Channel Mask.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)=
;
-+
-+/**
-+ * \brief Enables the Channel interrupt.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's interrupt to enable.
-+ *
-+ * Enables the Channel clear interrupt.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
-+
-+/**
-+ * \brief Disables the Channel interrupt.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's interrupt to disable.
-+ *
-+ * Disables the Channel interrupt.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
-+
-+/**
-+ * \brief Cleares the Channel interrupt.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's interrupt to clear.
-+ *
-+ * Cleares the Channel interrupt.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
-+
-+/**
-+ * \brief Initiates a MHU transfer with the handshake signals.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * Initiates a MHU transfer with the handshake signals in a blocking mo=
de.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_initiate_transfer(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Closes a MHU transfer with the handshake signals.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * Closes a MHU transfer with the handshake signals in a blocking mode.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_close_transfer(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Returns the value of access request signal.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[out] val         Pointer to variable that will store the valu=
e.
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_request(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val);
-+
-+/**
-+ * \brief Sets the value of access request signal to high.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_set_access_request(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Sets the value of access request signal to low.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_reset_access_request(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Returns the value of access ready signal.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[out] val        Pointer to variable that will store the value=
.
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_ready(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val);
-+
-+/**
-+ * \brief Returns the MHU interrupt status.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * \return Interrupt status register value. Masking is needed for indiv=
idual
-+ *         interrupts.
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+uint32_t mhu_v2_x_get_interrupt_status(const struct mhu_v2_x_dev_t *dev=
);
-+
-+/**
-+ * \brief Enables MHU interrupts.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] mask        Bit mask for enabling/disabling interrupts
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
-+
-+/**
-+ * \brief Disables MHU interrupts.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] mask        Bit mask for enabling/disabling interrupts
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
-+
-+/**
-+ * \brief Clears MHU interrupts.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] mask        Bit mask for clearing interrupts
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
-+
-+/**
-+ * \brief Returns the first channel number whose interrupt bit is high.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[out] channel     Pointer to variable that will have the chann=
el value.
-+ *
-+ * \return Returns the first channel number whose interrupt bit is high=
.
-+ * \return Returns mhu_v2_x_error_t error code.
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *channel);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __MHU_V2_X_H__ */
-diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drive=
rs/arm/mhu_driver/mhu_v2_x.c
-new file mode 100644
-index 00000000..01d8f659
---- /dev/null
-+++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
-@@ -0,0 +1,602 @@
-+/*
-+ * Copyright (c) 2021 Arm Limited
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+#include <stdint.h>
-+#include <stdbool.h>
-+#include "mhu_v2.h"
-+
-+#define _MHU_V2_X_MAX_CHANNELS    124
-+#define _MHU_V2_1_MAX_CHCOMB_INT  4
-+#define ENABLE                    0x1
-+#define DISABLE                   0x0
-+#define CLEAR_INTR                0x1
-+#define CH_PER_CH_COMB            0x20
-+#define SEND_FRAME(p_mhu)       ((struct _mhu_v2_x_send_frame_t *)p_mhu=
)
-+#define RECV_FRAME(p_mhu)       ((struct _mhu_v2_x_recv_frame_t *)p_mhu=
)
-+
-+#define MHU_MAJOR_REV_V2      0x1u
-+#define MHU_MINOR_REV_2_0     0x0u
-+#define MHU_MINOR_REV_2_1     0x1u
-+
-+struct _mhu_v2_x_send_ch_window_t {
-+    /* Offset: 0x00 (R/ ) Channel Status */
-+    volatile uint32_t ch_st;
-+    /* Offset: 0x04 (R/ ) Reserved */
-+    volatile uint32_t reserved_0;
-+    /* Offset: 0x08 (R/ ) Reserved */
-+    volatile uint32_t reserved_1;
-+    /* Offset: 0x0C ( /W) Channel Set */
-+    volatile uint32_t ch_set;
-+    /* Offset: 0x10 (R/ ) Channel Interrupt Status (Reserved in 2.0) */
-+    volatile uint32_t ch_int_st;
-+    /* Offset: 0x14 ( /W) Channel Interrupt Clear  (Reserved in 2.0) */
-+    volatile uint32_t ch_int_clr;
-+    /* Offset: 0x18 (R/W) Channel Interrupt Enable (Reserved in 2.0) */
-+    volatile uint32_t ch_int_en;
-+    /* Offset: 0x1C (R/ ) Reserved */
-+    volatile uint32_t reserved_2;
-+};
-+
-+struct _mhu_v2_x_send_frame_t {
-+    /* Offset: 0x000 ( / ) Sender Channel Window 0 -123 */
-+    struct _mhu_v2_x_send_ch_window_t send_ch_window[_MHU_V2_X_MAX_CHAN=
NELS];
-+    /* Offset: 0xF80 (R/ ) Message Handling Unit Configuration */
-+    volatile uint32_t mhu_cfg;
-+    /* Offset: 0xF84 (R/W) Response Configuration */
-+    volatile uint32_t resp_cfg;
-+    /* Offset: 0xF88 (R/W) Access Request */
-+    volatile uint32_t access_request;
-+    /* Offset: 0xF8C (R/ ) Access Ready */
-+    volatile uint32_t access_ready;
-+    /* Offset: 0xF90 (R/ ) Interrupt Status */
-+    volatile uint32_t int_st;
-+    /* Offset: 0xF94 ( /W) Interrupt Clear */
-+    volatile uint32_t int_clr;
-+    /* Offset: 0xF98 (R/W) Interrupt Enable */
-+    volatile uint32_t int_en;
-+    /* Offset: 0xF9C (R/ ) Reserved */
-+    volatile uint32_t reserved_0;
-+    /* Offset: 0xFA0 (R/W) Channel Combined Interrupt Stat (Reserved in=
 2.0) */
-+    volatile uint32_t ch_comb_int_st[_MHU_V2_1_MAX_CHCOMB_INT];
-+    /* Offset: =E2=80=AD0xFC4=E2=80=AC (R/ ) Reserved */
-+    volatile uint32_t reserved_1[6];
-+    /* Offset: 0xFC8 (R/ ) Implementer Identification Register */
-+    volatile uint32_t iidr;
-+    /* Offset: 0xFCC (R/ ) Architecture Identification Register */
-+    volatile uint32_t aidr;
-+    /* Offset: 0xFD0 (R/ )  */
-+    volatile uint32_t pid_1[4];
-+    /* Offset: 0xFE0 (R/ )  */
-+    volatile uint32_t pid_0[4];
-+    /* Offset: 0xFF0 (R/ )  */
-+    volatile uint32_t cid[4];
-+};
-+
-+struct _mhu_v2_x_rec_ch_window_t {
-+    /* Offset: 0x00 (R/ ) Channel Status */
-+    volatile uint32_t ch_st;
-+    /* Offset: 0x04 (R/ ) Channel Status Masked */
-+    volatile uint32_t ch_st_msk;
-+    /* Offset: 0x08 ( /W) Channel Clear */
-+    volatile uint32_t ch_clr;
-+    /* Offset: 0x0C (R/ ) Reserved */
-+    volatile uint32_t reserved_0;
-+    /* Offset: 0x10 (R/ ) Channel Mask Status */
-+    volatile uint32_t ch_msk_st;
-+    /* Offset: 0x14 ( /W) Channel Mask Set */
-+    volatile uint32_t ch_msk_set;
-+    /* Offset: 0x18 ( /W) Channel Mask Clear */
-+    volatile uint32_t ch_msk_clr;
-+    /* Offset: 0x1C (R/ ) Reserved */
-+    volatile uint32_t reserved_1;
-+};
-+
-+struct _mhu_v2_x_recv_frame_t {
-+    /* Offset: 0x000 ( / ) Receiver Channel Window 0 -123 */
-+    struct _mhu_v2_x_rec_ch_window_t rec_ch_window[_MHU_V2_X_MAX_CHANNE=
LS];
-+    /* Offset: 0xF80 (R/ ) Message Handling Unit Configuration */
-+    volatile uint32_t mhu_cfg;
-+    /* Offset: 0xF84 (R/ ) Reserved */
-+    volatile uint32_t reserved_0[3];
-+    /* Offset: 0xF90 (R/ ) Interrupt Status (Reserved in 2.0) */
-+    volatile uint32_t int_st;
-+    /* Offset: 0xF94 (R/ ) Interrupt Clear  (Reserved in 2.0) */
-+    volatile uint32_t int_clr;
-+    /* Offset: 0xF98 (R/W) Interrupt Enable (Reserved in 2.0) */
-+    volatile uint32_t int_en;
-+    /* Offset: 0xF9C (R/ ) Reserved  */
-+    volatile uint32_t reserved_1;
-+    /* Offset: 0xFA0 (R/ ) Channel Combined Interrupt Stat (Reserved in=
 2.0) */
-+    volatile uint32_t ch_comb_int_st[_MHU_V2_1_MAX_CHCOMB_INT];
-+    /* Offset: 0xFB0 (R/ ) Reserved */
-+    volatile uint32_t reserved_2[6];
-+    /* Offset: 0xFC8 (R/ ) Implementer Identification Register */
-+    volatile uint32_t iidr;
-+    /* Offset: 0xFCC (R/ ) Architecture Identification Register */
-+    volatile uint32_t aidr;
-+    /* Offset: 0xFD0 (R/ )  */
-+    volatile uint32_t pid_1[4];
-+    /* Offset: 0xFE0 (R/ )  */
-+    volatile uint32_t pid_0[4];
-+    /* Offset: 0xFF0 (R/ )  */
-+    volatile uint32_t cid[4];
-+};
-+
-+union _mhu_v2_x_frame_t {
-+    struct _mhu_v2_x_send_frame_t send_frame;
-+    struct _mhu_v2_x_recv_frame_t recv_frame;
-+};
-+
-+enum mhu_v2_x_error_t mhu_v2_x_driver_init(struct mhu_v2_x_dev_t *dev,
-+     enum mhu_v2_x_supported_revisions rev)
-+{
-+    uint32_t AIDR =3D 0;
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if (dev->is_initialized) {
-+        return MHU_V_2_X_ERR_ALREADY_INIT;
-+    }
-+
-+    if (rev =3D=3D MHU_REV_READ_FROM_HW) {
-+        /* Read revision from HW */
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            AIDR =3D p_mhu->recv_frame.aidr;
-+        } else {
-+            AIDR =3D p_mhu->send_frame.aidr;
-+        }
-+
-+        /* Get bits 7:4 to read major revision */
-+        if ( ((AIDR >> 4) & 0b1111) !=3D MHU_MAJOR_REV_V2) {
-+            /* Unsupported MHU version */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        } /* No need to save major version, driver only supports MHUv2 =
*/
-+
-+        /* Get bits 3:0 to read minor revision */
-+        dev->subversion =3D AIDR & 0b1111;
-+
-+        if (dev->subversion !=3D MHU_MINOR_REV_2_0 &&
-+            dev->subversion !=3D MHU_MINOR_REV_2_1) {
-+            /* Unsupported subversion */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    } else {
-+        /* Revisions were provided by caller */
-+        if (rev =3D=3D MHU_REV_2_0) {
-+            dev->subversion =3D MHU_MINOR_REV_2_0;
-+        } else if (rev =3D=3D MHU_REV_2_1) {
-+            dev->subversion =3D MHU_MINOR_REV_2_1;
-+        } else {
-+            /* Unsupported subversion */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }/* No need to save major version, driver only supports MHUv2 *=
/
-+    }
-+
-+    dev->is_initialized =3D true;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+uint32_t mhu_v2_x_get_num_channel_implemented(const struct mhu_v2_x_dev=
_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        return (SEND_FRAME(p_mhu))->mhu_cfg;
-+    } else {
-+        return (RECV_FRAME(p_mhu))->mhu_cfg;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_send(const struct mhu_v2_x_dev_t=
 *dev,
-+     uint32_t channel, uint32_t val)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_set =3D val;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_clear(const struct mhu_v2_x_dev_=
t *dev,
-+     uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_clr =3D UINT32_M=
AX;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_receive(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t *valu=
e)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        *value =3D (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_st;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_set(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_msk_set =3D mask=
;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_msk_clr =3D mask=
;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_en =3D ENAB=
LE;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_en =3D DISA=
BLE;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_clr =3D CLE=
AR_INTR;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_initiate_transfer(
-+     const struct mhu_v2_x_dev_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D ENABLE;
-+
-+    while ( !((SEND_FRAME(p_mhu))->access_ready) ) {
-+        /* Wait in a loop for access ready signal to be high */
-+        ;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_close_transfer(const struct mhu_v2_x_dev=
_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D DISABLE;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_request(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    *val =3D (SEND_FRAME(p_mhu))->access_request;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_set_access_request(
-+     const struct mhu_v2_x_dev_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D ENABLE;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_reset_access_request(
-+     const struct mhu_v2_x_dev_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D DISABLE;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_ready(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    *val =3D (SEND_FRAME(p_mhu))->access_ready;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+uint32_t mhu_v2_x_get_interrupt_status(const struct mhu_v2_x_dev_t *dev=
)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        return (SEND_FRAME(p_mhu))->int_st;
-+    } else {
-+        return (RECV_FRAME(p_mhu))->int_st;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
-+        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
-+            /* Combined channel IRQ is not present in v2.0 */
-+            return MHU_V_2_X_ERR_INVALID_ARG;
-+        }
-+
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            /* Only sender frame has these registers */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->int_en |=3D mask;
-+    } else {
-+        (RECV_FRAME(p_mhu))->int_en |=3D mask;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
-+        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
-+            /* Combined channel IRQ is not present in v2.0 */
-+            return MHU_V_2_X_ERR_INVALID_ARG;
-+        }
-+
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            /* Only sender frame has these registers */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->int_en &=3D ~mask;
-+    } else {
-+        (RECV_FRAME(p_mhu))->int_en &=3D ~mask;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
-+        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
-+            /* Combined channel IRQ is not present in v2.0 */
-+            return MHU_V_2_X_ERR_INVALID_ARG;
-+        }
-+
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            /* Only sender frame has these registers */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->int_clr =3D mask;
-+    } else {
-+        (RECV_FRAME(p_mhu))->int_clr =3D mask;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *channel)
-+{
-+    uint32_t i, j, status;
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion !=3D MHU_MINOR_REV_2_1) {
-+        /* Feature is only supported in MHU v2.1 */
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    for(i =3D 0; i < _MHU_V2_1_MAX_CHCOMB_INT; i++) {
-+        if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+            status =3D (SEND_FRAME(p_mhu))->ch_comb_int_st[i];
-+        } else {
-+            status =3D (RECV_FRAME(p_mhu))->ch_comb_int_st[i];
-+        }
-+
-+        for(j =3D 0; j < CH_PER_CH_COMB; j++) {
-+            if ((status >> CH_PER_CH_COMB - j - 1) & (ENABLE)) {
-+                *channel =3D (CH_PER_CH_COMB - j -1 + (i * CH_PER_CH_CO=
MB));
-+                return MHU_V_2_X_ERR_NONE;
-+            }
-+        }
-+    }
-+
-+    return MHU_V_2_X_ERR_GENERAL;
-+}
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-new file mode 100644
-index 00000000..bb778bb9
---- /dev/null
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -0,0 +1,10 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+# Platform definition for the 'fvp_base_revc-2xaem8a' virtual platform.
-+#----------------------------------------------------------------------=
---------
-+
-+# include MHU driver
-+include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0009-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/secure-partitions/corstone1000/0009-Add-opena=
mp-rpc-caller.patch
deleted file mode 100644
index 0f3f2c64..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0009-Add-openamp-rpc-caller.patch
+++ /dev/null
@@ -1,1197 +0,0 @@
-From a6721cc391397f5f999db84e4ebec4c20985996a Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:00:54 +0000
-Subject: [PATCH] Add openamp rpc caller
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- components/rpc/common/caller/rpc_caller.c     |  10 +
- components/rpc/common/interface/rpc_caller.h  |   8 +
- .../rpc/openamp/caller/sp/component.cmake     |  15 +
- .../rpc/openamp/caller/sp/openamp_caller.c    | 203 +++++++
- .../rpc/openamp/caller/sp/openamp_caller.h    |  43 ++
- .../rpc/openamp/caller/sp/openamp_mhu.c       | 191 ++++++
- .../rpc/openamp/caller/sp/openamp_mhu.h       |  19 +
- .../rpc/openamp/caller/sp/openamp_virtio.c    | 554 ++++++++++++++++++
- .../rpc/openamp/caller/sp/openamp_virtio.h    |  24 +
- deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
- .../se-proxy/opteesp/default_se-proxy.dts.in  |   6 +
- 11 files changed, 1074 insertions(+)
- create mode 100644 components/rpc/openamp/caller/sp/component.cmake
- create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.c
- create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.h
- create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.c
- create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.h
- create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.c
- create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.h
-
-diff --git a/components/rpc/common/caller/rpc_caller.c b/components/rpc/=
common/caller/rpc_caller.c
-index 2dceabeb..20d889c1 100644
---- a/components/rpc/common/caller/rpc_caller.c
-+++ b/components/rpc/common/caller/rpc_caller.c
-@@ -37,3 +37,13 @@ void rpc_caller_end(struct rpc_caller *s, rpc_call_ha=
ndle handle)
- {
- 	s->call_end(s->context, handle);
- }
-+
-+void *rpc_caller_virt_to_phys(struct rpc_caller *s, void *va)
-+{
-+	return s->virt_to_phys(s->context, va);
-+}
-+
-+void *rpc_caller_phys_to_virt(struct rpc_caller *s, void *pa)
-+{
-+	return s->phys_to_virt(s->context, pa);
-+}
-diff --git a/components/rpc/common/interface/rpc_caller.h b/components/r=
pc/common/interface/rpc_caller.h
-index 387489cd..ef9bb649 100644
---- a/components/rpc/common/interface/rpc_caller.h
-+++ b/components/rpc/common/interface/rpc_caller.h
-@@ -45,6 +45,10 @@ struct rpc_caller
- 		     	rpc_opstatus_t *opstatus, uint8_t **resp_buf, size_t *resp_len)=
;
-=20
- 	void (*call_end)(void *context, rpc_call_handle handle);
-+
-+	void *(*virt_to_phys)(void *context, void *va);
-+
-+	void *(*phys_to_virt)(void *context, void *pa);
- };
-=20
- /*
-@@ -87,6 +91,10 @@ RPC_CALLER_EXPORTED rpc_status_t rpc_caller_invoke(st=
ruct rpc_caller *s, rpc_cal
-  */
- RPC_CALLER_EXPORTED void rpc_caller_end(struct rpc_caller *s, rpc_call_=
handle handle);
-=20
-+RPC_CALLER_EXPORTED void *rpc_caller_virt_to_phys(struct rpc_caller *s,=
 void *va);
-+
-+RPC_CALLER_EXPORTED void *rpc_caller_phys_to_virt(struct rpc_caller *s,=
 void *pa);
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/rpc/openamp/caller/sp/component.cmake b/componen=
ts/rpc/openamp/caller/sp/component.cmake
-new file mode 100644
-index 00000000..fc919529
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/component.cmake
-@@ -0,0 +1,15 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/openamp_caller.c"
-+	"${CMAKE_CURRENT_LIST_DIR}/openamp_virtio.c"
-+	"${CMAKE_CURRENT_LIST_DIR}/openamp_mhu.c"
-+	)
-diff --git a/components/rpc/openamp/caller/sp/openamp_caller.c b/compone=
nts/rpc/openamp/caller/sp/openamp_caller.c
-new file mode 100644
-index 00000000..6cdfb756
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_caller.c
-@@ -0,0 +1,203 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <trace.h>
-+#include "openamp_caller.h"
-+#include "openamp_mhu.h"
-+#include "openamp_virtio.h"
-+#include <protocols/rpc/common/packed-c/status.h>
-+
-+#define OPENAMP_TRANSACTION_IDLE	0x0
-+#define OPENAMP_TRANSACTION_INPROGRESS	0x1
-+#define OPENAMP_TRANSACTION_INVOKED	0x2
-+
-+static rpc_call_handle openamp_call_begin(void *context, uint8_t **req_=
buf,
-+					  size_t req_len)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	rpc_call_handle handle;
-+	int ret;
-+
-+	if (!req_buf) {
-+		EMSG("openamp: call_begin: not req_buf");
-+		return NULL;
-+	}
-+
-+	if (req_len > UINT32_MAX || req_len =3D=3D 0) {
-+		EMSG("openamp: call_begin: resp_len invalid: %lu", req_len);
-+		return NULL;
-+	}
-+
-+	if (openamp->status !=3D OPENAMP_TRANSACTION_IDLE) {
-+		EMSG("openamp: call_begin: transaction not idle");
-+		return NULL;
-+	}
-+
-+	ret =3D ops->platform_call_begin(openamp, req_buf, req_len);
-+	if (ret < 0) {
-+		EMSG("openamp: call_begin: platform begin failed: %d", ret);
-+		return NULL;
-+	}
-+
-+	openamp->status =3D OPENAMP_TRANSACTION_INPROGRESS;
-+	handle =3D openamp;
-+
-+	return handle;
-+}
-+
-+static rpc_status_t openamp_call_invoke(void *context, rpc_call_handle =
handle,
-+					uint32_t opcode, int *opstatus,
-+					uint8_t **resp_buf, size_t *resp_len)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	rpc_status_t status;
-+	int ret;
-+
-+	(void)opcode;
-+
-+	if ((handle !=3D openamp) || !opstatus || !resp_buf || !resp_len) {
-+		EMSG("openamp: call_invoke: invalid arguments");
-+		return TS_RPC_ERROR_INVALID_PARAMETER;
-+	}
-+
-+	if (openamp->status !=3D OPENAMP_TRANSACTION_INPROGRESS) {
-+		EMSG("openamp: call_invoke: transaction needed to be started");
-+		return TS_RPC_ERROR_NOT_READY;
-+	}
-+
-+	ret =3D ops->platform_call_invoke(openamp, opstatus, resp_buf, resp_le=
n);
-+	if (ret < 0)
-+		return TS_RPC_ERROR_INTERNAL;
-+
-+	openamp->status =3D OPENAMP_TRANSACTION_INVOKED;
-+	*opstatus =3D 0;
-+
-+	return TS_RPC_CALL_ACCEPTED;
-+}
-+
-+static void openamp_call_end(void *context, rpc_call_handle handle)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+
-+	if (handle !=3D openamp) {
-+		EMSG("openamp: call_end: invalid arguments");
-+		return;
-+	}
-+
-+	if (openamp->status =3D=3D OPENAMP_TRANSACTION_IDLE) {
-+		EMSG("openamp: call_end: transaction idle");
-+		return;
-+	}
-+
-+	ops->platform_call_end(openamp);
-+
-+	openamp->status =3D OPENAMP_TRANSACTION_IDLE;
-+}
-+
-+static void *openamp_virt_to_phys(void *context, void *va)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+
-+	return ops->platform_virt_to_phys(openamp, va);
-+}
-+
-+static void *openamp_phys_to_virt(void *context, void *pa)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+
-+	return ops->platform_phys_to_virt(openamp, pa);
-+}
-+
-+static int openamp_init(struct openamp_caller *openamp)
-+{
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	int ret;
-+
-+	ret =3D ops->transport_init(openamp);
-+	if (ret < 0)
-+		return ret;
-+
-+	ret =3D ops->platform_init(openamp);
-+	if (ret < 0)
-+		goto denit_transport;
-+
-+	return 0;
-+
-+denit_transport:
-+	ops->transport_deinit(openamp);
-+
-+	return ret;
-+}
-+
-+static const struct openamp_platform_ops openamp_virtio_ops =3D {
-+	.transport_init =3D openamp_mhu_init,
-+	.transport_deinit =3D openamp_mhu_deinit,
-+	.transport_notify =3D openamp_mhu_notify_peer,
-+	.transport_receive =3D openamp_mhu_receive,
-+	.platform_init =3D openamp_virtio_init,
-+	.platform_call_begin =3D openamp_virtio_call_begin,
-+	.platform_call_invoke =3D openamp_virtio_call_invoke,
-+	.platform_call_end =3D openamp_virtio_call_end,
-+	.platform_virt_to_phys =3D openamp_virtio_virt_to_phys,
-+	.platform_phys_to_virt =3D openamp_virtio_phys_to_virt,
-+};
-+
-+struct rpc_caller *openamp_caller_init(struct openamp_caller *openamp)
-+{
-+	struct rpc_caller *rpc =3D &openamp->rpc_caller;
-+	int ret;
-+
-+	if (openamp->ref_count)
-+		return rpc;
-+
-+	rpc_caller_init(rpc, openamp);
-+
-+	rpc->call_begin =3D openamp_call_begin;
-+	rpc->call_invoke =3D openamp_call_invoke;
-+	rpc->call_end =3D openamp_call_end;
-+	rpc->virt_to_phys =3D openamp_virt_to_phys;
-+	rpc->phys_to_virt =3D openamp_phys_to_virt;
-+	openamp->platform_ops =3D &openamp_virtio_ops;
-+
-+	ret =3D openamp_init(openamp);
-+	if (ret < 0) {
-+		EMSG("openamp_init: failed to start: %d", ret);
-+		return rpc;
-+	}
-+	openamp->ref_count++;
-+
-+	return rpc;
-+}
-+
-+void openamp_caller_deinit(struct openamp_caller *openamp)
-+{
-+	struct rpc_caller *rpc =3D &openamp->rpc_caller;
-+
-+	if (--openamp->ref_count)
-+		return;
-+
-+	rpc->context =3D NULL;
-+	rpc->call_begin =3D NULL;
-+	rpc->call_invoke =3D NULL;
-+	rpc->call_end =3D NULL;
-+}
-+
-+int openamp_caller_discover(struct openamp_caller *openamp)
-+{
-+	return openamp_init(openamp);
-+}
-+
-+int openamp_caller_open(struct openamp_caller *openamp)
-+{
-+
-+}
-diff --git a/components/rpc/openamp/caller/sp/openamp_caller.h b/compone=
nts/rpc/openamp/caller/sp/openamp_caller.h
-new file mode 100644
-index 00000000..3fb67c56
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_caller.h
-@@ -0,0 +1,43 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+#ifndef OPENAMP_CALLER_H
-+#define OPENAMP_CALLER_H
-+
-+#include <stddef.h>
-+#include <rpc_caller.h>
-+
-+struct openamp_caller {
-+	struct rpc_caller rpc_caller;
-+	const struct openamp_platform_ops *platform_ops;
-+	uint32_t ref_count;
-+	uint8_t status;
-+
-+	void *transport;
-+	void *platform;
-+};
-+
-+struct openamp_platform_ops {
-+	int (*transport_init)(struct openamp_caller *openamp);
-+	int (*transport_deinit)(struct openamp_caller *openamp);
-+	int (*transport_notify)(struct openamp_caller *openamp);
-+	int (*transport_receive)(struct openamp_caller *openamp);
-+	int (*platform_init)(struct openamp_caller *openamp);
-+	int (*platform_deinit)(struct openamp_caller *openamp);
-+	int (*platform_call_begin)(struct openamp_caller *openamp,
-+				   uint8_t **req_buf, size_t req_len);
-+	int (*platform_call_invoke)(struct openamp_caller *openamp,
-+				    int *opstatus, uint8_t **resp_buf,
-+				    size_t *resp_len);
-+	int (*platform_call_end)(struct openamp_caller *openamp);
-+	void *(*platform_virt_to_phys)(struct openamp_caller *openamp, void *v=
a);
-+	void *(*platform_phys_to_virt)(struct openamp_caller *openamp, void *p=
a);
-+};
-+
-+struct rpc_caller *openamp_caller_init(struct openamp_caller *openamp);
-+void openamp_caller_deinit(struct openamp_caller *openamp);
-+
-+#endif
-diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.c b/components=
/rpc/openamp/caller/sp/openamp_mhu.c
-new file mode 100644
-index 00000000..ffdadaf8
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_mhu.c
-@@ -0,0 +1,191 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <config/interface/config_store.h>
-+#include <config/interface/config_blob.h>
-+#include <platform/interface/device_region.h>
-+#include <platform/drivers/arm/mhu_driver/mhu_v2.h>
-+#include <trace.h>
-+#include <errno.h>
-+#include <stdlib.h>
-+#include <stdint.h>
-+#include <stddef.h>
-+#include <limits.h>
-+
-+#include "openamp_caller.h"
-+
-+#define MHU_V_2_NOTIFY_CHANNEL	0
-+#define MHU_V_2_NOTIFY_VALUE	0xff
-+
-+struct openamp_mhu {
-+	struct device_region rx_region;
-+	struct device_region tx_region;
-+	struct mhu_v2_x_dev_t rx_dev;
-+	struct mhu_v2_x_dev_t tx_dev;
-+};
-+
-+static int openamp_mhu_device_get(const char *dev,
-+				  struct device_region *dev_region)
-+{
-+	bool found;
-+
-+	found =3D config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, dev, 0,
-+				   dev_region, sizeof(*dev_region));
-+	if (!found)
-+		return -EINVAL;
-+
-+	if (!dev_region->base_addr)
-+		return -EINVAL;
-+
-+	IMSG("mhu: device region found: %s addr: 0x%x size: %d", dev,
-+	     dev_region->base_addr, dev_region->io_region_size);
-+
-+	return 0;
-+}
-+
-+int openamp_mhu_receive(struct openamp_caller *openamp)
-+{
-+	struct mhu_v2_x_dev_t *rx_dev;
-+	enum mhu_v2_x_error_t ret;
-+	struct openamp_mhu *mhu;
-+	uint32_t channel =3D 0;
-+	uint32_t irq_status;
-+
-+	if (!openamp->transport) {
-+		EMSG("openamp: mhu: receive transport not initialized");
-+		return -EINVAL;
-+	}
-+
-+	mhu =3D openamp->transport;
-+	rx_dev =3D &mhu->rx_dev;
-+
-+	irq_status =3D 0;
-+
-+	do {
-+		irq_status =3D mhu_v2_x_get_interrupt_status(rx_dev);
-+	} while(!irq_status);
-+
-+	ret =3D mhu_v2_1_get_ch_interrupt_num(rx_dev, &channel);
-+
-+	ret =3D mhu_v2_x_channel_clear(rx_dev, channel);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: failed to clear channel: %d", channel);
-+		return -EPROTO;
-+	}
-+
-+	return 0;
-+}
-+
-+int openamp_mhu_notify_peer(struct openamp_caller *openamp)
-+{
-+	struct mhu_v2_x_dev_t *tx_dev;
-+	enum mhu_v2_x_error_t ret;
-+	struct openamp_mhu *mhu;
-+	uint32_t access_ready;
-+
-+	if (!openamp->transport) {
-+		EMSG("openamp: mhu: notify transport not initialized");
-+		return -EINVAL;
-+	}
-+
-+	mhu =3D openamp->transport;
-+	tx_dev =3D &mhu->tx_dev;
-+
-+	ret =3D mhu_v2_x_set_access_request(tx_dev);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: set access request failed");
-+		return -EPROTO;
-+	}
-+
-+	do {
-+		ret =3D mhu_v2_x_get_access_ready(tx_dev, &access_ready);
-+		if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+			EMSG("openamp: mhu: failed to get access_ready");
-+			return -EPROTO;
-+		}
-+	} while (!access_ready);
-+
-+	ret =3D mhu_v2_x_channel_send(tx_dev, MHU_V_2_NOTIFY_CHANNEL,
-+				    MHU_V_2_NOTIFY_VALUE);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: failed send over channel");
-+		return -EPROTO;
-+	}
-+
-+	ret =3D mhu_v2_x_reset_access_request(tx_dev);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: failed reset access request");
-+		return -EPROTO;
-+	}
-+
-+	return 0;
-+}
-+
-+int openamp_mhu_init(struct openamp_caller *openamp)
-+{
-+	struct mhu_v2_x_dev_t *rx_dev;
-+	struct mhu_v2_x_dev_t *tx_dev;
-+	struct openamp_mhu *mhu;
-+	int ret;
-+
-+	/* if we already have initialized skip this */
-+	if (openamp->transport)
-+		return 0;
-+
-+	mhu =3D malloc(sizeof(*mhu));
-+	if (!mhu)
-+		return -1;
-+
-+	ret =3D openamp_mhu_device_get("mhu-sender", &mhu->tx_region);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	ret =3D openamp_mhu_device_get("mhu-receiver", &mhu->rx_region);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	rx_dev =3D &mhu->rx_dev;
-+	tx_dev =3D &mhu->tx_dev;
-+
-+	rx_dev->base =3D  (unsigned int)mhu->rx_region.base_addr;
-+	rx_dev->frame =3D MHU_V2_X_RECEIVER_FRAME;
-+
-+	tx_dev->base =3D  (unsigned int)mhu->tx_region.base_addr;
-+	tx_dev->frame =3D MHU_V2_X_SENDER_FRAME;
-+
-+	ret =3D mhu_v2_x_driver_init(rx_dev, MHU_REV_READ_FROM_HW);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	ret =3D mhu_v2_x_driver_init(tx_dev, MHU_REV_READ_FROM_HW);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	openamp->transport =3D (void *)mhu;
-+
-+	return 0;
-+
-+free_mhu:
-+	free(mhu);
-+
-+	return ret;
-+}
-+
-+int openamp_mhu_deinit(struct openamp_caller *openamp)
-+{
-+	struct openamp_mhu *mhu;
-+
-+	if (!openamp->transport)
-+		return 0;
-+
-+	mhu =3D openamp->transport;
-+	free(mhu);
-+
-+	openamp->transport =3D NULL;
-+
-+	return 0;
-+}
-diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.h b/components=
/rpc/openamp/caller/sp/openamp_mhu.h
-new file mode 100644
-index 00000000..2ae5cb8e
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_mhu.h
-@@ -0,0 +1,19 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+#ifndef OPENAMP_MHU_H
-+#define OPENAMP_MHU_H
-+
-+#include <stddef.h>
-+#include "openamp_caller.h"
-+
-+int openamp_mhu_init(struct openamp_caller *openamp);
-+int openamp_mhu_deinit(struct openamp_caller *openamp);
-+
-+int openamp_mhu_notify_peer(struct openamp_caller *openamp);
-+int openamp_mhu_receive(struct openamp_caller *openamp);
-+
-+#endif
-diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.c b/compone=
nts/rpc/openamp/caller/sp/openamp_virtio.c
-new file mode 100644
-index 00000000..06e0735b
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_virtio.c
-@@ -0,0 +1,554 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <metal/device.h>
-+#include <metal/spinlock.h>
-+#include <openamp/open_amp.h>
-+#include <platform/interface/device_region.h>
-+#include <config/interface/config_store.h>
-+
-+#include <stddef.h>
-+#include "openamp_caller.h"
-+
-+#define OPENAMP_SHEM_DEVICE_NAME "openamp-virtio"
-+#define OPENAMP_RPMSG_ENDPOINT_NAME OPENAMP_SHEM_DEVICE_NAME
-+#define OPENAMP_RPMSG_ENDPOINT_ADDR 1024
-+
-+#define OPENAMP_SHEM_PHYS 0x88000000
-+#define OPENAMP_SHEM_PHYS_PAGES 1
-+#define OPENAMP_SHEM_SE_PHYS 0xa8000000
-+
-+#define OPENAMP_SHEM_VDEV_SIZE (4 * 1024)
-+#define OPENAMP_SHEM_VRING_SIZE (4 * 1024)
-+
-+#define OPENAMP_BUFFER_NO_WAIT  0
-+#define OPENAMP_BUFFER_WAIT     1
-+
-+#define VIRTQUEUE_NR            2
-+#define VQ_TX                   0
-+#define VQ_RX                   1
-+
-+#define VRING_DESCRIPTORS       16
-+#define VRING_ALIGN             4
-+
-+#define container_of(ptr, type, member) \
-+	((type *)((char *)(ptr) - (unsigned long)(&((type *)0)->member)))
-+
-+struct openamp_virtio_shm {
-+	uintptr_t base_addr;
-+	size_t size;
-+	uintptr_t vdev_status;
-+	size_t vdev_status_size;
-+	uintptr_t payload_addr;
-+	size_t payload_size;
-+	uintptr_t vring_tx;
-+	size_t vring_tx_size;
-+	uintptr_t vring_rx;
-+	size_t vring_rx_size;
-+
-+	metal_phys_addr_t shm_physmap[OPENAMP_SHEM_PHYS_PAGES];
-+};
-+
-+struct openamp_virtio_metal {
-+	struct metal_spinlock lock;
-+	struct metal_device shm_dev;
-+	struct metal_device *io_dev;
-+
-+	struct metal_io_region *io;
-+	struct openamp_virtio_shm shm;
-+};
-+
-+struct openamp_virtio_device {
-+	struct virtio_device virtio_dev;
-+	struct virtqueue *vq[VIRTQUEUE_NR];
-+	struct virtio_vring_info rvrings[VIRTQUEUE_NR];
-+};
-+
-+struct openamp_virtio_rpmsg {
-+	struct rpmsg_virtio_device rpmsg_vdev;
-+	struct rpmsg_endpoint ep;
-+	uint8_t *req_buf;
-+	uint32_t req_len;
-+	uint8_t *resp_buf;
-+	size_t resp_len;
-+};
-+
-+struct openamp_virtio {
-+	struct openamp_caller *openamp;
-+	struct openamp_virtio_rpmsg rpmsg;
-+	struct openamp_virtio_device vdev;
-+	struct openamp_virtio_metal metal;
-+};
-+
-+static struct openamp_virtio *openamp_virtio_from_dev(struct virtio_dev=
ice *vdev)
-+{
-+	struct openamp_virtio_device *openamp_vdev;
-+
-+	openamp_vdev =3D container_of(vdev, struct openamp_virtio_device,
-+			    virtio_dev);
-+
-+	return container_of(openamp_vdev, struct openamp_virtio, vdev);
-+}
-+
-+static struct openamp_virtio_rpmsg *openamp_virtio_rpmsg_from_dev(struc=
t rpmsg_device *rdev)
-+{
-+	struct rpmsg_virtio_device *rvdev;
-+
-+	rvdev =3D container_of(rdev, struct rpmsg_virtio_device, rdev);
-+
-+	return container_of(rvdev, struct openamp_virtio_rpmsg, rpmsg_vdev);
-+
-+}
-+
-+static void openamp_virtio_metal_device_setup(struct metal_device *shm_=
dev,
-+					      struct openamp_virtio_shm *shm)
-+{
-+	struct metal_io_region *shm_region;
-+
-+	shm_region =3D &shm_dev->regions[0];
-+
-+	shm_dev->name =3D OPENAMP_SHEM_DEVICE_NAME;
-+	shm_dev->num_regions =3D 1;
-+
-+	shm_region->virt =3D (void *)shm->payload_addr;
-+	shm_region->size =3D shm->payload_size;
-+
-+	shm_region->physmap =3D &shm->shm_physmap;
-+	shm_region->page_shift =3D (metal_phys_addr_t)(-1);
-+	shm_region->page_mask =3D (metal_phys_addr_t)(-1);
-+}
-+
-+static int openamp_virtio_metal_init(struct openamp_virtio_metal *metal=
)
-+{
-+	struct metal_init_params params =3D METAL_INIT_DEFAULTS;
-+	struct metal_device *shm_dev =3D &metal->shm_dev;
-+	int ret;
-+
-+	openamp_virtio_metal_device_setup(shm_dev, &metal->shm);
-+
-+	metal_spinlock_init(&metal->lock);
-+
-+	ret =3D metal_init(&params);
-+	if (ret < 0)
-+		return ret;
-+
-+	ret =3D metal_register_generic_device(shm_dev);
-+	if (ret < 0)
-+		goto metal_finish;
-+
-+	ret =3D metal_device_open("generic", OPENAMP_SHEM_DEVICE_NAME,
-+				&metal->io_dev);
-+	if (ret < 0)
-+		goto metal_finish;
-+
-+	metal->io =3D metal_device_io_region(metal->io_dev, 0);
-+	if (!metal->io) {
-+		EMSG("openamp: virtio: failed to init metal io");
-+		ret =3D -EPROTO;
-+		goto metal_finish;
-+	}
-+
-+	return 0;
-+
-+metal_finish:
-+	metal_finish();
-+	return ret;
-+}
-+
-+static unsigned char openamp_virtio_status_get(struct virtio_device *vd=
ev)
-+{
-+	struct openamp_virtio *virtio =3D openamp_virtio_from_dev(vdev);
-+	struct openamp_virtio_shm *shm =3D &virtio->metal.shm;
-+
-+	uint32_t status =3D *(volatile uint32_t *)shm->vdev_status;
-+
-+	return status;
-+}
-+
-+static void openamp_virtio_status_set(struct virtio_device *vdev,
-+				      unsigned char status)
-+{
-+	struct openamp_virtio *virtio =3D openamp_virtio_from_dev(vdev);
-+	struct openamp_virtio_shm *shm =3D &virtio->metal.shm;
-+
-+	*(volatile uint32_t *)shm->vdev_status =3D status;
-+}
-+
-+static int count;
-+
-+static uint32_t openamp_virtio_features_get(struct virtio_device *vdev)
-+{
-+	return 1 << VIRTIO_RPMSG_F_NS;
-+}
-+
-+static void openamp_virtio_notify(struct virtqueue *vq)
-+{
-+	struct openamp_virtio_device *openamp_vdev;
-+	struct openamp_caller *openamp;
-+	struct openamp_virtio *virtio;
-+	int ret;
-+
-+	openamp_vdev =3D container_of(vq->vq_dev, struct openamp_virtio_device=
, virtio_dev);
-+	virtio =3D container_of(openamp_vdev, struct openamp_virtio, vdev);
-+	openamp =3D virtio->openamp;
-+
-+	ret =3D openamp->platform_ops->transport_notify(openamp);
-+	if (ret < 0)
-+		EMSG("openamp: virtio: erro in transport_notify: %d", ret);
-+}
-+
-+const static struct virtio_dispatch openamp_virtio_dispatch =3D {
-+	.get_status =3D openamp_virtio_status_get,
-+	.set_status =3D openamp_virtio_status_set,
-+	.get_features =3D openamp_virtio_features_get,
-+	.notify =3D openamp_virtio_notify,
-+};
-+
-+static int openamp_virtio_device_setup(struct openamp_virtio *virtio)
-+{
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+	struct openamp_virtio_device *openamp_vdev =3D &virtio->vdev;
-+	struct virtio_device *vdev =3D &openamp_vdev->virtio_dev;
-+	struct openamp_virtio_shm *shm =3D &metal->shm;
-+	struct virtio_vring_info *rvring;
-+
-+	rvring =3D &openamp_vdev->rvrings[0];
-+
-+	vdev->role =3D RPMSG_REMOTE;
-+	vdev->vrings_num =3D VIRTQUEUE_NR;
-+	vdev->func =3D &openamp_virtio_dispatch;
-+
-+	openamp_vdev->vq[VQ_TX] =3D virtqueue_allocate(VRING_DESCRIPTORS);
-+	if (!openamp_vdev->vq[VQ_TX]) {
-+		EMSG("openamp: virtio: failed to allocate virtqueue 0");
-+		return -ENOMEM;
-+	}
-+	rvring->io =3D metal->io;
-+	rvring->info.vaddr =3D (void *)shm->vring_tx;
-+	rvring->info.num_descs =3D VRING_DESCRIPTORS;
-+	rvring->info.align =3D VRING_ALIGN;
-+	rvring->vq =3D openamp_vdev->vq[VQ_TX];
-+
-+	openamp_vdev->vq[VQ_RX] =3D virtqueue_allocate(VRING_DESCRIPTORS);
-+	if (!openamp_vdev->vq[VQ_RX]) {
-+		EMSG("openamp: virtio: failed to allocate virtqueue 1");
-+		goto free_vq;
-+	}
-+	rvring =3D &openamp_vdev->rvrings[VQ_RX];
-+	rvring->io =3D metal->io;
-+	rvring->info.vaddr =3D (void *)shm->vring_rx;
-+	rvring->info.num_descs =3D VRING_DESCRIPTORS;
-+	rvring->info.align =3D VRING_ALIGN;
-+	rvring->vq =3D openamp_vdev->vq[VQ_RX];
-+
-+	vdev->vrings_info =3D &openamp_vdev->rvrings[0];
-+
-+	return 0;
-+
-+free_vq:
-+	virtqueue_free(openamp_vdev->vq[VQ_TX]);
-+	virtqueue_free(openamp_vdev->vq[VQ_RX]);
-+
-+	return -ENOMEM;
-+}
-+
-+static int openamp_virtio_rpmsg_endpoint_callback(struct rpmsg_endpoint=
 *ep,
-+						  void *data, size_t len,
-+						  uint32_t src, void *priv)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg;
-+	struct rpmsg_device *rdev;
-+	struct openamp_virtio *virtio;
-+
-+	rdev =3D ep->rdev;
-+	vrpmsg =3D openamp_virtio_rpmsg_from_dev(rdev);
-+	virtio =3D container_of(vrpmsg, struct openamp_virtio, rpmsg);
-+
-+	rpmsg_hold_rx_buffer(ep, data);
-+	vrpmsg->resp_buf =3D data;
-+	vrpmsg->resp_len =3D len;
-+
-+	return 0;
-+}
-+
-+static void openamp_virtio_rpmsg_service_unbind(struct rpmsg_endpoint *=
ep)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg;
-+	struct rpmsg_device *rdev;
-+
-+	rdev =3D container_of(ep, struct rpmsg_device, ns_ept);
-+	vrpmsg =3D openamp_virtio_rpmsg_from_dev(rdev);
-+
-+	rpmsg_destroy_ept(&vrpmsg->ep);
-+}
-+
-+static void openamp_virtio_rpmsg_endpoint_bind(struct rpmsg_device *rde=
v,
-+					       const char *name,
-+					       unsigned int dest)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg;
-+
-+	vrpmsg =3D openamp_virtio_rpmsg_from_dev(rdev);
-+
-+	rpmsg_create_ept(&vrpmsg->ep, rdev, name, RPMSG_ADDR_ANY, dest,
-+			 openamp_virtio_rpmsg_endpoint_callback,
-+			 openamp_virtio_rpmsg_service_unbind);
-+}
-+
-+static int openamp_virtio_rpmsg_device_setup(struct openamp_virtio *vir=
tio,
-+					     struct device_region *virtio_dev)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+	struct rpmsg_virtio_device *rpmsg_vdev =3D &vrpmsg->rpmsg_vdev;
-+	struct openamp_virtio_device *openamp_vdev =3D &virtio->vdev;
-+	struct virtio_device *vdev =3D &openamp_vdev->virtio_dev;
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+	int ret;
-+
-+	/*
-+	 * we assume here that we are the client side and do not need to
-+	 * initialize the share memory poll (this is done at server side).
-+	 */
-+	ret =3D rpmsg_init_vdev(rpmsg_vdev, vdev,
-+			      openamp_virtio_rpmsg_endpoint_bind, metal->io,
-+			      NULL);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: init vdev failed: %d", ret);
-+		return ret;
-+	}
-+
-+
-+	ret =3D rpmsg_create_ept(&vrpmsg->ep, &rpmsg_vdev->rdev,
-+			       OPENAMP_RPMSG_ENDPOINT_NAME, RPMSG_ADDR_ANY,
-+			       RPMSG_ADDR_ANY,
-+			       openamp_virtio_rpmsg_endpoint_callback,
-+			       openamp_virtio_rpmsg_service_unbind);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: failed to create endpoint: %d", ret);
-+		return ret;
-+	}
-+
-+	/* set default remote addr */
-+	vrpmsg->ep.dest_addr =3D OPENAMP_RPMSG_ENDPOINT_ADDR;
-+
-+	return 0;
-+}
-+
-+static void openamp_virtio_shm_set(struct openamp_virtio *virtio,
-+				   struct device_region *virtio_region)
-+{
-+	struct openamp_virtio_shm *shm =3D &virtio->metal.shm;
-+
-+	shm->base_addr =3D virtio_region->base_addr;
-+	shm->size =3D virtio_region->io_region_size;
-+
-+	shm->vdev_status =3D shm->base_addr;
-+	shm->vdev_status_size =3D OPENAMP_SHEM_VDEV_SIZE;
-+
-+	shm->vring_rx =3D shm->base_addr + shm->size -
-+		(2 * OPENAMP_SHEM_VRING_SIZE);
-+	shm->vring_rx_size =3D OPENAMP_SHEM_VRING_SIZE;
-+
-+	shm->vring_tx =3D shm->vring_rx + shm->vring_rx_size;
-+	shm->vring_tx_size =3D OPENAMP_SHEM_VRING_SIZE;
-+
-+	shm->payload_addr =3D shm->vdev_status + shm->vdev_status_size;
-+	shm->payload_size =3D shm->size - shm->vdev_status_size -
-+		shm->vring_rx_size - shm->vring_tx_size;
-+
-+	shm->shm_physmap[0] =3D OPENAMP_SHEM_PHYS + shm->vdev_status_size;
-+
-+	IMSG("SHEM: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->base_addr, shm->size, shm->size);
-+	IMSG("VDEV: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->vdev_status, shm->vdev_status_size, shm->vdev_status_size);
-+	IMSG("PAYLOAD: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->payload_addr, shm->payload_size, shm->payload_size);
-+	IMSG("VRING_TX: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->vring_tx, shm->vring_tx_size, shm->vring_tx_size);
-+	IMSG("VRING_RX: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->vring_rx, shm->vring_rx_size, shm->vring_rx_size);
-+	IMSG("PHYMAP: base: 0x%0x", shm->shm_physmap[0]);
-+}
-+
-+static int openamp_virtio_device_get(const char *dev,
-+				     struct device_region *dev_region)
-+{
-+	bool found;
-+
-+	found =3D config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, dev, 0,
-+				   dev_region, sizeof(*dev_region));
-+	if (!found) {
-+		EMSG("openamp: virtio: device region not found: %s", dev);
-+		return -EINVAL;
-+	}
-+
-+	if (dev_region->base_addr =3D=3D 0 || dev_region->io_region_size =3D=3D=
 0) {
-+		EMSG("openamp: virtio: device region not valid");
-+		return -EINVAL;
-+	}
-+
-+	IMSG("openamp: virtio: device region found: %s addr: 0x%x size: %d",
-+	     dev, dev_region->base_addr, dev_region->io_region_size);
-+
-+	return  0;
-+}
-+
-+int openamp_virtio_call_begin(struct openamp_caller *openamp, uint8_t *=
*req_buf,
-+			      size_t req_len)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+	struct rpmsg_endpoint *ep =3D &vrpmsg->ep;
-+
-+
-+	*req_buf =3D rpmsg_get_tx_payload_buffer(ep, &vrpmsg->req_len,
-+					       OPENAMP_BUFFER_WAIT);
-+	if (*req_buf =3D=3D NULL)
-+		return -EINVAL;
-+
-+	if (vrpmsg->req_len < req_len)
-+		return -E2BIG;
-+
-+	vrpmsg->req_buf =3D *req_buf;
-+
-+	return 0;
-+}
-+
-+int openamp_virtio_call_invoke(struct openamp_caller *openamp, int *ops=
tatus,
-+			       uint8_t **resp_buf, size_t *resp_len)
-+{
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_device *openamp_vdev =3D &virtio->vdev;
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+	struct rpmsg_endpoint *ep =3D &vrpmsg->ep;
-+	int ret;
-+
-+	ret =3D rpmsg_send_nocopy(ep, vrpmsg->req_buf, vrpmsg->req_len);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: send nocopy failed: %d", ret);
-+		return -EIO;
-+	}
-+
-+	if (ret !=3D vrpmsg->req_len) {
-+		EMSG("openamp: virtio: send less bytes %d than requested %d",
-+		     ret, vrpmsg->req_len);
-+		return -EIO;
-+	}
-+
-+	if (!ops->transport_receive)
-+		return 0;
-+
-+	ret =3D ops->transport_receive(openamp);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: failed transport_receive");
-+		return -EIO;
-+	}
-+
-+	virtqueue_notification(openamp_vdev->vq[VQ_RX]);
-+
-+	*resp_buf =3D vrpmsg->resp_buf;
-+	*resp_len =3D vrpmsg->resp_len;
-+
-+	return  0;
-+}
-+
-+void openamp_virtio_call_end(struct openamp_caller *openamp)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+
-+	rpmsg_release_rx_buffer(&vrpmsg->ep, vrpmsg->resp_buf);
-+
-+	vrpmsg->req_buf =3D NULL;
-+	vrpmsg->req_len =3D 0;
-+	vrpmsg->resp_buf =3D NULL;
-+	vrpmsg->resp_len =3D 0;
-+}
-+
-+void *openamp_virtio_virt_to_phys(struct openamp_caller *openamp, void =
*va)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+
-+	return metal_io_virt_to_phys(metal->io, va);
-+}
-+
-+void *openamp_virtio_phys_to_virt(struct openamp_caller *openamp, void =
*pa)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+
-+	return metal_io_phys_to_virt(metal->io, pa);
-+}
-+
-+int openamp_virtio_init(struct openamp_caller *openamp)
-+{
-+	struct device_region virtio_dev;
-+	struct openamp_virtio *virtio;
-+	int ret;
-+
-+	if (openamp->platform)
-+		return 0;
-+
-+
-+	virtio =3D malloc(sizeof(*virtio));
-+	if (!virtio)
-+		return -ENOMEM;
-+
-+	virtio->openamp =3D openamp;
-+
-+	ret =3D openamp_virtio_device_get(OPENAMP_SHEM_DEVICE_NAME, &virtio_de=
v);
-+	if (ret < 0)
-+		goto free_virtio;
-+
-+	openamp_virtio_shm_set(virtio, &virtio_dev);
-+
-+	ret =3D openamp_virtio_metal_init(&virtio->metal);
-+	if (ret < 0)
-+		goto free_virtio;
-+
-+	ret =3D openamp_virtio_device_setup(virtio);
-+	if (ret < 0)
-+		goto finish_metal;
-+
-+	ret =3D openamp_virtio_rpmsg_device_setup(virtio, &virtio_dev);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: rpmsg device setup failed: %d", ret);
-+		goto finish_metal;
-+	}
-+
-+	openamp->platform =3D virtio;
-+
-+	return 0;
-+
-+finish_metal:
-+	metal_finish();
-+
-+free_virtio:
-+	free(virtio);
-+
-+	return ret;
-+}
-+
-+int openamp_virtio_deinit(struct openamp_caller *openamp)
-+{
-+	struct openamp_virtio *virtio;
-+
-+	if (!openamp->platform)
-+		return 0;
-+
-+	virtio =3D openamp->platform;
-+
-+	metal_finish();
-+	free(virtio);
-+
-+	openamp->platform =3D NULL;
-+
-+	return 0;
-+}
-diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.h b/compone=
nts/rpc/openamp/caller/sp/openamp_virtio.h
-new file mode 100644
-index 00000000..915128ff
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_virtio.h
-@@ -0,0 +1,24 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+#ifndef OPENAMP_VIRTIO_H
-+#define OPENAMP_VIRTIO_H
-+
-+#include <stddef.h>
-+#include "openamp_caller.h"
-+
-+int openamp_virtio_call_begin(struct openamp_caller *openamp, uint8_t *=
*req_buf,
-+			      size_t req_len);
-+int openamp_virtio_call_invoke(struct openamp_caller *openamp, int *ops=
tatus,
-+			       uint8_t **resp_buf, size_t *resp_len);
-+int openamp_virtio_call_end(struct openamp_caller *openamp);
-+void *openamp_virtio_virt_to_phys(struct openamp_caller *openamp, void =
*va);
-+void *openamp_virtio_phys_to_virt(struct openamp_caller *openamp, void =
*pa);
-+
-+int openamp_virtio_init(struct openamp_caller *openamp);
-+int openamp_virtio_deinit(struct openamp_caller *openamp);
-+
-+#endif
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index 248bd7e3..1511bbad 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -75,6 +75,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/include"
- 		"components/service/attestation/provider"
- 		"components/service/attestation/provider/serializer/packed-c"
-+		"components/rpc/openamp/caller/sp"
-=20
- 		# Stub service provider backends
- 		"components/rpc/dummy"
-diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/depl=
oyments/se-proxy/opteesp/default_se-proxy.dts.in
-index f351a592..55d49b31 100644
---- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-+++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-@@ -32,6 +32,12 @@
- 				pages-count =3D <16>;
- 				attributes =3D <0x3>; /* read-write */
- 			};
-+			openamp-virtio {
-+				/* Armv8 A Foundation Platform values */
-+				base-address =3D <0x00000000 0x88000000>;
-+				pages-count =3D <256>;
-+				attributes =3D <0x3>; /* read-write */
-+			};
- 		};
- 	};
- };
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch b/meta-a=
rm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0=
010-add-psa-client-definitions-for-ff-m.patch
deleted file mode 100644
index f41556a3..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0010-add-psa-client-definitions-for-ff-m.patch
+++ /dev/null
@@ -1,299 +0,0 @@
-From 791a1302d7b779f3aeee7d6f7c9fac00b4244c1b Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:05:18 +0000
-Subject: [PATCH] add psa client definitions for ff-m
-
-Add PSA client definitions in common include to add future
-ff-m support.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../service/common/include/psa/client.h       | 194 ++++++++++++++++++
- components/service/common/include/psa/sid.h   |  71 +++++++
- 2 files changed, 265 insertions(+)
- create mode 100644 components/service/common/include/psa/client.h
- create mode 100644 components/service/common/include/psa/sid.h
-
-diff --git a/components/service/common/include/psa/client.h b/components=
/service/common/include/psa/client.h
-new file mode 100644
-index 00000000..69ccf14f
---- /dev/null
-+++ b/components/service/common/include/psa/client.h
-@@ -0,0 +1,194 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef SERVICE_PSA_IPC_H
-+#define SERVICE_PSA_IPC_H
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#include <rpc_caller.h>
-+#include <psa/error.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#ifndef IOVEC_LEN
-+#define IOVEC_LEN(arr) ((uint32_t)(sizeof(arr)/sizeof(arr[0])))
-+#endif
-+
-+/*********************** PSA Client Macros and Types ******************=
*******/
-+
-+typedef int32_t psa_handle_t;
-+
-+/**
-+ * The version of the PSA Framework API that is being used to build the=
 calling
-+ * firmware. Only part of features of FF-M v1.1 have been implemented. =
FF-M v1.1
-+ * is compatible with v1.0.
-+ */
-+#define PSA_FRAMEWORK_VERSION       (0x0101u)
-+
-+/**
-+ * Return value from psa_version() if the requested RoT Service is not =
present
-+ * in the system.
-+ */
-+#define PSA_VERSION_NONE            (0u)
-+
-+/**
-+ * The zero-value null handle can be assigned to variables used in clie=
nts and
-+ * RoT Services, indicating that there is no current connection or mess=
age.
-+ */
-+#define PSA_NULL_HANDLE             ((psa_handle_t)0)
-+
-+/**
-+ * Tests whether a handle value returned by psa_connect() is valid.
-+ */
-+#define PSA_HANDLE_IS_VALID(handle) ((psa_handle_t)(handle) > 0)
-+
-+/**
-+ * Converts the handle value returned from a failed call psa_connect() =
into
-+ * an error code.
-+ */
-+#define PSA_HANDLE_TO_ERROR(handle) ((psa_status_t)(handle))
-+
-+/**
-+ * Maximum number of input and output vectors for a request to psa_call=
().
-+ */
-+#define PSA_MAX_IOVEC               (4u)
-+
-+/**
-+ * An IPC message type that indicates a generic client request.
-+ */
-+#define PSA_IPC_CALL                (0)
-+
-+/**
-+ * A read-only input memory region provided to an RoT Service.
-+ */
-+struct __attribute__ ((__packed__)) psa_invec {
-+    uint32_t base;           /*!< the start address of the memory buffe=
r */
-+    uint32_t len;                 /*!< the size in bytes               =
       */
-+};
-+
-+/**
-+ * A writable output memory region provided to an RoT Service.
-+ */
-+struct __attribute__ ((__packed__)) psa_outvec {
-+    uint32_t base;                 /*!< the start address of the memory=
 buffer */
-+    uint32_t len;                 /*!< the size in bytes               =
       */
-+};
-+
-+/*************************** PSA Client API ***************************=
*******/
-+
-+/**
-+ * \brief Retrieve the version of the PSA Framework API that is impleme=
nted.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \return version              The version of the PSA Framework implem=
entation
-+ *                              that is providing the runtime services =
to the
-+ *                              caller. The major and minor version are=
 encoded
-+ *                              as follows:
-+ * \arg                           version[15:8] -- major version number=
.
-+ * \arg                           version[7:0]  -- minor version number=
.
-+ */
-+uint32_t psa_framework_version(struct rpc_caller *caller);
-+
-+/**
-+ * \brief Retrieve the version of an RoT Service or indicate that it is=
 not
-+ *        present on this system.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] sid               ID of the RoT Service to query.
-+ *
-+ * \retval PSA_VERSION_NONE     The RoT Service is not implemented, or =
the
-+ *                              caller is not permitted to access the s=
ervice.
-+ * \retval > 0                  The version of the implemented RoT Serv=
ice.
-+ */
-+uint32_t psa_version(struct rpc_caller *caller, uint32_t sid);
-+
-+/**
-+ * \brief Connect to an RoT Service by its SID.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] sid               ID of the RoT Service to connect to.
-+ * \param[in] version           Requested version of the RoT Service.
-+ *
-+ * \retval > 0                  A handle for the connection.
-+ * \retval PSA_ERROR_CONNECTION_REFUSED The SPM or RoT Service has refu=
sed the
-+ *                              connection.
-+ * \retval PSA_ERROR_CONNECTION_BUSY The SPM or RoT Service cannot make=
 the
-+ *                              connection at the moment.
-+ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one o=
r more
-+ *                              of the following are true:
-+ * \arg                           The RoT Service ID is not present.
-+ * \arg                           The RoT Service version is not suppor=
ted.
-+ * \arg                           The caller is not allowed to access t=
he RoT
-+ *                                service.
-+ */
-+psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
-+			 uint32_t version);
-+
-+/**
-+ * \brief Call an RoT Service on an established connection.
-+ *
-+ * \note  FF-M 1.0 proposes 6 parameters for psa_call but the secure ga=
teway ABI
-+ *        support at most 4 parameters. TF-M chooses to encode 'in_len'=
,
-+ *        'out_len', and 'type' into a 32-bit integer to improve effici=
ency.
-+ *        Compared with struct-based encoding, this method saves extra =
memory
-+ *        check and memory copy operation. The disadvantage is that the=
 'type'
-+ *        range has to be reduced into a 16-bit integer. So with this e=
ncoding,
-+ *        the valid range for 'type' is 0-32767.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] handle            A handle to an established connection.
-+ * \param[in] type              The request type.
-+ *                              Must be zero( \ref PSA_IPC_CALL) or pos=
itive.
-+ * \param[in] in_vec            Array of input \ref psa_invec structure=
s.
-+ * \param[in] in_len            Number of input \ref psa_invec structur=
es.
-+ * \param[in,out] out_vec       Array of output \ref psa_outvec structu=
res.
-+ * \param[in] out_len           Number of output \ref psa_outvec struct=
ures.
-+ *
-+ * \retval >=3D0                  RoT Service-specific status value.
-+ * \retval <0                   RoT Service-specific error code.
-+ * \retval PSA_ERROR_PROGRAMMER_ERROR The connection has been terminate=
d by the
-+ *                              RoT Service. The call is a PROGRAMMER E=
RROR if
-+ *                              one or more of the following are true:
-+ * \arg                           An invalid handle was passed.
-+ * \arg                           The connection is already handling a =
request.
-+ * \arg                           type < 0.
-+ * \arg                           An invalid memory reference was provi=
ded.
-+ * \arg                           in_len + out_len > PSA_MAX_IOVEC.
-+ * \arg                           The message is unrecognized by the Ro=
T
-+ *                                Service or incorrectly formatted.
-+ */
-+psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
-+		      int32_t type, const struct psa_invec *in_vec,
-+		      size_t in_len, struct psa_outvec *out_vec, size_t out_len);
-+
-+/**
-+ * \brief Close a connection to an RoT Service.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] handle            A handle to an established connection, =
or the
-+ *                              null handle.
-+ *
-+ * \retval void                 Success.
-+ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one o=
r more
-+ *                              of the following are true:
-+ * \arg                           An invalid handle was provided that i=
s not
-+ *                                the null handle.
-+ * \arg                           The connection is currently handling =
a
-+ *                                request.
-+ */
-+void psa_close(struct rpc_caller *caller, psa_handle_t handle);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* SERVICE_PSA_IPC_H */
-+
-+
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-new file mode 100644
-index 00000000..aaa973c6
---- /dev/null
-+++ b/components/service/common/include/psa/sid.h
-@@ -0,0 +1,71 @@
-+/*
-+ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __PSA_MANIFEST_SID_H__
-+#define __PSA_MANIFEST_SID_H__
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/******** TFM_SP_PS ********/
-+#define TFM_PROTECTED_STORAGE_SERVICE_SID                          (0x0=
0000060U)
-+#define TFM_PROTECTED_STORAGE_SERVICE_VERSION                      (1U)
-+#define TFM_PROTECTED_STORAGE_SERVICE_HANDLE                       (0x4=
0000101U)
-+
-+/* Invalid UID */
-+#define TFM_PS_INVALID_UID 0
-+
-+/* PS message types that distinguish PS services. */
-+#define TFM_PS_SET                1001
-+#define TFM_PS_GET                1002
-+#define TFM_PS_GET_INFO           1003
-+#define TFM_PS_REMOVE             1004
-+#define TFM_PS_GET_SUPPORT        1005
-+
-+/******** TFM_SP_ITS ********/
-+#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x0=
0000070U)
-+#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_VERSION               (1U)
-+#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE                (0x4=
0000102U)
-+
-+/******** TFM_SP_CRYPTO ********/
-+#define TFM_CRYPTO_SID                                             (0x0=
0000080U)
-+#define TFM_CRYPTO_VERSION                                         (1U)
-+#define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-+
-+/******** TFM_SP_PLATFORM ********/
-+#define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
-+#define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
-+#define TFM_SP_PLATFORM_IOCTL_SID                                  (0x0=
0000041U)
-+#define TFM_SP_PLATFORM_IOCTL_VERSION                              (1U)
-+#define TFM_SP_PLATFORM_NV_COUNTER_SID                             (0x0=
0000042U)
-+#define TFM_SP_PLATFORM_NV_COUNTER_VERSION                         (1U)
-+
-+/******** TFM_SP_INITIAL_ATTESTATION ********/
-+#define TFM_ATTESTATION_SERVICE_SID                                (0x0=
0000020U)
-+#define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
-+#define TFM_ATTESTATION_SERVICE_HANDLE                             (0x4=
0000103U)
-+
-+/******** TFM_SP_FWU ********/
-+#define TFM_FWU_WRITE_SID                                          (0x0=
00000A0U)
-+#define TFM_FWU_WRITE_VERSION                                      (1U)
-+#define TFM_FWU_INSTALL_SID                                        (0x0=
00000A1U)
-+#define TFM_FWU_INSTALL_VERSION                                    (1U)
-+#define TFM_FWU_ABORT_SID                                          (0x0=
00000A2U)
-+#define TFM_FWU_ABORT_VERSION                                      (1U)
-+#define TFM_FWU_QUERY_SID                                          (0x0=
00000A3U)
-+#define TFM_FWU_QUERY_VERSION                                      (1U)
-+#define TFM_FWU_REQUEST_REBOOT_SID                                 (0x0=
00000A4U)
-+#define TFM_FWU_REQUEST_REBOOT_VERSION                             (1U)
-+#define TFM_FWU_ACCEPT_SID                                         (0x0=
00000A5U)
-+#define TFM_FWU_ACCEPT_VERSION                                     (1U)
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __PSA_MANIFEST_SID_H__ */
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0011-Add-common-service-component-to-ipc-support.patch =
b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corsto=
ne1000/0011-Add-common-service-component-to-ipc-support.patch
deleted file mode 100644
index 7ecb60f0..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0011-Add-common-service-component-to-ipc-support.patch
+++ /dev/null
@@ -1,295 +0,0 @@
-From b7e9e6fc59263f5daf4ae79eb758fa7647058338 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:13:03 +0000
-Subject: [PATCH] Add common service component to ipc support
-
-Add support for inter processor communication for PSA
-including, the openamp client side structures lib.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../service/common/psa_ipc/component.cmake    |  13 ++
- .../service/common/psa_ipc/service_psa_ipc.c  |  97 +++++++++++++
- .../psa_ipc/service_psa_ipc_openamp_lib.h     | 131 ++++++++++++++++++
- deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
- 4 files changed, 242 insertions(+)
- create mode 100644 components/service/common/psa_ipc/component.cmake
- create mode 100644 components/service/common/psa_ipc/service_psa_ipc.c
- create mode 100644 components/service/common/psa_ipc/service_psa_ipc_op=
enamp_lib.h
-
-diff --git a/components/service/common/psa_ipc/component.cmake b/compone=
nts/service/common/psa_ipc/component.cmake
-new file mode 100644
-index 00000000..5a1c9e62
---- /dev/null
-+++ b/components/service/common/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/service_psa_ipc.c"
-+	)
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-new file mode 100644
-index 00000000..e8093c20
---- /dev/null
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -0,0 +1,97 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <psa/error.h>
-+#include <rpc_caller.h>
-+
-+#include <psa/client.h>
-+#include "service_psa_ipc_openamp_lib.h"
-+
-+psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
-+			 uint32_t version)
-+{
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	struct s_openamp_msg *resp_msg =3D NULL;
-+	struct ns_openamp_msg *req_msg;
-+	rpc_call_handle rpc_handle;
-+	size_t resp_len;
-+	uint8_t *resp;
-+	uint8_t *req;
-+	int ret;
-+
-+	rpc_handle =3D rpc_caller_begin(caller, &req,
-+				      sizeof(struct ns_openamp_msg));
-+	if (!rpc_handle) {
-+		EMSG("psa_connect: could not get handle");
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	req_msg =3D (struct ns_openamp_msg *)req;
-+
-+	req_msg->call_type =3D OPENAMP_PSA_CONNECT;
-+	req_msg->params.psa_connect_params.sid =3D sid;
-+	req_msg->params.psa_connect_params.version =3D version;
-+
-+	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
-+				&resp_len);
-+	if (ret !=3D TS_RPC_CALL_ACCEPTED) {
-+		EMSG("psa_connect: invoke failed: %d", ret);
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	if (psa_status =3D=3D PSA_SUCCESS)
-+		resp_msg =3D (struct s_openamp_msg *)resp;
-+
-+	rpc_caller_end(caller, rpc_handle);
-+
-+	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
-+}
-+
-+psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
-+		      int32_t type, const struct psa_invec *in_vec,
-+		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
-+{
-+
-+}
-+
-+void psa_close(struct rpc_caller *caller, psa_handle_t handle)
-+{
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	struct s_openamp_msg *resp_msg =3D NULL;
-+	struct ns_openamp_msg *req_msg;
-+	rpc_call_handle rpc_handle;
-+	size_t resp_len;
-+	uint8_t *resp;
-+	uint8_t *req;
-+	int ret;
-+
-+	rpc_handle =3D rpc_caller_begin(caller, &req,
-+				      sizeof(struct ns_openamp_msg));
-+	if (!rpc_handle) {
-+		EMSG("psa_close: could not get handle");
-+		return;
-+	}
-+
-+	req_msg =3D (struct ns_openamp_msg *)req;
-+
-+	req_msg->call_type =3D OPENAMP_PSA_CLOSE;
-+	req_msg->params.psa_close_params.handle =3D handle;
-+
-+	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
-+				&resp_len);
-+	if (ret !=3D TS_RPC_CALL_ACCEPTED) {
-+		EMSG("psa_close: invoke failed: %d", ret);
-+		return;
-+	}
-+
-+	rpc_caller_end(caller, rpc_handle);
-+}
-diff --git a/components/service/common/psa_ipc/service_psa_ipc_openamp_l=
ib.h b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
-new file mode 100644
-index 00000000..33ea9666
---- /dev/null
-+++ b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
-@@ -0,0 +1,131 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef SERVICE_PSA_IPC_OPENAMP_LIB_H
-+#define SERVICE_PSA_IPC_OPENAMP_LIB_H
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#include <compiler.h>
-+#include <psa/error.h>
-+
-+#include <stdint.h>
-+#include <psa/client.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/* PSA client call type value */
-+#define OPENAMP_PSA_FRAMEWORK_VERSION       (0x1)
-+#define OPENAMP_PSA_VERSION                 (0x2)
-+#define OPENAMP_PSA_CONNECT                 (0x3)
-+#define OPENAMP_PSA_CALL                    (0x4)
-+#define OPENAMP_PSA_CLOSE                   (0x5)
-+
-+/* Return code of openamp APIs */
-+#define OPENAMP_SUCCESS                     (0)
-+#define OPENAMP_MAP_FULL                    (INT32_MIN + 1)
-+#define OPENAMP_MAP_ERROR                   (INT32_MIN + 2)
-+#define OPENAMP_INVAL_PARAMS                (INT32_MIN + 3)
-+#define OPENAMP_NO_PERMS                    (INT32_MIN + 4)
-+#define OPENAMP_NO_PEND_EVENT               (INT32_MIN + 5)
-+#define OPENAMP_CHAN_BUSY                   (INT32_MIN + 6)
-+#define OPENAMP_CALLBACK_REG_ERROR          (INT32_MIN + 7)
-+#define OPENAMP_INIT_ERROR                  (INT32_MIN + 8)
-+
-+#define HOLD_INPUT_BUFFER (1) /* IF true, TF-M Library will hold the op=
enamp
-+			       * buffer so that openamp shared memory buffer
-+			       * does not get freed.
-+			       */
-+
-+/*
-+ * This structure holds the parameters used in a PSA client call.
-+ */
-+typedef struct __packed psa_client_in_params {
-+	union {
-+		struct __packed {
-+			uint32_t        sid;
-+		} psa_version_params;
-+
-+		struct __packed {
-+			uint32_t        sid;
-+			uint32_t        version;
-+		} psa_connect_params;
-+
-+		struct __packed {
-+			psa_handle_t     handle;
-+			int32_t          type;
-+			uint32_t         in_vec;
-+			uint32_t         in_len;
-+			uint32_t         out_vec;
-+			uint32_t         out_len;
-+		} psa_call_params;
-+
-+		struct __packed {
-+			psa_handle_t    handle;
-+		} psa_close_params;
-+	};
-+} psa_client_in_params_t;
-+
-+/* Openamp message passed from NSPE to SPE to deliver a PSA client call=
 */
-+struct __packed ns_openamp_msg {
-+	uint32_t                      call_type;   /* PSA client call type */
-+	struct psa_client_in_params   params;      /* Contain parameters used =
in PSA
-+						  * client call
-+						  */
-+
-+	int32_t                     client_id;   /* Optional client ID of the
-+						  * non-secure caller.
-+						  * It is required to identify the
-+						  * non-secure task when NSPE OS
-+						  * enforces non-secure task
-+						  * isolation
-+						  */
-+	int32_t                     request_id;  /* This is the unique ID for =
a
-+						  * request send to TF-M by the
-+						  * non-secure core. TF-M forward
-+						  * the ID back to non-secure on the
-+						  * reply to a given request. Using
-+						  * this id, the non-secure library
-+						  * can identify the request for
-+						  * which the reply has received.
-+						  */
-+};
-+
-+/*
-+ * This structure holds the location of the out data of the PSA client =
call.
-+ */
-+struct __packed psa_client_out_params {
-+	uint32_t              out_vec;
-+	uint32_t              out_len;
-+};
-+
-+
-+/* Openamp message from SPE to NSPE delivering the reply back for a PSA=
 client
-+ * call.
-+ */
-+struct __packed s_openamp_msg {
-+	int32_t                     request_id;  /* Using this id, the non-sec=
ure
-+						  * library identifies the request.
-+						  * TF-M forwards the same
-+						  * request-id received on the
-+						  * initial request.
-+						  */
-+	int32_t                     reply;       /* Reply of the PSA client ca=
ll */
-+	struct psa_client_out_params     params;      /* Contain out data resu=
lt of the
-+						       * PSA client call.
-+						       */
-+};
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* SERVICE_PSA_IPC_OPENAMP_LIB_H */
-+
-+
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index 1511bbad..e0e0e12b 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -54,6 +54,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/common/include"
- 		"components/service/common/serializer/protobuf"
- 		"components/service/common/client"
-+		"components/service/common/psa_ipc"
- 		"components/service/common/provider"
- 		"components/service/discovery/provider"
- 		"components/service/discovery/provider/serializer/packed-c"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0012-Add-secure-storage-ipc-backend.patch b/meta-arm-bs=
p/recipes-security/trusted-services/secure-partitions/corstone1000/0012-A=
dd-secure-storage-ipc-backend.patch
deleted file mode 100644
index 068468b8..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0012-Add-secure-storage-ipc-backend.patch
+++ /dev/null
@@ -1,523 +0,0 @@
-From 962056a9c8115e9228719d46b09da983678ab024 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:19:24 +0000
-Subject: [PATCH] Add secure storage ipc backend
-
-Add secure storage ipc ff-m implementation which may use
-openamp as rpc to communicate with other processor.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../service/common/psa_ipc/service_psa_ipc.c  | 143 +++++++++++-
- .../secure_storage_ipc/component.cmake        |  14 ++
- .../secure_storage_ipc/secure_storage_ipc.c   | 214 ++++++++++++++++++
- .../secure_storage_ipc/secure_storage_ipc.h   |  52 +++++
- deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
- 5 files changed, 420 insertions(+), 4 deletions(-)
- create mode 100644 components/service/secure_storage/backend/secure_sto=
rage_ipc/component.cmake
- create mode 100644 components/service/secure_storage/backend/secure_sto=
rage_ipc/secure_storage_ipc.c
- create mode 100644 components/service/secure_storage/backend/secure_sto=
rage_ipc/secure_storage_ipc.h
-
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-index e8093c20..95a07c13 100644
---- a/components/service/common/psa_ipc/service_psa_ipc.c
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -16,6 +16,52 @@
- #include <psa/client.h>
- #include "service_psa_ipc_openamp_lib.h"
-=20
-+static struct psa_invec *psa_call_in_vec_param(uint8_t *req)
-+{
-+	return (struct psa_invec *)(req + sizeof(struct ns_openamp_msg));
-+}
-+
-+static struct psa_outvec *psa_call_out_vec_param(uint8_t *req, size_t i=
n_len)
-+{
-+	return (struct psa_outvec *)(req + sizeof(struct ns_openamp_msg) +
-+				     (in_len * sizeof(struct psa_invec)));
-+}
-+
-+static size_t psa_call_header_len(const struct psa_invec *in_vec, size_=
t in_len,
-+				  struct psa_outvec *out_vec, size_t out_len)
-+{
-+	return sizeof(struct ns_openamp_msg) + (in_len * sizeof(*in_vec)) +
-+		(out_len * sizeof(*out_vec));
-+}
-+
-+static size_t psa_call_in_vec_len(const struct psa_invec *in_vec, size_=
t in_len)
-+{
-+	size_t req_len =3D 0;
-+	int i;
-+
-+	if (!in_vec || !in_len)
-+		return 0;
-+
-+	for (i =3D 0; i < in_len; i++)
-+		req_len +=3D in_vec[i].len;
-+
-+	return req_len;
-+}
-+
-+static size_t psa_call_out_vec_len(const struct psa_outvec *out_vec, si=
ze_t out_len)
-+{
-+	size_t resp_len =3D 0;
-+	int i;
-+
-+	if (!out_vec || !out_len)
-+		return 0;
-+
-+	for (i =3D 0; i < out_len; i++)
-+		resp_len +=3D out_vec[i].len;
-+
-+	return resp_len;
-+}
-+
- psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
- 			 uint32_t version)
- {
-@@ -31,7 +77,7 @@ psa_handle_t psa_connect(struct rpc_caller *caller, ui=
nt32_t sid,
- 	rpc_handle =3D rpc_caller_begin(caller, &req,
- 				      sizeof(struct ns_openamp_msg));
- 	if (!rpc_handle) {
--		EMSG("psa_connect: could not get handle");
-+		EMSG("psa_connect: could not get rpc handle");
- 		return PSA_ERROR_GENERIC_ERROR;
- 	}
-=20
-@@ -56,14 +102,100 @@ psa_handle_t psa_connect(struct rpc_caller *caller=
, uint32_t sid,
- 	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
- }
-=20
--psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
-+psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handl=
e,
- 		      int32_t type, const struct psa_invec *in_vec,
- 		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
- {
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	struct s_openamp_msg *resp_msg =3D NULL;
-+	struct psa_outvec *out_vec_param;
-+	struct psa_invec *in_vec_param;
-+	struct ns_openamp_msg *req_msg;
-+	rpc_call_handle rpc_handle;
-+	size_t out_vec_len;
-+	size_t in_vec_len;
-+	size_t header_len;
-+	uint8_t *payload;
-+	size_t resp_len;
-+	uint8_t *resp;
-+	uint8_t *req;
-+	int ret;
-+	int i;
-+
-+	if ((psa_handle =3D=3D PSA_NULL_HANDLE) || !caller)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	header_len =3D psa_call_header_len(in_vec, in_len, out_vec, out_len);
-+	in_vec_len =3D psa_call_in_vec_len(in_vec, in_len);
-+	out_vec_len =3D psa_call_out_vec_len(out_vec, out_len);
-=20
-+	rpc_handle =3D rpc_caller_begin(caller, &req, header_len + in_vec_len)=
;
-+	if (!rpc_handle) {
-+		EMSG("psa_call: could not get handle");
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	payload =3D req + header_len;
-+
-+	out_vec_param =3D psa_call_out_vec_param(req, in_len);
-+	in_vec_param =3D psa_call_in_vec_param(req);
-+
-+	req_msg =3D (struct ns_openamp_msg *)req;
-+
-+	req_msg->call_type =3D OPENAMP_PSA_CALL;
-+	req_msg->request_id =3D 1234;
-+	req_msg->params.psa_call_params.handle =3D psa_handle;
-+	req_msg->params.psa_call_params.type =3D type;
-+	req_msg->params.psa_call_params.in_len =3D in_len;
-+	req_msg->params.psa_call_params.in_vec =3D rpc_caller_virt_to_phys(cal=
ler, in_vec_param);
-+	req_msg->params.psa_call_params.out_len =3D out_len;
-+	req_msg->params.psa_call_params.out_vec =3D rpc_caller_virt_to_phys(ca=
ller, out_vec_param);
-+
-+	for (i =3D 0; i < in_len; i++) {
-+		in_vec_param[i].base =3D rpc_caller_virt_to_phys(caller, payload);
-+		in_vec_param[i].len =3D in_vec[i].len;
-+
-+		memcpy(payload, in_vec[i].base, in_vec[i].len);
-+		payload +=3D in_vec[i].len;
-+	}
-+
-+	for (i =3D 0; i < out_len; i++) {
-+		out_vec_param[i].base =3D NULL;
-+		out_vec_param[i].len =3D out_vec[i].len;
-+	}
-+
-+	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
-+				&resp_len);
-+	if (ret !=3D TS_RPC_CALL_ACCEPTED) {
-+		EMSG("psa_call: invoke failed: %d", ret);
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	if (psa_status !=3D PSA_SUCCESS) {
-+		EMSG("psa_call: psa_status invoke failed: %d", psa_status);
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	resp_msg =3D (struct s_openamp_msg *)resp;
-+
-+	if (!resp_msg || !out_len || resp_msg->reply !=3D PSA_SUCCESS)
-+		goto caller_end;
-+
-+	out_vec_param =3D (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
-+						     resp_msg->params.out_vec);
-+
-+	for (i =3D 0; i < resp_msg->params.out_len; i++) {
-+		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param=
[i].base),
-+		       out_vec[i].len);
-+	}
-+
-+caller_end:
-+	rpc_caller_end(caller, rpc_handle);
-+
-+	return resp_msg ? resp_msg->reply : PSA_ERROR_COMMUNICATION_FAILURE;
- }
-=20
--void psa_close(struct rpc_caller *caller, psa_handle_t handle)
-+void psa_close(struct rpc_caller *caller, psa_handle_t psa_handle)
- {
- 	psa_status_t psa_status =3D PSA_SUCCESS;
- 	struct s_openamp_msg *resp_msg =3D NULL;
-@@ -74,6 +206,9 @@ void psa_close(struct rpc_caller *caller, psa_handle_=
t handle)
- 	uint8_t *req;
- 	int ret;
-=20
-+	if ((psa_handle =3D=3D PSA_NULL_HANDLE) || !caller)
-+		return;
-+
- 	rpc_handle =3D rpc_caller_begin(caller, &req,
- 				      sizeof(struct ns_openamp_msg));
- 	if (!rpc_handle) {
-@@ -84,7 +219,7 @@ void psa_close(struct rpc_caller *caller, psa_handle_=
t handle)
- 	req_msg =3D (struct ns_openamp_msg *)req;
-=20
- 	req_msg->call_type =3D OPENAMP_PSA_CLOSE;
--	req_msg->params.psa_close_params.handle =3D handle;
-+	req_msg->params.psa_close_params.handle =3D psa_handle;
-=20
- 	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
- 				&resp_len);
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/component.cmake b/components/service/secure_storage/backend/secure_stor=
age_ipc/component.cmake
-new file mode 100644
-index 00000000..5d8f6714
---- /dev/null
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/compo=
nent.cmake
-@@ -0,0 +1,14 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/secure_storage_ipc.c"
-+	)
-+
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-new file mode 100644
-index 00000000..9b55f77d
---- /dev/null
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -0,0 +1,214 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include "secure_storage_ipc.h"
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <rpc_caller.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+
-+static psa_status_t secure_storage_ipc_set(void *context, uint32_t clie=
nt_id,
-+			 psa_storage_uid_t uid, size_t data_length,
-+			 const void *p_data, psa_storage_create_flags_t create_flags)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D p_data, .len =3D data_length },
-+		{ .base =3D &create_flags, .len =3D sizeof(create_flags) },
-+	};
-+
-+	(void)client_id;
-+
-+	ipc->client.rpc_status =3D TS_RPC_CALL_ACCEPTED;
-+
-+	/* Validating input parameters */
-+	if (p_data =3D=3D NULL)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
-+	if (psa_status < 0)
-+		EMSG("ipc_set: psa_call failed: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_get(void *context,
-+					   uint32_t client_id,
-+					   psa_storage_uid_t uid,
-+					   size_t data_offset,
-+					   size_t data_size,
-+					   void *p_data,
-+					   size_t *p_data_length)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	uint32_t offset =3D (uint32_t)data_offset;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D &offset, .len =3D sizeof(offset) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D p_data, .len =3D data_size },
-+	};
-+
-+	if (!p_data_length) {
-+		EMSG("ipc_get: p_data_length not defined");
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
-+			      out_vec, IOVEC_LEN(out_vec));
-+	if (psa_status =3D=3D PSA_SUCCESS)
-+		*p_data_length =3D out_vec[0].len;
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_get_info(void *context,
-+						uint32_t client_id,
-+						psa_storage_uid_t uid,
-+						struct psa_storage_info_t *p_info)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D p_info, .len =3D sizeof(*p_info) },
-+	};
-+
-+	(void)client_id;
-+
-+	/* Validating input parameters */
-+	if (!p_info)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_GET_INFO, in_vec,
-+			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	if (psa_status !=3D PSA_SUCCESS)
-+		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_remove(void *context,
-+						uint32_t client_id,
-+						psa_storage_uid_t uid)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+	};
-+
-+	(void)client_id;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_REMOVE, in_vec,
-+			      IOVEC_LEN(in_vec), NULL, 0);
-+	if (psa_status !=3D PSA_SUCCESS)
-+		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_create(void *context,
-+					      uint32_t client_id,
-+					      uint64_t uid,
-+					      size_t capacity,
-+					      uint32_t create_flags)
-+{
-+	(void)context;
-+	(void)uid;
-+	(void)client_id;
-+	(void)capacity;
-+	(void)create_flags;
-+
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static psa_status_t secure_storage_set_extended(void *context,
-+						uint32_t client_id,
-+						uint64_t uid,
-+						size_t data_offset,
-+						size_t data_length,
-+						const void *p_data)
-+{
-+	(void)context;
-+	(void)uid;
-+	(void)client_id;
-+	(void)data_offset;
-+	(void)data_length;
-+	(void)p_data;
-+
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static uint32_t secure_storage_get_support(void *context, uint32_t clie=
nt_id)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	uint32_t support_flags;
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D &support_flags, .len =3D  sizeof(support_flags) },
-+	};
-+
-+	(void)client_id;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_GET_SUPPORT, NULL, 0,
-+			      out_vec, IOVEC_LEN(out_vec));
-+	if (psa_status !=3D PSA_SUCCESS)
-+		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+struct storage_backend *secure_storage_ipc_init(struct secure_storage_i=
pc *context,
-+						struct rpc_caller *caller)
-+{
-+	service_client_init(&context->client, caller);
-+
-+	static const struct storage_backend_interface interface =3D
-+	{
-+		.set =3D secure_storage_ipc_set,
-+		.get =3D secure_storage_ipc_get,
-+		.get_info =3D secure_storage_ipc_get_info,
-+		.remove =3D secure_storage_ipc_remove,
-+		.create =3D secure_storage_ipc_create,
-+		.set_extended =3D secure_storage_set_extended,
-+		.get_support =3D secure_storage_get_support,
-+	};
-+
-+	context->backend.context =3D context;
-+	context->backend.interface =3D &interface;
-+
-+	return &context->backend;
-+}
-+
-+void secure_storage_ipc_deinit(struct secure_storage_ipc *context)
-+{
-+	service_client_deinit(&context->client);
-+}
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.h b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.h
-new file mode 100644
-index 00000000..e8c1e8fd
---- /dev/null
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.h
-@@ -0,0 +1,52 @@
-+/*
-+ * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef SECURE_STORAGE_IPC_H
-+#define SECURE_STORAGE_IPC_H
-+
-+#include <service/secure_storage/backend/storage_backend.h>
-+#include <service/common/client/service_client.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * @brief      Secure storage ipc instance
-+ */
-+struct secure_storage_ipc
-+{
-+    struct storage_backend backend;
-+    struct service_client client;
-+};
-+
-+/**
-+ * @brief      Initialize a secure storage ipc client
-+ *
-+ * A secure storage client is a storage backend that makes RPC calls
-+ * to a remote secure storage provider.
-+ *
-+ * @param[in]  context    Instance data
-+ * @param[in]  rpc_caller RPC caller instance
-+ *
-+ *
-+ * @return     Pointer to inialized storage backend or NULL on failure
-+ */
-+struct storage_backend *secure_storage_ipc_init(struct secure_storage_i=
pc *context,
-+						struct rpc_caller *caller);
-+
-+/**
-+ * @brief      Deinitialize a secure storage ipc client
-+ *
-+ * @param[in]  context   Instance data
-+ */
-+void secure_storage_ipc_deinit(struct secure_storage_ipc *context);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* SECURE_STORAGE_IPC_H */
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index e0e0e12b..663177b7 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -73,6 +73,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/crypto/factory/full"
- 		"components/service/secure_storage/include"
- 		"components/service/secure_storage/frontend/secure_storage_provider"
-+		"components/service/secure_storage/backend/secure_storage_ipc"
- 		"components/service/attestation/include"
- 		"components/service/attestation/provider"
- 		"components/service/attestation/provider/serializer/packed-c"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.pa=
tch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
deleted file mode 100644
index 56964b5c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 12b8b8bb28c96e6f121122939b7d23e6c7055f0f Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:25:34 +0000
-Subject: [PATCH] Use secure storage ipc and openamp for se_proxy
-
-Remove mock up backend for secure storage in se proxy
-deployment and use instead the secure storage ipc backend with
-openamp as rpc to secure enclave side.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../se-proxy/opteesp/service_proxy_factory.c     | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/depl=
oyments/se-proxy/opteesp/service_proxy_factory.c
-index acfb6e88..57290056 100644
---- a/deployments/se-proxy/opteesp/service_proxy_factory.c
-+++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
-@@ -6,15 +6,20 @@
-=20
- #include <stddef.h>
- #include <rpc/common/endpoint/rpc_interface.h>
-+#include <rpc/openamp/caller/sp/openamp_caller.h>
- #include <service/attestation/provider/attest_provider.h>
- #include <service/attestation/provider/serializer/packed-c/packedc_atte=
st_provider_serializer.h>
- #include <service/crypto/factory/crypto_provider_factory.h>
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
-+#include <trace.h>
-=20
- /* Stub backends */
- #include <service/crypto/backend/stub/stub_crypto_backend.h>
-+#include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
- #include <service/secure_storage/backend/mock_store/mock_store.h>
-=20
-+struct openamp_caller openamp;
-+
- struct rpc_interface *attest_proxy_create(void)
- {
- 	struct rpc_interface *attest_iface;
-@@ -47,10 +52,15 @@ struct rpc_interface *crypto_proxy_create(void)
-=20
- struct rpc_interface *ps_proxy_create(void)
- {
--	static struct mock_store ps_backend;
- 	static struct secure_storage_provider ps_provider;
--
--	struct storage_backend *backend =3D mock_store_init(&ps_backend);
-+	static struct secure_storage_ipc ps_backend;
-+	static struct rpc_caller *storage_caller;
-+	struct storage_backend *backend;
-+
-+	storage_caller =3D openamp_caller_init(&openamp);
-+	if (!storage_caller)
-+		return NULL;
-+	backend =3D secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
-=20
- 	return secure_storage_provider_init(&ps_provider, backend);
- }
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0014-Add-uefi-variable-append-write-support.patch b/met=
a-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone100=
0/0014-Add-uefi-variable-append-write-support.patch
deleted file mode 100644
index cf7357e8..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0014-Add-uefi-variable-append-write-support.patch
+++ /dev/null
@@ -1,1162 +0,0 @@
-From 254f564c76320478e7b509faf279c0c493470657 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Thu, 2 Dec 2021 10:15:54 +0000
-Subject: [PATCH] Add uefi variable append write support
-
-Adds support for extending UEFI variable data handled by the
-smm_variable service provider using the EFI_VARIABLE_APPEND_WRITE
-attribute.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I7a6562327bc0a5ce5cd0e85276325227b83e9f9e
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../backend/test/variable_index_tests.cpp     |  90 +++---
- .../backend/test/variable_store_tests.cpp     |  40 ++-
- .../backend/uefi_variable_store.c             | 263 +++++++++++-------
- .../smm_variable/backend/variable_index.c     |  95 +++----
- .../smm_variable/backend/variable_index.h     |  58 ++--
- .../backend/variable_index_iterator.c         |   4 +-
- .../backend/variable_index_iterator.h         |   2 +-
- .../service/smm_variable_service_tests.cpp    |  48 ++++
- protocols/service/smm_variable/parameters.h   |   3 +
- 9 files changed, 364 insertions(+), 239 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/test/variable_index=
_tests.cpp b/components/service/smm_variable/backend/test/variable_index_=
tests.cpp
-index c8bacf97..8edc0e70 100644
---- a/components/service/smm_variable/backend/test/variable_index_tests.=
cpp
-+++ b/components/service/smm_variable/backend/test/variable_index_tests.=
cpp
-@@ -69,34 +69,37 @@ TEST_GROUP(UefiVariableIndexTests)
-=20
- 	void create_variables()
- 	{
--		const struct variable_info *info =3D NULL;
-+		struct variable_info *info =3D NULL;
-=20
--		info =3D variable_index_add_variable(
-+		info =3D variable_index_add_entry(
- 			&m_variable_index,
- 			&guid_1,
- 			name_1.size() * sizeof(int16_t),
--			name_1.data(),
--			EFI_VARIABLE_BOOTSERVICE_ACCESS);
--
-+			name_1.data());
- 		CHECK_TRUE(info);
-+		variable_index_set_variable(
-+			info,
-+			EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
--		info =3D variable_index_add_variable(
-+		info =3D variable_index_add_entry(
- 			&m_variable_index,
- 			&guid_2,
- 			name_2.size() * sizeof(int16_t),
--			name_2.data(),
--			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS);
--
-+			name_2.data());
- 		CHECK_TRUE(info);
-+		variable_index_set_variable(
-+			info,
-+			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
--		info =3D variable_index_add_variable(
-+		info =3D variable_index_add_entry(
- 			&m_variable_index,
- 			&guid_1,
- 			name_3.size() * sizeof(int16_t),
--			name_3.data(),
--			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_RUNTIME_ACCESS);
--
-+			name_3.data());
- 		CHECK_TRUE(info);
-+		variable_index_set_variable(
-+			info,
-+			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_RUNTIME_ACCESS);
- 	}
-=20
- 	static const size_t MAX_VARIABLES =3D 10;
-@@ -111,7 +114,7 @@ TEST_GROUP(UefiVariableIndexTests)
-=20
- TEST(UefiVariableIndexTests, emptyIndexOperations)
- {
--	const struct variable_info *info =3D NULL;
-+	struct variable_info *info =3D NULL;
-=20
- 	/* Expect not to find a variable */
- 	info =3D variable_index_find(
-@@ -130,36 +133,34 @@ TEST(UefiVariableIndexTests, emptyIndexOperations)
- 	POINTERS_EQUAL(NULL, info);
-=20
- 	/* Remove should silently return */
--	variable_index_remove_variable(
-+	variable_index_clear_variable(
- 		&m_variable_index,
- 		info);
- }
-=20
- TEST(UefiVariableIndexTests, addWithOversizedName)
- {
--	const struct variable_info *info =3D NULL;
-+	struct variable_info *info =3D NULL;
- 	std::vector<int16_t> name;
-=20
- 	name =3D to_variable_name(L"a long variable name that exceeds the leng=
th limit");
-=20
--	info =3D variable_index_add_variable(
-+	info =3D variable_index_add_entry(
- 		&m_variable_index,
- 		&guid_1,
- 		name.size() * sizeof(int16_t),
--		name.data(),
--		EFI_VARIABLE_BOOTSERVICE_ACCESS);
-+		name.data());
-=20
- 	/* Expect the add to fail because of an oversized name */
- 	POINTERS_EQUAL(NULL, info);
-=20
- 	name =3D to_variable_name(L"a long variable name that fits!");
-=20
--	info =3D variable_index_add_variable(
-+	info =3D variable_index_add_entry(
- 		&m_variable_index,
- 		&guid_1,
- 		name.size() * sizeof(int16_t),
--		name.data(),
--		EFI_VARIABLE_BOOTSERVICE_ACCESS);
-+		name.data());
-=20
- 	/* Expect the add succeed */
- 	CHECK_TRUE(info);
-@@ -167,18 +168,17 @@ TEST(UefiVariableIndexTests, addWithOversizedName)
-=20
- TEST(UefiVariableIndexTests, variableIndexFull)
- {
--	const struct variable_info *info =3D NULL;
-+	struct variable_info *info =3D NULL;
- 	EFI_GUID guid =3D guid_1;
-=20
- 	/* Expect to be able to fill the index */
- 	for (size_t i =3D 0; i < MAX_VARIABLES; ++i) {
-=20
--		info =3D variable_index_add_variable(
-+		info =3D variable_index_add_entry(
- 			&m_variable_index,
- 			&guid,
- 			name_1.size() * sizeof(int16_t),
--			name_1.data(),
--			EFI_VARIABLE_BOOTSERVICE_ACCESS);
-+			name_1.data());
-=20
- 		CHECK_TRUE(info);
-=20
-@@ -187,12 +187,11 @@ TEST(UefiVariableIndexTests, variableIndexFull)
- 	}
-=20
- 	/* Variable index should now be full */
--	info =3D variable_index_add_variable(
-+	info =3D variable_index_add_entry(
- 		&m_variable_index,
- 		&guid,
- 		name_1.size() * sizeof(int16_t),
--		name_1.data(),
--		EFI_VARIABLE_BOOTSERVICE_ACCESS);
-+		name_1.data());
-=20
- 	POINTERS_EQUAL(NULL, info);
- }
-@@ -323,7 +322,7 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
- TEST(UefiVariableIndexTests, removeVariable)
- {
- 	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
--	const struct variable_info *info =3D NULL;
-+	struct variable_info *info =3D NULL;
-=20
- 	create_variables();
-=20
-@@ -334,7 +333,7 @@ TEST(UefiVariableIndexTests, removeVariable)
- 		name_2.size() * sizeof(int16_t),
- 		name_2.data());
-=20
--	variable_index_remove_variable(
-+	variable_index_clear_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -352,7 +351,7 @@ TEST(UefiVariableIndexTests, removeVariable)
- 		name_1.size() * sizeof(int16_t),
- 		name_1.data());
-=20
--	variable_index_remove_variable(
-+	variable_index_clear_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -370,7 +369,7 @@ TEST(UefiVariableIndexTests, removeVariable)
- 		name_3.size() * sizeof(int16_t),
- 		name_3.data());
-=20
--	variable_index_remove_variable(
-+	variable_index_clear_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -395,7 +394,7 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- TEST(UefiVariableIndexTests, checkIterator)
- {
--	const struct variable_info *info =3D NULL;
-+	struct variable_info *info =3D NULL;
-=20
- 	create_variables();
-=20
-@@ -419,7 +418,7 @@ TEST(UefiVariableIndexTests, checkIterator)
- 	UNSIGNED_LONGS_EQUAL(name_2.size() * sizeof(int16_t), info->metadata.n=
ame_size);
- 	MEMCMP_EQUAL(name_2.data(), info->metadata.name, info->metadata.name_s=
ize);
-=20
--	const struct variable_info *info_to_remove =3D info;
-+	struct variable_info *info_to_remove =3D info;
-=20
- 	variable_index_iterator_next(&iter);
- 	CHECK_FALSE(variable_index_iterator_is_done(&iter));
-@@ -435,7 +434,8 @@ TEST(UefiVariableIndexTests, checkIterator)
- 	CHECK_TRUE(variable_index_iterator_is_done(&iter));
-=20
- 	/* Now remove the middle entry */
--	variable_index_remove_variable(&m_variable_index, info_to_remove);
-+	variable_index_clear_variable(&m_variable_index, info_to_remove);
-+	variable_index_remove_unused_entry(&m_variable_index, info_to_remove);
-=20
- 	/* Iterate again but this time there should only be two entries */
- 	variable_index_iterator_first(&iter, &m_variable_index);
-@@ -478,7 +478,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExis=
tingVar)
- 	constraints.max_size =3D 100;
-=20
- 	/* Set check constraints on one of the variables */
--	const struct variable_info *info =3D variable_index_find(
-+	struct variable_info *info =3D variable_index_find(
- 		&m_variable_index,
- 		&guid_2,
- 		name_2.size() * sizeof(int16_t),
-@@ -488,7 +488,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExis=
tingVar)
- 	CHECK_TRUE(info->is_variable_set);
- 	CHECK_FALSE(info->is_constraints_set);
-=20
--	variable_index_update_constraints(info, &constraints);
-+	variable_index_set_constraints(info, &constraints);
-=20
- 	CHECK_TRUE(info->is_constraints_set);
- 	CHECK_TRUE(info->is_variable_set);
-@@ -496,7 +496,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExis=
tingVar)
- 	/* Remove the variable but still expect the variable to be indexed
- 	 * because of the set constraints.
- 	 */
--	variable_index_remove_variable(
-+	variable_index_clear_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -588,7 +588,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsNonE=
xistingVar)
- 	constraints.max_size =3D 100;
-=20
- 	/* Initially expect no variable_info */
--	const struct variable_info *info =3D variable_index_find(
-+	struct variable_info *info =3D variable_index_find(
- 		&m_variable_index,
- 		&guid_2,
- 		name_2.size() * sizeof(int16_t),
-@@ -597,19 +597,19 @@ TEST(UefiVariableIndexTests, setCheckConstraintsNo=
nExistingVar)
- 	CHECK_FALSE(info);
-=20
- 	/* Adding the check constraints should result in an entry being added =
*/
--	info =3D variable_index_add_constraints(
-+	info =3D variable_index_add_entry(
- 		&m_variable_index,
- 		&guid_2,
- 		name_2.size() * sizeof(int16_t),
--		name_2.data(),
--		&constraints);
--
-+		name_2.data());
- 	CHECK_TRUE(info);
-+
-+	variable_index_set_constraints(info, &constraints);
- 	CHECK_FALSE(info->is_variable_set);
- 	CHECK_TRUE(info->is_constraints_set);
-=20
- 	/* Updating the variable should cause the variable to be marked as set=
 */
--	variable_index_update_variable(info, EFI_VARIABLE_RUNTIME_ACCESS);
-+	variable_index_set_variable(info, EFI_VARIABLE_RUNTIME_ACCESS);
-=20
- 	CHECK_TRUE(info->is_variable_set);
- 	CHECK_TRUE(info->is_constraints_set);
-diff --git a/components/service/smm_variable/backend/test/variable_store=
_tests.cpp b/components/service/smm_variable/backend/test/variable_store_=
tests.cpp
-index f6aba13a..578f118f 100644
---- a/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-+++ b/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-@@ -250,6 +250,21 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
- 	/* Expect got variable data to be the same as the set value */
- 	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
- 	LONGS_EQUAL(0, input_data.compare(output_data));
-+
-+	/* Extend the variable using an append write */
-+	std::string input_data2 =3D " jumps over the lazy dog";
-+
-+	status =3D set_variable(var_name, input_data2, EFI_VARIABLE_APPEND_WRI=
TE);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	status =3D get_variable(var_name, output_data);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	std::string expected_output =3D input_data + input_data2;
-+
-+	/* Expect the append write operation to have extended the variable */
-+	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
-+	LONGS_EQUAL(0, expected_output.compare(output_data));
- }
-=20
- TEST(UefiVariableStoreTests, persistentSetGet)
-@@ -259,7 +274,8 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	std::string input_data =3D "quick brown fox";
- 	std::string output_data;
-=20
--	status =3D set_variable(var_name, input_data, EFI_VARIABLE_NON_VOLATIL=
E);
-+	status =3D set_variable(var_name, input_data,
-+		EFI_VARIABLE_NON_VOLATILE);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	status =3D get_variable(var_name, output_data);
-@@ -269,6 +285,22 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
- 	LONGS_EQUAL(0, input_data.compare(output_data));
-=20
-+	/* Extend the variable using an append write */
-+	std::string input_data2 =3D " jumps over the lazy dog";
-+
-+	status =3D set_variable(var_name, input_data2,
-+		EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_APPEND_WRITE);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	status =3D get_variable(var_name, output_data);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	std::string expected_output =3D input_data + input_data2;
-+
-+	/* Expect the append write operation to have extended the variable */
-+	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
-+	LONGS_EQUAL(0, expected_output.compare(output_data));
-+
- 	/* Expect the variable to survive a power cycle */
- 	power_cycle();
-=20
-@@ -277,8 +309,8 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Still expect got variable data to be the same as the set value */
--	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
--	LONGS_EQUAL(0, input_data.compare(output_data));
-+	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
-+	LONGS_EQUAL(0, expected_output.compare(output_data));
- }
-=20
- TEST(UefiVariableStoreTests, removeVolatile)
-@@ -317,7 +349,7 @@ TEST(UefiVariableStoreTests, removePersistent)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Remove by setting with zero data length */
--	status =3D set_variable(var_name, std::string(), 0);
-+	status =3D set_variable(var_name, std::string(), EFI_VARIABLE_NON_VOLA=
TILE);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Expect variable to no loger exist */
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index b7091d75..bcb85995 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -46,6 +46,13 @@ static efi_status_t load_variable_data(
- 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
- 	size_t max_data_len);
-=20
-+static psa_status_t append_write(
-+	struct storage_backend *storage_backend,
-+	uint32_t client_id,
-+	uint64_t uid,
-+	size_t data_length,
-+	const void *data);
-+
- static void purge_orphan_index_entries(
- 	struct uefi_variable_store *context);
-=20
-@@ -113,40 +120,45 @@ efi_status_t uefi_variable_store_set_variable(
- 	struct uefi_variable_store *context,
- 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
- {
-+	bool should_sync_index =3D false;
-+
-+	/* Validate incoming request */
- 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
- 	status =3D check_capabilities(var);
--	bool should_sync_index =3D false;
--
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
--	/* Find in index */
--	const struct variable_info *info =3D variable_index_find(
-+	/* Find an existing entry in the variable index or add a new one */
-+	struct variable_info *info =3D variable_index_find(
- 		&context->variable_index,
- 		&var->Guid,
- 		var->NameSize,
- 		var->Name);
-=20
--	if (info) {
-+	if (!info) {
-=20
--		/* Variable info already exists */
--		status =3D check_access_permitted_on_set(context, info, var);
-+		info =3D variable_index_add_entry(
-+			&context->variable_index,
-+			&var->Guid,
-+			var->NameSize,
-+			var->Name);
-=20
--		if (status =3D=3D EFI_SUCCESS) {
-+		if (!info) return EFI_OUT_OF_RESOURCES;
-+	}
-=20
--			should_sync_index =3D
--				(var->Attributes & EFI_VARIABLE_NON_VOLATILE) ||
--				(info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE=
_NON_VOLATILE));
-+	/* Control access */
-+	status =3D check_access_permitted_on_set(context, info, var);
-=20
--			if (var->DataSize) {
-+	if (status =3D=3D EFI_SUCCESS) {
-=20
--				/* It's a set rather than a remove operation */
--				variable_index_update_variable(
--					info,
--					var->Attributes);
--			}
--			else {
-+		/* Access permitted */
-+		if (info->is_variable_set) {
-+
-+			/* It's a request to update to an existing variable */
-+			if (!(var->Attributes &
-+				(EFI_VARIABLE_APPEND_WRITE | EFI_VARIABLE_AUTHENTICATED_WRITE_ACCES=
S_MASK)) &&
-+				!var->DataSize) {
-=20
- 				/* It's a remove operation - for a remove, the variable
- 				 * data must be removed from the storage backend before
-@@ -155,30 +167,29 @@ efi_status_t uefi_variable_store_set_variable(
- 				 * the storage backend without a corresponding index entry.
- 				 */
- 				remove_variable_data(context, info);
--				variable_index_remove_variable(&context->variable_index, info);
-+				variable_index_clear_variable(&context->variable_index, info);
-=20
--				/* Variable info no longer valid */
--				info =3D NULL;
-+				should_sync_index =3D (var->Attributes & EFI_VARIABLE_NON_VOLATILE)=
;
-+			}
-+			else {
-+
-+				/* It's a set operation where variable data is potentially
-+				 * being overwritten or extended.
-+				 */
-+				if ((var->Attributes & ~EFI_VARIABLE_APPEND_WRITE) !=3D info->metad=
ata.attributes) {
-+
-+					/* Modifying attributes is forbidden */
-+					return EFI_INVALID_PARAMETER;
-+				}
- 			}
- 		}
- 		else {
-=20
--			/* Access forbidden */
--			info =3D NULL;
--		}
--	}
--	else if (var->DataSize) {
-+			/*  It's a request to create a new variable */
-+			variable_index_set_variable(info, var->Attributes);
-=20
--		/* It's a new variable */
--		info =3D variable_index_add_variable(
--			&context->variable_index,
--			&var->Guid,
--			var->NameSize,
--			var->Name,
--			var->Attributes);
--
--		if (!info) status =3D EFI_OUT_OF_RESOURCES;
--		should_sync_index =3D info && (info->metadata.attributes & EFI_VARIAB=
LE_NON_VOLATILE);
-+			should_sync_index =3D (var->Attributes & EFI_VARIABLE_NON_VOLATILE);
-+		}
- 	}
-=20
- 	/* The order of these operations is important. For an update
-@@ -195,11 +206,13 @@ efi_status_t uefi_variable_store_set_variable(
- 	}
-=20
- 	/* Store any variable data to the storage backend */
--	if (info && (status =3D=3D EFI_SUCCESS)) {
-+	if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
-=20
- 		status =3D store_variable_data(context, info, var);
- 	}
-=20
-+	variable_index_remove_unused_entry(&context->variable_index, info);
-+
- 	return status;
- }
-=20
-@@ -293,54 +306,42 @@ efi_status_t uefi_variable_store_set_var_check_pro=
perty(
- 	efi_status_t status =3D check_name_terminator(property->Name, property=
->NameSize);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
--	/* Find in index */
--	const struct variable_info *info =3D variable_index_find(
-+	/* Find in index or create a new entry */
-+	struct variable_info *info =3D variable_index_find(
- 		&context->variable_index,
- 		&property->Guid,
- 		property->NameSize,
- 		property->Name);
-=20
--	if (info) {
-+	if (!info) {
-=20
--		/* Applying check constraints to an existing variable that may have
--		 * constraints already set.  These could constrain the setting of
--		 * the constraints.
--		 */
--		struct variable_constraints constraints =3D info->check_constraints;
--
--		status =3D variable_checker_set_constraints(
--			&constraints,
--			info->is_constraints_set,
--			&property->VariableProperty);
--
--		if (status =3D=3D EFI_SUCCESS) {
-+		info =3D variable_index_add_entry(
-+			&context->variable_index,
-+			&property->Guid,
-+			property->NameSize,
-+			property->Name);
-=20
--			variable_index_update_constraints(info, &constraints);
--		}
-+		if (!info) return EFI_OUT_OF_RESOURCES;
- 	}
--	else {
--
--		/* Applying check constraints for a new variable */
--		struct variable_constraints constraints;
-=20
--		status =3D variable_checker_set_constraints(
--			&constraints,
--			false,
--			&property->VariableProperty);
-+	/* Applying check constraints to an existing variable that may have
-+	 * constraints already set.  These could constrain the setting of
-+	 * the constraints.
-+	 */
-+	struct variable_constraints constraints =3D info->check_constraints;
-=20
--		if (status =3D=3D EFI_SUCCESS) {
-+	status =3D variable_checker_set_constraints(
-+		&constraints,
-+		info->is_constraints_set,
-+		&property->VariableProperty);
-=20
--			info =3D variable_index_add_constraints(
--				&context->variable_index,
--				&property->Guid,
--				property->NameSize,
--				property->Name,
--				&constraints);
-+	if (status =3D=3D EFI_SUCCESS) {
-=20
--			if (!info) status =3D EFI_OUT_OF_RESOURCES;
--		}
-+		variable_index_set_constraints(info, &constraints);
- 	}
-=20
-+	variable_index_remove_unused_entry(&context->variable_index, info);
-+
- 	return status;
- }
-=20
-@@ -440,7 +441,8 @@ static efi_status_t check_capabilities(
- 	if (var->Attributes & ~(
- 		EFI_VARIABLE_NON_VOLATILE |
- 		EFI_VARIABLE_BOOTSERVICE_ACCESS |
--		EFI_VARIABLE_RUNTIME_ACCESS)) {
-+		EFI_VARIABLE_RUNTIME_ACCESS |
-+		EFI_VARIABLE_APPEND_WRITE)) {
-=20
- 		/* An unsupported attribute has been requested */
- 		status =3D EFI_UNSUPPORTED;
-@@ -486,17 +488,6 @@ static efi_status_t check_access_permitted_on_set(
- 			var->DataSize);
- 	}
-=20
--	if ((status =3D=3D EFI_SUCCESS) && var->DataSize) {
--
--		/* Restrict which attributes can be modified for an existing variable=
 */
--		if ((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=3D
--			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
--
--			/* Don't permit change of storage class */
--			status =3D EFI_INVALID_PARAMETER;
--		}
--	}
--
- 	return status;
- }
-=20
-@@ -518,20 +509,34 @@ static efi_status_t store_variable_data(
-=20
- 	if (storage_backend) {
-=20
--		psa_status =3D storage_backend->interface->set(
--			storage_backend->context,
--			context->owner_id,
--			info->metadata.uid,
--			data_len,
--			data,
--			PSA_STORAGE_FLAG_NONE);
-+		if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
-+
-+			/* Create or overwrite variable data */
-+			psa_status =3D storage_backend->interface->set(
-+				storage_backend->context,
-+				context->owner_id,
-+				info->metadata.uid,
-+				data_len,
-+				data,
-+				PSA_STORAGE_FLAG_NONE);
-+		}
-+		else {
-+
-+			/* Append new data to existing variable data */
-+			psa_status =3D append_write(
-+				storage_backend,
-+				context->owner_id,
-+				info->metadata.uid,
-+				data_len,
-+				data);
-+		}
- 	}
-=20
- 	if ((psa_status !=3D PSA_SUCCESS) && is_nv) {
-=20
- 		/* A storage failure has occurred so attempt to fix any
--		* mismatch between the variable index and stored NV variables.
--		*/
-+		 * mismatch between the variable index and stored NV variables.
-+		 */
- 		purge_orphan_index_entries(context);
- 	}
-=20
-@@ -598,6 +603,76 @@ static efi_status_t load_variable_data(
- 	return psa_to_efi_storage_status(psa_status);
- }
-=20
-+static psa_status_t append_write(
-+	struct storage_backend *storage_backend,
-+	uint32_t client_id,
-+	uint64_t uid,
-+	size_t data_length,
-+	const void *data)
-+{
-+	struct psa_storage_info_t storage_info;
-+
-+	if (data_length =3D=3D 0) return PSA_SUCCESS;
-+
-+	psa_status_t psa_status =3D storage_backend->interface->get_info(
-+		storage_backend->context,
-+		client_id,
-+		uid,
-+		&storage_info);
-+
-+	if (psa_status !=3D PSA_SUCCESS) return psa_status;
-+
-+	/* Determine size of appended variable */
-+	size_t new_size =3D storage_info.size + data_length;
-+
-+	/* Defend against integer overflow */
-+	if (new_size < storage_info.size) return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	/* Storage backend doesn't support an append operation so we need
-+	 * need to read the current variable data, extend it and write it back=
.
-+	 */
-+	uint8_t *rw_buf =3D malloc(new_size);
-+	if (!rw_buf) return PSA_ERROR_INSUFFICIENT_MEMORY;
-+
-+	size_t old_size =3D 0;
-+	psa_status =3D storage_backend->interface->get(
-+		storage_backend->context,
-+		client_id,
-+		uid,
-+		0,
-+		new_size,
-+		rw_buf,
-+		&old_size);
-+
-+	if (psa_status =3D=3D PSA_SUCCESS) {
-+
-+		if ((old_size + data_length) <=3D new_size) {
-+
-+			/* Extend the variable data */
-+			memcpy(&rw_buf[old_size], data, data_length);
-+
-+			psa_status =3D storage_backend->interface->set(
-+				storage_backend->context,
-+				client_id,
-+				uid,
-+				old_size + data_length,
-+				rw_buf,
-+				storage_info.flags);
-+		}
-+		else {
-+
-+			/* There's a mismatch between the length obtained from
-+			 * get_info() and the subsequent length returned by get().
-+			 */
-+			psa_status =3D PSA_ERROR_STORAGE_FAILURE;
-+		}
-+	}
-+
-+	free(rw_buf);
-+
-+	return psa_status;
-+}
-+
- static void purge_orphan_index_entries(
- 	struct uefi_variable_store *context)
- {
-@@ -612,7 +687,7 @@ static void purge_orphan_index_entries(
- 	 */
- 	while (!variable_index_iterator_is_done(&iter)) {
-=20
--		const struct variable_info *info =3D variable_index_iterator_current(=
&iter);
-+		struct variable_info *info =3D variable_index_iterator_current(&iter)=
;
-=20
- 		if (info->is_variable_set && (info->metadata.attributes & EFI_VARIABL=
E_NON_VOLATILE)) {
-=20
-@@ -628,7 +703,7 @@ static void purge_orphan_index_entries(
- 			if (psa_status !=3D PSA_SUCCESS) {
-=20
- 				/* Detected a mismatch between the index and storage */
--				variable_index_remove_variable(&context->variable_index, info);
-+				variable_index_clear_variable(&context->variable_index, info);
- 				any_orphans =3D true;
- 			}
- 		}
-diff --git a/components/service/smm_variable/backend/variable_index.c b/=
components/service/smm_variable/backend/variable_index.c
-index 99d7c97a..a8a55753 100644
---- a/components/service/smm_variable/backend/variable_index.c
-+++ b/components/service/smm_variable/backend/variable_index.c
-@@ -132,13 +132,13 @@ size_t variable_index_max_dump_size(
- 	return sizeof(struct variable_metadata) * context->max_variables;
- }
-=20
--const struct variable_info *variable_index_find(
--	const struct variable_index *context,
-+struct variable_info *variable_index_find(
-+	struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name)
- {
--	const struct variable_info *result =3D NULL;
-+	struct variable_info *result =3D NULL;
- 	int pos =3D find_variable(context, guid, name_size, name);
-=20
- 	if (pos >=3D 0) {
-@@ -149,13 +149,13 @@ const struct variable_info *variable_index_find(
- 	return result;
- }
-=20
--const struct variable_info *variable_index_find_next(
-+struct variable_info *variable_index_find_next(
- 	const struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name)
- {
--	const struct variable_info *result =3D NULL;
-+	struct variable_info *result =3D NULL;
-=20
- 	if (name_size >=3D sizeof(int16_t)) {
-=20
-@@ -263,12 +263,11 @@ static struct variable_entry *add_entry(
- 	return entry;
- }
-=20
--const struct variable_info *variable_index_add_variable(
-+struct variable_info *variable_index_add_entry(
- 	struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
--	const int16_t *name,
--	uint32_t attributes)
-+	const int16_t *name)
- {
- 	struct variable_info *info =3D NULL;
- 	struct variable_entry *entry =3D add_entry(context, guid, name_size, n=
ame);
-@@ -276,40 +275,41 @@ const struct variable_info *variable_index_add_var=
iable(
- 	if (entry) {
-=20
- 		info =3D &entry->info;
--
--		info->metadata.attributes =3D attributes;
--		info->is_variable_set =3D true;
--
--		mark_dirty(entry);
- 	}
-=20
- 	return info;
- }
-=20
--const struct variable_info *variable_index_add_constraints(
-+void variable_index_remove_unused_entry(
- 	struct variable_index *context,
--	const EFI_GUID *guid,
--	size_t name_size,
--	const int16_t *name,
--	const struct variable_constraints *constraints)
-+	struct variable_info *info)
- {
--	struct variable_info *info =3D NULL;
--	struct variable_entry *entry =3D add_entry(context, guid, name_size, n=
ame);
--
--	if (entry) {
-+	if (info &&
-+		!info->is_constraints_set &&
-+		!info->is_variable_set) {
-=20
--		info =3D &entry->info;
-+		struct variable_entry *entry =3D containing_entry(info);
-+		entry->in_use =3D false;
-=20
--		info->check_constraints =3D *constraints;
--		info->is_constraints_set =3D true;
-+		memset(info, 0, sizeof(struct variable_info));
- 	}
-+}
-=20
--	return info;
-+void variable_index_set_variable(
-+	struct variable_info *info,
-+	uint32_t attributes)
-+{
-+	struct variable_entry *entry =3D containing_entry(info);
-+
-+	info->metadata.attributes =3D attributes;
-+	info->is_variable_set =3D true;
-+
-+	mark_dirty(entry);
- }
-=20
--void variable_index_remove_variable(
-+void variable_index_clear_variable(
- 	struct variable_index *context,
--	const struct variable_info *info)
-+	struct variable_info *info)
- {
- 	if (info) {
-=20
-@@ -318,48 +318,17 @@ void variable_index_remove_variable(
-=20
- 		/* Mark variable as no longer set */
- 		entry->info.is_variable_set =3D false;
--
--		/* Entry may still be needed if check constraints were set */
--		entry->in_use =3D info->is_constraints_set;
--
--		if (!entry->in_use) {
--
--			/* Entry not needed so wipe */
--			memset(&entry->info, 0, sizeof(struct variable_info));
--		}
- 	}
- }
-=20
--void variable_index_update_variable(
--	const struct variable_info *info,
--	uint32_t attributes)
--{
--	if (info) {
--
--		struct variable_info *modified_info =3D (struct variable_info*)info;
--		struct variable_entry *entry =3D containing_entry(modified_info);
--
--		if (!modified_info->is_variable_set ||
--			(attributes !=3D modified_info->metadata.attributes)) {
--
--			/* The update changes the variable_info state */
--			modified_info->is_variable_set =3D true;
--			modified_info->metadata.attributes =3D attributes;
--			mark_dirty(entry);
--		}
--	}
--}
--
--void variable_index_update_constraints(
--	const struct variable_info *info,
-+void variable_index_set_constraints(
-+	struct variable_info *info,
- 	const struct variable_constraints *constraints)
- {
- 	if (info) {
-=20
--		struct variable_info *modified_info =3D (struct variable_info*)info;
--
--		modified_info->check_constraints =3D *constraints;
--		modified_info->is_constraints_set =3D true;
-+		info->check_constraints =3D *constraints;
-+		info->is_constraints_set =3D true;
- 	}
- }
-=20
-diff --git a/components/service/smm_variable/backend/variable_index.h b/=
components/service/smm_variable/backend/variable_index.h
-index e109d0d1..63f42ab6 100644
---- a/components/service/smm_variable/backend/variable_index.h
-+++ b/components/service/smm_variable/backend/variable_index.h
-@@ -119,8 +119,8 @@ size_t variable_index_max_dump_size(
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--const struct variable_info *variable_index_find(
--	const struct variable_index *context,
-+struct variable_info *variable_index_find(
-+	struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name);
-@@ -135,78 +135,76 @@ const struct variable_info *variable_index_find(
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--const struct variable_info *variable_index_find_next(
-+struct variable_info *variable_index_find_next(
- 	const struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name);
-=20
- /**
-- * @brief      Add a new variable to the index
-+ * @brief      Add a new entry to the index
-+ *
-+ * An entry is needed either when a new variable is created or
-+ * when variable constraints are set for a variable that doesn't
-+ * yet exist.
-  *
-  * @param[in]  context variable_index
-  * @param[in]  guid The variable's guid
-  * @param[in]  name_size The name parameter's size
-  * @param[in]  name The variable's name
-- * @param[in]  attributes The variable's attributes
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--const struct variable_info *variable_index_add_variable(
-+struct variable_info *variable_index_add_entry(
- 	struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
--	const int16_t *name,
--	uint32_t attributes);
-+	const int16_t *name);
-=20
- /**
-- * @brief      Remove a variable from the index
-+ * @brief      Remove an unused entry from the index
-  *
-- * Removes a variable from the index if it exists.
-+ * Removes an entry if it is not in use.
-  *
-  * @param[in]  context variable_index
-  * @param[in]  info The variable info corresponding to the entry to rem=
ove
-  */
--void variable_index_remove_variable(
-+void variable_index_remove_unused_entry(
- 	struct variable_index *context,
--	const struct variable_info *info);
-+	struct variable_info *info);
-=20
- /**
-- * @brief      Update a variable that's already in the index
-+ * @brief      Set a variable to the index
-+ *
-+ * An entry for the variable must already exist.
-  *
-  * @param[in]  info variable info
-  * @param[in]  attributes The variable's attributes
-  */
--void variable_index_update_variable(
--	const struct variable_info *info,
-+void variable_index_set_variable(
-+	struct variable_info *info,
- 	uint32_t attributes);
-=20
- /**
-- * @brief      Add a new check constraints object to the index
-+ * @brief      Clear a variable from the index
-  *
-- * @param[in]  context variable_index
-- * @param[in]  guid The variable's guid
-- * @param[in]  name_size The name parameter's size
-- * @param[in]  name The variable's name
-- * @param[in]  constraints The check constraints
-+ * Clears a variable from the index
-  *
-- * @return     Pointer to variable_info or NULL
-+ * @param[in]  context variable_index
-+ * @param[in]  info The variable info corresponding to the variable to =
clear
-  */
--const struct variable_info *variable_index_add_constraints(
-+void variable_index_clear_variable(
- 	struct variable_index *context,
--	const EFI_GUID *guid,
--	size_t name_size,
--	const int16_t *name,
--	const struct variable_constraints *constraints);
-+	struct variable_info *info);
-=20
- /**
-- * @brief      Update variable constraints that are already in the inde=
x
-+ * @brief      Set a check constraints object associated with a variavl=
e
-  *
-  * @param[in]  info variable info
-  * @param[in]  constraints The check constraints
-  */
--void variable_index_update_constraints(
--	const struct variable_info *info,
-+void variable_index_set_constraints(
-+	struct variable_info *info,
- 	const struct variable_constraints *constraints);
-=20
- /**
-diff --git a/components/service/smm_variable/backend/variable_index_iter=
ator.c b/components/service/smm_variable/backend/variable_index_iterator.=
c
-index 7cc6dc7a..8f8fc741 100644
---- a/components/service/smm_variable/backend/variable_index_iterator.c
-+++ b/components/service/smm_variable/backend/variable_index_iterator.c
-@@ -31,10 +31,10 @@ bool variable_index_iterator_is_done(
- 	return iter->current_pos >=3D iter->variable_index->max_variables;
- }
-=20
--const struct variable_info *variable_index_iterator_current(
-+struct variable_info *variable_index_iterator_current(
- 	const struct variable_index_iterator *iter)
- {
--	const struct variable_info *current =3D NULL;
-+	struct variable_info *current =3D NULL;
-=20
- 	if (!variable_index_iterator_is_done(iter)) {
-=20
-diff --git a/components/service/smm_variable/backend/variable_index_iter=
ator.h b/components/service/smm_variable/backend/variable_index_iterator.=
h
-index f64a2c49..7ff77c50 100644
---- a/components/service/smm_variable/backend/variable_index_iterator.h
-+++ b/components/service/smm_variable/backend/variable_index_iterator.h
-@@ -54,7 +54,7 @@ bool variable_index_iterator_is_done(
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--const struct variable_info *variable_index_iterator_current(
-+struct variable_info *variable_index_iterator_current(
- 	const struct variable_index_iterator *iter);
-=20
- /**
-diff --git a/components/service/smm_variable/test/service/smm_variable_s=
ervice_tests.cpp b/components/service/smm_variable/test/service/smm_varia=
ble_service_tests.cpp
-index d76d9cce..088940a8 100644
---- a/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-+++ b/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-@@ -249,6 +249,30 @@ TEST(SmmVariableServiceTests, setAndGet)
- 	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
- 	LONGS_EQUAL(0, get_data.compare(set_data));
-=20
-+	/* Extend the variable using an append write */
-+	std::string append_data =3D " values added with append write";
-+
-+	efi_status =3D m_client->set_variable(
-+		m_common_guid,
-+		var_name,
-+		append_data,
-+		EFI_VARIABLE_APPEND_WRITE);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+
-+	efi_status =3D m_client->get_variable(
-+		m_common_guid,
-+		var_name,
-+		get_data);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+
-+	std::string appended_data =3D set_data + append_data;
-+
-+	/* Expect the append write operation to have extended the variable */
-+	UNSIGNED_LONGLONGS_EQUAL(appended_data.size(), get_data.size());
-+	LONGS_EQUAL(0, appended_data.compare(get_data));
-+
- 	/* Expect remove to be permitted */
- 	efi_status =3D m_client->remove_variable(m_common_guid, var_name);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-@@ -279,6 +303,30 @@ TEST(SmmVariableServiceTests, setAndGetNv)
- 	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
- 	LONGS_EQUAL(0, get_data.compare(set_data));
-=20
-+	/* Extend the variable using an append write */
-+	std::string append_data =3D " values added with append write";
-+
-+	efi_status =3D m_client->set_variable(
-+		m_common_guid,
-+		var_name,
-+		append_data,
-+		EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_APPEND_WRITE);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+
-+	efi_status =3D m_client->get_variable(
-+		m_common_guid,
-+		var_name,
-+		get_data);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+
-+	std::string appended_data =3D set_data + append_data;
-+
-+	/* Expect the append write operation to have extended the variable */
-+	UNSIGNED_LONGLONGS_EQUAL(appended_data.size(), get_data.size());
-+	LONGS_EQUAL(0, appended_data.compare(get_data));
-+
- 	/* Expect remove to be permitted */
- 	efi_status =3D m_client->remove_variable(m_common_guid, var_name);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-diff --git a/protocols/service/smm_variable/parameters.h b/protocols/ser=
vice/smm_variable/parameters.h
-index 1f795a9b..233f301b 100644
---- a/protocols/service/smm_variable/parameters.h
-+++ b/protocols/service/smm_variable/parameters.h
-@@ -47,6 +47,9 @@ typedef struct {
- 	 EFI_VARIABLE_HARDWARE_ERROR_RECORD | \
- 	 EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
- 	 EFI_VARIABLE_APPEND_WRITE)
-+#define	EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS_MASK \
-+	(EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
-+	 EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS)
-=20
- /**
-  * Parameter structure for SetVariable and GetVariable.
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.pa=
tch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
deleted file mode 100644
index 978600dd..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
+++ /dev/null
@@ -1,830 +0,0 @@
-From c4eaf83548eed4ed6194ff9e1368d6ae65f4ebf9 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Thu, 2 Dec 2021 17:27:55 +0000
-Subject: [PATCH] Add UEFI variable support for QueryVariableInfo
-
-Adds support for the UEFI QueryVariableInfo operation. The total
-store size currently relies on pre-configured values, set for a
-particular deployment. Ideally, this information would be read
-from the storage backend. This facility is not however yet
-supported by the storage backend interface or by any PSA
-storage backend storage providers.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I971252831f7e478914d736c672d184a371e64502
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../backend/test/variable_store_tests.cpp     |  89 +++++++-
- .../backend/uefi_variable_store.c             | 213 ++++++++++++++----
- .../backend/uefi_variable_store.h             |  39 +++-
- .../client/cpp/smm_variable_client.cpp        |  66 ++++++
- .../client/cpp/smm_variable_client.h          |   7 +
- .../provider/smm_variable_provider.c          |  31 ++-
- .../service/smm_variable_service_tests.cpp    |  55 ++++-
- 7 files changed, 445 insertions(+), 55 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/test/variable_store=
_tests.cpp b/components/service/smm_variable/backend/test/variable_store_=
tests.cpp
-index 578f118f..e90c1067 100644
---- a/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-+++ b/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-@@ -27,6 +27,18 @@ TEST_GROUP(UefiVariableStoreTests)
-=20
- 		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
-+		uefi_variable_store_set_storage_limits(
-+			&m_uefi_variable_store,
-+			EFI_VARIABLE_NON_VOLATILE,
-+			STORE_CAPACITY,
-+			MAX_VARIABLE_SIZE);
-+
-+		uefi_variable_store_set_storage_limits(
-+			&m_uefi_variable_store,
-+			0,
-+			STORE_CAPACITY,
-+			MAX_VARIABLE_SIZE);
-+
- 		setup_common_guid();
- 	}
-=20
-@@ -152,6 +164,33 @@ TEST_GROUP(UefiVariableStoreTests)
- 		return status;
- 	}
-=20
-+	efi_status_t query_variable_info(
-+		uint32_t attributes,
-+		size_t *max_variable_storage_size,
-+		size_t *remaining_variable_storage_size,
-+		size_t *max_variable_size)
-+	{
-+		SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO query;
-+
-+		query.MaximumVariableStorageSize =3D 0;
-+		query.RemainingVariableStorageSize =3D 0;
-+		query.MaximumVariableSize =3D 0;
-+		query.Attributes =3D attributes;
-+
-+		efi_status_t status =3D uefi_variable_store_query_variable_info(
-+			&m_uefi_variable_store,
-+			&query);
-+
-+		if (status =3D=3D EFI_SUCCESS) {
-+
-+			*max_variable_storage_size =3D query.MaximumVariableStorageSize;
-+			*remaining_variable_storage_size =3D query.RemainingVariableStorageS=
ize;
-+			*max_variable_size =3D query.MaximumVariableSize;
-+		}
-+
-+		return status;
-+	}
-+
- 	efi_status_t set_check_var_property(
- 		const std::wstring &name,
- 		const VAR_CHECK_VARIABLE_PROPERTY &check_property)
-@@ -195,7 +234,8 @@ TEST_GROUP(UefiVariableStoreTests)
-=20
- 		if (info && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) =
{
-=20
--			struct storage_backend *storage_backend =3D m_uefi_variable_store.pe=
rsistent_store;
-+			struct storage_backend *storage_backend =3D
-+				m_uefi_variable_store.persistent_store.storage_backend;
-=20
- 			storage_backend->interface->remove(
- 				storage_backend->context,
-@@ -220,9 +260,24 @@ TEST_GROUP(UefiVariableStoreTests)
- 			m_volatile_backend);
-=20
- 		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+		uefi_variable_store_set_storage_limits(
-+			&m_uefi_variable_store,
-+			EFI_VARIABLE_NON_VOLATILE,
-+			STORE_CAPACITY,
-+			MAX_VARIABLE_SIZE);
-+
-+		uefi_variable_store_set_storage_limits(
-+			&m_uefi_variable_store,
-+			0,
-+			STORE_CAPACITY,
-+			MAX_VARIABLE_SIZE);
- 	}
-=20
- 	static const size_t MAX_VARIABLES =3D 10;
-+	static const size_t MAX_VARIABLE_SIZE =3D 100;
-+	static const size_t STORE_CAPACITY =3D 1000;
-+
- 	static const uint32_t OWNER_ID =3D 100;
- 	static const size_t VARIABLE_BUFFER_SIZE =3D 1024;
-=20
-@@ -265,6 +320,22 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
- 	/* Expect the append write operation to have extended the variable */
- 	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
- 	LONGS_EQUAL(0, expected_output.compare(output_data));
-+
-+	/* Expect query_variable_info to return consistent values */
-+	size_t max_variable_storage_size =3D 0;
-+	size_t remaining_variable_storage_size =3D 0;
-+	size_t max_variable_size =3D 0;
-+
-+	status =3D query_variable_info(
-+		0,
-+		&max_variable_storage_size,
-+		&remaining_variable_storage_size,
-+		&max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY, max_variable_storage_size);
-+	UNSIGNED_LONGLONGS_EQUAL(MAX_VARIABLE_SIZE, max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY - expected_output.size(), rema=
ining_variable_storage_size);
- }
-=20
- TEST(UefiVariableStoreTests, persistentSetGet)
-@@ -311,6 +382,22 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	/* Still expect got variable data to be the same as the set value */
- 	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
- 	LONGS_EQUAL(0, expected_output.compare(output_data));
-+
-+	/* Expect query_variable_info to return consistent values */
-+	size_t max_variable_storage_size =3D 0;
-+	size_t remaining_variable_storage_size =3D 0;
-+	size_t max_variable_size =3D 0;
-+
-+	status =3D query_variable_info(
-+		EFI_VARIABLE_NON_VOLATILE,
-+		&max_variable_storage_size,
-+		&remaining_variable_storage_size,
-+		&max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY, max_variable_storage_size);
-+	UNSIGNED_LONGLONGS_EQUAL(MAX_VARIABLE_SIZE, max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY - expected_output.size(), rema=
ining_variable_storage_size);
- }
-=20
- TEST(UefiVariableStoreTests, removeVolatile)
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index bcb85995..ed50eaf9 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -46,8 +46,15 @@ static efi_status_t load_variable_data(
- 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
- 	size_t max_data_len);
-=20
--static psa_status_t append_write(
--	struct storage_backend *storage_backend,
-+static psa_status_t store_overwrite(
-+	struct delegate_variable_store *delegate_store,
-+	uint32_t client_id,
-+	uint64_t uid,
-+	size_t data_length,
-+	const void *data);
-+
-+static psa_status_t store_append_write(
-+	struct delegate_variable_store *delegate_store,
- 	uint32_t client_id,
- 	uint64_t uid,
- 	size_t data_length,
-@@ -56,6 +63,15 @@ static psa_status_t append_write(
- static void purge_orphan_index_entries(
- 	struct uefi_variable_store *context);
-=20
-+static struct delegate_variable_store *select_delegate_store(
-+	struct uefi_variable_store *context,
-+	uint32_t attributes);
-+
-+static size_t space_used(
-+	struct uefi_variable_store *context,
-+	uint32_t attributes,
-+	struct storage_backend *storage_backend);
-+
- static efi_status_t psa_to_efi_storage_status(
- 	psa_status_t psa_status);
-=20
-@@ -66,6 +82,10 @@ static efi_status_t check_name_terminator(
- /* Private UID for storing the variable index */
- #define VARIABLE_INDEX_STORAGE_UID			(1)
-=20
-+/* Default maximum variable size -
-+ * may be overridden using uefi_variable_store_set_storage_limits()
-+ */
-+#define DEFAULT_MAX_VARIABLE_SIZE			(2048)
-=20
- efi_status_t uefi_variable_store_init(
- 	struct uefi_variable_store *context,
-@@ -76,8 +96,17 @@ efi_status_t uefi_variable_store_init(
- {
- 	efi_status_t status =3D EFI_SUCCESS;
-=20
--	context->persistent_store =3D persistent_store;
--	context->volatile_store =3D volatile_store;
-+	/* Initialise persistent store defaults */
-+	context->persistent_store.is_nv =3D true;
-+	context->persistent_store.max_variable_size =3D DEFAULT_MAX_VARIABLE_S=
IZE;
-+	context->persistent_store.total_capacity =3D DEFAULT_MAX_VARIABLE_SIZE=
 * max_variables;
-+	context->persistent_store.storage_backend =3D persistent_store;
-+
-+	/* Initialise volatile store defaults */
-+	context->volatile_store.is_nv =3D false;
-+	context->volatile_store.max_variable_size =3D DEFAULT_MAX_VARIABLE_SIZ=
E;
-+	context->volatile_store.total_capacity =3D DEFAULT_MAX_VARIABLE_SIZE *=
 max_variables;
-+	context->volatile_store.storage_backend =3D volatile_store;
-=20
- 	context->owner_id =3D owner_id;
- 	context->is_boot_service =3D true;
-@@ -116,6 +145,20 @@ void uefi_variable_store_deinit(
- 	context->index_sync_buffer =3D NULL;
- }
-=20
-+void uefi_variable_store_set_storage_limits(
-+	struct uefi_variable_store *context,
-+	uint32_t attributes,
-+	size_t total_capacity,
-+	size_t max_variable_size)
-+{
-+	struct delegate_variable_store *delegate_store =3D select_delegate_sto=
re(
-+		context,
-+		attributes);
-+
-+	delegate_store->total_capacity =3D total_capacity;
-+	delegate_store->max_variable_size =3D max_variable_size;
-+}
-+
- efi_status_t uefi_variable_store_set_variable(
- 	struct uefi_variable_store *context,
- 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
-@@ -284,12 +327,24 @@ efi_status_t uefi_variable_store_get_next_variable=
_name(
-=20
- efi_status_t uefi_variable_store_query_variable_info(
- 	struct uefi_variable_store *context,
--	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *cur)
-+	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *var_info)
- {
--	efi_status_t status =3D EFI_UNSUPPORTED;
-+	struct delegate_variable_store *delegate_store =3D select_delegate_sto=
re(
-+		context,
-+		var_info->Attributes);
-=20
-+	size_t total_used =3D space_used(
-+		context,
-+		var_info->Attributes,
-+		delegate_store->storage_backend);
-=20
--	return status;
-+	var_info->MaximumVariableSize =3D delegate_store->max_variable_size;
-+	var_info->MaximumVariableStorageSize =3D delegate_store->total_capacit=
y;
-+	var_info->RemainingVariableStorageSize =3D (total_used < delegate_stor=
e->total_capacity) ?
-+		delegate_store->total_capacity - total_used :
-+		0;
-+
-+	return EFI_SUCCESS;
- }
-=20
- efi_status_t uefi_variable_store_exit_boot_service(
-@@ -375,7 +430,7 @@ efi_status_t uefi_variable_store_get_var_check_prope=
rty(
- static void load_variable_index(
- 	struct uefi_variable_store *context)
- {
--	struct storage_backend *persistent_store =3D context->persistent_store=
;
-+	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
-=20
- 	if (persistent_store) {
-=20
-@@ -413,7 +468,7 @@ static efi_status_t sync_variable_index(
-=20
- 	if (is_dirty) {
-=20
--		struct storage_backend *persistent_store =3D context->persistent_stor=
e;
-+		struct storage_backend *persistent_store =3D context->persistent_stor=
e.storage_backend;
-=20
- 		if (persistent_store) {
-=20
-@@ -501,30 +556,27 @@ static efi_status_t store_variable_data(
- 	const uint8_t *data =3D (const uint8_t*)var +
- 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(var);
-=20
--	bool is_nv =3D (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)=
;
--
--	struct storage_backend *storage_backend =3D (is_nv) ?
--		context->persistent_store :
--		context->volatile_store;
-+	struct delegate_variable_store *delegate_store =3D select_delegate_sto=
re(
-+		context,
-+		info->metadata.attributes);
-=20
--	if (storage_backend) {
-+	if (delegate_store->storage_backend) {
-=20
- 		if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
-=20
- 			/* Create or overwrite variable data */
--			psa_status =3D storage_backend->interface->set(
--				storage_backend->context,
-+			psa_status =3D store_overwrite(
-+				delegate_store,
- 				context->owner_id,
- 				info->metadata.uid,
- 				data_len,
--				data,
--				PSA_STORAGE_FLAG_NONE);
-+				data);
- 		}
- 		else {
-=20
- 			/* Append new data to existing variable data */
--			psa_status =3D append_write(
--				storage_backend,
-+			psa_status =3D store_append_write(
-+				delegate_store,
- 				context->owner_id,
- 				info->metadata.uid,
- 				data_len,
-@@ -532,7 +584,7 @@ static efi_status_t store_variable_data(
- 		}
- 	}
-=20
--	if ((psa_status !=3D PSA_SUCCESS) && is_nv) {
-+	if ((psa_status !=3D PSA_SUCCESS) && delegate_store->is_nv) {
-=20
- 		/* A storage failure has occurred so attempt to fix any
- 		 * mismatch between the variable index and stored NV variables.
-@@ -551,16 +603,14 @@ static efi_status_t remove_variable_data(
-=20
- 	if (info->is_variable_set) {
-=20
--		bool is_nv =3D (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE=
);
-+		struct delegate_variable_store *delegate_store =3D select_delegate_st=
ore(
-+			context,
-+			info->metadata.attributes);
-=20
--		struct storage_backend *storage_backend =3D (is_nv) ?
--			context->persistent_store :
--			context->volatile_store;
-+		if (delegate_store->storage_backend) {
-=20
--		if (storage_backend) {
--
--			psa_status =3D storage_backend->interface->remove(
--				storage_backend->context,
-+			psa_status =3D delegate_store->storage_backend->interface->remove(
-+				delegate_store->storage_backend->context,
- 				context->owner_id,
- 				info->metadata.uid);
- 		}
-@@ -580,16 +630,14 @@ static efi_status_t load_variable_data(
- 	uint8_t *data =3D (uint8_t*)var +
- 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(var);
-=20
--	bool is_nv =3D (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)=
;
-+	struct delegate_variable_store *delegate_store =3D select_delegate_sto=
re(
-+		context,
-+		info->metadata.attributes);
-=20
--	struct storage_backend *storage_backend =3D (is_nv) ?
--		context->persistent_store :
--		context->volatile_store;
-+	if (delegate_store->storage_backend) {
-=20
--	if (storage_backend) {
--
--		psa_status =3D storage_backend->interface->get(
--			storage_backend->context,
-+		psa_status =3D delegate_store->storage_backend->interface->get(
-+			delegate_store->storage_backend->context,
- 			context->owner_id,
- 			info->metadata.uid,
- 			0,
-@@ -603,8 +651,29 @@ static efi_status_t load_variable_data(
- 	return psa_to_efi_storage_status(psa_status);
- }
-=20
--static psa_status_t append_write(
--	struct storage_backend *storage_backend,
-+static psa_status_t store_overwrite(
-+	struct delegate_variable_store *delegate_store,
-+	uint32_t client_id,
-+	uint64_t uid,
-+	size_t data_length,
-+	const void *data)
-+{
-+	/* Police maximum variable size limit */
-+	if (data_length > delegate_store->max_variable_size) return PSA_ERROR_=
INVALID_ARGUMENT;
-+
-+	psa_status_t psa_status =3D delegate_store->storage_backend->interface=
->set(
-+		delegate_store->storage_backend->context,
-+		client_id,
-+		uid,
-+		data_length,
-+		data,
-+		PSA_STORAGE_FLAG_NONE);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t store_append_write(
-+	struct delegate_variable_store *delegate_store,
- 	uint32_t client_id,
- 	uint64_t uid,
- 	size_t data_length,
-@@ -614,8 +683,8 @@ static psa_status_t append_write(
-=20
- 	if (data_length =3D=3D 0) return PSA_SUCCESS;
-=20
--	psa_status_t psa_status =3D storage_backend->interface->get_info(
--		storage_backend->context,
-+	psa_status_t psa_status =3D delegate_store->storage_backend->interface=
->get_info(
-+		delegate_store->storage_backend->context,
- 		client_id,
- 		uid,
- 		&storage_info);
-@@ -628,6 +697,9 @@ static psa_status_t append_write(
- 	/* Defend against integer overflow */
- 	if (new_size < storage_info.size) return PSA_ERROR_INVALID_ARGUMENT;
-=20
-+		/* Police maximum variable size limit */
-+	if (new_size > delegate_store->max_variable_size) return PSA_ERROR_INV=
ALID_ARGUMENT;
-+
- 	/* Storage backend doesn't support an append operation so we need
- 	 * need to read the current variable data, extend it and write it back=
.
- 	 */
-@@ -635,8 +707,8 @@ static psa_status_t append_write(
- 	if (!rw_buf) return PSA_ERROR_INSUFFICIENT_MEMORY;
-=20
- 	size_t old_size =3D 0;
--	psa_status =3D storage_backend->interface->get(
--		storage_backend->context,
-+	psa_status =3D delegate_store->storage_backend->interface->get(
-+		delegate_store->storage_backend->context,
- 		client_id,
- 		uid,
- 		0,
-@@ -651,8 +723,8 @@ static psa_status_t append_write(
- 			/* Extend the variable data */
- 			memcpy(&rw_buf[old_size], data, data_length);
-=20
--			psa_status =3D storage_backend->interface->set(
--				storage_backend->context,
-+			psa_status =3D delegate_store->storage_backend->interface->set(
-+				delegate_store->storage_backend->context,
- 				client_id,
- 				uid,
- 				old_size + data_length,
-@@ -692,7 +764,7 @@ static void purge_orphan_index_entries(
- 		if (info->is_variable_set && (info->metadata.attributes & EFI_VARIABL=
E_NON_VOLATILE)) {
-=20
- 			struct psa_storage_info_t storage_info;
--			struct storage_backend *storage_backend =3D context->persistent_stor=
e;
-+			struct storage_backend *storage_backend =3D context->persistent_stor=
e.storage_backend;
-=20
- 			psa_status_t psa_status =3D storage_backend->interface->get_info(
- 				storage_backend->context,
-@@ -714,6 +786,53 @@ static void purge_orphan_index_entries(
- 	if (any_orphans) sync_variable_index(context);
- }
-=20
-+static struct delegate_variable_store *select_delegate_store(
-+	struct uefi_variable_store *context,
-+	uint32_t attributes)
-+{
-+	bool is_nv =3D (attributes & EFI_VARIABLE_NON_VOLATILE);
-+
-+	return (is_nv) ?
-+		&context->persistent_store :
-+		&context->volatile_store;
-+}
-+
-+static size_t space_used(
-+	struct uefi_variable_store *context,
-+	uint32_t attributes,
-+	struct storage_backend *storage_backend)
-+{
-+	if (!storage_backend) return 0;
-+
-+	size_t total_used =3D 0;
-+	struct variable_index_iterator iter;
-+	variable_index_iterator_first(&iter, &context->variable_index);
-+
-+	while (!variable_index_iterator_is_done(&iter)) {
-+
-+		struct variable_info *info =3D variable_index_iterator_current(&iter)=
;
-+
-+		if (info->is_variable_set &&
-+		    ((info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE) =3D=3D
-+			 (attributes & EFI_VARIABLE_NON_VOLATILE))) {
-+
-+			struct psa_storage_info_t storage_info;
-+
-+			psa_status_t psa_status =3D storage_backend->interface->get_info(
-+				storage_backend->context,
-+				context->owner_id,
-+				info->metadata.uid,
-+				&storage_info);
-+
-+			if (psa_status =3D=3D PSA_SUCCESS) total_used +=3D storage_info.size=
;
-+		}
-+
-+		variable_index_iterator_next(&iter);
-+	}
-+
-+	return total_used;
-+}
-+
- static efi_status_t psa_to_efi_storage_status(
- 	psa_status_t psa_status)
- {
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.h b/components/service/smm_variable/backend/uefi_variable_store.h
-index fe0f24af..cc992067 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.h
-+++ b/components/service/smm_variable/backend/uefi_variable_store.h
-@@ -20,6 +20,20 @@
- extern "C" {
- #endif
-=20
-+/**
-+ * \brief delegate_variable_store structure definition
-+ *
-+ * A delegate_variable_store combines an association with a concrete
-+ * storage backend and a set of limits parameters.
-+ */
-+struct delegate_variable_store
-+{
-+	bool is_nv;
-+	size_t total_capacity;
-+	size_t max_variable_size;
-+	struct storage_backend *storage_backend;
-+};
-+
- /**
-  * \brief uefi_variable_store structure definition
-  *
-@@ -35,8 +49,8 @@ struct uefi_variable_store
- 	uint8_t *index_sync_buffer;
- 	size_t index_sync_buffer_size;
- 	struct variable_index variable_index;
--	struct storage_backend *persistent_store;
--	struct storage_backend *volatile_store;
-+	struct delegate_variable_store persistent_store;
-+	struct delegate_variable_store volatile_store;
- };
-=20
- /**
-@@ -69,6 +83,23 @@ efi_status_t uefi_variable_store_init(
- void uefi_variable_store_deinit(
- 	struct uefi_variable_store *context);
-=20
-+/**
-+ * @brief      Set storage limits
-+ *
-+ * Overrides the default limits for the specified storage space. These
-+ * values are reflected in the values returned by QueryVariableInfo.
-+ *
-+ * @param[in]  context uefi_variable_store instance
-+ * @param[in]  attributes EFI_VARIABLE_NON_VOLATILE or 0
-+ * @param[in]  total_capacity The total storage capacity in bytes
-+ * @param[in]  max_variable_size Variable size limit
-+ */
-+void uefi_variable_store_set_storage_limits(
-+	struct uefi_variable_store *context,
-+	uint32_t attributes,
-+	size_t total_capacity,
-+	size_t max_variable_size);
-+
- /**
-  * @brief      Set variable
-  *
-@@ -123,13 +154,13 @@ efi_status_t uefi_variable_store_get_next_variable=
_name(
-  * @brief      Query for variable info
-  *
-  * @param[in]  context uefi_variable_store instance
-- * @param[out] info Returns info
-+ * @param[inout] var_info Returns info
-  *
-  * @return     EFI_SUCCESS if succesful
-  */
- efi_status_t uefi_variable_store_query_variable_info(
- 	struct uefi_variable_store *context,
--	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *cur);
-+	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *var_info);
-=20
- /**
-  * @brief      Exit boot service
-diff --git a/components/service/smm_variable/client/cpp/smm_variable_cli=
ent.cpp b/components/service/smm_variable/client/cpp/smm_variable_client.=
cpp
-index a68b7ace..8438285b 100644
---- a/components/service/smm_variable/client/cpp/smm_variable_client.cpp
-+++ b/components/service/smm_variable/client/cpp/smm_variable_client.cpp
-@@ -219,6 +219,72 @@ efi_status_t smm_variable_client::get_next_variable=
_name(
- 		0);
- }
-=20
-+efi_status_t smm_variable_client::query_variable_info(
-+	uint32_t attributes,
-+	size_t *max_variable_storage_size,
-+	size_t *remaining_variable_storage_size,
-+	size_t *max_variable_size)
-+{
-+	efi_status_t efi_status =3D EFI_NOT_READY;
-+
-+	size_t req_len =3D sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO=
);
-+	rpc_call_handle call_handle;
-+	uint8_t *req_buf;
-+
-+	call_handle =3D rpc_caller_begin(m_caller, &req_buf, req_len);
-+
-+	if (call_handle) {
-+
-+		uint8_t *resp_buf;
-+        size_t resp_len;
-+		rpc_opstatus_t opstatus;
-+
-+		SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *query =3D
-+			(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO*)req_buf;
-+
-+		query->Attributes =3D attributes;
-+		query->MaximumVariableSize =3D 0;
-+		query->MaximumVariableStorageSize =3D 0;
-+		query->RemainingVariableStorageSize =3D 0;
-+
-+		m_err_rpc_status =3D rpc_caller_invoke(m_caller, call_handle,
-+			SMM_VARIABLE_FUNCTION_QUERY_VARIABLE_INFO, &opstatus, &resp_buf, &re=
sp_len);
-+
-+		if (m_err_rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
-+
-+			efi_status =3D opstatus;
-+
-+			if (efi_status =3D=3D EFI_SUCCESS) {
-+
-+				if (resp_len >=3D sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_IN=
FO)) {
-+
-+					query =3D (SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO*)resp_buf;
-+
-+					*max_variable_storage_size =3D query->MaximumVariableStorageSize;
-+					*remaining_variable_storage_size =3D query->RemainingVariableStora=
geSize;
-+					*max_variable_size =3D query->MaximumVariableSize;
-+				}
-+				else {
-+
-+					efi_status =3D EFI_PROTOCOL_ERROR;
-+				}
-+			}
-+			else {
-+
-+				efi_status =3D EFI_PROTOCOL_ERROR;
-+			}
-+		}
-+		else {
-+
-+			efi_status =3D rpc_to_efi_status();
-+		}
-+
-+		rpc_caller_end(m_caller, call_handle);
-+	}
-+
-+	return efi_status;
-+}
-+
- efi_status_t smm_variable_client::get_next_variable_name(
- 	EFI_GUID &guid,
- 	std::wstring &name,
-diff --git a/components/service/smm_variable/client/cpp/smm_variable_cli=
ent.h b/components/service/smm_variable/client/cpp/smm_variable_client.h
-index 9c36c4eb..c7973916 100644
---- a/components/service/smm_variable/client/cpp/smm_variable_client.h
-+++ b/components/service/smm_variable/client/cpp/smm_variable_client.h
-@@ -63,6 +63,13 @@ public:
- 		const EFI_GUID &guid,
- 		const std::wstring &name);
-=20
-+	/* Query variable info */
-+	efi_status_t query_variable_info(
-+		uint32_t attributes,
-+		size_t *max_variable_storage_size,
-+		size_t *remaining_variable_storage_size,
-+		size_t *max_variable_size);
-+
- 	/* Get the next variable name - for enumerating store contents */
- 	efi_status_t get_next_variable_name(
- 		EFI_GUID &guid,
-diff --git a/components/service/smm_variable/provider/smm_variable_provi=
der.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index d239a428..52e68d09 100644
---- a/components/service/smm_variable/provider/smm_variable_provider.c
-+++ b/components/service/smm_variable/provider/smm_variable_provider.c
-@@ -252,11 +252,38 @@ static rpc_status_t set_variable_handler(void *con=
text, struct call_req* req)
-=20
- static rpc_status_t query_variable_info_handler(void *context, struct c=
all_req* req)
- {
-+	efi_status_t efi_status =3D EFI_INVALID_PARAMETER;
- 	struct smm_variable_provider *this_instance =3D (struct smm_variable_p=
rovider*)context;
-=20
--	/* todo */
-+	const struct call_param_buf *req_buf =3D call_req_get_req_buf(req);
-+
-+	if (req_buf->data_len >=3D sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIA=
BLE_INFO)) {
-+
-+		struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
-+
-+		if (resp_buf->size >=3D req_buf->data_len) {
-=20
--	return TS_RPC_ERROR_NOT_READY;
-+			memmove(resp_buf->data, req_buf->data, req_buf->data_len);
-+
-+			efi_status =3D uefi_variable_store_query_variable_info(
-+				&this_instance->variable_store,
-+				(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO*)resp_buf->data);
-+
-+			if (efi_status =3D=3D EFI_SUCCESS) {
-+
-+				resp_buf->data_len =3D sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIAB=
LE_INFO);
-+			}
-+		}
-+		else {
-+
-+			/* Reponse buffer not big enough */
-+			efi_status =3D EFI_BAD_BUFFER_SIZE;
-+		}
-+	}
-+
-+	call_req_set_opstatus(req, efi_status);
-+
-+	return TS_RPC_CALL_ACCEPTED;
- }
-=20
- static rpc_status_t exit_boot_service_handler(void *context, struct cal=
l_req* req)
-diff --git a/components/service/smm_variable/test/service/smm_variable_s=
ervice_tests.cpp b/components/service/smm_variable/test/service/smm_varia=
ble_service_tests.cpp
-index 088940a8..15556e9d 100644
---- a/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-+++ b/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-@@ -335,12 +335,38 @@ TEST(SmmVariableServiceTests, setAndGetNv)
- TEST(SmmVariableServiceTests, enumerateStoreContents)
- {
- 	efi_status_t efi_status =3D EFI_SUCCESS;
-+
-+	/* Query information about the empty variable store */
-+	size_t nv_max_variable_storage_size =3D 0;
-+	size_t nv_max_variable_size =3D 0;
-+	size_t nv_remaining_variable_storage_size =3D 0;
-+
-+	efi_status =3D m_client->query_variable_info(
-+		EFI_VARIABLE_NON_VOLATILE,
-+		&nv_max_variable_storage_size,
-+		&nv_remaining_variable_storage_size,
-+		&nv_max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+	UNSIGNED_LONGLONGS_EQUAL(nv_max_variable_storage_size, nv_remaining_va=
riable_storage_size);
-+
-+	size_t v_max_variable_storage_size =3D 0;
-+	size_t v_max_variable_size =3D 0;
-+	size_t v_remaining_variable_storage_size =3D 0;
-+
-+	efi_status =3D m_client->query_variable_info(
-+		0,
-+		&v_max_variable_storage_size,
-+		&v_remaining_variable_storage_size,
-+		&v_max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+	UNSIGNED_LONGLONGS_EQUAL(v_max_variable_storage_size, v_remaining_vari=
able_storage_size);
-+
-+	/* Add some variables to the store */
- 	std::wstring var_name_1 =3D L"varibale_1";
- 	std::wstring var_name_2 =3D L"varibale_2";
- 	std::wstring var_name_3 =3D L"varibale_3";
- 	std::string set_data =3D "Some variable data";
-=20
--	/* Add some variables to the store */
- 	efi_status =3D m_client->set_variable(
- 		m_common_guid,
- 		var_name_1,
-@@ -365,6 +391,33 @@ TEST(SmmVariableServiceTests, enumerateStoreContent=
s)
-=20
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-=20
-+	/* Query variable info again and check it's as expected */
-+	size_t max_variable_storage_size =3D 0;
-+	size_t max_variable_size =3D 0;
-+	size_t remaining_variable_storage_size =3D 0;
-+
-+	/* Check non-volatile - two variables have been added */
-+	efi_status =3D m_client->query_variable_info(
-+		EFI_VARIABLE_NON_VOLATILE,
-+		&max_variable_storage_size,
-+		&remaining_variable_storage_size,
-+		&max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+	UNSIGNED_LONGLONGS_EQUAL(
-+		(nv_remaining_variable_storage_size - set_data.size() * 2),
-+		remaining_variable_storage_size);
-+
-+	/* Check volatile - one variables have been added */
-+	efi_status =3D m_client->query_variable_info(
-+		0,
-+		&max_variable_storage_size,
-+		&remaining_variable_storage_size,
-+		&max_variable_size);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+	UNSIGNED_LONGLONGS_EQUAL(
-+		(v_remaining_variable_storage_size - set_data.size() * 1),
-+		remaining_variable_storage_size);
-+
- 	/* Enumerate store contents - expect the values we added */
- 	std::wstring var_name;
- 	EFI_GUID guid =3D {0};
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0016-Add-uefi-test-deployment.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/secure-partitions/corstone1000/0016-Add-uef=
i-test-deployment.patch
deleted file mode 100644
index 66a4499e..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0016-Add-uefi-test-deployment.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 22120b4bd64da232e5a4e04a9a15376f34a933a3 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Mon, 6 Dec 2021 15:20:12 +0000
-Subject: [PATCH] Add uefi-test deployment
-
-Adds a new deployment for building and running service level tests
-for UEFI SMM services. Tests may be run against StMM, smm-gateway
-or any other similar secure-world uefi service provider.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Ic0e16dff51ef76ddd1f4dea37a4a55b029edd696
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../ts-service-test/arm-linux/CMakeLists.txt  |  3 -
- .../uefi-test/arm-linux/CMakeLists.txt        | 43 +++++++++++
- deployments/uefi-test/linux-pc/CMakeLists.txt | 76 +++++++++++++++++++
- deployments/uefi-test/uefi-test.cmake         | 52 +++++++++++++
- tools/b-test/test_data.yaml                   | 10 +++
- 5 files changed, 181 insertions(+), 3 deletions(-)
- create mode 100644 deployments/uefi-test/arm-linux/CMakeLists.txt
- create mode 100644 deployments/uefi-test/linux-pc/CMakeLists.txt
- create mode 100644 deployments/uefi-test/uefi-test.cmake
-
-diff --git a/deployments/ts-service-test/arm-linux/CMakeLists.txt b/depl=
oyments/ts-service-test/arm-linux/CMakeLists.txt
-index 6a01d38a..e902cd2f 100644
---- a/deployments/ts-service-test/arm-linux/CMakeLists.txt
-+++ b/deployments/ts-service-test/arm-linux/CMakeLists.txt
-@@ -23,9 +23,6 @@ add_components(
- 	BASE_DIR ${TS_ROOT}
- 	COMPONENTS
- 		"components/app/test-runner"
--# Running smm_variable tests currently requires kernel built with CONFI=
G_STRICT_DEVMEM=3Dn
--#		"components/service/smm_variable/client/cpp"
--#		"components/service/smm_variable/test/service"
-  )
-=20
- include(${TS_ROOT}/external/CppUTest/CppUTest.cmake)
-diff --git a/deployments/uefi-test/arm-linux/CMakeLists.txt b/deployment=
s/uefi-test/arm-linux/CMakeLists.txt
-new file mode 100644
-index 00000000..053041ad
---- /dev/null
-+++ b/deployments/uefi-test/arm-linux/CMakeLists.txt
-@@ -0,0 +1,43 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+cmake_minimum_required(VERSION 3.16)
-+include(../../deployment.cmake REQUIRED)
-+
-+#----------------------------------------------------------------------=
---------
-+#  The CMakeLists.txt for building the uefi-test deployment for arm-lin=
ux
-+#
-+#  Used for building and running service level tests from Linux user-sp=
ace
-+#  on an Arm platform with real deployments of UEFI SMM services
-+#----------------------------------------------------------------------=
---------
-+include(${TS_ROOT}/environments/arm-linux/env.cmake)
-+project(trusted-services LANGUAGES CXX C)
-+add_executable(uefi-test)
-+target_include_directories(uefi-test PRIVATE "${TOP_LEVEL_INCLUDE_DIRS}=
")
-+
-+add_components(
-+	TARGET "uefi-test"
-+	BASE_DIR ${TS_ROOT}
-+	COMPONENTS
-+		"components/app/test-runner"
-+ )
-+
-+include(${TS_ROOT}/external/CppUTest/CppUTest.cmake)
-+target_link_libraries(uefi-test PRIVATE CppUTest)
-+
-+#----------------------------------------------------------------------=
---------
-+#  Extend with components that are common across all deployments of
-+#  uefi-test
-+#
-+#----------------------------------------------------------------------=
---------
-+include(../uefi-test.cmake REQUIRED)
-+
-+#----------------------------------------------------------------------=
---------
-+#  Define library options and dependencies.
-+#
-+#----------------------------------------------------------------------=
---------
-+env_set_link_options(TGT uefi-test)
-+target_link_libraries(uefi-test PRIVATE stdc++ gcc m)
-diff --git a/deployments/uefi-test/linux-pc/CMakeLists.txt b/deployments=
/uefi-test/linux-pc/CMakeLists.txt
-new file mode 100644
-index 00000000..be6e9840
---- /dev/null
-+++ b/deployments/uefi-test/linux-pc/CMakeLists.txt
-@@ -0,0 +1,76 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+cmake_minimum_required(VERSION 3.16)
-+include(../../deployment.cmake REQUIRED)
-+
-+#----------------------------------------------------------------------=
---------
-+#  The CMakeLists.txt for building the uefi-test deployment for linux-p=
c
-+#
-+#  Used for building and running service level tests in a native PC env=
iroment.
-+#  Tests can be run by running the built executable called "uefi-test"
-+#----------------------------------------------------------------------=
---------
-+include(${TS_ROOT}/environments/linux-pc/env.cmake)
-+project(trusted-services LANGUAGES CXX C)
-+
-+# Prevents symbols in the uefi-test executable overriding symbols with
-+# with same name in libts during dynamic linking performed by the progr=
am
-+# loader.
-+set(CMAKE_C_VISIBILITY_PRESET hidden)
-+
-+# Preparing firmware-test-build by including it
-+include(${TS_ROOT}/external/firmware_test_builder/FirmwareTestBuilder.c=
make)
-+
-+include(CTest)
-+include(UnitTest)
-+
-+set(COVERAGE FALSE CACHE BOOL "Enable code coverage measurement")
-+set(UNIT_TEST_PROJECT_PATH ${TS_ROOT} CACHE PATH "Path of the project d=
irectory")
-+set(CMAKE_CXX_STANDARD 11)
-+
-+unit_test_init_cpputest()
-+
-+if (COVERAGE)
-+	include(Coverage)
-+
-+	set(COVERAGE_FILE "coverage.info")
-+	set(TS_SERVICE_TEST_COVERAGE_FILE "uefi-test-coverage.info" CACHE PATH=
 "Path of coverage info file")
-+	set(TS_SERVICE_TEST_COVERAGE_REPORT_DIR "${CMAKE_CURRENT_BINARY_DIR}/t=
s-service-coverage-report" CACHE PATH "Directory of coverage report")
-+
-+	# Collecting coverage
-+	coverage_generate(
-+		NAME "ts-service test"
-+		SOURCE_DIR ${TS_ROOT}
-+		BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}
-+		OUTPUT_FILE ${COVERAGE_FILE}
-+	)
-+
-+	# Filtering project file coverage
-+	coverage_filter(
-+		INPUT_FILE ${COVERAGE_FILE}
-+		OUTPUT_FILE ${TS_SERVICE_TEST_COVERAGE_FILE}
-+		INCLUDE_DIRECTORY ${UNIT_TEST_PROJECT_PATH}/components
-+	)
-+
-+	# Coverage report
-+	coverage_generate_report(
-+		INPUT_FILE ${TS_SERVICE_TEST_COVERAGE_FILE}
-+		OUTPUT_DIRECTORY ${TS_SERVICE_TEST_COVERAGE_REPORT_DIR}
-+	)
-+endif()
-+
-+unit_test_add_suite(
-+	NAME uefi-test
-+)
-+
-+target_include_directories(uefi-test PRIVATE "${TOP_LEVEL_INCLUDE_DIRS}=
")
-+
-+#----------------------------------------------------------------------=
---------
-+#  Extend with components that are common across all deployments of
-+#  uefi-test
-+#
-+#----------------------------------------------------------------------=
---------
-+include(../uefi-test.cmake REQUIRED)
-diff --git a/deployments/uefi-test/uefi-test.cmake b/deployments/uefi-te=
st/uefi-test.cmake
-new file mode 100644
-index 00000000..ea678d0e
---- /dev/null
-+++ b/deployments/uefi-test/uefi-test.cmake
-@@ -0,0 +1,52 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+#----------------------------------------------------------------------=
---------
-+#  The base build file shared between deployments of 'uefi-test' for
-+#  different environments.  Used for running end-to-end service-level t=
ests
-+#  against SMM service providers that implement UEFI services such as s=
mm
-+#  variable.
-+#----------------------------------------------------------------------=
---------
-+
-+#----------------------------------------------------------------------=
---------
-+#  Use libts for locating and accessing services. An appropriate versio=
n of
-+#  libts will be imported for the enviroment in which service tests are
-+#  deployed.
-+#----------------------------------------------------------------------=
---------
-+include(${TS_ROOT}/deployments/libts/libts-import.cmake)
-+target_link_libraries(uefi-test PRIVATE libts)
-+
-+#----------------------------------------------------------------------=
---------
-+#  Components that are common accross all deployments
-+#
-+#----------------------------------------------------------------------=
---------
-+add_components(
-+	TARGET "uefi-test"
-+	BASE_DIR ${TS_ROOT}
-+	COMPONENTS
-+		"components/service/smm_variable/client/cpp"
-+		"components/service/smm_variable/test/service"
-+)
-+
-+#----------------------------------------------------------------------=
---------
-+#  Components used from external projects
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+# Nanopb
-+include(${TS_ROOT}/external/nanopb/nanopb.cmake)
-+target_link_libraries(uefi-test PRIVATE nanopb::protobuf-nanopb-static)
-+protobuf_generate_all(TGT "uefi-test" NAMESPACE "protobuf" BASE_DIR "${=
TS_ROOT}/protocols")
-+
-+#----------------------------------------------------------------------=
---------
-+#  Define install content.
-+#
-+#----------------------------------------------------------------------=
---------
-+if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
-+	set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install CACHE PATH "locat=
ion to install build output to." FORCE)
-+endif()
-+install(TARGETS uefi-test RUNTIME DESTINATION ${TS_ENV}/bin)
-diff --git a/tools/b-test/test_data.yaml b/tools/b-test/test_data.yaml
-index 11f8f633..33a85b12 100644
---- a/tools/b-test/test_data.yaml
-+++ b/tools/b-test/test_data.yaml
-@@ -163,3 +163,13 @@ data:
-       os_id : "GNU/Linux"
-       params:
-           - "-GUnix Makefiles"
-+    - name: "uefi-test-pc-linux"
-+      src: "$TS_ROOT/deployments/uefi-test/linux-pc"
-+      os_id : "GNU/Linux"
-+      params:
-+          - "-GUnix Makefiles"
-+    - name: "uefi-test-arm-linux"
-+      src: "$TS_ROOT/deployments/uefi-test/arm-linux"
-+      os_id : "GNU/Linux"
-+      params:
-+          - "-GUnix Makefiles"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_ca=
ll.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call=
.patch
deleted file mode 100644
index 9ad506b1..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patc=
h
+++ /dev/null
@@ -1,33 +0,0 @@
-From 289bec4cacac80cb43c19e4ca7b2c50fc932712e Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Wed, 8 Dec 2021 11:48:28 +0000
-Subject: [PATCH] Fix interface ID parameter setting in sp/ffarpc_caller
-
-When making FFA based RPC calls from one SP to another, the
-destination interface ID parameter was not being set correctly.
-This change fixes this issue.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Iab520e4c7dc63ee1f5d3bf1bd1de702e4cc6f093
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- components/rpc/ffarpc/caller/sp/ffarpc_caller.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c b/component=
s/rpc/ffarpc/caller/sp/ffarpc_caller.c
-index 250b1781..dabcd90c 100644
---- a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
-+++ b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
-@@ -81,7 +81,7 @@ static rpc_status_t call_invoke(void *context, rpc_cal=
l_handle handle, uint32_t
- 	req.destination_id =3D this_context->dest_partition_id;
- 	req.source_id =3D own_id;
- 	req.args[SP_CALL_ARGS_IFACE_ID_OPCODE] =3D
--		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(this_context->dest_partition_id=
, opcode);
-+		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(this_context->dest_iface_id, op=
code);
- 	//TODO: downcast problem?
- 	req.args[SP_CALL_ARGS_REQ_DATA_LEN] =3D (uint32_t)this_context->req_le=
n;
- 	req.args[SP_CALL_ARGS_ENCODING] =3D this_context->rpc_caller.encoding;
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer=
.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions=
/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.pat=
ch
deleted file mode 100644
index 6ea473b0..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 18b20dea7cf7e8afc26c5d49d5368d3180bd54d7 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Wed, 8 Dec 2021 16:05:22 +0000
-Subject: [PATCH] Support FFARPC call requests with no shared buffer
-
-To allow simple clients to make RPC calls for service operations
-that take no request parameters and return no response parameters,
-the ffarpc_call_ep.c has been modified to accept call requests
-when no shared buffer exists, as long as there is no request data.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I83b1bfb719a005922d6394887492d2d272b74907
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../rpc/ffarpc/endpoint/ffarpc_call_ep.c      | 52 ++++++++++---------
- 1 file changed, 27 insertions(+), 25 deletions(-)
-
-diff --git a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c b/component=
s/rpc/ffarpc/endpoint/ffarpc_call_ep.c
-index 17f957c2..a08a250c 100644
---- a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
-+++ b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
-@@ -150,29 +150,43 @@ out:
- static void handle_service_msg(struct ffa_call_ep *call_ep, uint16_t so=
urce_id,
- 			       const uint32_t *req_args, uint32_t *resp_args)
- {
--	rpc_status_t rpc_status =3D TS_RPC_ERROR_INTERNAL;
-+	rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
- 	struct call_req call_req;
-=20
- 	uint32_t ifaceid_opcode =3D req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
- 	int idx =3D find_shm(call_ep, source_id);
-=20
--	if (idx < 0) {
--		EMSG("handle service msg error");
--		goto out;
--	}
--
- 	call_req.caller_id =3D source_id;
- 	call_req.interface_id =3D FFA_CALL_ARGS_EXTRACT_IFACE(ifaceid_opcode);
- 	call_req.opcode =3D FFA_CALL_ARGS_EXTRACT_OPCODE(ifaceid_opcode);
- 	call_req.encoding =3D req_args[SP_CALL_ARGS_ENCODING];
-=20
--	call_req.req_buf.data =3D call_ep->shmem_buf[idx];
- 	call_req.req_buf.data_len =3D req_args[SP_CALL_ARGS_REQ_DATA_LEN];
--	call_req.req_buf.size =3D call_ep->shmem_buf_size[idx];
--
--	call_req.resp_buf.data =3D call_ep->shmem_buf[idx];
- 	call_req.resp_buf.data_len =3D 0;
--	call_req.resp_buf.size =3D call_ep->shmem_buf_size[idx];
-+
-+	if (idx >=3D 0 && call_ep->shmem_buf[idx]) {
-+		/* A shared buffer is available for call parameters */
-+		call_req.req_buf.data =3D call_ep->shmem_buf[idx];
-+		call_req.req_buf.size =3D call_ep->shmem_buf_size[idx];
-+
-+		call_req.resp_buf.data =3D call_ep->shmem_buf[idx];
-+		call_req.resp_buf.size =3D call_ep->shmem_buf_size[idx];
-+	}
-+	else if (call_req.req_buf.data_len =3D=3D 0) {
-+		/* No shared buffer so only allow calls with no request data */
-+		call_req.req_buf.data =3D NULL;
-+		call_req.req_buf.size =3D 0;
-+
-+		call_req.resp_buf.data =3D NULL;
-+		call_req.resp_buf.size =3D 0;
-+	}
-+	else {
-+		/*
-+		 * Caller has specified non-zero length request data but there is
-+		 * no shared buffer to carry the request data.
-+		 */
-+		goto out;
-+	}
-=20
- 	rpc_status =3D rpc_interface_receive(call_ep->iface, &call_req);
-=20
-@@ -223,7 +237,6 @@ void ffa_call_ep_receive(struct ffa_call_ep *call_ep=
,
- {
- 	const uint32_t *req_args =3D req_msg->args;
- 	uint32_t *resp_args =3D resp_msg->args;
--	int idx;
-=20
- 	uint16_t source_id =3D req_msg->source_id;
- 	uint32_t ifaceid_opcode =3D req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
-@@ -232,18 +245,7 @@ void ffa_call_ep_receive(struct ffa_call_ep *call_e=
p,
- 		/* It's an RPC layer management request */
- 		handle_mgmt_msg(call_ep, source_id, req_args, resp_args);
- 	} else {
--		/*
--		 * Assume anything else is a service request. Service requests
--		 * rely on a buffer being shared from the requesting client.
--		 * If it hasn't been set-up, fail the request.
--		 */
--		idx =3D find_shm(call_ep, source_id);
--
--		if (idx >=3D 0 && call_ep->shmem_buf[idx]) {
--			handle_service_msg(call_ep, source_id, req_args, resp_args);
--		} else {
--			EMSG("shared buffer not found or NULL");
--			set_mgmt_resp_args(resp_args, ifaceid_opcode, TS_RPC_ERROR_NOT_READY=
);
--		}
-+		/* Assume anything else is a service request */
-+		handle_service_msg(call_ep, source_id, req_args, resp_args);
- 	}
- }
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0019-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/secure-partitions/corstone1000/0019-Run-psa-arch-t=
est.patch
deleted file mode 100644
index 4f542158..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0019-Run-psa-arch-test.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From a496978dcf82494c69e600f65adf061f15e565f4 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 12 Dec 2021 10:43:48 +0000
-Subject: [PATCH] Run psa-arch-test
-
-Fixes needed to run psa-arch-test
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-
----
- components/service/common/psa_ipc/service_psa_ipc.c       | 1 +
- .../backend/secure_storage_ipc/secure_storage_ipc.c       | 8 --------
- .../service/secure_storage/include/psa/storage_common.h   | 4 ++--
- external/openamp/openamp.cmake                            | 2 +-
- 4 files changed, 4 insertions(+), 11 deletions(-)
-
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-index 95a07c13..5e5815db 100644
---- a/components/service/common/psa_ipc/service_psa_ipc.c
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -185,6 +185,7 @@ psa_status_t psa_call(struct rpc_caller *caller, psa=
_handle_t psa_handle,
- 						     resp_msg->params.out_vec);
-=20
- 	for (i =3D 0; i < resp_msg->params.out_len; i++) {
-+                out_vec[i].len =3D out_vec_param[i].len;
- 		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param=
[i].base),
- 		       out_vec[i].len);
- 	}
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-index 9b55f77d..a1f369db 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -31,10 +31,6 @@ static psa_status_t secure_storage_ipc_set(void *cont=
ext, uint32_t client_id,
-=20
- 	ipc->client.rpc_status =3D TS_RPC_CALL_ACCEPTED;
-=20
--	/* Validating input parameters */
--	if (p_data =3D=3D NULL)
--		return PSA_ERROR_INVALID_ARGUMENT;
--
- 	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
- 			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status < 0)
-@@ -96,10 +92,6 @@ static psa_status_t secure_storage_ipc_get_info(void =
*context,
-=20
- 	(void)client_id;
-=20
--	/* Validating input parameters */
--	if (!p_info)
--		return PSA_ERROR_INVALID_ARGUMENT;
--
- 	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
- 			      TFM_PS_GET_INFO, in_vec,
- 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-diff --git a/components/service/secure_storage/include/psa/storage_commo=
n.h b/components/service/secure_storage/include/psa/storage_common.h
-index 4f6ba2a7..1fd6b40d 100644
---- a/components/service/secure_storage/include/psa/storage_common.h
-+++ b/components/service/secure_storage/include/psa/storage_common.h
-@@ -20,8 +20,8 @@ typedef uint64_t psa_storage_uid_t;
- typedef uint32_t psa_storage_create_flags_t;
-=20
- struct psa_storage_info_t {
--	size_t capacity;
--	size_t size;
-+	uint32_t capacity;
-+	uint32_t size;
- 	psa_storage_create_flags_t flags;
- };
-=20
-diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.c=
make
-index aae13bad..75ab2290 100644
---- a/external/openamp/openamp.cmake
-+++ b/external/openamp/openamp.cmake
-@@ -61,7 +61,7 @@ execute_process(COMMAND
- 			-DCMAKE_SYSTEM_PROCESSOR=3Darm
- 			-DEXTERNAL_INCLUDE_PATHS=3D${OPENAMP_EXTERNAL_INCLUDE_PATHS}
- 			-DMACHINE=3Dtemplate
--			-DRPMSG_BUFFER_SIZE=3D512
-+			-DRPMSG_BUFFER_SIZE=3D8192
- 			${openamp_SOURCE_DIR}
- 	WORKING_DIRECTORY
- 			${openamp_BINARY_DIR}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0020-Use-address-instead-of-pointers.patch b/meta-arm-b=
sp/recipes-security/trusted-services/secure-partitions/corstone1000/0020-=
Use-address-instead-of-pointers.patch
deleted file mode 100644
index 844bca3c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0020-Use-address-instead-of-pointers.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From b417c1124af9d4569ba8871dfd1e43e626dddf12 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 12 Dec 2021 10:57:17 +0000
-Subject: [PATCH] Use address instead of pointers
-
-Since secure enclave is 32bit and we 64bit there is an issue
-in the protocol communication design that force us to handle
-on our side the manipulation of address and pointers to make
-this work.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-
----
- .../service/common/include/psa/client.h       | 15 ++++++++++++++
- .../service/common/psa_ipc/service_psa_ipc.c  | 20 ++++++++++++-------
- .../secure_storage_ipc/secure_storage_ipc.c   | 20 +++++++++----------
- 3 files changed, 38 insertions(+), 17 deletions(-)
-
-diff --git a/components/service/common/include/psa/client.h b/components=
/service/common/include/psa/client.h
-index 69ccf14f..12dcd68f 100644
---- a/components/service/common/include/psa/client.h
-+++ b/components/service/common/include/psa/client.h
-@@ -81,6 +81,21 @@ struct __attribute__ ((__packed__)) psa_outvec {
-     uint32_t len;                 /*!< the size in bytes               =
       */
- };
-=20
-+static void *psa_u32_to_ptr(uint32_t addr)
-+{
-+	return (void *)(uintptr_t)addr;
-+}
-+
-+static uint32_t psa_ptr_to_u32(void *ptr)
-+{
-+	return (uintptr_t)ptr;
-+}
-+
-+static uint32_t psa_ptr_const_to_u32(const void *ptr)
-+{
-+	return (uintptr_t)ptr;
-+}
-+
- /*************************** PSA Client API ***************************=
*******/
-=20
- /**
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-index 5e5815db..435c6c0a 100644
---- a/components/service/common/psa_ipc/service_psa_ipc.c
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -62,6 +62,11 @@ static size_t psa_call_out_vec_len(const struct psa_o=
utvec *out_vec, size_t out_
- 	return resp_len;
- }
-=20
-+static uint32_t psa_virt_to_phys_u32(struct rpc_caller *caller, void *v=
a)
-+{
-+	return (uintptr_t)rpc_caller_virt_to_phys(caller, va);
-+}
-+
- psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
- 			 uint32_t version)
- {
-@@ -147,20 +152,20 @@ psa_status_t psa_call(struct rpc_caller *caller, p=
sa_handle_t psa_handle,
- 	req_msg->params.psa_call_params.handle =3D psa_handle;
- 	req_msg->params.psa_call_params.type =3D type;
- 	req_msg->params.psa_call_params.in_len =3D in_len;
--	req_msg->params.psa_call_params.in_vec =3D rpc_caller_virt_to_phys(cal=
ler, in_vec_param);
-+	req_msg->params.psa_call_params.in_vec =3D psa_virt_to_phys_u32(caller=
, in_vec_param);
- 	req_msg->params.psa_call_params.out_len =3D out_len;
--	req_msg->params.psa_call_params.out_vec =3D rpc_caller_virt_to_phys(ca=
ller, out_vec_param);
-+	req_msg->params.psa_call_params.out_vec =3D psa_virt_to_phys_u32(calle=
r, out_vec_param);
-=20
- 	for (i =3D 0; i < in_len; i++) {
--		in_vec_param[i].base =3D rpc_caller_virt_to_phys(caller, payload);
-+		in_vec_param[i].base =3D psa_virt_to_phys_u32(caller, payload);
- 		in_vec_param[i].len =3D in_vec[i].len;
-=20
--		memcpy(payload, in_vec[i].base, in_vec[i].len);
-+		memcpy(payload, psa_u32_to_ptr(in_vec[i].base), in_vec[i].len);
- 		payload +=3D in_vec[i].len;
- 	}
-=20
- 	for (i =3D 0; i < out_len; i++) {
--		out_vec_param[i].base =3D NULL;
-+		out_vec_param[i].base =3D 0;
- 		out_vec_param[i].len =3D out_vec[i].len;
- 	}
-=20
-@@ -182,11 +187,12 @@ psa_status_t psa_call(struct rpc_caller *caller, p=
sa_handle_t psa_handle,
- 		goto caller_end;
-=20
- 	out_vec_param =3D (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
--						     resp_msg->params.out_vec);
-+				psa_u32_to_ptr(resp_msg->params.out_vec));
-=20
- 	for (i =3D 0; i < resp_msg->params.out_len; i++) {
-                 out_vec[i].len =3D out_vec_param[i].len;
--		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param=
[i].base),
-+		memcpy(psa_u32_to_ptr(out_vec[i].base),
-+		       rpc_caller_phys_to_virt(caller,	psa_u32_to_ptr(out_vec_param[i=
].base)),
- 		       out_vec[i].len);
- 	}
-=20
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-index a1f369db..bda442a6 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -22,9 +22,9 @@ static psa_status_t secure_storage_ipc_set(void *conte=
xt, uint32_t client_id,
- 	psa_handle_t psa_handle;
- 	psa_status_t psa_status;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
--		{ .base =3D p_data, .len =3D data_length },
--		{ .base =3D &create_flags, .len =3D sizeof(create_flags) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_const_to_u32(p_data), .len =3D data_length },
-+		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
- 	};
-=20
- 	(void)client_id;
-@@ -53,11 +53,11 @@ static psa_status_t secure_storage_ipc_get(void *con=
text,
- 	psa_status_t psa_status;
- 	uint32_t offset =3D (uint32_t)data_offset;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
--		{ .base =3D &offset, .len =3D sizeof(offset) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&offset), .len =3D sizeof(offset) },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D p_data, .len =3D data_size },
-+		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
- 	};
-=20
- 	if (!p_data_length) {
-@@ -84,10 +84,10 @@ static psa_status_t secure_storage_ipc_get_info(void=
 *context,
- 	psa_handle_t psa_handle;
- 	psa_status_t psa_status;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D p_info, .len =3D sizeof(*p_info) },
-+		{ .base =3D psa_ptr_to_u32(p_info), .len =3D sizeof(*p_info) },
- 	};
-=20
- 	(void)client_id;
-@@ -110,7 +110,7 @@ static psa_status_t secure_storage_ipc_remove(void *=
context,
- 	psa_handle_t psa_handle;
- 	psa_status_t psa_status;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
- 	};
-=20
- 	(void)client_id;
-@@ -164,7 +164,7 @@ static uint32_t secure_storage_get_support(void *con=
text, uint32_t client_id)
- 	psa_status_t psa_status;
- 	uint32_t support_flags;
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D &support_flags, .len =3D  sizeof(support_flags) },
-+		{ .base =3D psa_ptr_to_u32(&support_flags), .len =3D  sizeof(support_=
flags) },
- 	};
-=20
- 	(void)client_id;
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-a=
rm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0=
021-Add-psa-ipc-attestation-to-se-proxy.patch
deleted file mode 100644
index 5376bb22..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
+++ /dev/null
@@ -1,267 +0,0 @@
-From 259300dc81b95ff65cd2e95e0fecd140d76e4b5e Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 7 Dec 2021 11:50:00 +0000
-Subject: [PATCH] Add psa ipc attestation to se proxy
-
-Implement attestation client API as psa ipc and include it to
-se proxy deployment.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-
----
- .../client/psa_ipc/component.cmake            | 13 +++
- .../client/psa_ipc/iat_ipc_client.c           | 86 +++++++++++++++++++
- .../reporter/psa_ipc/component.cmake          | 13 +++
- .../reporter/psa_ipc/psa_ipc_attest_report.c  | 45 ++++++++++
- components/service/common/include/psa/sid.h   |  4 +
- deployments/se-proxy/opteesp/CMakeLists.txt   |  3 +-
- .../se-proxy/opteesp/service_proxy_factory.c  |  6 ++
- 7 files changed, 169 insertions(+), 1 deletion(-)
- create mode 100644 components/service/attestation/client/psa_ipc/compon=
ent.cmake
- create mode 100644 components/service/attestation/client/psa_ipc/iat_ip=
c_client.c
- create mode 100644 components/service/attestation/reporter/psa_ipc/comp=
onent.cmake
- create mode 100644 components/service/attestation/reporter/psa_ipc/psa_=
ipc_attest_report.c
-
-diff --git a/components/service/attestation/client/psa_ipc/component.cma=
ke b/components/service/attestation/client/psa_ipc/component.cmake
-new file mode 100644
-index 00000000..a5bc6b4a
---- /dev/null
-+++ b/components/service/attestation/client/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/iat_ipc_client.c"
-+	)
-diff --git a/components/service/attestation/client/psa_ipc/iat_ipc_clien=
t.c b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
-new file mode 100644
-index 00000000..30bd0a13
---- /dev/null
-+++ b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
-@@ -0,0 +1,86 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <string.h>
-+
-+#include "../psa/iat_client.h"
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <psa/initial_attestation.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+
-+/**
-+ * @brief      The singleton psa_iat_client instance
-+ *
-+ * The psa attestation C API assumes a single backend service provider.
-+ */
-+static struct service_client instance;
-+
-+
-+psa_status_t psa_iat_client_init(struct rpc_caller *caller)
-+{
-+	return service_client_init(&instance, caller);
-+}
-+
-+void psa_iat_client_deinit(void)
-+{
-+	service_client_deinit(&instance);
-+}
-+
-+int psa_iat_client_rpc_status(void)
-+{
-+	return instance.rpc_status;
-+}
-+
-+psa_status_t psa_initial_attest_get_token(const uint8_t *auth_challenge=
,
-+					  size_t challenge_size,
-+					  uint8_t *token_buf,
-+					  size_t token_buf_size,
-+					  size_t *token_size)
-+{
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller *caller =3D instance.caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_const_to_u32(auth_challenge), .len =3D challenge_=
size},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(token_buf), .len =3D token_buf_size},
-+	};
-+
-+	if (!token_buf || !token_buf_size)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	status =3D psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
-+			  TFM_ATTEST_GET_TOKEN, in_vec, IOVEC_LEN(in_vec),
-+			  out_vec, IOVEC_LEN(out_vec));
-+	if (status =3D=3D PSA_SUCCESS) {
-+		*token_size =3D out_vec[0].len;
-+	}
-+
-+	return status;
-+}
-+
-+psa_status_t psa_initial_attest_get_token_size(size_t challenge_size,
-+						size_t *token_size)
-+{
-+	struct rpc_caller *caller =3D instance.caller;
-+	psa_status_t status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&challenge_size), .len =3D sizeof(uint32_t=
)}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(token_size), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
-+			  TFM_ATTEST_GET_TOKEN_SIZE,
-+			  in_vec, IOVEC_LEN(in_vec),
-+			  out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-diff --git a/components/service/attestation/reporter/psa_ipc/component.c=
make b/components/service/attestation/reporter/psa_ipc/component.cmake
-new file mode 100644
-index 00000000..b37830c6
---- /dev/null
-+++ b/components/service/attestation/reporter/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/psa_ipc_attest_report.c"
-+	)
-diff --git a/components/service/attestation/reporter/psa_ipc/psa_ipc_att=
est_report.c b/components/service/attestation/reporter/psa_ipc/psa_ipc_at=
test_report.c
-new file mode 100644
-index 00000000..15805e8e
---- /dev/null
-+++ b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_rep=
ort.c
-@@ -0,0 +1,45 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+/**
-+ * A attestation reporter for psa ipc
-+ */
-+
-+#include <stddef.h>
-+#include <psa/error.h>
-+#include <service/attestation/reporter/attest_report.h>
-+#include <psa/initial_attestation.h>
-+
-+#define TOKEN_BUF_SIZE	1024
-+
-+static uint8_t token_buf[TOKEN_BUF_SIZE];
-+
-+int attest_report_create(int32_t client_id, const uint8_t *auth_challen=
ge_data,
-+			 size_t auth_challenge_len, const uint8_t **report,
-+			 size_t *report_len)
-+{
-+	*report =3D token_buf;
-+	psa_status_t ret;
-+	size_t token_size =3D 0;
-+
-+	ret =3D psa_initial_attest_get_token(auth_challenge_data,
-+					   auth_challenge_len, token_buf,
-+					   TOKEN_BUF_SIZE, &token_size);
-+	if (ret !=3D PSA_SUCCESS) {
-+		*report =3D NULL;
-+		*report_len =3D 0;
-+		return ret;
-+	}
-+
-+	*report_len =3D token_size;
-+
-+	return PSA_SUCCESS;
-+}
-+
-+void attest_report_destroy(const uint8_t *report)
-+{
-+	(void)report;
-+}
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index aaa973c6..833f5039 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -50,6 +50,10 @@ extern "C" {
- #define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
- #define TFM_ATTESTATION_SERVICE_HANDLE                             (0x4=
0000103U)
-=20
-+/* Initial Attestation message types that distinguish Attest services. =
*/
-+#define TFM_ATTEST_GET_TOKEN       1001
-+#define TFM_ATTEST_GET_TOKEN_SIZE  1002
-+
- /******** TFM_SP_FWU ********/
- #define TFM_FWU_WRITE_SID                                          (0x0=
00000A0U)
- #define TFM_FWU_WRITE_VERSION                                      (1U)
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index 663177b7..af2225e7 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -77,12 +77,13 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/include"
- 		"components/service/attestation/provider"
- 		"components/service/attestation/provider/serializer/packed-c"
-+		"components/service/attestation/reporter/psa_ipc"
-+		"components/service/attestation/client/psa_ipc"
- 		"components/rpc/openamp/caller/sp"
-=20
- 		# Stub service provider backends
- 		"components/rpc/dummy"
- 		"components/rpc/common/caller"
--		"components/service/attestation/reporter/stub"
- 		"components/service/attestation/key_mngr/stub"
- 		"components/service/crypto/backend/stub"
- 		"components/service/crypto/client/psa"
-diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/depl=
oyments/se-proxy/opteesp/service_proxy_factory.c
-index 57290056..4b8ccecc 100644
---- a/deployments/se-proxy/opteesp/service_proxy_factory.c
-+++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
-@@ -23,12 +23,18 @@ struct openamp_caller openamp;
- struct rpc_interface *attest_proxy_create(void)
- {
- 	struct rpc_interface *attest_iface;
-+	struct rpc_caller *attest_caller;
-=20
- 	/* Static objects for proxy instance */
- 	static struct attest_provider attest_provider;
-=20
-+	attest_caller =3D openamp_caller_init(&openamp);
-+	if (!attest_caller)
-+		return NULL;
-+
- 	/* Initialize the service provider */
- 	attest_iface =3D attest_provider_init(&attest_provider);
-+	psa_iat_client_init(&openamp.rpc_caller);
-=20
- 	attest_provider_register_serializer(&attest_provider,
- 		TS_RPC_ENCODING_PACKED_C, packedc_attest_provider_serializer_instance=
());
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-stor=
ag.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag=
.patch
deleted file mode 100644
index aa389d8b..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patc=
h
+++ /dev/null
@@ -1,164 +0,0 @@
-From 90006cecbbba58afee5f51e6bd72f7027a257b5e Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Thu, 9 Dec 2021 14:11:06 +0000
-Subject: [PATCH] Setup its backend as openamp rpc using secure storage i=
pc
- implementation.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-
----
- components/service/common/include/psa/sid.h   | 12 +++++-----
- .../secure_storage_ipc/secure_storage_ipc.c   | 20 ++++++++---------
- .../secure_storage_ipc/secure_storage_ipc.h   |  1 +
- .../se-proxy/opteesp/service_proxy_factory.c  | 22 +++++++++++++------
- 4 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 833f5039..4a951d4a 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -20,12 +20,12 @@ extern "C" {
- /* Invalid UID */
- #define TFM_PS_INVALID_UID 0
-=20
--/* PS message types that distinguish PS services. */
--#define TFM_PS_SET                1001
--#define TFM_PS_GET                1002
--#define TFM_PS_GET_INFO           1003
--#define TFM_PS_REMOVE             1004
--#define TFM_PS_GET_SUPPORT        1005
-+/* PS / ITS message types that distinguish PS services. */
-+#define TFM_PS_ITS_SET                1001
-+#define TFM_PS_ITS_GET                1002
-+#define TFM_PS_ITS_GET_INFO           1003
-+#define TFM_PS_ITS_REMOVE             1004
-+#define TFM_PS_ITS_GET_SUPPORT        1005
-=20
- /******** TFM_SP_ITS ********/
- #define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x0=
0000070U)
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-index bda442a6..0e1b48c0 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -31,8 +31,8 @@ static psa_status_t secure_storage_ipc_set(void *conte=
xt, uint32_t client_id,
-=20
- 	ipc->client.rpc_status =3D TS_RPC_CALL_ACCEPTED;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
-+	psa_status =3D psa_call(caller, ipc->service_handle, TFM_PS_ITS_SET,
-+			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status < 0)
- 		EMSG("ipc_set: psa_call failed: %d", psa_status);
-=20
-@@ -65,8 +65,8 @@ static psa_status_t secure_storage_ipc_get(void *conte=
xt,
- 		return PSA_ERROR_INVALID_ARGUMENT;
- 	}
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
- 			      out_vec, IOVEC_LEN(out_vec));
- 	if (psa_status =3D=3D PSA_SUCCESS)
- 		*p_data_length =3D out_vec[0].len;
-@@ -92,8 +92,8 @@ static psa_status_t secure_storage_ipc_get_info(void *=
context,
-=20
- 	(void)client_id;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_GET_INFO, in_vec,
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_GET_INFO, in_vec,
- 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
- 	if (psa_status !=3D PSA_SUCCESS)
- 		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
-@@ -115,8 +115,8 @@ static psa_status_t secure_storage_ipc_remove(void *=
context,
-=20
- 	(void)client_id;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_REMOVE, in_vec,
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_REMOVE, in_vec,
- 			      IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status !=3D PSA_SUCCESS)
- 		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
-@@ -169,8 +169,8 @@ static uint32_t secure_storage_get_support(void *con=
text, uint32_t client_id)
-=20
- 	(void)client_id;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_GET_SUPPORT, NULL, 0,
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_GET_SUPPORT, NULL, 0,
- 			      out_vec, IOVEC_LEN(out_vec));
- 	if (psa_status !=3D PSA_SUCCESS)
- 		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.h b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.h
-index e8c1e8fd..d9949f6a 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.h
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.h
-@@ -21,6 +21,7 @@ struct secure_storage_ipc
- {
-     struct storage_backend backend;
-     struct service_client client;
-+    int32_t service_handle;
- };
-=20
- /**
-diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/depl=
oyments/se-proxy/opteesp/service_proxy_factory.c
-index 4b8ccecc..1110ac46 100644
---- a/deployments/se-proxy/opteesp/service_proxy_factory.c
-+++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
-@@ -5,6 +5,7 @@
-  */
-=20
- #include <stddef.h>
-+#include <psa/sid.h>
- #include <rpc/common/endpoint/rpc_interface.h>
- #include <rpc/openamp/caller/sp/openamp_caller.h>
- #include <service/attestation/provider/attest_provider.h>
-@@ -60,23 +61,30 @@ struct rpc_interface *ps_proxy_create(void)
- {
- 	static struct secure_storage_provider ps_provider;
- 	static struct secure_storage_ipc ps_backend;
--	static struct rpc_caller *storage_caller;
-+	struct rpc_caller *storage_caller;
- 	struct storage_backend *backend;
-=20
- 	storage_caller =3D openamp_caller_init(&openamp);
- 	if (!storage_caller)
- 		return NULL;
- 	backend =3D secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
-+	ps_backend.service_handle =3D TFM_PROTECTED_STORAGE_SERVICE_HANDLE;
-=20
- 	return secure_storage_provider_init(&ps_provider, backend);
- }
-=20
- struct rpc_interface *its_proxy_create(void)
- {
--	static struct mock_store its_backend;
--	static struct secure_storage_provider its_provider;
--
--	struct storage_backend *backend =3D mock_store_init(&its_backend);
--
--	return secure_storage_provider_init(&its_provider, backend);
-+        static struct secure_storage_provider its_provider;
-+        static struct secure_storage_ipc its_backend;
-+        struct rpc_caller *storage_caller;
-+        struct storage_backend *backend;
-+=20
-+        storage_caller =3D openamp_caller_init(&openamp);
-+        if (!storage_caller)
-+        	return NULL;
-+        backend =3D secure_storage_ipc_init(&its_backend, &openamp.rpc_=
caller);
-+        its_backend.service_handle =3D TFM_INTERNAL_TRUSTED_STORAGE_SER=
VICE_HANDLE;
-+=20
-+        return secure_storage_provider_init(&its_provider, backend);
- }
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0023-add-psa-ipc-crypto-backend.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/secure-partitions/corstone1000/0023-add-p=
sa-ipc-crypto-backend.patch
deleted file mode 100644
index a20a6a48..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0023-add-psa-ipc-crypto-backend.patch
+++ /dev/null
@@ -1,2586 +0,0 @@
-From 5af98a77887c2aa60bc93dbdddb174e03501b733 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 9 Dec 2021 14:17:39 +0000
-Subject: [PATCH] add psa ipc crypto backend
-
-Add psa ipc crypto backend and attach it to se proxy
-deployment.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-
----
- components/service/common/include/psa/sid.h   |  73 +++++
- .../crypto/backend/psa_ipc/component.cmake    |  21 ++
- .../backend/psa_ipc/crypto_ipc_backend.c      |  26 ++
- .../backend/psa_ipc/crypto_ipc_backend.h      |  70 ++++
- .../client/caller/psa_ipc/crypto_caller.h     |  34 ++
- .../caller/psa_ipc/crypto_caller_aead.h       | 252 +++++++++++++++
- .../crypto_caller_asymmetric_decrypt.h        |  76 +++++
- .../crypto_caller_asymmetric_encrypt.h        |  76 +++++
- .../caller/psa_ipc/crypto_caller_cipher.h     | 246 +++++++++++++++
- .../caller/psa_ipc/crypto_caller_copy_key.h   |  57 ++++
- .../psa_ipc/crypto_caller_destroy_key.h       |  51 +++
- .../caller/psa_ipc/crypto_caller_export_key.h |  59 ++++
- .../psa_ipc/crypto_caller_export_public_key.h |  59 ++++
- .../psa_ipc/crypto_caller_generate_key.h      |  55 ++++
- .../psa_ipc/crypto_caller_generate_random.h   |  57 ++++
- .../crypto_caller_get_key_attributes.h        |  56 ++++
- .../caller/psa_ipc/crypto_caller_hash.h       | 220 +++++++++++++
- .../caller/psa_ipc/crypto_caller_import_key.h |  57 ++++
- .../psa_ipc/crypto_caller_key_attributes.h    |  51 +++
- .../psa_ipc/crypto_caller_key_derivation.h    | 298 ++++++++++++++++++
- .../client/caller/psa_ipc/crypto_caller_mac.h | 207 ++++++++++++
- .../caller/psa_ipc/crypto_caller_purge_key.h  |  51 +++
- .../caller/psa_ipc/crypto_caller_sign_hash.h  |  64 ++++
- .../psa_ipc/crypto_caller_verify_hash.h       |  59 ++++
- .../crypto/include/psa/crypto_client_struct.h |   8 +-
- .../service/crypto/include/psa/crypto_sizes.h |   2 +-
- deployments/se-proxy/opteesp/CMakeLists.txt   |   2 +-
- .../se-proxy/opteesp/service_proxy_factory.c  |  15 +-
- .../providers/arm/corstone1000/platform.cmake |   2 +
- 29 files changed, 2293 insertions(+), 11 deletions(-)
- create mode 100644 components/service/crypto/backend/psa_ipc/component.=
cmake
- create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc=
_backend.c
- create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc=
_backend.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_aead.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_asymmetric_decrypt.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_asymmetric_encrypt.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_cipher.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_copy_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_destroy_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_export_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_export_public_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_generate_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_generate_random.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_get_key_attributes.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_hash.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_import_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_key_attributes.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_key_derivation.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_mac.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_purge_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_sign_hash.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_verify_hash.h
-
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 4a951d4a..7a29cc25 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -37,6 +37,79 @@ extern "C" {
- #define TFM_CRYPTO_VERSION                                         (1U)
- #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-=20
-+/**
-+ * \brief Define a progressive numerical value for each SID which can b=
e used
-+ *        when dispatching the requests to the service
-+ */
-+enum {
-+    TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID =3D (0u),
-+    TFM_CRYPTO_RESET_KEY_ATTRIBUTES_SID,
-+    TFM_CRYPTO_OPEN_KEY_SID,
-+    TFM_CRYPTO_CLOSE_KEY_SID,
-+    TFM_CRYPTO_IMPORT_KEY_SID,
-+    TFM_CRYPTO_DESTROY_KEY_SID,
-+    TFM_CRYPTO_EXPORT_KEY_SID,
-+    TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
-+    TFM_CRYPTO_PURGE_KEY_SID,
-+    TFM_CRYPTO_COPY_KEY_SID,
-+    TFM_CRYPTO_HASH_COMPUTE_SID,
-+    TFM_CRYPTO_HASH_COMPARE_SID,
-+    TFM_CRYPTO_HASH_SETUP_SID,
-+    TFM_CRYPTO_HASH_UPDATE_SID,
-+    TFM_CRYPTO_HASH_FINISH_SID,
-+    TFM_CRYPTO_HASH_VERIFY_SID,
-+    TFM_CRYPTO_HASH_ABORT_SID,
-+    TFM_CRYPTO_HASH_CLONE_SID,
-+    TFM_CRYPTO_MAC_COMPUTE_SID,
-+    TFM_CRYPTO_MAC_VERIFY_SID,
-+    TFM_CRYPTO_MAC_SIGN_SETUP_SID,
-+    TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
-+    TFM_CRYPTO_MAC_UPDATE_SID,
-+    TFM_CRYPTO_MAC_SIGN_FINISH_SID,
-+    TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
-+    TFM_CRYPTO_MAC_ABORT_SID,
-+    TFM_CRYPTO_CIPHER_ENCRYPT_SID,
-+    TFM_CRYPTO_CIPHER_DECRYPT_SID,
-+    TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
-+    TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
-+    TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
-+    TFM_CRYPTO_CIPHER_SET_IV_SID,
-+    TFM_CRYPTO_CIPHER_UPDATE_SID,
-+    TFM_CRYPTO_CIPHER_FINISH_SID,
-+    TFM_CRYPTO_CIPHER_ABORT_SID,
-+    TFM_CRYPTO_AEAD_ENCRYPT_SID,
-+    TFM_CRYPTO_AEAD_DECRYPT_SID,
-+    TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
-+    TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
-+    TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
-+    TFM_CRYPTO_AEAD_SET_NONCE_SID,
-+    TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
-+    TFM_CRYPTO_AEAD_UPDATE_AD_SID,
-+    TFM_CRYPTO_AEAD_UPDATE_SID,
-+    TFM_CRYPTO_AEAD_FINISH_SID,
-+    TFM_CRYPTO_AEAD_VERIFY_SID,
-+    TFM_CRYPTO_AEAD_ABORT_SID,
-+    TFM_CRYPTO_SIGN_MESSAGE_SID,
-+    TFM_CRYPTO_VERIFY_MESSAGE_SID,
-+    TFM_CRYPTO_SIGN_HASH_SID,
-+    TFM_CRYPTO_VERIFY_HASH_SID,
-+    TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
-+    TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
-+    TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
-+    TFM_CRYPTO_GENERATE_RANDOM_SID,
-+    TFM_CRYPTO_GENERATE_KEY_SID,
-+    TFM_CRYPTO_SID_MAX,
-+};
-+
- /******** TFM_SP_PLATFORM ********/
- #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
- #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
-diff --git a/components/service/crypto/backend/psa_ipc/component.cmake b=
/components/service/crypto/backend/psa_ipc/component.cmake
-new file mode 100644
-index 00000000..93c297a8
---- /dev/null
-+++ b/components/service/crypto/backend/psa_ipc/component.cmake
-@@ -0,0 +1,21 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/crypto_ipc_backend.c"
-+	)
-+
-+# The ipc crypto backend uses the psa crypto client to realize the
-+# psa crypto API that the crypto provider depends on.  This define
-+# configures the psa crypto client to be built with the ipc crypto
-+# caller.
-+target_compile_definitions(${TGT} PRIVATE
-+	PSA_CRYPTO_CLIENT_CALLER_SELECTION_H=3D"service/crypto/client/caller/p=
sa_ipc/crypto_caller.h"
-+)
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.c b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
-new file mode 100644
-index 00000000..e47cd4ff
---- /dev/null
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
-@@ -0,0 +1,26 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <psa/crypto.h>
-+#include <service/crypto/client/psa/psa_crypto_client.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include "crypto_ipc_backend.h"
-+
-+psa_status_t crypto_ipc_backend_init(struct rpc_caller *caller)
-+{
-+	psa_status_t status =3D psa_crypto_client_init(caller);
-+
-+	if (status =3D=3D PSA_SUCCESS)
-+		status =3D psa_crypto_init();
-+
-+	return status;
-+}
-+
-+void crypto_ipc_backend_deinit(void)
-+{
-+	psa_crypto_client_deinit();
-+}
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-new file mode 100644
-index 00000000..c13c20e8
---- /dev/null
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-@@ -0,0 +1,70 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CRYPTO_IPC_BACKEND_H
-+#define CRYPTO_IPC_BACKEND_H
-+
-+#include <service/crypto/client/psa/psa_crypto_client.h>
-+#include <psa/error.h>
-+#include <rpc_caller.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * \brief This type is used to overcome a limitation in the number of m=
aximum
-+ *        IOVECs that can be used especially in psa_aead_encrypt and
-+ *        psa_aead_decrypt. To be removed in case the AEAD APIs number =
of
-+ *        parameters passed gets restructured
-+ */
-+#define TFM_CRYPTO_MAX_NONCE_LENGTH (16u)
-+struct psa_ipc_crypto_aead_pack_input {
-+	uint8_t nonce[TFM_CRYPTO_MAX_NONCE_LENGTH];
-+	uint32_t nonce_length;
-+};
-+
-+struct psa_ipc_crypto_pack_iovec {
-+	uint32_t sfn_id;             /*!< Secure function ID used to dispatch =
the
-+				      *   request
-+				      */
-+	uint16_t step;               /*!< Key derivation step */
-+	psa_key_id_t key_id;         /*!< Key id */
-+	psa_algorithm_t alg;         /*!< Algorithm */
-+	uint32_t op_handle;          /*!< Frontend context handle associated t=
o a
-+				      *   multipart operation
-+				      */
-+	uint32_t capacity;             /*!< Key derivation capacity */
-+
-+	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily=
 used for
-+							    *   AEAD until the API is
-+							    *   restructured
-+							    */
-+};
-+
-+#define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
-+
-+/**
-+ * \brief Initialize the psa ipc crypto backend
-+ *
-+ * Initializes a crypto backend that uses the psa API client with a
-+ * psa_ipc_backend caller to realize the PSA crypto API used by the cry=
pto
-+ * service proviser.
-+ *
-+ * \return PSA_SUCCESS if backend initialized successfully
-+ */
-+psa_status_t crypto_ipc_backend_init(struct rpc_caller *caller);
-+
-+/**
-+ * \brief Clean-up to free any resource used by the crypto backend
-+ */
-+void crypto_ipc_backend_deinit(void);
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CRYPTO_IPC_BACKEND_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
-new file mode 100644
-index 00000000..0a972187
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
-@@ -0,0 +1,34 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_H
-+#define PSA_IPC_CRYPTO_CALLER_H
-+
-+/**
-+ * Includes all header files that form the psa ipc crypto caller
-+ * interface.  May be used by a client that needs to call operations
-+ * provided by a crypto service instance using the psa ipc interface.
-+ */
-+#include "crypto_caller_aead.h"
-+#include "crypto_caller_asymmetric_decrypt.h"
-+#include "crypto_caller_asymmetric_encrypt.h"
-+#include "crypto_caller_cipher.h"
-+#include "crypto_caller_copy_key.h"
-+#include "crypto_caller_destroy_key.h"
-+#include "crypto_caller_export_key.h"
-+#include "crypto_caller_export_public_key.h"
-+#include "crypto_caller_generate_key.h"
-+#include "crypto_caller_generate_random.h"
-+#include "crypto_caller_get_key_attributes.h"
-+#include "crypto_caller_hash.h"
-+#include "crypto_caller_import_key.h"
-+#include "crypto_caller_key_derivation.h"
-+#include "crypto_caller_mac.h"
-+#include "crypto_caller_purge_key.h"
-+#include "crypto_caller_sign_hash.h"
-+#include "crypto_caller_verify_hash.h"
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-new file mode 100644
-index 00000000..78517fe3
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -0,0 +1,252 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_AEAD_H
-+#define PSA_IPC_CRYPTO_CALLER_AEAD_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_aead_encrypt(
-+					      struct service_client *context,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg,
-+					      const uint8_t *nonce,
-+					      size_t nonce_length,
-+					      const uint8_t *additional_data,
-+					      size_t additional_data_length,
-+					      const uint8_t *plaintext,
-+					      size_t plaintext_length,
-+					      uint8_t *aeadtext,
-+					      size_t aeadtext_size,
-+					      size_t *aeadtext_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	int i;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.aead_in =3D { .nonce =3D {0}, .nonce_length =3D nonce_length },
-+	};
-+
-+	if (!additional_data && additional_data_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(plaintext),
-+			.len =3D plaintext_length },
-+		{ .base =3D psa_ptr_const_to_u32(additional_data),
-+			.len =3D additional_data_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(aeadtext), .len =3D aeadtext_size },
-+	};
-+
-+	if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	if (nonce) {
-+		for (i =3D 0; i < nonce_length; i++)
-+			iov.aead_in.nonce[i] =3D nonce[i];
-+	}
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (!additional_data)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*aeadtext_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_decrypt(
-+					      struct service_client *context,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg,
-+					      const uint8_t *nonce,
-+					      size_t nonce_length,
-+					      const uint8_t *additional_data,
-+					      size_t additional_data_length,
-+					      const uint8_t *aeadtext,
-+					      size_t aeadtext_length,
-+					      uint8_t *plaintext,
-+					      size_t plaintext_size,
-+					      size_t *plaintext_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	int i;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.aead_in =3D { .nonce =3D {0}, .nonce_length =3D nonce_length },
-+	};
-+
-+	if (!additional_data && additional_data_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(aeadtext),
-+			.len =3D aeadtext_length },
-+		{ .base =3D psa_ptr_const_to_u32(additional_data),
-+			.len =3D additional_data_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(plaintext), .len =3D plaintext_size },
-+	};
-+
-+	if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	if (nonce) {
-+		for (i =3D 0; i < nonce_length; i++)
-+			iov.aead_in.nonce[i] =3D nonce[i];
-+	}
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (!additional_data)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*plaintext_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_encrypt_setup(
-+					    struct service_client *context,
-+					    uint32_t *op_handle,
-+					    psa_key_id_t key,
-+					    psa_algorithm_t alg)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_decrypt_setup(
-+					    struct service_client *context,
-+					    uint32_t *op_handle,
-+					    psa_key_id_t key,
-+					    psa_algorithm_t alg)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_generate_nonce(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *nonce,
-+					     size_t nonce_size,
-+					     size_t *nonce_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_set_nonce(
-+						struct service_client *context,
-+						uint32_t op_handle,
-+						const uint8_t *nonce,
-+						size_t nonce_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_set_lengths(
-+					  struct service_client *context,
-+					  uint32_t op_handle,
-+					  size_t ad_length,
-+					  size_t plaintext_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_update_ad(
-+						struct service_client *context,
-+						uint32_t op_handle,
-+						const uint8_t *input,
-+						size_t input_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_update(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     const uint8_t *input,
-+					     size_t input_length,
-+					     uint8_t *output,
-+					     size_t output_size,
-+					     size_t *output_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_finish(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *aeadtext,
-+					     size_t aeadtext_size,
-+					     size_t *aeadtext_length,
-+					     uint8_t *tag,
-+					     size_t tag_size,
-+					     size_t *tag_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_verify(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *plaintext,
-+					     size_t plaintext_size,
-+					     size_t *plaintext_length,
-+					     const uint8_t *tag,
-+					     size_t tag_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_abort(
-+					    struct service_client *context,
-+					    uint32_t op_handle)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_AEAD_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_decrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_decrypt.h
-new file mode 100644
-index 00000000..ff01815c
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_decrypt.h
-@@ -0,0 +1,76 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H
-+#define PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_asymmetric_decrypt(
-+				    struct service_client *context,
-+				    psa_key_id_t id,
-+				    psa_algorithm_t alg,
-+				    const uint8_t *input, size_t input_length,
-+				    const uint8_t *salt, size_t salt_length,
-+				    uint8_t *output, size_t output_size,
-+				    size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+
-+	/* Sanitize optional input */
-+	if (!salt && salt_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+		{ .base =3D psa_ptr_const_to_u32(salt), .len =3D salt_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+	if (!salt)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_encrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_encrypt.h
-new file mode 100644
-index 00000000..1daf1689
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_encrypt.h
-@@ -0,0 +1,76 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H
-+#define PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_asymmetric_encrypt(
-+				    struct service_client *context,
-+				    psa_key_id_t id,
-+				    psa_algorithm_t alg,
-+				    const uint8_t *input, size_t input_length,
-+				    const uint8_t *salt, size_t salt_length,
-+				    uint8_t *output, size_t output_size,
-+				    size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+
-+	/* Sanitize optional input */
-+	if (!salt && salt_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+		{ .base =3D psa_ptr_const_to_u32(salt), .len =3D salt_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+	if (!salt)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h
-new file mode 100644
-index 00000000..fbefb28d
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
-@@ -0,0 +1,246 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_CIPHER_H
-+#define PSA_IPC_CRYPTO_CALLER_CIPHER_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_cipher_encrypt_setup(
-+					      struct service_client *context,
-+					      uint32_t *op_handle,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_decrypt_setup(
-+					      struct service_client *context,
-+					      uint32_t *op_handle,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_generate_iv(
-+					    struct service_client *context,
-+					    uint32_t op_handle,
-+					    uint8_t *iv,
-+					    size_t iv_size,
-+					    size_t *iv_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(iv), .len =3D iv_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*iv_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_set_iv(
-+					       struct service_client *context,
-+					       uint32_t op_handle,
-+					       const uint8_t *iv,
-+					       size_t iv_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_SET_IV_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(iv), .len =3D iv_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_update(
-+					       struct service_client *context,
-+					       uint32_t op_handle,
-+					       const uint8_t *input,
-+					       size_t input_length,
-+					       uint8_t *output,
-+					       size_t output_size,
-+					       size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_UPDATE_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_finish(
-+					       struct service_client *context,
-+					       uint32_t op_handle,
-+					       uint8_t *output,
-+					       size_t output_size,
-+					       size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_abort(
-+					      struct service_client *context,
-+					      uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline size_t crypto_caller_cipher_max_update_size(const struct =
service_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the cipher_update operation
-+	 * using the ipc encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	/* Allow for output to be a whole number of blocks */
-+	overhead +=3D PSA_BLOCK_CIPHER_BLOCK_MAX_SIZE;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_CIPHER_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_copy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_ca=
ller_copy_key.h
-new file mode 100644
-index 00000000..9a988171
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy=
_key.h
-@@ -0,0 +1,57 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_COPY_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_COPY_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_copy_key(struct service_client=
 *context,
-+						  psa_key_id_t source_key,
-+						  const psa_key_attributes_t *attributes,
-+						  psa_key_id_t *target_key)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_COPY_KEY_SID,
-+		.key_id =3D source_key,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(attributes), .len =3D sizeof(psa_key=
_attributes_t) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(target_key), .len =3D sizeof(psa_key_id_t)=
 }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_COPY_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_destroy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_destroy_key.h
-new file mode 100644
-index 00000000..d00f4faa
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_dest=
roy_key.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_destroy_key(struct service_cli=
ent *context,
-+						     psa_key_id_t id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_DESTROY_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_export_key.h
-new file mode 100644
-index 00000000..8ac5477f
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_key.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_export_key(struct service_clie=
nt *context,
-+						    psa_key_id_t id,
-+						    uint8_t *data,
-+						    size_t data_size,
-+						    size_t *data_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_EXPORT_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(data), .len =3D data_size }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*data_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_public_key.h b/components/service/crypto/client/caller/psa_ipc/=
crypto_caller_export_public_key.h
-new file mode 100644
-index 00000000..b24c47f1
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_public_key.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_export_public_key(struct servi=
ce_client *context,
-+							   psa_key_id_t id,
-+							   uint8_t *data,
-+							   size_t data_size,
-+							   size_t *data_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(data), .len =3D data_size }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*data_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_key.h b/components/service/crypto/client/caller/psa_ipc/crypt=
o_caller_generate_key.h
-new file mode 100644
-index 00000000..1b66ed40
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_key.h
-@@ -0,0 +1,55 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_generate_key(struct service_cl=
ient *context,
-+						      const psa_key_attributes_t *attributes,
-+						      psa_key_id_t *id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_GENERATE_KEY_SID,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(attributes), .len =3D sizeof(psa_key=
_attributes_t) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(id), .len =3D sizeof(psa_key_id_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_random.h b/components/service/crypto/client/caller/psa_ipc/cr=
ypto_caller_generate_random.h
-new file mode 100644
-index 00000000..7c538237
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_random.h
-@@ -0,0 +1,57 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H
-+#define PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_generate_random(struct service=
_client *context,
-+							 uint8_t *output,
-+							 size_t output_size)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_GENERATE_RANDOM_SID,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size }
-+	};
-+
-+	if (!output_size)
-+		return PSA_SUCCESS;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_get_key_attributes.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_get_key_attributes.h
-new file mode 100644
-index 00000000..22f1d18f
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_=
key_attributes.h
-@@ -0,0 +1,56 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H
-+#define PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_get_key_attributes(
-+					    struct service_client *context,
-+					    psa_key_id_t key,
-+					    psa_key_attributes_t *attributes)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID,
-+		.key_id =3D key,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(attributes), .len =3D sizeof(psa_key_attri=
butes_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_hash.h
-new file mode 100644
-index 00000000..9f37908a
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
-@@ -0,0 +1,220 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_HASH_H
-+#define PSA_IPC_CRYPTO_CALLER_HASH_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_hash_setup(
-+					    struct service_client *context,
-+					    uint32_t *op_handle,
-+					    psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_SETUP_SID,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_update(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     const uint8_t *input,
-+					     size_t input_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_UPDATE_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_finish(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *hash,
-+					     size_t hash_size,
-+					     size_t *hash_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(hash), .len =3D hash_size},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*hash_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_abort(
-+					    struct service_client *context,
-+					    uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_verify(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     const uint8_t *hash,
-+					     size_t hash_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_VERIFY_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_clone(
-+					    struct service_client *context,
-+					    uint32_t source_op_handle,
-+					    uint32_t *target_op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_CLONE_SID,
-+		.op_handle =3D source_op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(target_op_handle),
-+			.len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_suspend(struct service_cl=
ient *context,
-+	uint32_t op_handle,
-+	uint8_t *hash_state,
-+	size_t hash_state_size,
-+	size_t *hash_state_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_resume(struct service_cli=
ent *context,
-+	uint32_t op_handle,
-+	const uint8_t *hash_state,
-+	size_t hash_state_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline size_t crypto_caller_hash_max_update_size(const struct se=
rvice_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the hash_update operation
-+	 * using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_HASH_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_import_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_import_key.h
-new file mode 100644
-index 00000000..d4703366
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_impo=
rt_key.h
-@@ -0,0 +1,57 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_IMPORT_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_IMPORT_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_import_key(struct service_clie=
nt *context,
-+				    const psa_key_attributes_t *attributes,
-+				    const uint8_t *data, size_t data_length,
-+				    psa_key_id_t *id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_IMPORT_KEY_SID,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(attributes), .len =3D sizeof(psa_key=
_attributes_t) },
-+		{ .base =3D psa_ptr_const_to_u32(data), .len =3D data_length }
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(id), .len =3D sizeof(psa_key_id_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_IMPORT_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_key_attributes.h b/components/service/crypto/client/caller/psa_ipc/cry=
pto_caller_key_attributes.h
-new file mode 100644
-index 00000000..2fad2f0a
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
attributes.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H
-+#define PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H
-+
-+#include <psa/crypto.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline void packedc_crypto_caller_translate_key_attributes_to_pr=
oto(
-+	struct ts_crypto_key_attributes *proto_attributes,
-+	const psa_key_attributes_t *psa_attributes)
-+{
-+	proto_attributes->type =3D psa_get_key_type(psa_attributes);
-+	proto_attributes->key_bits =3D psa_get_key_bits(psa_attributes);
-+	proto_attributes->lifetime =3D psa_get_key_lifetime(psa_attributes);
-+	proto_attributes->id =3D psa_get_key_id(psa_attributes);
-+
-+	proto_attributes->policy.usage =3D psa_get_key_usage_flags(psa_attribu=
tes);
-+	proto_attributes->policy.alg =3D psa_get_key_algorithm(psa_attributes)=
;
-+ }
-+
-+static inline void packedc_crypto_caller_translate_key_attributes_from_=
proto(
-+	psa_key_attributes_t *psa_attributes,
-+	const struct ts_crypto_key_attributes *proto_attributes)
-+{
-+	psa_set_key_type(psa_attributes, proto_attributes->type);
-+	psa_set_key_bits(psa_attributes, proto_attributes->key_bits);
-+	psa_set_key_lifetime(psa_attributes, proto_attributes->lifetime);
-+
-+	if (proto_attributes->lifetime =3D=3D PSA_KEY_LIFETIME_PERSISTENT) {
-+
-+		psa_set_key_id(psa_attributes, proto_attributes->id);
-+	}
-+
-+	psa_set_key_usage_flags(psa_attributes, proto_attributes->policy.usage=
);
-+	psa_set_key_algorithm(psa_attributes, proto_attributes->policy.alg);
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_key_derivation.h b/components/service/crypto/client/caller/psa_ipc/cry=
pto_caller_key_derivation.h
-new file mode 100644
-index 00000000..5ce4fb6c
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
derivation.h
-@@ -0,0 +1,298 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H
-+#define PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_key_derivation_setup(
-+					      struct service_client *context,
-+					      uint32_t *op_handle,
-+					      psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_get_capacity(
-+					     struct service_client *context,
-+					     const uint32_t op_handle,
-+					     size_t *capacity)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(capacity), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_set_capacity(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     size_t capacity)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
-+		.capacity =3D capacity,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_input_bytes(
-+					    struct service_client *context,
-+					    uint32_t op_handle,
-+					    psa_key_derivation_step_t step,
-+					    const uint8_t *data,
-+					    size_t data_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
-+		.step =3D step,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(data), .len =3D data_length },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_input_key(
-+					  struct service_client *context,
-+					  uint32_t op_handle,
-+					  psa_key_derivation_step_t step,
-+					  psa_key_id_t key)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
-+		.key_id =3D key,
-+		.step =3D step,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_output_bytes(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *output,
-+					     size_t output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_length },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_output_key(
-+				   struct service_client *context,
-+				   const psa_key_attributes_t *attributes,
-+				   uint32_t op_handle,
-+				   psa_key_id_t *key)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(attributes),
-+			.len =3D sizeof(psa_key_attributes_t) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(key), .len =3D sizeof(psa_key_id_t)},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_abort(
-+					      struct service_client *context,
-+					      uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_key_agreement(
-+				      struct service_client *context,
-+				      uint32_t op_handle,
-+				      psa_key_derivation_step_t step,
-+				      psa_key_id_t private_key,
-+				      const uint8_t *peer_key,
-+				      size_t peer_key_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
-+		.key_id =3D private_key,
-+		.step =3D step,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(peer_key),
-+			.len =3D peer_key_length},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_raw_key_agreement(
-+					   struct service_client *context,
-+					   psa_algorithm_t alg,
-+					   psa_key_id_t private_key,
-+					   const uint8_t *peer_key,
-+					   size_t peer_key_length,
-+					   uint8_t *output,
-+					   size_t output_size,
-+					   size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
-+		.alg =3D alg,
-+		.key_id =3D private_key,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(peer_key),
-+			.len =3D peer_key_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_mac.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_=
mac.h
-new file mode 100644
-index 00000000..3a820192
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.=
h
-@@ -0,0 +1,207 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_MAC_H
-+#define PSA_IPC_CRYPTO_CALLER_MAC_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_mac_sign_setup(
-+						struct service_client *context,
-+						uint32_t *op_handle,
-+						psa_key_id_t key,
-+						psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_SIGN_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_verify_setup(
-+					  struct service_client *context,
-+					  uint32_t *op_handle,
-+					  psa_key_id_t key,
-+					  psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_update(
-+					    struct service_client *context,
-+					    uint32_t op_handle,
-+					    const uint8_t *input,
-+					    size_t input_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_UPDATE_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_sign_finish(
-+						 struct service_client *context,
-+						 uint32_t op_handle,
-+						 uint8_t *mac,
-+						 size_t mac_size,
-+						 size_t *mac_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_SIGN_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(mac), .len =3D mac_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*mac_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_verify_finish(
-+					   struct service_client *context,
-+					   uint32_t op_handle,
-+					   const uint8_t *mac,
-+					   size_t mac_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(mac), .len =3D mac_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_abort(
-+					   struct service_client *context,
-+					   uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline size_t crypto_caller_mac_max_update_size(const struct ser=
vice_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the mac_update operation
-+	 * using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_MAC_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_purge_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_purge_key.h
-new file mode 100644
-index 00000000..a3a796e2
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purg=
e_key.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PACKEDC_CRYPTO_CALLER_PURGE_KEY_H
-+#define PACKEDC_CRYPTO_CALLER_PURGE_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_purge_key(struct service_clien=
t *context,
-+						   psa_key_id_t id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_PURGE_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_PURGE_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-new file mode 100644
-index 00000000..71d88ced
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-@@ -0,0 +1,64 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H
-+#define PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_sign_hash(struct service_clien=
t *context,
-+						   psa_key_id_t id,
-+						   psa_algorithm_t alg,
-+						   const uint8_t *hash,
-+						   size_t hash_length,
-+						   uint8_t *signature,
-+						   size_t signature_size,
-+						   size_t *signature_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_SIGN_HASH_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(signature), .len =3D signature_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*signature_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-new file mode 100644
-index 00000000..e16f6e54
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H
-+#define PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+						     psa_key_id_t id,
-+						     psa_algorithm_t alg,
-+						     const uint8_t *hash,
-+						     size_t hash_length,
-+						     const uint8_t *signature,
-+						     size_t signature_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_VERIFY_HASH_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
-+		{ .base =3D psa_ptr_const_to_u32(signature), .len =3D signature_lengt=
h},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H */
-diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
-index abd420c8..bf95c982 100644
---- a/components/service/crypto/include/psa/crypto_client_struct.h
-+++ b/components/service/crypto/include/psa/crypto_client_struct.h
-@@ -31,12 +31,12 @@ extern "C" {
-  * data structure internally. */
- struct psa_client_key_attributes_s
- {
-+    uint16_t type;
-+    uint16_t bits;
-     uint32_t lifetime;
--    uint32_t id;
--    uint32_t alg;
-+    psa_key_id_t id;
-     uint32_t usage;
--    size_t bits;
--    uint16_t type;
-+    uint32_t alg;
- };
-=20
- #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
-diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 7a0149bb..4d7bf6e9 100644
---- a/components/service/crypto/include/psa/crypto_sizes.h
-+++ b/components/service/crypto/include/psa/crypto_sizes.h
-@@ -81,7 +81,7 @@
- #define PSA_HASH_MAX_SIZE 64
- #define PSA_HMAC_MAX_HASH_BLOCK_SIZE 128
- #else
--#define PSA_HASH_MAX_SIZE 32
-+#define PSA_HASH_MAX_SIZE 64
- #define PSA_HMAC_MAX_HASH_BLOCK_SIZE 64
- #endif
-=20
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index af2225e7..21904283 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -85,7 +85,7 @@ add_components(TARGET "se-proxy"
- 		"components/rpc/dummy"
- 		"components/rpc/common/caller"
- 		"components/service/attestation/key_mngr/stub"
--		"components/service/crypto/backend/stub"
-+		"components/service/crypto/backend/psa_ipc"
- 		"components/service/crypto/client/psa"
- 		"components/service/secure_storage/backend/mock_store"
- )
-diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/depl=
oyments/se-proxy/opteesp/service_proxy_factory.c
-index 1110ac46..7edeef8b 100644
---- a/deployments/se-proxy/opteesp/service_proxy_factory.c
-+++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
-@@ -15,7 +15,7 @@
- #include <trace.h>
-=20
- /* Stub backends */
--#include <service/crypto/backend/stub/stub_crypto_backend.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
- #include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
- #include <service/secure_storage/backend/mock_store/mock_store.h>
-=20
-@@ -47,12 +47,17 @@ struct rpc_interface *crypto_proxy_create(void)
- {
- 	struct rpc_interface *crypto_iface =3D NULL;
- 	struct crypto_provider *crypto_provider;
-+	struct rpc_caller *crypto_caller;
-=20
--	if (stub_crypto_backend_init() =3D=3D PSA_SUCCESS) {
-+	crypto_caller =3D openamp_caller_init(&openamp);
-+	if (!crypto_caller)
-+		return NULL;
-+
-+	if (crypto_ipc_backend_init(&openamp.rpc_caller) !=3D PSA_SUCCESS)
-+		return NULL;
-=20
--		crypto_provider =3D crypto_provider_factory_create();
--		crypto_iface =3D service_provider_get_rpc_interface(&crypto_provider-=
>base_provider);
--	}
-+	crypto_provider =3D crypto_provider_factory_create();
-+	crypto_iface =3D service_provider_get_rpc_interface(&crypto_provider->=
base_provider);
-=20
- 	return crypto_iface;
- }
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index bb778bb9..51e5faa3 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -8,3 +8,5 @@
-=20
- # include MHU driver
- include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
-+
-+add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.pat=
ch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/cor=
stone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
deleted file mode 100644
index 91207bdd..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8fca2a8eed6ebc1cbf9f7972c6a9bb137ebafe1a Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Sun, 12 Dec 2021 17:07:03 +0000
-Subject: [PATCH] Increase SMM gateway UEFI variable macro value
-
-The maximum number of UEFI variables that be supported by SMM
-gateway is currently 40. When more than 40 variables are written,
-or read SMM gateway returns error code. Currently this value is
-increased to 100 to support more UEFI variables.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- deployments/smm-gateway/smm_gateway.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gat=
eway/smm_gateway.c
-index 7828b3af..7e6729ee 100644
---- a/deployments/smm-gateway/smm_gateway.c
-+++ b/deployments/smm-gateway/smm_gateway.c
-@@ -20,6 +20,9 @@
- #define SMM_GATEWAY_NV_STORE_SN		"sn:ffa:751bf801-3dde-4768-a514-0f10ae=
ed1790:0"
- #endif
-=20
-+/* Maximum number of UEFI variables set to 100 */
-+#define SMM_GATEWAY_MAX_UEFI_VARIABLES		(100)
-+
- /* Default maximum number of UEFI variables */
- #ifndef SMM_GATEWAY_MAX_UEFI_VARIABLES
- #define SMM_GATEWAY_MAX_UEFI_VARIABLES		(40)
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0025-Add-stub-capsule-update-service-components.patch b=
/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corston=
e1000/0025-Add-stub-capsule-update-service-components.patch
deleted file mode 100644
index 943568c8..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0025-Add-stub-capsule-update-service-components.patch
+++ /dev/null
@@ -1,436 +0,0 @@
-From eb1beb0f4f3a0d97a1ee941b068fb1f3b7ba7d7b Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH] Add stub capsule update service components
-
-To facilitate development of a capsule update service provider,
-stub components are added to provide a starting point for an
-implementation. The capsule update service provider is integrated
-into the se-proxy/opteesp deployment.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../backend/capsule_update_backend.h          |  24 ++++
- .../provider/capsule_update_provider.c        | 133 ++++++++++++++++++
- .../provider/capsule_update_provider.h        |  51 +++++++
- .../capsule_update/provider/component.cmake   |  13 ++
- deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
- deployments/se-proxy/opteesp/se_proxy_sp.c    |   3 +
- .../se-proxy/opteesp/service_proxy_factory.c  |  16 +++
- .../se-proxy/opteesp/service_proxy_factory.h  |   1 +
- deployments/se-proxy/se_proxy_interfaces.h    |   9 +-
- .../capsule_update/capsule_update_proto.h     |  13 ++
- protocols/service/capsule_update/opcodes.h    |  17 +++
- protocols/service/capsule_update/parameters.h |  15 ++
- 12 files changed, 292 insertions(+), 4 deletions(-)
- create mode 100644 components/service/capsule_update/backend/capsule_up=
date_backend.h
- create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.c
- create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.h
- create mode 100644 components/service/capsule_update/provider/component=
.cmake
- create mode 100644 protocols/service/capsule_update/capsule_update_prot=
o.h
- create mode 100644 protocols/service/capsule_update/opcodes.h
- create mode 100644 protocols/service/capsule_update/parameters.h
-
-diff --git a/components/service/capsule_update/backend/capsule_update_ba=
ckend.h b/components/service/capsule_update/backend/capsule_update_backen=
d.h
-new file mode 100644
-index 00000000..f3144ff1
---- /dev/null
-+++ b/components/service/capsule_update/backend/capsule_update_backend.h
-@@ -0,0 +1,24 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_BACKEND_H
-+#define CAPSULE_UPDATE_BACKEND_H
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * Defines the common capsule update backend interface.  Concrete backe=
nds
-+ * implement this interface for different types of platform.
-+ */
-+
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CAPSULE_UPDATE_BACKEND_H */
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-new file mode 100644
-index 00000000..9bbd7abc
---- /dev/null
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -0,0 +1,133 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <trace.h>
-+
-+#include <protocols/service/capsule_update/capsule_update_proto.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include "capsule_update_provider.h"
-+
-+
-+#define CAPSULE_UPDATE_REQUEST (0x1)
-+#define KERNEL_STARTED_EVENT   (0x2)
-+
-+enum corstone1000_ioctl_id_t {
-+	IOCTL_CORSTONE1000_FWU_FLASH_IMAGES =3D 0,
-+	IOCTL_CORSTONE1000_FWU_HOST_ACK,
-+};
-+
-+/* Service request handlers */
-+static rpc_status_t update_capsule_handler(void *context, struct call_r=
eq *req);
-+static rpc_status_t boot_confirmed_handler(void *context, struct call_r=
eq *req);
-+
-+/* Handler mapping table for service */
-+static const struct service_handler handler_table[] =3D {
-+	{CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE,			update_capsule_handler},
-+	{CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
-+};
-+
-+struct rpc_interface *capsule_update_provider_init(
-+	struct capsule_update_provider *context)
-+{
-+	struct rpc_interface *rpc_interface =3D NULL;
-+
-+	if (context) {
-+
-+		service_provider_init(
-+			&context->base_provider,
-+			context,
-+			handler_table,
-+			sizeof(handler_table)/sizeof(struct service_handler));
-+
-+		rpc_interface =3D service_provider_get_rpc_interface(&context->base_p=
rovider);
-+	}
-+
-+	return rpc_interface;
-+}
-+
-+void capsule_update_provider_deinit(struct capsule_update_provider *con=
text)
-+{
-+	(void)context;
-+}
-+
-+static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *c=
aller)
-+{
-+	uint32_t ioctl_id;
-+	psa_handle_t handle;
-+	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
-+
-+	struct psa_invec in_vec[] =3D {
-+			{ .base =3D &ioctl_id, .len =3D sizeof(ioctl_id) }
-+	};
-+
-+	if(!caller) {
-+		EMSG("event_handler rpc_caller is NULL");
-+		rpc_status =3D TS_RPC_ERROR_RESOURCE_FAILURE;
-+		return rpc_status;
-+	}
-+
-+	MSG("event handler opcode %x", opcode);
-+	switch(opcode) {
-+		case CAPSULE_UPDATE_REQUEST:
-+		/* Openamp call with IOCTL for firmware update*/
-+		ioctl_id =3D IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
-+		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
-+				TFM_SP_PLATFORM_IOCTL_VERSION);
-+		if (handle <=3D 0) {
-+			EMSG("%s Invalid handle", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
-+			return rpc_status;
-+		}
-+		psa_call(caller,handle, PSA_IPC_CALL,
-+			in_vec,IOVEC_LEN(in_vec), NULL, 0);
-+		break;
-+
-+		case KERNEL_STARTED_EVENT:
-+		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
-+		/*openamp call with IOCTL for kernel start*/
-+		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
-+				TFM_SP_PLATFORM_IOCTL_VERSION);
-+		if (handle <=3D 0) {
-+			EMSG("%s Invalid handle", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
-+			return rpc_status;
-+		}
-+		psa_call(caller,handle, PSA_IPC_CALL,
-+			in_vec,IOVEC_LEN(in_vec), NULL, 0);
-+		break;
-+		default:
-+			EMSG("%s unsupported opcode", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
-+			return rpc_status;
-+	}
-+	return rpc_status;
-+
-+}
-+
-+static rpc_status_t update_capsule_handler(void *context, struct call_r=
eq *req)
-+{
-+	struct capsule_update_provider *this_instance =3D (struct capsule_upda=
te_provider*)context;
-+	struct rpc_caller *caller =3D this_instance->client.caller;
-+	uint32_t opcode =3D req->opcode;
-+	rpc_status_t rpc_status =3D TS_RPC_ERROR_NOT_READY;
-+
-+	rpc_status =3D event_handler(opcode, caller);
-+	return rpc_status;
-+}
-+
-+static rpc_status_t boot_confirmed_handler(void *context, struct call_r=
eq *req)
-+{
-+	struct capsule_update_provider *this_instance =3D (struct capsule_upda=
te_provider*)context;
-+	struct rpc_caller *caller =3D this_instance->client.caller;
-+	uint32_t opcode =3D req->opcode;
-+	rpc_status_t rpc_status =3D TS_RPC_ERROR_NOT_READY;
-+
-+	rpc_status =3D event_handler(opcode, caller);
-+
-+	return rpc_status;
-+}
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.h b/components/service/capsule_update/provider/capsule_update_pro=
vider.h
-new file mode 100644
-index 00000000..3de49854
---- /dev/null
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_PROVIDER_H
-+#define CAPSULE_UPDATE_PROVIDER_H
-+
-+#include <rpc/common/endpoint/rpc_interface.h>
-+#include <service/common/provider/service_provider.h>
-+#include <service/common/client/service_client.h>
-+#include <service/capsule_update/backend/capsule_update_backend.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * The capsule_update_provider is a service provider that accepts updat=
e capsule
-+ * requests and delegates them to a suitable backend that applies the u=
pdate.
-+ */
-+struct capsule_update_provider
-+{
-+	struct service_provider base_provider;
-+	struct service_client client;
-+};
-+
-+/**
-+ * \brief Initialize an instance of the capsule update service provider
-+ *
-+ * @param[in] context The instance to initialize
-+ *
-+ * \return An rpc_interface or NULL on failure
-+ */
-+struct rpc_interface *capsule_update_provider_init(
-+	struct capsule_update_provider *context);
-+
-+/**
-+ * \brief Cleans up when the instance is no longer needed
-+ *
-+ * \param[in] context   The instance to de-initialize
-+ */
-+void capsule_update_provider_deinit(
-+	struct capsule_update_provider *context);
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CAPSULE_UPDATE_PROVIDER_H */
-diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
-new file mode 100644
-index 00000000..1d412eb2
---- /dev/null
-+++ b/components/service/capsule_update/provider/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
-+	)
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index 21904283..953bb716 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -80,6 +80,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/reporter/psa_ipc"
- 		"components/service/attestation/client/psa_ipc"
- 		"components/rpc/openamp/caller/sp"
-+		"components/service/capsule_update/provider"
-=20
- 		# Stub service provider backends
- 		"components/rpc/dummy"
-diff --git a/deployments/se-proxy/opteesp/se_proxy_sp.c b/deployments/se=
-proxy/opteesp/se_proxy_sp.c
-index ef90d9ee..11b014b2 100644
---- a/deployments/se-proxy/opteesp/se_proxy_sp.c
-+++ b/deployments/se-proxy/opteesp/se_proxy_sp.c
-@@ -48,6 +48,9 @@ void __noreturn sp_main(struct ffa_init_info *init_inf=
o)
- 	rpc_iface =3D attest_proxy_create();
- 	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_ATTEST, rpc_iface);
-=20
-+	rpc_iface =3D capsule_update_proxy_create();
-+	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE, rpc=
_iface);
-+
- 	/* End of boot phase */
- 	sp_msg_wait(&req_msg);
-=20
-diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/depl=
oyments/se-proxy/opteesp/service_proxy_factory.c
-index 7edeef8b..591cc9ee 100644
---- a/deployments/se-proxy/opteesp/service_proxy_factory.c
-+++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
-@@ -13,6 +13,7 @@
- #include <service/crypto/factory/crypto_provider_factory.h>
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include <trace.h>
-+#include <service/capsule_update/provider/capsule_update_provider.h>
-=20
- /* Stub backends */
- #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-@@ -93,3 +94,18 @@ struct rpc_interface *its_proxy_create(void)
- =20
-         return secure_storage_provider_init(&its_provider, backend);
- }
-+
-+struct rpc_interface *capsule_update_proxy_create(void)
-+{
-+	static struct capsule_update_provider capsule_update_provider;
-+	static struct rpc_caller *capsule_update_caller;
-+
-+	capsule_update_caller =3D openamp_caller_init(&openamp);
-+
-+	if (!capsule_update_caller)
-+	return NULL;
-+
-+	capsule_update_provider.client.caller =3D capsule_update_caller;
-+
-+	return capsule_update_provider_init(&capsule_update_provider);
-+}
-diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.h b/depl=
oyments/se-proxy/opteesp/service_proxy_factory.h
-index 298d407a..02aa7fe2 100644
---- a/deployments/se-proxy/opteesp/service_proxy_factory.h
-+++ b/deployments/se-proxy/opteesp/service_proxy_factory.h
-@@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
- struct rpc_interface *crypto_proxy_create(void);
- struct rpc_interface *ps_proxy_create(void);
- struct rpc_interface *its_proxy_create(void);
-+struct rpc_interface *capsule_update_proxy_create(void);
-=20
- #ifdef __cplusplus
- }
-diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se=
-proxy/se_proxy_interfaces.h
-index 48908f84..3d4a7c20 100644
---- a/deployments/se-proxy/se_proxy_interfaces.h
-+++ b/deployments/se-proxy/se_proxy_interfaces.h
-@@ -8,9 +8,10 @@
- #define SE_PROXY_INTERFACES_H
-=20
- /* Interface IDs from service endpoints available from an se-proxy depl=
oyment */
--#define SE_PROXY_INTERFACE_ID_ITS			(0)
--#define SE_PROXY_INTERFACE_ID_PS			(1)
--#define SE_PROXY_INTERFACE_ID_CRYPTO		(2)
--#define SE_PROXY_INTERFACE_ID_ATTEST		(3)
-+#define SE_PROXY_INTERFACE_ID_ITS			    (0)
-+#define SE_PROXY_INTERFACE_ID_PS			    (1)
-+#define SE_PROXY_INTERFACE_ID_CRYPTO		    (2)
-+#define SE_PROXY_INTERFACE_ID_ATTEST		    (3)
-+#define SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE    (4)
-=20
- #endif /* SE_PROXY_INTERFACES_H */
-diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/p=
rotocols/service/capsule_update/capsule_update_proto.h
-new file mode 100644
-index 00000000..8f326cd3
---- /dev/null
-+++ b/protocols/service/capsule_update/capsule_update_proto.h
-@@ -0,0 +1,13 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_PROTO_H
-+#define CAPSULE_UPDATE_PROTO_H
-+
-+#include <protocols/service/capsule_update/opcodes.h>
-+#include <protocols/service/capsule_update/parameters.h>
-+
-+#endif /* CAPSULE_UPDATE_PROTO_H */
-diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/serv=
ice/capsule_update/opcodes.h
-new file mode 100644
-index 00000000..8185a090
---- /dev/null
-+++ b/protocols/service/capsule_update/opcodes.h
-@@ -0,0 +1,17 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_OPCODES_H
-+#define CAPSULE_UPDATE_OPCODES_H
-+
-+/**
-+ * Opcode definitions for the capsule update service
-+ */
-+
-+#define CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE		1
-+#define CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED		2
-+
-+#endif /* CAPSULE_UPDATE_OPCODES_H */
-diff --git a/protocols/service/capsule_update/parameters.h b/protocols/s=
ervice/capsule_update/parameters.h
-new file mode 100644
-index 00000000..285d9241
---- /dev/null
-+++ b/protocols/service/capsule_update/parameters.h
-@@ -0,0 +1,15 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_PARAMETERS_H
-+#define CAPSULE_UPDATE_PARAMETERS_H
-+
-+/**
-+ * Operation parameter definitions for the capsule update service acces=
s protocol.
-+ */
-+
-+
-+#endif /* CAPSULE_UPDATE_PARAMETERS_H */
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
deleted file mode 100644
index 38ce2439..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From c9188e59fd27d208a975187da285a9b5938bb00d Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Thu, 16 Dec 2021 13:29:58 +0000
-Subject: [PATCH] Add logs to functions in SMM gateway SP
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- .../backend/uefi_variable_store.c             | 29 +++++++++++++++++--
- .../provider/smm_variable_provider.c          |  7 +++--
- 2 files changed, 32 insertions(+), 4 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index ed50eaf9..0c371e94 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -11,6 +11,7 @@
- #include "uefi_variable_store.h"
- #include "variable_index_iterator.h"
- #include "variable_checker.h"
-+#include <trace.h>
-=20
- /* Private functions */
- static void load_variable_index(
-@@ -151,12 +152,15 @@ void uefi_variable_store_set_storage_limits(
- 	size_t total_capacity,
- 	size_t max_variable_size)
- {
-+	EMSG("In func %s\n", __func__);
- 	struct delegate_variable_store *delegate_store =3D select_delegate_sto=
re(
- 		context,
- 		attributes);
-=20
- 	delegate_store->total_capacity =3D total_capacity;
- 	delegate_store->max_variable_size =3D max_variable_size;
-+	EMSG("In func %s total_capacity is %d\n", __func__, total_capacity);
-+	EMSG("In func %s max_variable_size is %d\n", __func__, max_variable_si=
ze);
- }
-=20
- efi_status_t uefi_variable_store_set_variable(
-@@ -265,6 +269,7 @@ efi_status_t uefi_variable_store_get_variable(
- 	size_t max_data_len,
- 	size_t *total_length)
- {
-+	EMSG("In func %s\n", __func__);
- 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
-@@ -299,6 +304,7 @@ efi_status_t uefi_variable_store_get_next_variable_n=
ame(
- 	size_t max_name_len,
- 	size_t *total_length)
- {
-+	EMSG("In func %s\n", __func__);
- 	efi_status_t status =3D check_name_terminator(cur->Name, cur->NameSize=
);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
-@@ -329,6 +335,8 @@ efi_status_t uefi_variable_store_query_variable_info=
(
- 	struct uefi_variable_store *context,
- 	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *var_info)
- {
-+
-+	EMSG("In func %s\n", __func__);
- 	struct delegate_variable_store *delegate_store =3D select_delegate_sto=
re(
- 		context,
- 		var_info->Attributes);
-@@ -337,13 +345,15 @@ efi_status_t uefi_variable_store_query_variable_in=
fo(
- 		context,
- 		var_info->Attributes,
- 		delegate_store->storage_backend);
--
-+	EMSG("In func %s total_used is %d\n", __func__, total_used);
- 	var_info->MaximumVariableSize =3D delegate_store->max_variable_size;
- 	var_info->MaximumVariableStorageSize =3D delegate_store->total_capacit=
y;
- 	var_info->RemainingVariableStorageSize =3D (total_used < delegate_stor=
e->total_capacity) ?
- 		delegate_store->total_capacity - total_used :
- 		0;
--
-+	EMSG("In func %s var_info->MaximumVariableSize is %d\n", __func__, var=
_info->MaximumVariableSize);
-+	EMSG("In func %s var_info->MaximumVariableStorageSize is %d\n", __func=
__, var_info->MaximumVariableStorageSize);
-+	EMSG("In func %s var_info->RemainingVariableStorageSize is %d\n", __fu=
nc__, var_info->RemainingVariableStorageSize);
- 	return EFI_SUCCESS;
- }
-=20
-@@ -358,6 +368,7 @@ efi_status_t uefi_variable_store_set_var_check_prope=
rty(
- 	struct uefi_variable_store *context,
- 	const SMM_VARIABLE_COMMUNICATE_VAR_CHECK_VARIABLE_PROPERTY *property)
- {
-+	EMSG("In func %s\n", __func__);
- 	efi_status_t status =3D check_name_terminator(property->Name, property=
->NameSize);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
-@@ -404,6 +415,7 @@ efi_status_t uefi_variable_store_get_var_check_prope=
rty(
- 	struct uefi_variable_store *context,
- 	SMM_VARIABLE_COMMUNICATE_VAR_CHECK_VARIABLE_PROPERTY *property)
- {
-+	EMSG("In func %s\n", __func__);
- 	efi_status_t status =3D check_name_terminator(property->Name, property=
->NameSize);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
-@@ -430,6 +442,7 @@ efi_status_t uefi_variable_store_get_var_check_prope=
rty(
- static void load_variable_index(
- 	struct uefi_variable_store *context)
- {
-+	EMSG("In func %s\n", __func__);
- 	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
-=20
- 	if (persistent_store) {
-@@ -444,6 +457,7 @@ static void load_variable_index(
- 			context->index_sync_buffer_size,
- 			context->index_sync_buffer,
- 			&data_len);
-+		EMSG("In func %s get status is %d\n", __func__, psa_status);
-=20
- 		if (psa_status =3D=3D PSA_SUCCESS) {
-=20
-@@ -455,6 +469,7 @@ static void load_variable_index(
- static efi_status_t sync_variable_index(
- 	struct uefi_variable_store *context)
- {
-+	EMSG("In func %s\n", __func__);
- 	efi_status_t status =3D EFI_SUCCESS;
-=20
- 	/* Sync the varibale index to storage if anything is dirty */
-@@ -479,6 +494,7 @@ static efi_status_t sync_variable_index(
- 				data_len,
- 				context->index_sync_buffer,
- 				PSA_STORAGE_FLAG_NONE);
-+			EMSG("In func %s set status is %d\n", __func__, psa_status);
-=20
- 			status =3D psa_to_efi_storage_status(psa_status);
- 		}
-@@ -490,6 +506,7 @@ static efi_status_t sync_variable_index(
- static efi_status_t check_capabilities(
- 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
- {
-+	EMSG("In func %s\n", __func__);
- 	efi_status_t status =3D EFI_SUCCESS;
-=20
- 	/* Check if any unsupported variable attributes have been requested */
-@@ -551,6 +568,7 @@ static efi_status_t store_variable_data(
- 	const struct variable_info *info,
- 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
- {
-+	EMSG("In func %s\n", __func__);
- 	psa_status_t psa_status =3D PSA_SUCCESS;
- 	size_t data_len =3D var->DataSize;
- 	const uint8_t *data =3D (const uint8_t*)var +
-@@ -599,6 +617,7 @@ static efi_status_t remove_variable_data(
- 	struct uefi_variable_store *context,
- 	const struct variable_info *info)
- {
-+	EMSG("In func %s\n", __func__);
- 	psa_status_t psa_status =3D PSA_SUCCESS;
-=20
- 	if (info->is_variable_set) {
-@@ -613,6 +632,7 @@ static efi_status_t remove_variable_data(
- 				delegate_store->storage_backend->context,
- 				context->owner_id,
- 				info->metadata.uid);
-+			EMSG("In func %s status is %d\n", __func__, psa_status);
- 		}
- 	}
-=20
-@@ -625,6 +645,7 @@ static efi_status_t load_variable_data(
- 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
- 	size_t max_data_len)
- {
-+	EMSG("In func %s\n", __func__);
- 	psa_status_t psa_status =3D PSA_SUCCESS;
- 	size_t data_len =3D 0;
- 	uint8_t *data =3D (uint8_t*)var +
-@@ -644,6 +665,7 @@ static efi_status_t load_variable_data(
- 			max_data_len,
- 			data,
- 			&data_len);
-+		EMSG("In func %s get status is %d\n", __func__, psa_status);
-=20
- 		var->DataSize =3D data_len;
- 	}
-@@ -771,6 +793,7 @@ static void purge_orphan_index_entries(
- 				context->owner_id,
- 				info->metadata.uid,
- 				&storage_info);
-+			EMSG("In func %s get status is %d\n", __func__, psa_status);
-=20
- 			if (psa_status !=3D PSA_SUCCESS) {
-=20
-@@ -802,6 +825,7 @@ static size_t space_used(
- 	uint32_t attributes,
- 	struct storage_backend *storage_backend)
- {
-+	EMSG("In func %s\n", __func__);
- 	if (!storage_backend) return 0;
-=20
- 	size_t total_used =3D 0;
-@@ -823,6 +847,7 @@ static size_t space_used(
- 				context->owner_id,
- 				info->metadata.uid,
- 				&storage_info);
-+			EMSG("In func %s get status is %d\n", __func__, psa_status);
-=20
- 			if (psa_status =3D=3D PSA_SUCCESS) total_used +=3D storage_info.size=
;
- 		}
-diff --git a/components/service/smm_variable/provider/smm_variable_provi=
der.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index 52e68d09..1f362c17 100644
---- a/components/service/smm_variable/provider/smm_variable_provider.c
-+++ b/components/service/smm_variable/provider/smm_variable_provider.c
-@@ -9,6 +9,7 @@
- #include <protocols/service/smm_variable/smm_variable_proto.h>
- #include <protocols/rpc/common/packed-c/status.h>
- #include "smm_variable_provider.h"
-+#include <trace.h>
-=20
- /* Service request handlers */
- static rpc_status_t get_variable_handler(void *context, struct call_req=
 *req);
-@@ -252,17 +253,18 @@ static rpc_status_t set_variable_handler(void *con=
text, struct call_req* req)
-=20
- static rpc_status_t query_variable_info_handler(void *context, struct c=
all_req* req)
- {
-+	EMSG("In func %s \n", __func__);
- 	efi_status_t efi_status =3D EFI_INVALID_PARAMETER;
- 	struct smm_variable_provider *this_instance =3D (struct smm_variable_p=
rovider*)context;
-=20
- 	const struct call_param_buf *req_buf =3D call_req_get_req_buf(req);
--
-+	EMSG("In func %s sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO) =
is %d\n", __func__, sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO))=
;
- 	if (req_buf->data_len >=3D sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIA=
BLE_INFO)) {
-=20
- 		struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
-=20
- 		if (resp_buf->size >=3D req_buf->data_len) {
--
-+		=09
- 			memmove(resp_buf->data, req_buf->data, req_buf->data_len);
-=20
- 			efi_status =3D uefi_variable_store_query_variable_info(
-@@ -272,6 +274,7 @@ static rpc_status_t query_variable_info_handler(void=
 *context, struct call_req*
- 			if (efi_status =3D=3D EFI_SUCCESS) {
-=20
- 				resp_buf->data_len =3D sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIAB=
LE_INFO);
-+				EMSG("In func %s resp_buf->data_len is %d\n", __func__, resp_buf->d=
ata_len);
- 			}
- 		}
- 		else {
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0027-Configure-storage-size.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/secure-partitions/corstone1000/0027-Configure=
-storage-size.patch
deleted file mode 100644
index ddf95034..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0027-Configure-storage-size.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3e472452bca64ed90071b61416460f1a69382293 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Thu, 16 Dec 2021 21:31:40 +0000
-Subject: [PATCH] Configure storage size
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- .../service/smm_variable/backend/uefi_variable_store.c       | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 0c371e94..b7cfff40 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -87,6 +87,7 @@ static efi_status_t check_name_terminator(
-  * may be overridden using uefi_variable_store_set_storage_limits()
-  */
- #define DEFAULT_MAX_VARIABLE_SIZE			(2048)
-+#define CONFIGURE_STORAGE_SIZE			    (50)
-=20
- efi_status_t uefi_variable_store_init(
- 	struct uefi_variable_store *context,
-@@ -100,13 +101,13 @@ efi_status_t uefi_variable_store_init(
- 	/* Initialise persistent store defaults */
- 	context->persistent_store.is_nv =3D true;
- 	context->persistent_store.max_variable_size =3D DEFAULT_MAX_VARIABLE_S=
IZE;
--	context->persistent_store.total_capacity =3D DEFAULT_MAX_VARIABLE_SIZE=
 * max_variables;
-+	context->persistent_store.total_capacity =3D CONFIGURE_STORAGE_SIZE * =
max_variables;
- 	context->persistent_store.storage_backend =3D persistent_store;
-=20
- 	/* Initialise volatile store defaults */
- 	context->volatile_store.is_nv =3D false;
- 	context->volatile_store.max_variable_size =3D DEFAULT_MAX_VARIABLE_SIZ=
E;
--	context->volatile_store.total_capacity =3D DEFAULT_MAX_VARIABLE_SIZE *=
 max_variables;
-+	context->volatile_store.total_capacity =3D CONFIGURE_STORAGE_SIZE * ma=
x_variables;
- 	context->volatile_store.storage_backend =3D volatile_store;
-=20
- 	context->owner_id =3D owner_id;
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patc=
h b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/cors=
tone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
deleted file mode 100644
index 9bb3f91d..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
+++ /dev/null
@@ -1,1219 +0,0 @@
-From da3bd0721f2403562b6ae6d1939f5f331fd141bb Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Wed, 15 Dec 2021 17:23:25 +0000
-Subject: [PATCH] Revert "Add uefi variable append write support"
-
-This reverts commit e8758d9aff0eddae81a74b0191cd027bcdc92c04.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- .../backend/test/variable_index_tests.cpp     |  90 +++---
- .../backend/test/variable_store_tests.cpp     |  72 +----
- .../backend/uefi_variable_store.c             | 293 ++++++------------
- .../smm_variable/backend/variable_index.c     |  95 ++++--
- .../smm_variable/backend/variable_index.h     |  58 ++--
- .../backend/variable_index_iterator.c         |   4 +-
- .../backend/variable_index_iterator.h         |   2 +-
- .../service/smm_variable_service_tests.cpp    |  48 ---
- protocols/service/smm_variable/parameters.h   |   3 -
- 9 files changed, 239 insertions(+), 426 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/test/variable_index=
_tests.cpp b/components/service/smm_variable/backend/test/variable_index_=
tests.cpp
-index 8edc0e70..c8bacf97 100644
---- a/components/service/smm_variable/backend/test/variable_index_tests.=
cpp
-+++ b/components/service/smm_variable/backend/test/variable_index_tests.=
cpp
-@@ -69,37 +69,34 @@ TEST_GROUP(UefiVariableIndexTests)
-=20
- 	void create_variables()
- 	{
--		struct variable_info *info =3D NULL;
-+		const struct variable_info *info =3D NULL;
-=20
--		info =3D variable_index_add_entry(
-+		info =3D variable_index_add_variable(
- 			&m_variable_index,
- 			&guid_1,
- 			name_1.size() * sizeof(int16_t),
--			name_1.data());
--		CHECK_TRUE(info);
--		variable_index_set_variable(
--			info,
-+			name_1.data(),
- 			EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
--		info =3D variable_index_add_entry(
-+		CHECK_TRUE(info);
-+
-+		info =3D variable_index_add_variable(
- 			&m_variable_index,
- 			&guid_2,
- 			name_2.size() * sizeof(int16_t),
--			name_2.data());
--		CHECK_TRUE(info);
--		variable_index_set_variable(
--			info,
-+			name_2.data(),
- 			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
--		info =3D variable_index_add_entry(
-+		CHECK_TRUE(info);
-+
-+		info =3D variable_index_add_variable(
- 			&m_variable_index,
- 			&guid_1,
- 			name_3.size() * sizeof(int16_t),
--			name_3.data());
--		CHECK_TRUE(info);
--		variable_index_set_variable(
--			info,
-+			name_3.data(),
- 			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_RUNTIME_ACCESS);
-+
-+		CHECK_TRUE(info);
- 	}
-=20
- 	static const size_t MAX_VARIABLES =3D 10;
-@@ -114,7 +111,7 @@ TEST_GROUP(UefiVariableIndexTests)
-=20
- TEST(UefiVariableIndexTests, emptyIndexOperations)
- {
--	struct variable_info *info =3D NULL;
-+	const struct variable_info *info =3D NULL;
-=20
- 	/* Expect not to find a variable */
- 	info =3D variable_index_find(
-@@ -133,34 +130,36 @@ TEST(UefiVariableIndexTests, emptyIndexOperations)
- 	POINTERS_EQUAL(NULL, info);
-=20
- 	/* Remove should silently return */
--	variable_index_clear_variable(
-+	variable_index_remove_variable(
- 		&m_variable_index,
- 		info);
- }
-=20
- TEST(UefiVariableIndexTests, addWithOversizedName)
- {
--	struct variable_info *info =3D NULL;
-+	const struct variable_info *info =3D NULL;
- 	std::vector<int16_t> name;
-=20
- 	name =3D to_variable_name(L"a long variable name that exceeds the leng=
th limit");
-=20
--	info =3D variable_index_add_entry(
-+	info =3D variable_index_add_variable(
- 		&m_variable_index,
- 		&guid_1,
- 		name.size() * sizeof(int16_t),
--		name.data());
-+		name.data(),
-+		EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
- 	/* Expect the add to fail because of an oversized name */
- 	POINTERS_EQUAL(NULL, info);
-=20
- 	name =3D to_variable_name(L"a long variable name that fits!");
-=20
--	info =3D variable_index_add_entry(
-+	info =3D variable_index_add_variable(
- 		&m_variable_index,
- 		&guid_1,
- 		name.size() * sizeof(int16_t),
--		name.data());
-+		name.data(),
-+		EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
- 	/* Expect the add succeed */
- 	CHECK_TRUE(info);
-@@ -168,17 +167,18 @@ TEST(UefiVariableIndexTests, addWithOversizedName)
-=20
- TEST(UefiVariableIndexTests, variableIndexFull)
- {
--	struct variable_info *info =3D NULL;
-+	const struct variable_info *info =3D NULL;
- 	EFI_GUID guid =3D guid_1;
-=20
- 	/* Expect to be able to fill the index */
- 	for (size_t i =3D 0; i < MAX_VARIABLES; ++i) {
-=20
--		info =3D variable_index_add_entry(
-+		info =3D variable_index_add_variable(
- 			&m_variable_index,
- 			&guid,
- 			name_1.size() * sizeof(int16_t),
--			name_1.data());
-+			name_1.data(),
-+			EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
- 		CHECK_TRUE(info);
-=20
-@@ -187,11 +187,12 @@ TEST(UefiVariableIndexTests, variableIndexFull)
- 	}
-=20
- 	/* Variable index should now be full */
--	info =3D variable_index_add_entry(
-+	info =3D variable_index_add_variable(
- 		&m_variable_index,
- 		&guid,
- 		name_1.size() * sizeof(int16_t),
--		name_1.data());
-+		name_1.data(),
-+		EFI_VARIABLE_BOOTSERVICE_ACCESS);
-=20
- 	POINTERS_EQUAL(NULL, info);
- }
-@@ -322,7 +323,7 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
- TEST(UefiVariableIndexTests, removeVariable)
- {
- 	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
--	struct variable_info *info =3D NULL;
-+	const struct variable_info *info =3D NULL;
-=20
- 	create_variables();
-=20
-@@ -333,7 +334,7 @@ TEST(UefiVariableIndexTests, removeVariable)
- 		name_2.size() * sizeof(int16_t),
- 		name_2.data());
-=20
--	variable_index_clear_variable(
-+	variable_index_remove_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -351,7 +352,7 @@ TEST(UefiVariableIndexTests, removeVariable)
- 		name_1.size() * sizeof(int16_t),
- 		name_1.data());
-=20
--	variable_index_clear_variable(
-+	variable_index_remove_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -369,7 +370,7 @@ TEST(UefiVariableIndexTests, removeVariable)
- 		name_3.size() * sizeof(int16_t),
- 		name_3.data());
-=20
--	variable_index_clear_variable(
-+	variable_index_remove_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -394,7 +395,7 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- TEST(UefiVariableIndexTests, checkIterator)
- {
--	struct variable_info *info =3D NULL;
-+	const struct variable_info *info =3D NULL;
-=20
- 	create_variables();
-=20
-@@ -418,7 +419,7 @@ TEST(UefiVariableIndexTests, checkIterator)
- 	UNSIGNED_LONGS_EQUAL(name_2.size() * sizeof(int16_t), info->metadata.n=
ame_size);
- 	MEMCMP_EQUAL(name_2.data(), info->metadata.name, info->metadata.name_s=
ize);
-=20
--	struct variable_info *info_to_remove =3D info;
-+	const struct variable_info *info_to_remove =3D info;
-=20
- 	variable_index_iterator_next(&iter);
- 	CHECK_FALSE(variable_index_iterator_is_done(&iter));
-@@ -434,8 +435,7 @@ TEST(UefiVariableIndexTests, checkIterator)
- 	CHECK_TRUE(variable_index_iterator_is_done(&iter));
-=20
- 	/* Now remove the middle entry */
--	variable_index_clear_variable(&m_variable_index, info_to_remove);
--	variable_index_remove_unused_entry(&m_variable_index, info_to_remove);
-+	variable_index_remove_variable(&m_variable_index, info_to_remove);
-=20
- 	/* Iterate again but this time there should only be two entries */
- 	variable_index_iterator_first(&iter, &m_variable_index);
-@@ -478,7 +478,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExis=
tingVar)
- 	constraints.max_size =3D 100;
-=20
- 	/* Set check constraints on one of the variables */
--	struct variable_info *info =3D variable_index_find(
-+	const struct variable_info *info =3D variable_index_find(
- 		&m_variable_index,
- 		&guid_2,
- 		name_2.size() * sizeof(int16_t),
-@@ -488,7 +488,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExis=
tingVar)
- 	CHECK_TRUE(info->is_variable_set);
- 	CHECK_FALSE(info->is_constraints_set);
-=20
--	variable_index_set_constraints(info, &constraints);
-+	variable_index_update_constraints(info, &constraints);
-=20
- 	CHECK_TRUE(info->is_constraints_set);
- 	CHECK_TRUE(info->is_variable_set);
-@@ -496,7 +496,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExis=
tingVar)
- 	/* Remove the variable but still expect the variable to be indexed
- 	 * because of the set constraints.
- 	 */
--	variable_index_clear_variable(
-+	variable_index_remove_variable(
- 		&m_variable_index,
- 		info);
-=20
-@@ -588,7 +588,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsNonE=
xistingVar)
- 	constraints.max_size =3D 100;
-=20
- 	/* Initially expect no variable_info */
--	struct variable_info *info =3D variable_index_find(
-+	const struct variable_info *info =3D variable_index_find(
- 		&m_variable_index,
- 		&guid_2,
- 		name_2.size() * sizeof(int16_t),
-@@ -597,19 +597,19 @@ TEST(UefiVariableIndexTests, setCheckConstraintsNo=
nExistingVar)
- 	CHECK_FALSE(info);
-=20
- 	/* Adding the check constraints should result in an entry being added =
*/
--	info =3D variable_index_add_entry(
-+	info =3D variable_index_add_constraints(
- 		&m_variable_index,
- 		&guid_2,
- 		name_2.size() * sizeof(int16_t),
--		name_2.data());
--	CHECK_TRUE(info);
-+		name_2.data(),
-+		&constraints);
-=20
--	variable_index_set_constraints(info, &constraints);
-+	CHECK_TRUE(info);
- 	CHECK_FALSE(info->is_variable_set);
- 	CHECK_TRUE(info->is_constraints_set);
-=20
- 	/* Updating the variable should cause the variable to be marked as set=
 */
--	variable_index_set_variable(info, EFI_VARIABLE_RUNTIME_ACCESS);
-+	variable_index_update_variable(info, EFI_VARIABLE_RUNTIME_ACCESS);
-=20
- 	CHECK_TRUE(info->is_variable_set);
- 	CHECK_TRUE(info->is_constraints_set);
-diff --git a/components/service/smm_variable/backend/test/variable_store=
_tests.cpp b/components/service/smm_variable/backend/test/variable_store_=
tests.cpp
-index e90c1067..235642e6 100644
---- a/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-+++ b/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-@@ -305,37 +305,6 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
- 	/* Expect got variable data to be the same as the set value */
- 	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
- 	LONGS_EQUAL(0, input_data.compare(output_data));
--
--	/* Extend the variable using an append write */
--	std::string input_data2 =3D " jumps over the lazy dog";
--
--	status =3D set_variable(var_name, input_data2, EFI_VARIABLE_APPEND_WRI=
TE);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
--
--	status =3D get_variable(var_name, output_data);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
--
--	std::string expected_output =3D input_data + input_data2;
--
--	/* Expect the append write operation to have extended the variable */
--	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
--	LONGS_EQUAL(0, expected_output.compare(output_data));
--
--	/* Expect query_variable_info to return consistent values */
--	size_t max_variable_storage_size =3D 0;
--	size_t remaining_variable_storage_size =3D 0;
--	size_t max_variable_size =3D 0;
--
--	status =3D query_variable_info(
--		0,
--		&max_variable_storage_size,
--		&remaining_variable_storage_size,
--		&max_variable_size);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
--
--	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY, max_variable_storage_size);
--	UNSIGNED_LONGLONGS_EQUAL(MAX_VARIABLE_SIZE, max_variable_size);
--	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY - expected_output.size(), rema=
ining_variable_storage_size);
- }
-=20
- TEST(UefiVariableStoreTests, persistentSetGet)
-@@ -345,8 +314,7 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	std::string input_data =3D "quick brown fox";
- 	std::string output_data;
-=20
--	status =3D set_variable(var_name, input_data,
--		EFI_VARIABLE_NON_VOLATILE);
-+	status =3D set_variable(var_name, input_data, EFI_VARIABLE_NON_VOLATIL=
E);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	status =3D get_variable(var_name, output_data);
-@@ -356,22 +324,6 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
- 	LONGS_EQUAL(0, input_data.compare(output_data));
-=20
--	/* Extend the variable using an append write */
--	std::string input_data2 =3D " jumps over the lazy dog";
--
--	status =3D set_variable(var_name, input_data2,
--		EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_APPEND_WRITE);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
--
--	status =3D get_variable(var_name, output_data);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
--
--	std::string expected_output =3D input_data + input_data2;
--
--	/* Expect the append write operation to have extended the variable */
--	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
--	LONGS_EQUAL(0, expected_output.compare(output_data));
--
- 	/* Expect the variable to survive a power cycle */
- 	power_cycle();
-=20
-@@ -380,24 +332,8 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Still expect got variable data to be the same as the set value */
--	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
--	LONGS_EQUAL(0, expected_output.compare(output_data));
--
--	/* Expect query_variable_info to return consistent values */
--	size_t max_variable_storage_size =3D 0;
--	size_t remaining_variable_storage_size =3D 0;
--	size_t max_variable_size =3D 0;
--
--	status =3D query_variable_info(
--		EFI_VARIABLE_NON_VOLATILE,
--		&max_variable_storage_size,
--		&remaining_variable_storage_size,
--		&max_variable_size);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
--
--	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY, max_variable_storage_size);
--	UNSIGNED_LONGLONGS_EQUAL(MAX_VARIABLE_SIZE, max_variable_size);
--	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY - expected_output.size(), rema=
ining_variable_storage_size);
-+	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
-+	LONGS_EQUAL(0, input_data.compare(output_data));
- }
-=20
- TEST(UefiVariableStoreTests, removeVolatile)
-@@ -436,7 +372,7 @@ TEST(UefiVariableStoreTests, removePersistent)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Remove by setting with zero data length */
--	status =3D set_variable(var_name, std::string(), EFI_VARIABLE_NON_VOLA=
TILE);
-+	status =3D set_variable(var_name, std::string(), 0);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Expect variable to no loger exist */
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index b7cfff40..6a90f46a 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -47,20 +47,6 @@ static efi_status_t load_variable_data(
- 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
- 	size_t max_data_len);
-=20
--static psa_status_t store_overwrite(
--	struct delegate_variable_store *delegate_store,
--	uint32_t client_id,
--	uint64_t uid,
--	size_t data_length,
--	const void *data);
--
--static psa_status_t store_append_write(
--	struct delegate_variable_store *delegate_store,
--	uint32_t client_id,
--	uint64_t uid,
--	size_t data_length,
--	const void *data);
--
- static void purge_orphan_index_entries(
- 	struct uefi_variable_store *context);
-=20
-@@ -168,45 +154,40 @@ efi_status_t uefi_variable_store_set_variable(
- 	struct uefi_variable_store *context,
- 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
- {
--	bool should_sync_index =3D false;
--
--	/* Validate incoming request */
- 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
- 	status =3D check_capabilities(var);
-+	bool should_sync_index =3D false;
-+
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
--	/* Find an existing entry in the variable index or add a new one */
--	struct variable_info *info =3D variable_index_find(
-+	/* Find in index */
-+	const struct variable_info *info =3D variable_index_find(
- 		&context->variable_index,
- 		&var->Guid,
- 		var->NameSize,
- 		var->Name);
-=20
--	if (!info) {
-+	if (info) {
-=20
--		info =3D variable_index_add_entry(
--			&context->variable_index,
--			&var->Guid,
--			var->NameSize,
--			var->Name);
-+		/* Variable info already exists */
-+		status =3D check_access_permitted_on_set(context, info, var);
-=20
--		if (!info) return EFI_OUT_OF_RESOURCES;
--	}
-+		if (status =3D=3D EFI_SUCCESS) {
-=20
--	/* Control access */
--	status =3D check_access_permitted_on_set(context, info, var);
-+			should_sync_index =3D
-+				(var->Attributes & EFI_VARIABLE_NON_VOLATILE) ||
-+				(info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE=
_NON_VOLATILE));
-=20
--	if (status =3D=3D EFI_SUCCESS) {
-+			if (var->DataSize) {
-=20
--		/* Access permitted */
--		if (info->is_variable_set) {
--
--			/* It's a request to update to an existing variable */
--			if (!(var->Attributes &
--				(EFI_VARIABLE_APPEND_WRITE | EFI_VARIABLE_AUTHENTICATED_WRITE_ACCES=
S_MASK)) &&
--				!var->DataSize) {
-+				/* It's a set rather than a remove operation */
-+				variable_index_update_variable(
-+					info,
-+					var->Attributes);
-+			}
-+			else {
-=20
- 				/* It's a remove operation - for a remove, the variable
- 				 * data must be removed from the storage backend before
-@@ -215,30 +196,31 @@ efi_status_t uefi_variable_store_set_variable(
- 				 * the storage backend without a corresponding index entry.
- 				 */
- 				remove_variable_data(context, info);
--				variable_index_clear_variable(&context->variable_index, info);
-+				variable_index_remove_variable(&context->variable_index, info);
-=20
--				should_sync_index =3D (var->Attributes & EFI_VARIABLE_NON_VOLATILE)=
;
--			}
--			else {
--
--				/* It's a set operation where variable data is potentially
--				 * being overwritten or extended.
--				 */
--				if ((var->Attributes & ~EFI_VARIABLE_APPEND_WRITE) !=3D info->metad=
ata.attributes) {
--
--					/* Modifying attributes is forbidden */
--					return EFI_INVALID_PARAMETER;
--				}
-+				/* Variable info no longer valid */
-+				info =3D NULL;
- 			}
- 		}
- 		else {
-=20
--			/*  It's a request to create a new variable */
--			variable_index_set_variable(info, var->Attributes);
--
--			should_sync_index =3D (var->Attributes & EFI_VARIABLE_NON_VOLATILE);
-+			/* Access forbidden */
-+			info =3D NULL;
- 		}
- 	}
-+	else if (var->DataSize) {
-+
-+		/* It's a new variable */
-+		info =3D variable_index_add_variable(
-+			&context->variable_index,
-+			&var->Guid,
-+			var->NameSize,
-+			var->Name,
-+			var->Attributes);
-+
-+		if (!info) status =3D EFI_OUT_OF_RESOURCES;
-+		should_sync_index =3D info && (info->metadata.attributes & EFI_VARIAB=
LE_NON_VOLATILE);
-+	}
-=20
- 	/* The order of these operations is important. For an update
- 	 * or create operation, The variable index is always synchronized
-@@ -254,13 +236,11 @@ efi_status_t uefi_variable_store_set_variable(
- 	}
-=20
- 	/* Store any variable data to the storage backend */
--	if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
-+	if (info && (status =3D=3D EFI_SUCCESS)) {
-=20
- 		status =3D store_variable_data(context, info, var);
- 	}
-=20
--	variable_index_remove_unused_entry(&context->variable_index, info);
--
- 	return status;
- }
-=20
-@@ -373,41 +353,53 @@ efi_status_t uefi_variable_store_set_var_check_pro=
perty(
- 	efi_status_t status =3D check_name_terminator(property->Name, property=
->NameSize);
- 	if (status !=3D EFI_SUCCESS) return status;
-=20
--	/* Find in index or create a new entry */
--	struct variable_info *info =3D variable_index_find(
-+	/* Find in index */
-+	const struct variable_info *info =3D variable_index_find(
- 		&context->variable_index,
- 		&property->Guid,
- 		property->NameSize,
- 		property->Name);
-=20
--	if (!info) {
-+	if (info) {
-=20
--		info =3D variable_index_add_entry(
--			&context->variable_index,
--			&property->Guid,
--			property->NameSize,
--			property->Name);
-+		/* Applying check constraints to an existing variable that may have
-+		 * constraints already set.  These could constrain the setting of
-+		 * the constraints.
-+		 */
-+		struct variable_constraints constraints =3D info->check_constraints;
-+
-+		status =3D variable_checker_set_constraints(
-+			&constraints,
-+			info->is_constraints_set,
-+			&property->VariableProperty);
-+
-+		if (status =3D=3D EFI_SUCCESS) {
-=20
--		if (!info) return EFI_OUT_OF_RESOURCES;
-+			variable_index_update_constraints(info, &constraints);
-+		}
- 	}
-+	else {
-=20
--	/* Applying check constraints to an existing variable that may have
--	 * constraints already set.  These could constrain the setting of
--	 * the constraints.
--	 */
--	struct variable_constraints constraints =3D info->check_constraints;
-+		/* Applying check constraints for a new variable */
-+		struct variable_constraints constraints;
-=20
--	status =3D variable_checker_set_constraints(
--		&constraints,
--		info->is_constraints_set,
--		&property->VariableProperty);
-+		status =3D variable_checker_set_constraints(
-+			&constraints,
-+			false,
-+			&property->VariableProperty);
-=20
--	if (status =3D=3D EFI_SUCCESS) {
-+		if (status =3D=3D EFI_SUCCESS) {
-=20
--		variable_index_set_constraints(info, &constraints);
--	}
-+			info =3D variable_index_add_constraints(
-+				&context->variable_index,
-+				&property->Guid,
-+				property->NameSize,
-+				property->Name,
-+				&constraints);
-=20
--	variable_index_remove_unused_entry(&context->variable_index, info);
-+			if (!info) status =3D EFI_OUT_OF_RESOURCES;
-+		}
-+	}
-=20
- 	return status;
- }
-@@ -514,8 +506,7 @@ static efi_status_t check_capabilities(
- 	if (var->Attributes & ~(
- 		EFI_VARIABLE_NON_VOLATILE |
- 		EFI_VARIABLE_BOOTSERVICE_ACCESS |
--		EFI_VARIABLE_RUNTIME_ACCESS |
--		EFI_VARIABLE_APPEND_WRITE)) {
-+		EFI_VARIABLE_RUNTIME_ACCESS)) {
-=20
- 		/* An unsupported attribute has been requested */
- 		status =3D EFI_UNSUPPORTED;
-@@ -561,6 +552,17 @@ static efi_status_t check_access_permitted_on_set(
- 			var->DataSize);
- 	}
-=20
-+	if ((status =3D=3D EFI_SUCCESS) && var->DataSize) {
-+
-+		/* Restrict which attributes can be modified for an existing variable=
 */
-+		if ((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=3D
-+			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
-+
-+			/* Don't permit change of storage class */
-+			status =3D EFI_INVALID_PARAMETER;
-+		}
-+	}
-+
- 	return status;
- }
-=20
-@@ -581,33 +583,20 @@ static efi_status_t store_variable_data(
-=20
- 	if (delegate_store->storage_backend) {
-=20
--		if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
--
--			/* Create or overwrite variable data */
--			psa_status =3D store_overwrite(
--				delegate_store,
--				context->owner_id,
--				info->metadata.uid,
--				data_len,
--				data);
--		}
--		else {
--
--			/* Append new data to existing variable data */
--			psa_status =3D store_append_write(
--				delegate_store,
--				context->owner_id,
--				info->metadata.uid,
--				data_len,
--				data);
--		}
-+		psa_status =3D delegate_store->storage_backend->interface->set(
-+			delegate_store->storage_backend->context,
-+			context->owner_id,
-+			info->metadata.uid,
-+			data_len,
-+			data,
-+			PSA_STORAGE_FLAG_NONE);
- 	}
-=20
- 	if ((psa_status !=3D PSA_SUCCESS) && delegate_store->is_nv) {
-=20
- 		/* A storage failure has occurred so attempt to fix any
--		 * mismatch between the variable index and stored NV variables.
--		 */
-+		* mismatch between the variable index and stored NV variables.
-+		*/
- 		purge_orphan_index_entries(context);
- 	}
-=20
-@@ -674,100 +663,6 @@ static efi_status_t load_variable_data(
- 	return psa_to_efi_storage_status(psa_status);
- }
-=20
--static psa_status_t store_overwrite(
--	struct delegate_variable_store *delegate_store,
--	uint32_t client_id,
--	uint64_t uid,
--	size_t data_length,
--	const void *data)
--{
--	/* Police maximum variable size limit */
--	if (data_length > delegate_store->max_variable_size) return PSA_ERROR_=
INVALID_ARGUMENT;
--
--	psa_status_t psa_status =3D delegate_store->storage_backend->interface=
->set(
--		delegate_store->storage_backend->context,
--		client_id,
--		uid,
--		data_length,
--		data,
--		PSA_STORAGE_FLAG_NONE);
--
--	return psa_status;
--}
--
--static psa_status_t store_append_write(
--	struct delegate_variable_store *delegate_store,
--	uint32_t client_id,
--	uint64_t uid,
--	size_t data_length,
--	const void *data)
--{
--	struct psa_storage_info_t storage_info;
--
--	if (data_length =3D=3D 0) return PSA_SUCCESS;
--
--	psa_status_t psa_status =3D delegate_store->storage_backend->interface=
->get_info(
--		delegate_store->storage_backend->context,
--		client_id,
--		uid,
--		&storage_info);
--
--	if (psa_status !=3D PSA_SUCCESS) return psa_status;
--
--	/* Determine size of appended variable */
--	size_t new_size =3D storage_info.size + data_length;
--
--	/* Defend against integer overflow */
--	if (new_size < storage_info.size) return PSA_ERROR_INVALID_ARGUMENT;
--
--		/* Police maximum variable size limit */
--	if (new_size > delegate_store->max_variable_size) return PSA_ERROR_INV=
ALID_ARGUMENT;
--
--	/* Storage backend doesn't support an append operation so we need
--	 * need to read the current variable data, extend it and write it back=
.
--	 */
--	uint8_t *rw_buf =3D malloc(new_size);
--	if (!rw_buf) return PSA_ERROR_INSUFFICIENT_MEMORY;
--
--	size_t old_size =3D 0;
--	psa_status =3D delegate_store->storage_backend->interface->get(
--		delegate_store->storage_backend->context,
--		client_id,
--		uid,
--		0,
--		new_size,
--		rw_buf,
--		&old_size);
--
--	if (psa_status =3D=3D PSA_SUCCESS) {
--
--		if ((old_size + data_length) <=3D new_size) {
--
--			/* Extend the variable data */
--			memcpy(&rw_buf[old_size], data, data_length);
--
--			psa_status =3D delegate_store->storage_backend->interface->set(
--				delegate_store->storage_backend->context,
--				client_id,
--				uid,
--				old_size + data_length,
--				rw_buf,
--				storage_info.flags);
--		}
--		else {
--
--			/* There's a mismatch between the length obtained from
--			 * get_info() and the subsequent length returned by get().
--			 */
--			psa_status =3D PSA_ERROR_STORAGE_FAILURE;
--		}
--	}
--
--	free(rw_buf);
--
--	return psa_status;
--}
--
- static void purge_orphan_index_entries(
- 	struct uefi_variable_store *context)
- {
-@@ -782,7 +677,7 @@ static void purge_orphan_index_entries(
- 	 */
- 	while (!variable_index_iterator_is_done(&iter)) {
-=20
--		struct variable_info *info =3D variable_index_iterator_current(&iter)=
;
-+		const struct variable_info *info =3D variable_index_iterator_current(=
&iter);
-=20
- 		if (info->is_variable_set && (info->metadata.attributes & EFI_VARIABL=
E_NON_VOLATILE)) {
-=20
-@@ -799,7 +694,7 @@ static void purge_orphan_index_entries(
- 			if (psa_status !=3D PSA_SUCCESS) {
-=20
- 				/* Detected a mismatch between the index and storage */
--				variable_index_clear_variable(&context->variable_index, info);
-+				variable_index_remove_variable(&context->variable_index, info);
- 				any_orphans =3D true;
- 			}
- 		}
-diff --git a/components/service/smm_variable/backend/variable_index.c b/=
components/service/smm_variable/backend/variable_index.c
-index a8a55753..99d7c97a 100644
---- a/components/service/smm_variable/backend/variable_index.c
-+++ b/components/service/smm_variable/backend/variable_index.c
-@@ -132,13 +132,13 @@ size_t variable_index_max_dump_size(
- 	return sizeof(struct variable_metadata) * context->max_variables;
- }
-=20
--struct variable_info *variable_index_find(
--	struct variable_index *context,
-+const struct variable_info *variable_index_find(
-+	const struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name)
- {
--	struct variable_info *result =3D NULL;
-+	const struct variable_info *result =3D NULL;
- 	int pos =3D find_variable(context, guid, name_size, name);
-=20
- 	if (pos >=3D 0) {
-@@ -149,13 +149,13 @@ struct variable_info *variable_index_find(
- 	return result;
- }
-=20
--struct variable_info *variable_index_find_next(
-+const struct variable_info *variable_index_find_next(
- 	const struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name)
- {
--	struct variable_info *result =3D NULL;
-+	const struct variable_info *result =3D NULL;
-=20
- 	if (name_size >=3D sizeof(int16_t)) {
-=20
-@@ -263,11 +263,12 @@ static struct variable_entry *add_entry(
- 	return entry;
- }
-=20
--struct variable_info *variable_index_add_entry(
-+const struct variable_info *variable_index_add_variable(
- 	struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
--	const int16_t *name)
-+	const int16_t *name,
-+	uint32_t attributes)
- {
- 	struct variable_info *info =3D NULL;
- 	struct variable_entry *entry =3D add_entry(context, guid, name_size, n=
ame);
-@@ -275,41 +276,40 @@ struct variable_info *variable_index_add_entry(
- 	if (entry) {
-=20
- 		info =3D &entry->info;
-+
-+		info->metadata.attributes =3D attributes;
-+		info->is_variable_set =3D true;
-+
-+		mark_dirty(entry);
- 	}
-=20
- 	return info;
- }
-=20
--void variable_index_remove_unused_entry(
-+const struct variable_info *variable_index_add_constraints(
- 	struct variable_index *context,
--	struct variable_info *info)
-+	const EFI_GUID *guid,
-+	size_t name_size,
-+	const int16_t *name,
-+	const struct variable_constraints *constraints)
- {
--	if (info &&
--		!info->is_constraints_set &&
--		!info->is_variable_set) {
--
--		struct variable_entry *entry =3D containing_entry(info);
--		entry->in_use =3D false;
-+	struct variable_info *info =3D NULL;
-+	struct variable_entry *entry =3D add_entry(context, guid, name_size, n=
ame);
-=20
--		memset(info, 0, sizeof(struct variable_info));
--	}
--}
-+	if (entry) {
-=20
--void variable_index_set_variable(
--	struct variable_info *info,
--	uint32_t attributes)
--{
--	struct variable_entry *entry =3D containing_entry(info);
-+		info =3D &entry->info;
-=20
--	info->metadata.attributes =3D attributes;
--	info->is_variable_set =3D true;
-+		info->check_constraints =3D *constraints;
-+		info->is_constraints_set =3D true;
-+	}
-=20
--	mark_dirty(entry);
-+	return info;
- }
-=20
--void variable_index_clear_variable(
-+void variable_index_remove_variable(
- 	struct variable_index *context,
--	struct variable_info *info)
-+	const struct variable_info *info)
- {
- 	if (info) {
-=20
-@@ -318,17 +318,48 @@ void variable_index_clear_variable(
-=20
- 		/* Mark variable as no longer set */
- 		entry->info.is_variable_set =3D false;
-+
-+		/* Entry may still be needed if check constraints were set */
-+		entry->in_use =3D info->is_constraints_set;
-+
-+		if (!entry->in_use) {
-+
-+			/* Entry not needed so wipe */
-+			memset(&entry->info, 0, sizeof(struct variable_info));
-+		}
- 	}
- }
-=20
--void variable_index_set_constraints(
--	struct variable_info *info,
-+void variable_index_update_variable(
-+	const struct variable_info *info,
-+	uint32_t attributes)
-+{
-+	if (info) {
-+
-+		struct variable_info *modified_info =3D (struct variable_info*)info;
-+		struct variable_entry *entry =3D containing_entry(modified_info);
-+
-+		if (!modified_info->is_variable_set ||
-+			(attributes !=3D modified_info->metadata.attributes)) {
-+
-+			/* The update changes the variable_info state */
-+			modified_info->is_variable_set =3D true;
-+			modified_info->metadata.attributes =3D attributes;
-+			mark_dirty(entry);
-+		}
-+	}
-+}
-+
-+void variable_index_update_constraints(
-+	const struct variable_info *info,
- 	const struct variable_constraints *constraints)
- {
- 	if (info) {
-=20
--		info->check_constraints =3D *constraints;
--		info->is_constraints_set =3D true;
-+		struct variable_info *modified_info =3D (struct variable_info*)info;
-+
-+		modified_info->check_constraints =3D *constraints;
-+		modified_info->is_constraints_set =3D true;
- 	}
- }
-=20
-diff --git a/components/service/smm_variable/backend/variable_index.h b/=
components/service/smm_variable/backend/variable_index.h
-index 63f42ab6..e109d0d1 100644
---- a/components/service/smm_variable/backend/variable_index.h
-+++ b/components/service/smm_variable/backend/variable_index.h
-@@ -119,8 +119,8 @@ size_t variable_index_max_dump_size(
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--struct variable_info *variable_index_find(
--	struct variable_index *context,
-+const struct variable_info *variable_index_find(
-+	const struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name);
-@@ -135,76 +135,78 @@ struct variable_info *variable_index_find(
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--struct variable_info *variable_index_find_next(
-+const struct variable_info *variable_index_find_next(
- 	const struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
- 	const int16_t *name);
-=20
- /**
-- * @brief      Add a new entry to the index
-- *
-- * An entry is needed either when a new variable is created or
-- * when variable constraints are set for a variable that doesn't
-- * yet exist.
-+ * @brief      Add a new variable to the index
-  *
-  * @param[in]  context variable_index
-  * @param[in]  guid The variable's guid
-  * @param[in]  name_size The name parameter's size
-  * @param[in]  name The variable's name
-+ * @param[in]  attributes The variable's attributes
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--struct variable_info *variable_index_add_entry(
-+const struct variable_info *variable_index_add_variable(
- 	struct variable_index *context,
- 	const EFI_GUID *guid,
- 	size_t name_size,
--	const int16_t *name);
-+	const int16_t *name,
-+	uint32_t attributes);
-=20
- /**
-- * @brief      Remove an unused entry from the index
-+ * @brief      Remove a variable from the index
-  *
-- * Removes an entry if it is not in use.
-+ * Removes a variable from the index if it exists.
-  *
-  * @param[in]  context variable_index
-  * @param[in]  info The variable info corresponding to the entry to rem=
ove
-  */
--void variable_index_remove_unused_entry(
-+void variable_index_remove_variable(
- 	struct variable_index *context,
--	struct variable_info *info);
-+	const struct variable_info *info);
-=20
- /**
-- * @brief      Set a variable to the index
-- *
-- * An entry for the variable must already exist.
-+ * @brief      Update a variable that's already in the index
-  *
-  * @param[in]  info variable info
-  * @param[in]  attributes The variable's attributes
-  */
--void variable_index_set_variable(
--	struct variable_info *info,
-+void variable_index_update_variable(
-+	const struct variable_info *info,
- 	uint32_t attributes);
-=20
- /**
-- * @brief      Clear a variable from the index
-- *
-- * Clears a variable from the index
-+ * @brief      Add a new check constraints object to the index
-  *
-  * @param[in]  context variable_index
-- * @param[in]  info The variable info corresponding to the variable to =
clear
-+ * @param[in]  guid The variable's guid
-+ * @param[in]  name_size The name parameter's size
-+ * @param[in]  name The variable's name
-+ * @param[in]  constraints The check constraints
-+ *
-+ * @return     Pointer to variable_info or NULL
-  */
--void variable_index_clear_variable(
-+const struct variable_info *variable_index_add_constraints(
- 	struct variable_index *context,
--	struct variable_info *info);
-+	const EFI_GUID *guid,
-+	size_t name_size,
-+	const int16_t *name,
-+	const struct variable_constraints *constraints);
-=20
- /**
-- * @brief      Set a check constraints object associated with a variavl=
e
-+ * @brief      Update variable constraints that are already in the inde=
x
-  *
-  * @param[in]  info variable info
-  * @param[in]  constraints The check constraints
-  */
--void variable_index_set_constraints(
--	struct variable_info *info,
-+void variable_index_update_constraints(
-+	const struct variable_info *info,
- 	const struct variable_constraints *constraints);
-=20
- /**
-diff --git a/components/service/smm_variable/backend/variable_index_iter=
ator.c b/components/service/smm_variable/backend/variable_index_iterator.=
c
-index 8f8fc741..7cc6dc7a 100644
---- a/components/service/smm_variable/backend/variable_index_iterator.c
-+++ b/components/service/smm_variable/backend/variable_index_iterator.c
-@@ -31,10 +31,10 @@ bool variable_index_iterator_is_done(
- 	return iter->current_pos >=3D iter->variable_index->max_variables;
- }
-=20
--struct variable_info *variable_index_iterator_current(
-+const struct variable_info *variable_index_iterator_current(
- 	const struct variable_index_iterator *iter)
- {
--	struct variable_info *current =3D NULL;
-+	const struct variable_info *current =3D NULL;
-=20
- 	if (!variable_index_iterator_is_done(iter)) {
-=20
-diff --git a/components/service/smm_variable/backend/variable_index_iter=
ator.h b/components/service/smm_variable/backend/variable_index_iterator.=
h
-index 7ff77c50..f64a2c49 100644
---- a/components/service/smm_variable/backend/variable_index_iterator.h
-+++ b/components/service/smm_variable/backend/variable_index_iterator.h
-@@ -54,7 +54,7 @@ bool variable_index_iterator_is_done(
-  *
-  * @return     Pointer to variable_info or NULL
-  */
--struct variable_info *variable_index_iterator_current(
-+const struct variable_info *variable_index_iterator_current(
- 	const struct variable_index_iterator *iter);
-=20
- /**
-diff --git a/components/service/smm_variable/test/service/smm_variable_s=
ervice_tests.cpp b/components/service/smm_variable/test/service/smm_varia=
ble_service_tests.cpp
-index 15556e9d..38c08ebe 100644
---- a/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-+++ b/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-@@ -249,30 +249,6 @@ TEST(SmmVariableServiceTests, setAndGet)
- 	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
- 	LONGS_EQUAL(0, get_data.compare(set_data));
-=20
--	/* Extend the variable using an append write */
--	std::string append_data =3D " values added with append write";
--
--	efi_status =3D m_client->set_variable(
--		m_common_guid,
--		var_name,
--		append_data,
--		EFI_VARIABLE_APPEND_WRITE);
--
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
--
--	efi_status =3D m_client->get_variable(
--		m_common_guid,
--		var_name,
--		get_data);
--
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
--
--	std::string appended_data =3D set_data + append_data;
--
--	/* Expect the append write operation to have extended the variable */
--	UNSIGNED_LONGLONGS_EQUAL(appended_data.size(), get_data.size());
--	LONGS_EQUAL(0, appended_data.compare(get_data));
--
- 	/* Expect remove to be permitted */
- 	efi_status =3D m_client->remove_variable(m_common_guid, var_name);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-@@ -303,30 +279,6 @@ TEST(SmmVariableServiceTests, setAndGetNv)
- 	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
- 	LONGS_EQUAL(0, get_data.compare(set_data));
-=20
--	/* Extend the variable using an append write */
--	std::string append_data =3D " values added with append write";
--
--	efi_status =3D m_client->set_variable(
--		m_common_guid,
--		var_name,
--		append_data,
--		EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_APPEND_WRITE);
--
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
--
--	efi_status =3D m_client->get_variable(
--		m_common_guid,
--		var_name,
--		get_data);
--
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
--
--	std::string appended_data =3D set_data + append_data;
--
--	/* Expect the append write operation to have extended the variable */
--	UNSIGNED_LONGLONGS_EQUAL(appended_data.size(), get_data.size());
--	LONGS_EQUAL(0, appended_data.compare(get_data));
--
- 	/* Expect remove to be permitted */
- 	efi_status =3D m_client->remove_variable(m_common_guid, var_name);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-diff --git a/protocols/service/smm_variable/parameters.h b/protocols/ser=
vice/smm_variable/parameters.h
-index 233f301b..1f795a9b 100644
---- a/protocols/service/smm_variable/parameters.h
-+++ b/protocols/service/smm_variable/parameters.h
-@@ -47,9 +47,6 @@ typedef struct {
- 	 EFI_VARIABLE_HARDWARE_ERROR_RECORD | \
- 	 EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
- 	 EFI_VARIABLE_APPEND_WRITE)
--#define	EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS_MASK \
--	(EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
--	 EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS)
-=20
- /**
-  * Parameter structure for SetVariable and GetVariable.
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch b/meta-a=
rm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0=
029-Change-UID-of-variable-index-in-SMM.patch
deleted file mode 100644
index caa1d9a9..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 12e9b977e4c7515ce90fecc62630be394fd7da62 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Mon, 20 Dec 2021 19:54:39 +0000
-Subject: [PATCH] Change UID of variable index in SMM
-
-This patch fixes the os_indications setVariable() failure. The variable
-index UID in SMM gateway which was 1 is changed in this patch. TFM has a
-special usage for variable with UID 1, which makes it write once only.
-This is not required for SMM variable index.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- components/service/smm_variable/backend/uefi_variable_store.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 6a90f46a..1bb869ae 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -67,7 +67,7 @@ static efi_status_t check_name_terminator(
- 	size_t name_size);
-=20
- /* Private UID for storing the variable index */
--#define VARIABLE_INDEX_STORAGE_UID			(1)
-+#define VARIABLE_INDEX_STORAGE_UID			(0x787)
-=20
- /* Default maximum variable size -
-  * may be overridden using uefi_variable_store_set_storage_limits()
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0030-Add-missing-features-to-setVariable.patch b/meta-a=
rm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0=
030-Add-missing-features-to-setVariable.patch
deleted file mode 100644
index 244146a2..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0030-Add-missing-features-to-setVariable.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 55fc3dbfb0ec21b1239808d0dddae14fbb8bb5f3 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Mon, 20 Dec 2021 19:56:30 +0000
-Subject: [PATCH] Add missing features to setVariable()
-
-This patch resolves the failing tests in SCT related to
-setVariable() function. The existing implementation is
-missing few cases where error codes are returned when called
-with certain paramters. These conditions are implemented in
-this patch based on the explanation provided in uefi spec.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- .../backend/uefi_variable_store.c             | 29 ++++++++++++++++---
- 1 file changed, 25 insertions(+), 4 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 1bb869ae..a1671074 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -161,6 +161,17 @@ efi_status_t uefi_variable_store_set_variable(
- 	bool should_sync_index =3D false;
-=20
- 	if (status !=3D EFI_SUCCESS) return status;
-+=09
-+	/*
-+	* Runtime access to a data variable implies boot service access. Attri=
butes that have
-+	* EFI_VARIABLE_RUNTIME_ACCESS set must also have EFI_VARIABLE_BOOTSERV=
ICE_ACCESS set.
-+	* The caller is responsible for following this rule.
-+	*/
-+	if((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS))
-+	{
-+			if((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=3D EFI_VARI=
ABLE_BOOTSERVICE_ACCESS )
-+			return EFI_INVALID_PARAMETER;
-+	}
-=20
- 	/* Find in index */
- 	const struct variable_info *info =3D variable_index_find(
-@@ -221,6 +232,13 @@ efi_status_t uefi_variable_store_set_variable(
- 		if (!info) status =3D EFI_OUT_OF_RESOURCES;
- 		should_sync_index =3D info && (info->metadata.attributes & EFI_VARIAB=
LE_NON_VOLATILE);
- 	}
-+	else=20
-+    {
-+		/* Return EFI_NOT_FOUND when a remove operation is performed
-+		 * on variable that is not existing.
-+		*/
-+        status =3D EFI_NOT_FOUND;
-+    }
-=20
- 	/* The order of these operations is important. For an update
- 	 * or create operation, The variable index is always synchronized
-@@ -555,10 +573,13 @@ static efi_status_t check_access_permitted_on_set(
- 	if ((status =3D=3D EFI_SUCCESS) && var->DataSize) {
-=20
- 		/* Restrict which attributes can be modified for an existing variable=
 */
--		if ((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=3D
--			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
--
--			/* Don't permit change of storage class */
-+        if (((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=3D
-+            (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) ||
-+            ((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=3D
-+            (info->metadata.attributes & EFI_VARIABLE_BOOTSERVICE_ACCES=
S)) ||
-+            ((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS) !=3D
-+            (info->metadata.attributes & EFI_VARIABLE_RUNTIME_ACCESS)))=
 {
-+			/* Don't permit change of attributes */
- 			status =3D EFI_INVALID_PARAMETER;
- 		}
- 	}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName=
.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions=
/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.pat=
ch
deleted file mode 100644
index 3990d82c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dc3f134436ad6852f1bad9542232e84166843a7e Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Mon, 20 Dec 2021 20:01:10 +0000
-Subject: [PATCH] Add invalid parameter check in getNextVariableName()
-
-This patch resolves the failing tests in SCT related to
-getNextVariableName() function. The existing implementation is
-missing few cases where error codes are returned when called
-with certain paramters. These conditions are implemented in
-this patch based on the explanation provided in uefi spec.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-
----
- .../smm_variable/backend/uefi_variable_store.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index a1671074..a57b3346 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -161,7 +161,7 @@ efi_status_t uefi_variable_store_set_variable(
- 	bool should_sync_index =3D false;
-=20
- 	if (status !=3D EFI_SUCCESS) return status;
--=09
-+
- 	/*
- 	* Runtime access to a data variable implies boot service access. Attri=
butes that have
- 	* EFI_VARIABLE_RUNTIME_ACCESS set must also have EFI_VARIABLE_BOOTSERV=
ICE_ACCESS set.
-@@ -310,6 +310,22 @@ efi_status_t uefi_variable_store_get_next_variable_=
name(
- 	status =3D EFI_NOT_FOUND;
- 	*total_length =3D 0;
-=20
-+	/*
-+	 *	If input values of VariableName and VendorGuid are not a name and G=
UID of an=20
-+	 *	existing variable, EFI_INVALID_PARAMETER is returned.=09
-+	 */
-+	if (cur->NameSize >=3D sizeof(int16_t)) {
-+		/*
-+		* Name must be at least one character long to accommodate
-+		* the mandatory null terminator.
-+		*/
-+		if (cur->Name[0] !=3D 0) {
-+			const struct variable_info *var_info =3D variable_index_find(&contex=
t->variable_index,&cur->Guid,cur->NameSize,cur->Name);
-+			if(var_info =3D=3D NULL)
-+					return EFI_INVALID_PARAMETER;
-+		}
-+	}
-+
- 	const struct variable_info *info =3D variable_index_find_next(
- 		&context->variable_index,
- 		&cur->Guid,
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch b=
/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corston=
e1000/0032-smm_gateway-add-checks-for-null-attributes.patch
deleted file mode 100644
index da3ddaf6..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 571ddac16048dfba4b25b04fe5cbd706c392b5ba Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 24 Dec 2021 19:17:17 +0000
-Subject: [PATCH] smm_gateway: add checks for null attributes
-
-As par EDK-2 and EDK-2 test code, when a user issue's
-setVariable() with 0 in attributes field, it means a variable
-delete request. Currently, smm gatway doesn't handle this scenario.
-This change is to add that support
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-
----
- .../backend/uefi_variable_store.c             | 28 ++++++++++++-------
- 1 file changed, 18 insertions(+), 10 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index a57b3346..e8771c21 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -167,7 +167,9 @@ efi_status_t uefi_variable_store_set_variable(
- 	* EFI_VARIABLE_RUNTIME_ACCESS set must also have EFI_VARIABLE_BOOTSERV=
ICE_ACCESS set.
- 	* The caller is responsible for following this rule.
- 	*/
--	if((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS))
-+	if (!var->Attributes)
-+		EMSG("It might be a delete variable request\n");
-+	else if((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS))
- 	{
- 			if((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=3D EFI_VARI=
ABLE_BOOTSERVICE_ACCESS )
- 			return EFI_INVALID_PARAMETER;
-@@ -191,7 +193,7 @@ efi_status_t uefi_variable_store_set_variable(
- 				(var->Attributes & EFI_VARIABLE_NON_VOLATILE) ||
- 				(info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE=
_NON_VOLATILE));
-=20
--			if (var->DataSize) {
-+			if (var->DataSize && var->Attributes) {
-=20
- 				/* It's a set rather than a remove operation */
- 				variable_index_update_variable(
-@@ -206,7 +208,9 @@ efi_status_t uefi_variable_store_set_variable(
- 				 * that it's never possible for an object to exist within
- 				 * the storage backend without a corresponding index entry.
- 				 */
--				remove_variable_data(context, info);
-+				EMSG("  deleting variable %s \n",var->Name);
-+				if (remove_variable_data(context, info) !=3D PSA_SUCCESS)
-+					EMSG("  deleting variable %s FAILED\n",var->Name);
- 				variable_index_remove_variable(&context->variable_index, info);
-=20
- 				/* Variable info no longer valid */
-@@ -587,14 +591,18 @@ static efi_status_t check_access_permitted_on_set(
- 	}
-=20
- 	if ((status =3D=3D EFI_SUCCESS) && var->DataSize) {
--
-+		/* Delete the variable with Attributes is 0 */
-+		if (!var->Attributes) {
-+			EMSG("Null attributes, may be a delete variable request\n");
-+			status =3D EFI_SUCCESS;
-+		}
- 		/* Restrict which attributes can be modified for an existing variable=
 */
--        if (((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=3D
--            (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) ||
--            ((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=3D
--            (info->metadata.attributes & EFI_VARIABLE_BOOTSERVICE_ACCES=
S)) ||
--            ((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS) !=3D
--            (info->metadata.attributes & EFI_VARIABLE_RUNTIME_ACCESS)))=
 {
-+		else if (((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=3D
-+			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) ||
-+			((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=3D
-+			(info->metadata.attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS)) ||
-+			((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS) !=3D
-+			(info->metadata.attributes & EFI_VARIABLE_RUNTIME_ACCESS))) {
- 			/* Don't permit change of attributes */
- 			status =3D EFI_INVALID_PARAMETER;
- 		}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch b/meta-arm-bsp=
/recipes-security/trusted-services/secure-partitions/corstone1000/0033-En=
hance-mbedtls-fetch-process.patch
deleted file mode 100644
index 02130b56..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0033-Enhance-mbedtls-fetch-process.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 47db072e9ec749c6be7c0a27d64d7fbd75748d60 Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Wed, 8 Dec 2021 04:20:34 +0100
-Subject: [PATCH] Enhance mbedtls fetch process
-
-Update management of MbedTLS external component to be optimized
-for download speed insted of availability.
-The updated process is:
-  - check if binary is available. If yes configure build to use it
-    and stop.
-  - if not, check is source is available. If yes, build it and use
-    the resulting binary.
-  - if not, then download the source using git, compile it and use
-    the resulting binary
-
-The following variables can be set on the command line to alter the
-behavior of the module:
-  - MBEDTLS_URL git repo URL to fetch from.
-  - MBEDTLS_REFSPEC revision to fetch
-  - MBEDTLS_SOURCE_DIR to specify location of source code in
-    local file syetem.
-  - MBEDTLS_INSTALL_DIR to specify location of binary.
-
-I.e. cmake -S <...> -B <...> -DMBEDTLS_INSTALL_DIR=3D~/mbedtls
-will make the resulting binary installed to ~/mbedtls. This can be
-used later to speed up a clean build an use the prebuilt binary.
-
-Change-Id: I8a9ad8b3303e6dfa0a7c9c3d7e4b4787b94d925a
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- external/MbedTLS/MbedTLS.cmake | 192 ++++++++++++++++++++-------------
- 1 file changed, 119 insertions(+), 73 deletions(-)
-
-diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
-index 3cbaed15..935be765 100644
---- a/external/MbedTLS/MbedTLS.cmake
-+++ b/external/MbedTLS/MbedTLS.cmake
-@@ -1,96 +1,142 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
- #----------------------------------------------------------------------=
---------
-=20
--# Determine the number of processes to run while running parallel build=
s.
--# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
--if(NOT DEFINED PROCESSOR_COUNT)
--	include(ProcessorCount)
--	ProcessorCount(PROCESSOR_COUNT)
--	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
--endif()
-+set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git"
-+		CACHE STRING "Mbed TLS repository URL")
-+set(MBEDTLS_REFSPEC "mbedtls-3.0.0"
-+		CACHE STRING "Mbed TLS git refspec")
-+set(MBEDTLS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-src"
-+		CACHE PATH "MbedTLS source directory")
-+set(MBEDTLS_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/mbedtls_install"
-+		CACHE PATH "Mbed TLS installation directory")
-=20
--set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git" CACHE STRING "=
Mbed TLS repository URL")
--set(MBEDTLS_REFSPEC "mbedtls-3.0.0" CACHE STRING "Mbed TLS git refspec"=
)
--set(MBEDTLS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/mbedtls_install" =
CACHE PATH "Mbed TLS installation directory")
--set(MBEDTLS_PACKAGE_PATH "${MBEDTLS_INSTALL_PATH}/lib/mbedtls/cmake" CA=
CHE PATH "Mbed TLS CMake package directory")
-+find_library(MBEDCRYPTO_LIB_FILE
-+				NAMES libmbedcrypto.a mbedcrypto.a libmbedcrypto.lib mbedcrypto.lib
-+				PATHS ${MBEDTLS_INSTALL_DIR}
-+				PATH_SUFFIXES "lib"
-+				DOC "Location of mberdrypto library."
-+				NO_DEFAULT_PATH
-+)
-=20
--include(FetchContent)
-+set(MBEDCRYPTO_LIB_FILE ${MBEDCRYPTO_LIB_FILE})
-+unset(MBEDCRYPTO_LIB_FILE CACHE)
-=20
--# Checking git
--find_program(GIT_COMMAND "git")
--if (NOT GIT_COMMAND)
--	message(FATAL_ERROR "Please install git")
--endif()
-+set(MBEDTLS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-build=
")
-=20
--# Fetching Mbed TLS
--FetchContent_Declare(
--	mbedtls
--	GIT_REPOSITORY ${MBEDTLS_URL}
--	GIT_TAG ${MBEDTLS_REFSPEC}
--	GIT_SHALLOW TRUE
--)
-+# Binary not found and it needs to be built.
-+if (NOT MBEDCRYPTO_LIB_FILE)
-+	# Determine the number of processes to run while running parallel buil=
ds.
-+	# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
-+	if(NOT DEFINED PROCESSOR_COUNT)
-+		include(ProcessorCount)
-+		ProcessorCount(PROCESSOR_COUNT)
-+		set(PROCESSOR_COUNT ${PROCESSOR_COUNT}
-+				CACHE STRING "Number of cores to use for parallel builds.")
-+	endif()
-=20
--# FetchContent_GetProperties exports mbedtls_SOURCE_DIR and mbedtls_BIN=
ARY_DIR variables
--FetchContent_GetProperties(mbedtls)
--if(NOT mbedtls_POPULATED)
--	message(STATUS "Fetching Mbed TLS")
--	FetchContent_Populate(mbedtls)
--endif()
-+	# See if the source is available locally
-+	find_file(MBEDCRYPTO_HEADER_FILE
-+		NAMES crypto.h
-+		PATHS ${MBEDTLS_SOURCE_DIR}
-+		PATH_SUFFIXES "include/psa"
-+		NO_DEFAULT_PATH
-+	)
-+	set(MBEDCRYPTO_HEADER_FILE ${MBEDCRYPTO_HEADER_FILE})
-+	unset(MBEDCRYPTO_HEADER_FILE CACHE)
-=20
--# Convert the include path list to a string. Needed to make parameter p=
assing to
--# Mbed TLS build work fine.
--string(REPLACE ";" "\\;" MBEDTLS_EXTRA_INCLUDES "${MBEDTLS_EXTRA_INCLUD=
ES}")
-+	# Source not found, fetch it.
-+	if (NOT MBEDCRYPTO_HEADER_FILE)
-+		include(FetchContent)
-=20
--find_package(Python3 COMPONENTS Interpreter)
--if (NOT Python3_Interpreter_FOUND)
--	message(FATAL_ERROR "Python 3 interpreter not found.")
--endif()
-+		# Checking git
-+		find_program(GIT_COMMAND "git")
-+		if (NOT GIT_COMMAND)
-+			message(FATAL_ERROR "Please install git")
-+		endif()
-=20
--#Configure Mbed TLS to build only mbedcrypto lib
--execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto =
WORKING_DIRECTORY ${mbedtls_SOURCE_DIR})
--
--# Advertise Mbed TLS as the provider of the psa crypto API
--set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_PATH}/include" CACHE STRI=
NG "PSA Crypto API include path")
--
--#Configure the library
--execute_process(COMMAND
--	${CMAKE_COMMAND}
--		-DENABLE_PROGRAMS=3DOFF
--		-DENABLE_TESTING=3DOFF
--		-DUNSAFE_BUILD=3DON
--		-DCMAKE_INSTALL_PREFIX=3D${MBEDTLS_INSTALL_PATH}
--		-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
--		-DCMAKE_TRY_COMPILE_TARGET_TYPE=3DSTATIC_LIBRARY
--		-DEXTERNAL_DEFINITIONS=3D-DMBEDTLS_USER_CONFIG_FILE=3D"${MBEDTLS_USER=
_CONFIG_FILE}"
--		-DEXTERNAL_INCLUDE_PATHS=3D${MBEDTLS_EXTRA_INCLUDES}
--		-GUnix\ Makefiles
--		${mbedtls_SOURCE_DIR}
--	WORKING_DIRECTORY
--		${mbedtls_BINARY_DIR}
--	RESULT_VARIABLE _exec_error
--)
-+		# Fetching Mbed TLS
-+		FetchContent_Declare(
-+			mbedtls
-+			SOURCE_DIR ${MBEDTLS_SOURCE_DIR}
-+			BINARY_DIR ${MBEDTLS_BINARY_DIR}
-+			GIT_REPOSITORY ${MBEDTLS_URL}
-+			GIT_TAG ${MBEDTLS_REFSPEC}
-+			GIT_SHALLOW TRUE
-+		)
-=20
--if (_exec_error)
--	message(FATAL_ERROR "Configuration step of Mbed TLS failed with ${_exe=
c_error}.")
--endif()
-+		# FetchContent_GetProperties exports mbedtls_SOURCE_DIR and mbedtls_B=
INARY_DIR variables
-+		FetchContent_GetProperties(mbedtls)
-+		# FetchContent_Populate will fail if the source directory is removed =
since it will try to
-+		# do an "update" and not a "populate" action. As a workaround, remove=
 the subbuild directory.
-+		# Note: this fix assumes, the default subbuild location is used.
-+		file(REMOVE_RECURSE "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-subbui=
ld")
-+
-+		# If the source directory has been moved, the binary dir must be rege=
nerated from scratch.
-+		file(REMOVE_RECURSE "${MBEDTLS_BINARY_DIR}")
-=20
--#TODO: add dependency to generated project on this file!
--#TODO: add custom target to rebuild Mbed TLS
-+		if (NOT mbedtls_POPULATED)
-+			message(STATUS "Fetching Mbed TLS")
-+			FetchContent_Populate(mbedtls)
-+		endif()
-+		set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${MBED=
TLS_SOURCE_DIR})
-+	endif()
-=20
--#Build the library
--execute_process(COMMAND
--		${CMAKE_COMMAND} --build ${mbedtls_BINARY_DIR} --parallel ${PROCESSOR=
_COUNT} --target install
-+	# Build mbedcrypto library
-+
-+	# Convert the include path list to a string. Needed to make parameter =
passing to
-+	# Mbed TLS build work fine.
-+	string(REPLACE ";" "\\;" MBEDTLS_EXTRA_INCLUDES "${MBEDTLS_EXTRA_INCLU=
DES}")
-+
-+	find_package(Python3 REQUIRED COMPONENTS Interpreter)
-+
-+	#Configure Mbed TLS to build only mbedcrypto lib
-+	execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto=
 WORKING_DIRECTORY ${MBEDTLS_SOURCE_DIR})
-+
-+	# Advertise Mbed TLS as the provider of the psa crypto API
-+	set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_DIR}/include" CACHE STRI=
NG "PSA Crypto API include path")
-+
-+	#Configure the library
-+	execute_process(COMMAND
-+		${CMAKE_COMMAND} -E env CROSS_COMPILE=3D${CROSS_COMPILE}
-+			${CMAKE_COMMAND}
-+				-DENABLE_PROGRAMS=3DOFF
-+				-DENABLE_TESTING=3DOFF
-+				-DUNSAFE_BUILD=3DON
-+				-DCMAKE_INSTALL_PREFIX=3D${MBEDTLS_INSTALL_DIR}
-+				-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
-+				-DCMAKE_TRY_COMPILE_TARGET_TYPE=3DSTATIC_LIBRARY
-+				-DEXTERNAL_DEFINITIONS=3D-DMBEDTLS_USER_CONFIG_FILE=3D"${MBEDTLS_US=
ER_CONFIG_FILE}"
-+				-DEXTERNAL_INCLUDE_PATHS=3D${MBEDTLS_EXTRA_INCLUDES}
-+				-GUnix\ Makefiles
-+				${MBEDTLS_SOURCE_DIR}
-+		WORKING_DIRECTORY
-+			${MBEDTLS_BINARY_DIR}
- 		RESULT_VARIABLE _exec_error
- 	)
--if (_exec_error)
--	message(FATAL_ERROR "Build step of Mbed TLS failed with ${_exec_error}=
.")
-+
-+	if (_exec_error)
-+		message(FATAL_ERROR "Configuration step of Mbed TLS failed with ${_ex=
ec_error}.")
-+	endif()
-+
-+	#Build the library
-+	execute_process(COMMAND
-+			${CMAKE_COMMAND} --build ${MBEDTLS_BINARY_DIR} --parallel ${PROCESSO=
R_COUNT} --target install
-+			RESULT_VARIABLE _exec_error
-+		)
-+
-+	if (_exec_error)
-+		message(FATAL_ERROR "Build step of Mbed TLS failed with ${_exec_error=
}.")
-+	endif()
-+
-+	set(MBEDCRYPTO_LIB_FILE "${MBEDTLS_INSTALL_DIR}/lib/${CMAKE_STATIC_LIB=
RARY_PREFIX}mbedcrypto${CMAKE_STATIC_LIBRARY_SUFFIX}")
- endif()
-=20
- #Create an imported target to have clean abstraction in the build-syste=
m.
- add_library(mbedcrypto STATIC IMPORTED)
--set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION "${MBEDTLS_IN=
STALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mbedcrypto${CMAKE_STATIC_LI=
BRARY_SUFFIX}")
--set_property(TARGET mbedcrypto PROPERTY INTERFACE_INCLUDE_DIRECTORIES "=
${MBEDTLS_INSTALL_PATH}/include")
-+set_property(DIRECTORY ${CMAKE_SOURCE_DIR} APPEND PROPERTY CMAKE_CONFIG=
URE_DEPENDS ${MBEDCRYPTO_LIB_FILE})
-+set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION ${MBEDCRYPTO_=
LIB_FILE})
-+set_property(TARGET mbedcrypto PROPERTY INTERFACE_INCLUDE_DIRECTORIES "=
${MBEDTLS_INSTALL_DIR}/include")
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch b/met=
a-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone100=
0/0034-Fix-format-specifier-in-logging_caller.patch
deleted file mode 100644
index 75fa7c2a..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0034-Fix-format-specifier-in-logging_caller.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 131bb3c577fff93ff9ba6f5e7d450f727fec0e62 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Fri, 11 Feb 2022 12:30:45 +0000
-Subject: [PATCH] Fix format specifier in logging_caller
-
-A previous change increased the width of the opstatus value
-returned by an rpc endpoint from 32 to 64 bits. This change
-corrects the printf format specifier in the rpc logging_caller
-that corresponds to logging the opstatus value.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Ie695a6bf8cf8014317b85196d7b933d344782b2c
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- components/rpc/common/logging/logging_caller.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/components/rpc/common/logging/logging_caller.c b/components=
/rpc/common/logging/logging_caller.c
-index 07c33de5..cac03f2f 100644
---- a/components/rpc/common/logging/logging_caller.c
-+++ b/components/rpc/common/logging/logging_caller.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -87,7 +87,7 @@ static rpc_status_t call_invoke(void *context, rpc_cal=
l_handle handle, uint32_t
-=20
- 	if (status =3D=3D TS_RPC_CALL_ACCEPTED) {
-=20
--		fprintf(this_instance->log_file, "op_status: %d\n", *opstatus);
-+		fprintf(this_instance->log_file, "op_status: %ld\n", *opstatus);
- 		fprintf(this_instance->log_file, "resp_len: %ld\n", *resp_len);
- 	}
-=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for=
-v.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v=
.patch
deleted file mode 100644
index 01b99d3e..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patc=
h
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7aa9796020487ce32746c25934ce20829acc462c Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Fri, 11 Feb 2022 13:42:59 +0000
-Subject: [PATCH] Update refspecs for mbedtls and psa-arch-tests for v3.1=
.0
-
-Updates external component refspecs to use mbedtls 3.1.0 and
-compatible API tests from psa-arch-test.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I1b5cebd7de3c1885f5f8a8ea21ba5e4c52aefaf4
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- external/MbedTLS/MbedTLS.cmake               |  2 +-
- external/psa_arch_tests/psa_arch_tests.cmake | 17 ++++++-----------
- 2 files changed, 7 insertions(+), 12 deletions(-)
-
-diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
-index 935be765..3350d8a0 100644
---- a/external/MbedTLS/MbedTLS.cmake
-+++ b/external/MbedTLS/MbedTLS.cmake
-@@ -7,7 +7,7 @@
-=20
- set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git"
- 		CACHE STRING "Mbed TLS repository URL")
--set(MBEDTLS_REFSPEC "mbedtls-3.0.0"
-+set(MBEDTLS_REFSPEC "mbedtls-3.1.0"
- 		CACHE STRING "Mbed TLS git refspec")
- set(MBEDTLS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-src"
- 		CACHE PATH "MbedTLS source directory")
-diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
-index e6ab73f7..f6d2fb9f 100644
---- a/external/psa_arch_tests/psa_arch_tests.cmake
-+++ b/external/psa_arch_tests/psa_arch_tests.cmake
-@@ -5,20 +5,15 @@
- #
- #----------------------------------------------------------------------=
---------
-=20
--# Determine the number of processes to run while running parallel build=
s.
--# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
--if(NOT DEFINED PROCESSOR_COUNT)
--	include(ProcessorCount)
--	ProcessorCount(PROCESSOR_COUNT)
--	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
--endif()
-+# Temporarily using modified tests used for tf-m verification
-+set(PSA_ARCH_TESTS_URL "https://github.com/bensze01/psa-arch-tests.git"=
 CACHE STRING "psa-arch-tests repository URL")
-+set(PSA_ARCH_TESTS_REFSPEC "fix-multipart-aead" CACHE STRING "psa-arch-=
tests git refspec")
-=20
--set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests.=
git" CACHE STRING "psa-arch-tests repository URL")
--set(PSA_ARCH_TESTS_REFSPEC "master" CACHE STRING "psa-arch-tests git re=
fspec")
-+#set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests=
.git" CACHE STRING "psa-arch-tests repository URL")
-+#set(PSA_ARCH_TESTS_REFSPEC "2a1852252a9b9af655cbe02d5d3c930952d0d798" =
CACHE STRING "psa-arch-tests v22.01_API1.4_ADAC_BETA")
- set(PSA_ARCH_TESTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/psa-arch-t=
ests_install" CACHE PATH "psa-arch-tests installation directory")
- set(PSA_ARCH_TESTS_PACKAGE_PATH "${PSA_ARCH_TESTS_INSTALL_PATH}/libpsa-=
arch-tests/cmake" CACHE PATH "psa-arch-tests CMake package directory")
--
--include(FetchContent)
-+set(PSA_ARCH_TESTS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/psa_ar=
ch_tests-src" CACHE PATH "psa-arch-tests source.")
-=20
- # Checking git
- find_program(GIT_COMMAND "git")
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.p=
atch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/c=
orstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
deleted file mode 100644
index ae78f41a..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
+++ /dev/null
@@ -1,1080 +0,0 @@
-From b160f734006f4959d92377dc3aa8eabc3ac7c1da Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Fri, 11 Feb 2022 14:08:13 +0000
-Subject: [PATCH] Separate sign/verify message and hash operations
-
-Previous versions of mbedtls didn't distinguish between
-asymmetric sign and verify operations on a hash or message.
-They are now treated as separate operations from a usage
-control perspective. This change makes the corresponding
-hash/message sepration in client and service provider
-components.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Ic0041c694c026522c9b00c974d22261e9e2feadd
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- .../caller/packed-c/crypto_caller_sign_hash.h | 29 +++++++-
- .../packed-c/crypto_caller_verify_hash.h      | 33 ++++++++-
- .../caller/stub/crypto_caller_sign_hash.h     | 11 ++-
- .../caller/stub/crypto_caller_verify_hash.h   | 11 ++-
- .../service/crypto/client/cpp/crypto_client.h | 17 ++++-
- .../packed-c/packedc_crypto_client.cpp        | 22 +++++-
- .../protocol/packed-c/packedc_crypto_client.h | 17 ++++-
- .../protobuf/protobuf_crypto_client.cpp       | 43 ++++++++++-
- .../protobuf/protobuf_crypto_client.h         | 27 ++++++-
- .../crypto/client/psa/psa_sign_message.c      | 24 +++---
- .../crypto/client/psa/psa_verify_message.c    | 24 +++---
- .../service/crypto/provider/crypto_provider.c | 40 ++++++----
- .../serializer/crypto_provider_serializer.h   |  6 +-
- .../packedc_crypto_provider_serializer.c      | 12 +--
- .../protobuf/pb_crypto_provider_serializer.c  | 74 +++++++++----------
- .../check_crypto_opcode_alignment.cpp         | 25 ++++---
- .../test/service/crypto_service_scenarios.cpp | 56 +++++++++++++-
- .../test/service/crypto_service_scenarios.h   |  3 +-
- .../packed-c/crypto_service_packedc_tests.cpp |  7 +-
- .../crypto_service_protobuf_tests.cpp         |  7 +-
- protocols/service/crypto/packed-c/opcodes.h   |  4 +-
- .../service/crypto/protobuf/opcodes.proto     |  4 +-
- 22 files changed, 366 insertions(+), 130 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_sign_hash.h b/components/service/crypto/client/caller/packed-c/crypto=
_caller_sign_hash.h
-index e807773e..4a9ed20d 100644
---- a/components/service/crypto/client/caller/packed-c/crypto_caller_sig=
n_hash.h
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller_sig=
n_hash.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -20,7 +20,8 @@
- extern "C" {
- #endif
-=20
--static inline psa_status_t crypto_caller_sign_hash(struct service_clien=
t *context,
-+static inline psa_status_t crypto_caller_asym_sign_commom(struct servic=
e_client *context,
-+	uint32_t opcode,
- 	psa_key_id_t id,
- 	psa_algorithm_t alg,
- 	const uint8_t *hash, size_t hash_length,
-@@ -60,7 +61,7 @@ static inline psa_status_t crypto_caller_sign_hash(str=
uct service_client *contex
-=20
- 		context->rpc_status =3D
- 			rpc_caller_invoke(context->caller, call_handle,
--						TS_CRYPTO_OPCODE_SIGN_HASH, &opstatus, &resp_buf, &resp_len);
-+						opcode, &opstatus, &resp_buf, &resp_len);
-=20
- 		if (context->rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
-=20
-@@ -98,6 +99,28 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
- 	return psa_status;
- }
-=20
-+static inline psa_status_t crypto_caller_sign_hash(struct service_clien=
t *context,
-+	psa_key_id_t id,
-+	psa_algorithm_t alg,
-+	const uint8_t *hash, size_t hash_length,
-+	uint8_t *signature, size_t signature_size, size_t *signature_length)
-+{
-+	return crypto_caller_asym_sign_commom(context, TS_CRYPTO_OPCODE_SIGN_H=
ASH,
-+		id, alg, hash, hash_length,
-+		signature, signature_size, signature_length);
-+}
-+
-+static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
-+	psa_key_id_t id,
-+	psa_algorithm_t alg,
-+	const uint8_t *hash, size_t hash_length,
-+	uint8_t *signature, size_t signature_size, size_t *signature_length)
-+{
-+	return crypto_caller_asym_sign_commom(context, TS_CRYPTO_OPCODE_SIGN_M=
ESSAGE,
-+		id, alg, hash, hash_length,
-+		signature, signature_size, signature_length);
-+}
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_verify_hash.h b/components/service/crypto/client/caller/packed-c/cryp=
to_caller_verify_hash.h
-index 47152946..daa11330 100644
---- a/components/service/crypto/client/caller/packed-c/crypto_caller_ver=
ify_hash.h
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller_ver=
ify_hash.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -20,7 +20,8 @@
- extern "C" {
- #endif
-=20
--static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+static inline psa_status_t crypto_caller_asym_verify_common(struct serv=
ice_client *context,
-+	uint32_t opcode,
- 	psa_key_id_t id,
- 	psa_algorithm_t alg,
- 	const uint8_t *hash, size_t hash_length,
-@@ -65,7 +66,7 @@ static inline psa_status_t crypto_caller_verify_hash(s=
truct service_client *cont
-=20
- 		context->rpc_status =3D
- 			rpc_caller_invoke(context->caller, call_handle,
--					TS_CRYPTO_OPCODE_VERIFY_HASH, &opstatus, &resp_buf, &resp_len);
-+					opcode, &opstatus, &resp_buf, &resp_len);
-=20
- 		if (context->rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) psa_status =3D o=
pstatus;
-=20
-@@ -75,6 +76,32 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
- 	return psa_status;
- }
-=20
-+static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+	psa_key_id_t id,
-+	psa_algorithm_t alg,
-+	const uint8_t *hash, size_t hash_length,
-+	const uint8_t *signature, size_t signature_length)
-+{
-+	return crypto_caller_asym_verify_common(context,
-+		TS_CRYPTO_OPCODE_VERIFY_HASH,
-+		id, alg,
-+		hash, hash_length,
-+		signature, signature_length);
-+}
-+
-+static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
-+	psa_key_id_t id,
-+	psa_algorithm_t alg,
-+	const uint8_t *input, size_t input_length,
-+	const uint8_t *signature, size_t signature_length)
-+{
-+	return crypto_caller_asym_verify_common(context,
-+		TS_CRYPTO_OPCODE_VERIFY_MESSAGE,
-+		id, alg,
-+		input, input_length,
-+		signature, signature_length);
-+}
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/caller/stub/crypto_caller_=
sign_hash.h b/components/service/crypto/client/caller/stub/crypto_caller_=
sign_hash.h
-index d09369a2..09049f5c 100644
---- a/components/service/crypto/client/caller/stub/crypto_caller_sign_ha=
sh.h
-+++ b/components/service/crypto/client/caller/stub/crypto_caller_sign_ha=
sh.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -23,6 +23,15 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
- 	return PSA_ERROR_NOT_SUPPORTED;
- }
-=20
-+static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
-+	psa_key_id_t id,
-+	psa_algorithm_t alg,
-+	const uint8_t *hash, size_t hash_length,
-+	uint8_t *signature, size_t signature_size, size_t *signature_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/caller/stub/crypto_caller_=
verify_hash.h b/components/service/crypto/client/caller/stub/crypto_calle=
r_verify_hash.h
-index 20d11dcf..3f3eb878 100644
---- a/components/service/crypto/client/caller/stub/crypto_caller_verify_=
hash.h
-+++ b/components/service/crypto/client/caller/stub/crypto_caller_verify_=
hash.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -23,6 +23,15 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
- 	return PSA_ERROR_NOT_SUPPORTED;
- }
-=20
-+static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
-+	psa_key_id_t id,
-+	psa_algorithm_t alg,
-+	const uint8_t *input, size_t input_length,
-+	const uint8_t *signature, size_t signature_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/cpp/crypto_client.h b/comp=
onents/service/crypto/client/cpp/crypto_client.h
-index 2a5e5b99..ccb0714a 100644
---- a/components/service/crypto/client/cpp/crypto_client.h
-+++ b/components/service/crypto/client/cpp/crypto_client.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -57,7 +57,7 @@ public:
- 		psa_key_id_t id,
- 		uint8_t *data, size_t data_size, size_t *data_length) =3D 0;
-=20
--	/* Sign/verify methods */
-+	/* Sign/verify hash methods */
- 	virtual psa_status_t sign_hash(
- 		psa_key_id_t id,
- 		psa_algorithm_t alg,
-@@ -70,6 +70,19 @@ public:
- 		const uint8_t *hash, size_t hash_length,
- 		const uint8_t *signature, size_t signature_length) =3D 0;
-=20
-+	/* Sign/verify message methods */
-+	virtual psa_status_t sign_message(
-+		psa_key_id_t id,
-+		psa_algorithm_t alg,
-+		const uint8_t *message, size_t message_length,
-+		uint8_t *signature, size_t signature_size, size_t *signature_length) =
=3D 0;
-+
-+	virtual psa_status_t verify_message(
-+		psa_key_id_t id,
-+		psa_algorithm_t alg,
-+		const uint8_t *message, size_t message_length,
-+		const uint8_t *signature, size_t signature_length) =3D 0;
-+
- 	/* Asymmetric encrypt/decrypt */
- 	virtual psa_status_t asymmetric_encrypt(
- 		psa_key_id_t id,
-diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.cpp b/components/service/crypto/client/cpp/protocol/pac=
ked-c/packedc_crypto_client.cpp
-index 4d9d8f41..4e10f9be 100644
---- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
-+++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -107,6 +107,26 @@ psa_status_t packedc_crypto_client::verify_hash(
- 		signature, signature_length);
- }
-=20
-+psa_status_t packedc_crypto_client::sign_message(
-+	psa_key_id_t id, psa_algorithm_t alg,
-+	const uint8_t *message, size_t message_length,
-+	uint8_t *signature, size_t signature_size, size_t *signature_length)
-+{
-+	return crypto_caller_sign_message(&m_client, id, alg,
-+		message, message_length,
-+		signature, signature_size, signature_length);
-+}
-+
-+psa_status_t packedc_crypto_client::verify_message(
-+	psa_key_id_t id, psa_algorithm_t alg,
-+	const uint8_t *message, size_t message_length,
-+	const uint8_t *signature, size_t signature_length)
-+{
-+	return crypto_caller_verify_message(&m_client, id, alg,
-+		message, message_length,
-+		signature, signature_length);
-+}
-+
- psa_status_t packedc_crypto_client::asymmetric_encrypt(
- 	psa_key_id_t id, psa_algorithm_t alg,
- 	const uint8_t *input, size_t input_length,
-diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.h b/components/service/crypto/client/cpp/protocol/packe=
d-c/packedc_crypto_client.h
-index 377b51d1..d74ba609 100644
---- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
-+++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -54,7 +54,7 @@ public:
- 		psa_key_id_t id,
- 		uint8_t *data, size_t data_size, size_t *data_length);
-=20
--	/* Sign/verify methods */
-+	/* Sign/verify hash methods */
- 	psa_status_t sign_hash(
- 		psa_key_id_t id,
- 		psa_algorithm_t alg,
-@@ -67,6 +67,19 @@ public:
- 		const uint8_t *hash, size_t hash_length,
- 		const uint8_t *signature, size_t signature_length);
-=20
-+	/* Sign/verify message methods */
-+	psa_status_t sign_message(
-+		psa_key_id_t id,
-+		psa_algorithm_t alg,
-+		const uint8_t *message, size_t message_length,
-+		uint8_t *signature, size_t signature_size, size_t *signature_length);
-+
-+	psa_status_t verify_message(
-+		psa_key_id_t id,
-+		psa_algorithm_t alg,
-+		const uint8_t *message, size_t message_length,
-+		const uint8_t *signature, size_t signature_length);
-+
- 	/* Asymmetric encrypt/decrypt */
- 	psa_status_t asymmetric_encrypt(
- 		psa_key_id_t id,
-diff --git a/components/service/crypto/client/cpp/protocol/protobuf/prot=
obuf_crypto_client.cpp b/components/service/crypto/client/cpp/protocol/pr=
otobuf/protobuf_crypto_client.cpp
-index 17780351..28c8f6fb 100644
---- a/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.cpp
-+++ b/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.cpp
-@@ -386,6 +386,25 @@ psa_status_t protobuf_crypto_client::export_public_=
key(psa_key_id_t id,
- psa_status_t protobuf_crypto_client::sign_hash(psa_key_id_t id, psa_alg=
orithm_t alg,
- 							const uint8_t *hash, size_t hash_length,
- 							uint8_t *signature, size_t signature_size, size_t *signature_len=
gth)
-+{
-+	return asym_sign(ts_crypto_Opcode_SIGN_HASH, id, alg,
-+				hash, hash_length,
-+				signature, signature_size, signature_length);
-+}
-+
-+psa_status_t protobuf_crypto_client::sign_message(psa_key_id_t id, psa_=
algorithm_t alg,
-+							const uint8_t *message, size_t message_length,
-+							uint8_t *signature, size_t signature_size, size_t *signature_len=
gth)
-+{
-+	return asym_sign(ts_crypto_Opcode_SIGN_MESSAGE, id, alg,
-+				message, message_length,
-+				signature, signature_size, signature_length);
-+}
-+
-+psa_status_t protobuf_crypto_client::asym_sign(uint32_t opcode,
-+							psa_key_id_t id, psa_algorithm_t alg,
-+							const uint8_t *hash, size_t hash_length,
-+							uint8_t *signature, size_t signature_size, size_t *signature_len=
gth)
- {
- 	size_t req_len;
- 	pb_bytes_array_t *hash_byte_array =3D
-@@ -416,7 +435,7 @@ psa_status_t protobuf_crypto_client::sign_hash(psa_k=
ey_id_t id, psa_algorithm_t
- 			pb_encode(&ostream, ts_crypto_SignHashIn_fields, &req_msg);
-=20
- 			m_client.rpc_status =3D rpc_caller_invoke(m_client.caller, call_hand=
le,
--						ts_crypto_Opcode_SIGN_HASH, &opstatus, &resp_buf, &resp_len);
-+						opcode, &opstatus, &resp_buf, &resp_len);
-=20
- 			if (m_client.rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
-=20
-@@ -462,10 +481,28 @@ psa_status_t protobuf_crypto_client::sign_hash(psa=
_key_id_t id, psa_algorithm_t
- 	return psa_status;
- }
-=20
--
- psa_status_t protobuf_crypto_client::verify_hash(psa_key_id_t id, psa_a=
lgorithm_t alg,
- 						const uint8_t *hash, size_t hash_length,
- 						const uint8_t *signature, size_t signature_length)
-+{
-+	return asym_verify(ts_crypto_Opcode_VERIFY_HASH, id, alg,
-+				hash, hash_length,
-+				signature, signature_length);
-+}
-+
-+psa_status_t protobuf_crypto_client::verify_message(psa_key_id_t id, ps=
a_algorithm_t alg,
-+						const uint8_t *message, size_t message_length,
-+						const uint8_t *signature, size_t signature_length)
-+{
-+	return asym_verify(ts_crypto_Opcode_VERIFY_MESSAGE, id, alg,
-+				message, message_length,
-+				signature, signature_length);
-+}
-+
-+psa_status_t protobuf_crypto_client::asym_verify(uint32_t opcode,
-+						psa_key_id_t id, psa_algorithm_t alg,
-+						const uint8_t *hash, size_t hash_length,
-+						const uint8_t *signature, size_t signature_length)
- {
- 	size_t req_len;
- 	pb_bytes_array_t *hash_byte_array =3D
-@@ -497,7 +534,7 @@ psa_status_t protobuf_crypto_client::verify_hash(psa=
_key_id_t id, psa_algorithm_
- 			pb_encode(&ostream, ts_crypto_VerifyHashIn_fields, &req_msg);
-=20
- 			m_client.rpc_status =3D rpc_caller_invoke(m_client.caller, call_hand=
le,
--						ts_crypto_Opcode_VERIFY_HASH, &opstatus, &resp_buf, &resp_len);
-+						opcode, &opstatus, &resp_buf, &resp_len);
-=20
- 			if (m_client.rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) psa_status =3D =
opstatus;
-=20
-diff --git a/components/service/crypto/client/cpp/protocol/protobuf/prot=
obuf_crypto_client.h b/components/service/crypto/client/cpp/protocol/prot=
obuf/protobuf_crypto_client.h
-index 085d9cfa..abe4439e 100644
---- a/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.h
-+++ b/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -54,7 +54,7 @@ public:
- 		psa_key_id_t id,
- 		uint8_t *data, size_t data_size, size_t *data_length);
-=20
--	/* Sign/verify methods */
-+	/* Sign/verify hash methods */
- 	psa_status_t sign_hash(
- 		psa_key_id_t id,
- 		psa_algorithm_t alg,
-@@ -67,6 +67,19 @@ public:
- 		const uint8_t *hash, size_t hash_length,
- 		const uint8_t *signature, size_t signature_length);
-=20
-+	/* Sign/verify message methods */
-+	psa_status_t sign_message(
-+		psa_key_id_t id,
-+		psa_algorithm_t alg,
-+		const uint8_t *message, size_t message_length,
-+		uint8_t *signature, size_t signature_size, size_t *signature_length);
-+
-+	psa_status_t verify_message(
-+		psa_key_id_t id,
-+		psa_algorithm_t alg,
-+		const uint8_t *message, size_t message_length,
-+		const uint8_t *signature, size_t signature_length);
-+
- 	/* Asymmetric encrypt/decrypt */
- 	psa_status_t asymmetric_encrypt(
- 		psa_key_id_t id,
-@@ -221,6 +234,16 @@ public:
-=20
- private:
-=20
-+	psa_status_t asym_sign(uint32_t opcode,
-+		psa_key_id_t id, psa_algorithm_t alg,
-+		const uint8_t *hash, size_t hash_length,
-+		uint8_t *signature, size_t signature_size, size_t *signature_length);
-+
-+	psa_status_t asym_verify(uint32_t opcode,
-+		psa_key_id_t id, psa_algorithm_t alg,
-+		const uint8_t *hash, size_t hash_length,
-+		const uint8_t *signature, size_t signature_length);
-+
- 	void translate_key_attributes(
- 		ts_crypto_KeyAttributes &proto_attributes,
- 		const psa_key_attributes_t &psa_attributes);
-diff --git a/components/service/crypto/client/psa/psa_sign_message.c b/c=
omponents/service/crypto/client/psa/psa_sign_message.c
-index dc2f7e80..b6446253 100644
---- a/components/service/crypto/client/psa/psa_sign_message.c
-+++ b/components/service/crypto/client/psa/psa_sign_message.c
-@@ -1,13 +1,15 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-=20
- #include <psa/crypto.h>
-+#include "psa_crypto_client.h"
-+#include "crypto_caller_selector.h"
-=20
- psa_status_t psa_sign_message(
--	psa_key_id_t key,
-+	psa_key_id_t id,
- 	psa_algorithm_t alg,
- 	const uint8_t *input,
- 	size_t input_length,
-@@ -15,19 +17,11 @@ psa_status_t psa_sign_message(
- 	size_t signature_size,
- 	size_t *signature_length)
- {
--	size_t hash_len;
--	uint8_t hash[PSA_HASH_MAX_SIZE];
-+	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
-+		return psa_crypto_client_instance.init_status;
-=20
--	psa_status_t psa_status =3D psa_hash_compute(PSA_ALG_SIGN_GET_HASH(alg=
),
-+	return crypto_caller_sign_message(&psa_crypto_client_instance.base,
-+		id, alg,
- 		input, input_length,
--		hash, sizeof(hash), &hash_len);
--
--	if (psa_status =3D=3D PSA_SUCCESS) {
--
--		psa_status =3D psa_sign_hash(key, alg,
--			hash, hash_len,
--			signature, signature_size, signature_length);
--	}
--
--	return psa_status;
-+		signature, signature_size, signature_length);
- }
-diff --git a/components/service/crypto/client/psa/psa_verify_message.c b=
/components/service/crypto/client/psa/psa_verify_message.c
-index d0fbc7c8..57c2c5e8 100644
---- a/components/service/crypto/client/psa/psa_verify_message.c
-+++ b/components/service/crypto/client/psa/psa_verify_message.c
-@@ -1,32 +1,26 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-=20
- #include <psa/crypto.h>
-+#include "psa_crypto_client.h"
-+#include "crypto_caller_selector.h"
-=20
- psa_status_t psa_verify_message(
--	psa_key_id_t key,
-+	psa_key_id_t id,
- 	psa_algorithm_t alg,
- 	const uint8_t *input,
- 	size_t input_length,
- 	const uint8_t * signature,
- 	size_t signature_length)
- {
--	size_t hash_len;
--	uint8_t hash[PSA_HASH_MAX_SIZE];
-+	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
-+		return psa_crypto_client_instance.init_status;
-=20
--	psa_status_t psa_status =3D psa_hash_compute(PSA_ALG_SIGN_GET_HASH(alg=
),
-+	return crypto_caller_verify_message(&psa_crypto_client_instance.base,
-+		id, alg,
- 		input, input_length,
--		hash, sizeof(hash), &hash_len);
--
--	if (psa_status =3D=3D PSA_SUCCESS) {
--
--		psa_status =3D psa_verify_hash(key, alg,
--			hash, hash_len,
--			signature, signature_length);
--	}
--
--	return psa_status;
-+		signature, signature_length);
- }
-diff --git a/components/service/crypto/provider/crypto_provider.c b/comp=
onents/service/crypto/provider/crypto_provider.c
-index d0fc7cac..67a5b340 100644
---- a/components/service/crypto/provider/crypto_provider.c
-+++ b/components/service/crypto/provider/crypto_provider.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -16,8 +16,8 @@ static rpc_status_t destroy_key_handler(void *context,=
 struct call_req* req);
- static rpc_status_t export_key_handler(void *context, struct call_req* =
req);
- static rpc_status_t export_public_key_handler(void *context, struct cal=
l_req* req);
- static rpc_status_t import_key_handler(void *context, struct call_req* =
req);
--static rpc_status_t sign_hash_handler(void *context, struct call_req* r=
eq);
--static rpc_status_t verify_hash_handler(void *context, struct call_req*=
 req);
-+static rpc_status_t asymmetric_sign_handler(void *context, struct call_=
req* req);
-+static rpc_status_t asymmetric_verify_handler(void *context, struct cal=
l_req* req);
- static rpc_status_t asymmetric_decrypt_handler(void *context, struct ca=
ll_req* req);
- static rpc_status_t asymmetric_encrypt_handler(void *context, struct ca=
ll_req* req);
- static rpc_status_t generate_random_handler(void *context, struct call_=
req* req);
-@@ -32,14 +32,16 @@ static const struct service_handler handler_table[] =
=3D {
- 	{TS_CRYPTO_OPCODE_EXPORT_KEY,           export_key_handler},
- 	{TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY,    export_public_key_handler},
- 	{TS_CRYPTO_OPCODE_IMPORT_KEY,           import_key_handler},
--	{TS_CRYPTO_OPCODE_SIGN_HASH,            sign_hash_handler},
--	{TS_CRYPTO_OPCODE_VERIFY_HASH,          verify_hash_handler},
-+	{TS_CRYPTO_OPCODE_SIGN_HASH,            asymmetric_sign_handler},
-+	{TS_CRYPTO_OPCODE_VERIFY_HASH,          asymmetric_verify_handler},
- 	{TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT,   asymmetric_decrypt_handler},
- 	{TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT,   asymmetric_encrypt_handler},
- 	{TS_CRYPTO_OPCODE_GENERATE_RANDOM,      generate_random_handler},
- 	{TS_CRYPTO_OPCODE_COPY_KEY,          	copy_key_handler},
- 	{TS_CRYPTO_OPCODE_PURGE_KEY,          	purge_key_handler},
- 	{TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES, 	get_key_attributes_handler},
-+	{TS_CRYPTO_OPCODE_SIGN_MESSAGE,         asymmetric_sign_handler},
-+	{TS_CRYPTO_OPCODE_VERIFY_MESSAGE,       asymmetric_verify_handler},
- };
-=20
- struct rpc_interface *crypto_provider_init(struct crypto_provider *cont=
ext)
-@@ -272,7 +274,7 @@ static rpc_status_t import_key_handler(void *context=
, struct call_req* req)
- 	return rpc_status;
- }
-=20
--static rpc_status_t sign_hash_handler(void *context, struct call_req* r=
eq)
-+static rpc_status_t asymmetric_sign_handler(void *context, struct call_=
req* req)
- {
- 	rpc_status_t rpc_status =3D TS_RPC_ERROR_SERIALIZATION_NOT_SUPPORTED;
- 	struct call_param_buf *req_buf =3D call_req_get_req_buf(req);
-@@ -284,7 +286,7 @@ static rpc_status_t sign_hash_handler(void *context,=
 struct call_req* req)
- 	uint8_t hash_buffer[PSA_HASH_MAX_SIZE];
-=20
- 	if (serializer)
--		rpc_status =3D serializer->deserialize_sign_hash_req(req_buf, &id, &a=
lg, hash_buffer, &hash_len);
-+		rpc_status =3D serializer->deserialize_asymmetric_sign_req(req_buf, &=
id, &alg, hash_buffer, &hash_len);
-=20
- 	if (rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
-=20
-@@ -292,14 +294,16 @@ static rpc_status_t sign_hash_handler(void *contex=
t, struct call_req* req)
- 		size_t sig_len;
- 		uint8_t sig_buffer[PSA_SIGNATURE_MAX_SIZE];
-=20
--		psa_status =3D psa_sign_hash(id, alg,
--					hash_buffer, hash_len,
--					sig_buffer, sizeof(sig_buffer), &sig_len);
-+		psa_status =3D (call_req_get_opcode(req) =3D=3D TS_CRYPTO_OPCODE_SIGN=
_HASH) ?
-+			psa_sign_hash(id, alg, hash_buffer, hash_len,
-+				sig_buffer, sizeof(sig_buffer), &sig_len) :
-+			psa_sign_message(id, alg, hash_buffer, hash_len,
-+				sig_buffer, sizeof(sig_buffer), &sig_len);
-=20
- 		if (psa_status =3D=3D PSA_SUCCESS) {
-=20
- 			struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
--			rpc_status =3D serializer->serialize_sign_hash_resp(resp_buf, sig_bu=
ffer, sig_len);
-+			rpc_status =3D serializer->serialize_asymmetric_sign_resp(resp_buf, =
sig_buffer, sig_len);
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
-@@ -308,7 +312,7 @@ static rpc_status_t sign_hash_handler(void *context,=
 struct call_req* req)
- 	return rpc_status;
- }
-=20
--static rpc_status_t verify_hash_handler(void *context, struct call_req*=
 req)
-+static rpc_status_t asymmetric_verify_handler(void *context, struct cal=
l_req* req)
- {
- 	rpc_status_t rpc_status =3D TS_RPC_ERROR_SERIALIZATION_NOT_SUPPORTED;
- 	struct call_param_buf *req_buf =3D call_req_get_req_buf(req);
-@@ -322,7 +326,7 @@ static rpc_status_t verify_hash_handler(void *contex=
t, struct call_req* req)
- 	uint8_t sig_buffer[PSA_SIGNATURE_MAX_SIZE];
-=20
- 	if (serializer)
--		rpc_status =3D serializer->deserialize_verify_hash_req(req_buf, &id, =
&alg,
-+		rpc_status =3D serializer->deserialize_asymmetric_verify_req(req_buf,=
 &id, &alg,
- 											hash_buffer, &hash_len,
- 											sig_buffer, &sig_len);
-=20
-@@ -330,9 +334,13 @@ static rpc_status_t verify_hash_handler(void *conte=
xt, struct call_req* req)
-=20
- 		psa_status_t psa_status;
-=20
--		psa_status =3D psa_verify_hash(id, alg,
--					hash_buffer, hash_len,
--					sig_buffer, sig_len);
-+		psa_status =3D (call_req_get_opcode(req) =3D=3D TS_CRYPTO_OPCODE_VERI=
FY_HASH) ?
-+			psa_verify_hash(id, alg,
-+				hash_buffer, hash_len,
-+				sig_buffer, sig_len) :
-+			psa_verify_message(id, alg,
-+				hash_buffer, hash_len,
-+				sig_buffer, sig_len);
-=20
- 		call_req_set_opstatus(req, psa_status);
- 	}
-diff --git a/components/service/crypto/provider/serializer/crypto_provid=
er_serializer.h b/components/service/crypto/provider/serializer/crypto_pr=
ovider_serializer.h
-index 68940cae..57364f24 100644
---- a/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
-+++ b/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
-@@ -79,15 +79,15 @@ struct crypto_provider_serializer {
-                                         const psa_key_attributes_t *att=
ributes);
-=20
-     /* Operation: sign_hash */
--    rpc_status_t (*deserialize_sign_hash_req)(const struct call_param_b=
uf *req_buf,
-+    rpc_status_t (*deserialize_asymmetric_sign_req)(const struct call_p=
aram_buf *req_buf,
-                                         psa_key_id_t *id, psa_algorithm=
_t *alg,
-                                         uint8_t *hash, size_t *hash_len=
);
-=20
--    rpc_status_t (*serialize_sign_hash_resp)(struct call_param_buf *res=
p_buf,
-+    rpc_status_t (*serialize_asymmetric_sign_resp)(struct call_param_bu=
f *resp_buf,
-                                         const uint8_t *sig, size_t sig_=
len);
-=20
-     /* Operation: verify_hash */
--    rpc_status_t (*deserialize_verify_hash_req)(const struct call_param=
_buf *req_buf,
-+    rpc_status_t (*deserialize_asymmetric_verify_req)(const struct call=
_param_buf *req_buf,
-                                         psa_key_id_t *id, psa_algorithm=
_t *alg,
-                                         uint8_t *hash, size_t *hash_len=
,
-                                         uint8_t *sig, size_t *sig_len);
-diff --git a/components/service/crypto/provider/serializer/packed-c/pack=
edc_crypto_provider_serializer.c b/components/service/crypto/provider/ser=
ializer/packed-c/packedc_crypto_provider_serializer.c
-index c70db865..4a7e59f0 100644
---- a/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
-+++ b/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
-@@ -333,7 +333,7 @@ static rpc_status_t serialize_get_key_attributes_res=
p(struct call_param_buf *res
- }
-=20
- /* Operation: sign_hash */
--static rpc_status_t deserialize_sign_hash_req(const struct call_param_b=
uf *req_buf,
-+static rpc_status_t deserialize_asymmetric_sign_req(const struct call_p=
aram_buf *req_buf,
-                             psa_key_id_t *id, psa_algorithm_t *alg,
-                             uint8_t *hash, size_t *hash_len)
- {
-@@ -378,7 +378,7 @@ static rpc_status_t deserialize_sign_hash_req(const =
struct call_param_buf *req_b
-     return rpc_status;
- }
-=20
--static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *res=
p_buf,
-+static rpc_status_t serialize_asymmetric_sign_resp(struct call_param_bu=
f *resp_buf,
-                             const uint8_t *sig, size_t sig_len)
- {
-     rpc_status_t rpc_status =3D TS_RPC_ERROR_INTERNAL;
-@@ -401,7 +401,7 @@ static rpc_status_t serialize_sign_hash_resp(struct =
call_param_buf *resp_buf,
- }
-=20
- /* Operation: verify_hash */
--static rpc_status_t deserialize_verify_hash_req(const struct call_param=
_buf *req_buf,
-+static rpc_status_t deserialize_asymmetric_verify_req(const struct call=
_param_buf *req_buf,
-                                 psa_key_id_t *id, psa_algorithm_t *alg,
-                                 uint8_t *hash, size_t *hash_len,
-                                 uint8_t *sig, size_t *sig_len)
-@@ -695,9 +695,9 @@ const struct crypto_provider_serializer *packedc_cry=
pto_provider_serializer_inst
-         deserialize_purge_key_req,
-         deserialize_get_key_attributes_req,
-         serialize_get_key_attributes_resp,
--        deserialize_sign_hash_req,
--        serialize_sign_hash_resp,
--        deserialize_verify_hash_req,
-+        deserialize_asymmetric_sign_req,
-+        serialize_asymmetric_sign_resp,
-+        deserialize_asymmetric_verify_req,
-         deserialize_asymmetric_decrypt_req,
-         serialize_asymmetric_decrypt_resp,
-         deserialize_asymmetric_encrypt_req,
-diff --git a/components/service/crypto/provider/serializer/protobuf/pb_c=
rypto_provider_serializer.c b/components/service/crypto/provider/serializ=
er/protobuf/pb_crypto_provider_serializer.c
-index 7767d20a..083a581a 100644
---- a/components/service/crypto/provider/serializer/protobuf/pb_crypto_p=
rovider_serializer.c
-+++ b/components/service/crypto/provider/serializer/protobuf/pb_crypto_p=
rovider_serializer.c
-@@ -267,9 +267,9 @@ static rpc_status_t serialize_get_key_attributes_res=
p(struct call_param_buf *res
- }
-=20
- /* Operation: sign_hash */
--static rpc_status_t deserialize_sign_hash_req(const struct call_param_b=
uf *req_buf,
--                            psa_key_id_t *id, psa_algorithm_t *alg,
--                            uint8_t *hash, size_t *hash_len)
-+static rpc_status_t deserialize_asymmetric_sign_req(const struct call_p=
aram_buf *req_buf,
-+							psa_key_id_t *id, psa_algorithm_t *alg,
-+							uint8_t *hash, size_t *hash_len)
- {
-     rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
-     ts_crypto_SignHashIn recv_msg =3D ts_crypto_SignHashIn_init_default=
;
-@@ -295,8 +295,8 @@ static rpc_status_t deserialize_sign_hash_req(const =
struct call_param_buf *req_b
-     return rpc_status;
- }
-=20
--static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *res=
p_buf,
--                            const uint8_t *sig, size_t sig_len)
-+static rpc_status_t serialize_asymmetric_sign_resp(struct call_param_bu=
f *resp_buf,
-+							const uint8_t *sig, size_t sig_len)
- {
-     size_t packed_resp_size;
-     rpc_status_t rpc_status =3D TS_RPC_ERROR_INTERNAL;
-@@ -323,10 +323,10 @@ static rpc_status_t serialize_sign_hash_resp(struc=
t call_param_buf *resp_buf,
- }
-=20
- /* Operation: verify_hash */
--static rpc_status_t deserialize_verify_hash_req(const struct call_param=
_buf *req_buf,
--                                psa_key_id_t *id, psa_algorithm_t *alg,
--                                uint8_t *hash, size_t *hash_len,
--                                uint8_t *sig, size_t *sig_len)
-+static rpc_status_t deserialize_asymmetric_verify_req(const struct call=
_param_buf *req_buf,
-+								psa_key_id_t *id, psa_algorithm_t *alg,
-+								uint8_t *hash, size_t *hash_len,
-+								uint8_t *sig, size_t *sig_len)
- {
-     rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
-     ts_crypto_VerifyHashIn recv_msg =3D ts_crypto_VerifyHashIn_init_def=
ault;
-@@ -538,32 +538,32 @@ static rpc_status_t serialize_generate_random_resp=
(struct call_param_buf *resp_b
- /* Singleton method to provide access to the serializer instance */
- const struct crypto_provider_serializer *pb_crypto_provider_serializer_=
instance(void)
- {
--    static const struct crypto_provider_serializer instance =3D {
--        max_deserialised_parameter_size,
--        deserialize_generate_key_req,
--        serialize_generate_key_resp,
--        deserialize_destroy_key_req,
--        deserialize_export_key_req,
--        serialize_export_key_resp,
--        deserialize_export_public_key_req,
--        serialize_export_public_key_resp,
--        deserialize_import_key_req,
--        serialize_import_key_resp,
--        deserialize_copy_key_req,
--        serialize_copy_key_resp,
--        deserialize_purge_key_req,
--        deserialize_get_key_attributes_req,
--        serialize_get_key_attributes_resp,
--        deserialize_sign_hash_req,
--        serialize_sign_hash_resp,
--        deserialize_verify_hash_req,
--        deserialize_asymmetric_decrypt_req,
--        serialize_asymmetric_decrypt_resp,
--        deserialize_asymmetric_encrypt_req,
--        serialize_asymmetric_encrypt_resp,
--        deserialize_generate_random_req,
--        serialize_generate_random_resp
--    };
--
--    return &instance;
-+	static const struct crypto_provider_serializer instance =3D {
-+		max_deserialised_parameter_size,
-+		deserialize_generate_key_req,
-+		serialize_generate_key_resp,
-+		deserialize_destroy_key_req,
-+		deserialize_export_key_req,
-+		serialize_export_key_resp,
-+		deserialize_export_public_key_req,
-+		serialize_export_public_key_resp,
-+		deserialize_import_key_req,
-+		serialize_import_key_resp,
-+		deserialize_copy_key_req,
-+		serialize_copy_key_resp,
-+		deserialize_purge_key_req,
-+		deserialize_get_key_attributes_req,
-+		serialize_get_key_attributes_resp,
-+		deserialize_asymmetric_sign_req,
-+		serialize_asymmetric_sign_resp,
-+		deserialize_asymmetric_verify_req,
-+		deserialize_asymmetric_decrypt_req,
-+		serialize_asymmetric_decrypt_resp,
-+		deserialize_asymmetric_encrypt_req,
-+		serialize_asymmetric_encrypt_resp,
-+		deserialize_generate_random_req,
-+		serialize_generate_random_resp
-+	};
-+
-+	return &instance;
- }
-diff --git a/components/service/crypto/test/protocol/check_crypto_opcode=
_alignment.cpp b/components/service/crypto/test/protocol/check_crypto_opc=
ode_alignment.cpp
-index bd6c66ee..da01abf4 100644
---- a/components/service/crypto/test/protocol/check_crypto_opcode_alignm=
ent.cpp
-+++ b/components/service/crypto/test/protocol/check_crypto_opcode_alignm=
ent.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -18,15 +18,16 @@ TEST_GROUP(CryptoProtocolOpcodeChecks)
-=20
- TEST(CryptoProtocolOpcodeChecks, checkPackedcToProtobuf)
- {
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_KEY, ts_crypto_Opcode_GENERAT=
E_KEY);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_DESTROY_KEY, ts_crypto_Opcode_DESTROY_=
KEY);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_KEY, ts_crypto_Opcode_EXPORT_KE=
Y);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY, ts_crypto_Opcode_EX=
PORT_PUBLIC_KEY);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_IMPORT_KEY, ts_crypto_Opcode_IMPORT_KE=
Y);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_SIGN_HASH, ts_crypto_Opcode_SIGN_HASH)=
;
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_VERIFY_HASH, ts_crypto_Opcode_VERIFY_H=
ASH);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT, ts_crypto_Opcode_A=
SYMMETRIC_DECRYPT);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT, ts_crypto_Opcode_A=
SYMMETRIC_ENCRYPT);
--    CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_RANDOM, ts_crypto_Opcode_GENE=
RATE_RANDOM);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_KEY, ts_crypto_Opcode_GENERATE_K=
EY);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_DESTROY_KEY, ts_crypto_Opcode_DESTROY_KEY=
);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_KEY, ts_crypto_Opcode_EXPORT_KEY);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY, ts_crypto_Opcode_EXPOR=
T_PUBLIC_KEY);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_IMPORT_KEY, ts_crypto_Opcode_IMPORT_KEY);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_SIGN_HASH, ts_crypto_Opcode_SIGN_HASH);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_VERIFY_HASH, ts_crypto_Opcode_VERIFY_HASH=
);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT, ts_crypto_Opcode_ASYM=
METRIC_DECRYPT);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT, ts_crypto_Opcode_ASYM=
METRIC_ENCRYPT);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_RANDOM, ts_crypto_Opcode_GENERAT=
E_RANDOM);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_SIGN_MESSAGE, ts_crypto_Opcode_SIGN_MESSA=
GE);
-+	CHECK_EQUAL(TS_CRYPTO_OPCODE_VERIFY_MESSAGE, ts_crypto_Opcode_VERIFY_M=
ESSAGE);
- }
--
-diff --git a/components/service/crypto/test/service/crypto_service_scena=
rios.cpp b/components/service/crypto/test/service/crypto_service_scenario=
s.cpp
-index ec2c6736..b3345551 100644
---- a/components/service/crypto/test/service/crypto_service_scenarios.cp=
p
-+++ b/components/service/crypto/test/service/crypto_service_scenarios.cp=
p
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -290,6 +290,56 @@ void crypto_service_scenarios::signAndVerifyHash()
- 	CHECK_EQUAL(PSA_SUCCESS, status);
- }
-=20
-+void crypto_service_scenarios::signAndVerifyMessage()
-+{
-+	psa_status_t status;
-+	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
-+	psa_key_id_t key_id;
-+
-+	psa_set_key_id(&attributes, 14);
-+	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_SIGN_MESSAGE | PSA_=
KEY_USAGE_VERIFY_MESSAGE);
-+	psa_set_key_algorithm(&attributes, PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG=
_SHA_256));
-+	psa_set_key_type(&attributes, PSA_KEY_TYPE_ECC_KEY_PAIR(PSA_ECC_FAMILY=
_SECP_R1));
-+	psa_set_key_bits(&attributes, 256);
-+
-+	/* Generate a key */
-+	status =3D m_crypto_client->generate_key(&attributes, &key_id);
-+	CHECK_EQUAL(PSA_SUCCESS, status);
-+
-+	psa_reset_key_attributes(&attributes);
-+
-+	/* Sign a message */
-+	uint8_t message[21];
-+	uint8_t signature[PSA_SIGNATURE_MAX_SIZE];
-+	size_t signature_length;
-+
-+	memset(message, 0x99, sizeof(message));
-+
-+	status =3D m_crypto_client->sign_message(key_id,
-+		PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG_SHA_256), message, sizeof(message=
),
-+		signature, sizeof(signature), &signature_length);
-+
-+	CHECK_EQUAL(PSA_SUCCESS, status);
-+	CHECK(signature_length > 0);
-+
-+	/* Verify the signature */
-+	status =3D m_crypto_client->verify_message(key_id,
-+		PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG_SHA_256), message, sizeof(message=
),
-+		signature, signature_length);
-+	CHECK_EQUAL(PSA_SUCCESS, status);
-+
-+	/* Change the message and expect verify to fail */
-+	message[0] =3D 0x72;
-+	status =3D m_crypto_client->verify_message(key_id,
-+		PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG_SHA_256), message, sizeof(message=
),
-+		signature, signature_length);
-+	CHECK_EQUAL(PSA_ERROR_INVALID_SIGNATURE, status);
-+
-+	/* Remove the key */
-+	status =3D m_crypto_client->destroy_key(key_id);
-+	CHECK_EQUAL(PSA_SUCCESS, status);
-+}
-+
- void crypto_service_scenarios::signAndVerifyEat()
- {
- 	/* Sign and verify a hash using EAT key type and algorithm */
-@@ -348,7 +398,7 @@ void crypto_service_scenarios::asymEncryptDecrypt()
- 	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
- 	psa_key_id_t key_id;
-=20
--	psa_set_key_id(&attributes, 14);
-+	psa_set_key_id(&attributes, 15);
- 	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_U=
SAGE_DECRYPT);
- 	psa_set_key_algorithm(&attributes, PSA_ALG_RSA_PKCS1V15_CRYPT);
- 	psa_set_key_type(&attributes, PSA_KEY_TYPE_RSA_KEY_PAIR);
-@@ -394,7 +444,7 @@ void crypto_service_scenarios::asymEncryptDecryptWit=
hSalt()
- 	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
- 	psa_key_id_t key_id;
-=20
--	psa_set_key_id(&attributes, 15);
-+	psa_set_key_id(&attributes, 16);
- 	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_U=
SAGE_DECRYPT);
- 	psa_set_key_algorithm(&attributes,  PSA_ALG_RSA_OAEP(PSA_ALG_SHA_256))=
;
- 	psa_set_key_type(&attributes, PSA_KEY_TYPE_RSA_KEY_PAIR);
-diff --git a/components/service/crypto/test/service/crypto_service_scena=
rios.h b/components/service/crypto/test/service/crypto_service_scenarios.=
h
-index c65eba26..23671644 100644
---- a/components/service/crypto/test/service/crypto_service_scenarios.h
-+++ b/components/service/crypto/test/service/crypto_service_scenarios.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -24,6 +24,7 @@ public:
- 	void asymEncryptDecrypt();
- 	void asymEncryptDecryptWithSalt();
- 	void signAndVerifyHash();
-+	void signAndVerifyMessage();
- 	void signAndVerifyEat();
- 	void exportAndImportKeyPair();
- 	void exportPublicKey();
-diff --git a/components/service/crypto/test/service/packed-c/crypto_serv=
ice_packedc_tests.cpp b/components/service/crypto/test/service/packed-c/c=
rypto_service_packedc_tests.cpp
-index 79eddfbb..ea238432 100644
---- a/components/service/crypto/test/service/packed-c/crypto_service_pac=
kedc_tests.cpp
-+++ b/components/service/crypto/test/service/packed-c/crypto_service_pac=
kedc_tests.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -87,6 +87,11 @@ TEST(CryptoServicePackedcTests, signAndVerifyHash)
- 	m_scenarios->signAndVerifyHash();
- }
-=20
-+TEST(CryptoServicePackedcTests, signAndVerifyMessage)
-+{
-+	m_scenarios->signAndVerifyMessage();
-+}
-+
- TEST(CryptoServicePackedcTests, signAndVerifyEat)
- {
- 	m_scenarios->signAndVerifyEat();
-diff --git a/components/service/crypto/test/service/protobuf/crypto_serv=
ice_protobuf_tests.cpp b/components/service/crypto/test/service/protobuf/=
crypto_service_protobuf_tests.cpp
-index 1230752c..c172ad4a 100644
---- a/components/service/crypto/test/service/protobuf/crypto_service_pro=
tobuf_tests.cpp
-+++ b/components/service/crypto/test/service/protobuf/crypto_service_pro=
tobuf_tests.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -77,6 +77,11 @@ TEST(CryptoServiceProtobufTests, signAndVerifyHash)
-     m_scenarios->signAndVerifyHash();
- }
-=20
-+TEST(CryptoServiceProtobufTests, signAndVerifyMessage)
-+{
-+    m_scenarios->signAndVerifyMessage();
-+}
-+
- TEST(CryptoServiceProtobufTests, asymEncryptDecrypt)
- {
-     m_scenarios->asymEncryptDecrypt();
-diff --git a/protocols/service/crypto/packed-c/opcodes.h b/protocols/ser=
vice/crypto/packed-c/opcodes.h
-index a07bd57e..5aebf2fa 100644
---- a/protocols/service/crypto/packed-c/opcodes.h
-+++ b/protocols/service/crypto/packed-c/opcodes.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -25,6 +25,8 @@
- #define TS_CRYPTO_OPCODE_COPY_KEY               (TS_CRYPTO_OPCODE_BASE =
+ 13)
- #define TS_CRYPTO_OPCODE_PURGE_KEY              (TS_CRYPTO_OPCODE_BASE =
+ 14)
- #define TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES     (TS_CRYPTO_OPCODE_BASE =
+ 15)
-+#define TS_CRYPTO_OPCODE_SIGN_MESSAGE           (TS_CRYPTO_OPCODE_BASE =
+ 16)
-+#define TS_CRYPTO_OPCODE_VERIFY_MESSAGE         (TS_CRYPTO_OPCODE_BASE =
+ 17)
-=20
- /* Hash operations */
- #define TS_CRYPTO_OPCODE_HASH_BASE              (0x0200)
-diff --git a/protocols/service/crypto/protobuf/opcodes.proto b/protocols=
/service/crypto/protobuf/opcodes.proto
-index 094d3a02..ef64d044 100644
---- a/protocols/service/crypto/protobuf/opcodes.proto
-+++ b/protocols/service/crypto/protobuf/opcodes.proto
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
- syntax =3D "proto3";
-@@ -18,4 +18,6 @@ enum Opcode {
-   ASYMMETRIC_DECRYPT  =3D 0x010a;
-   ASYMMETRIC_ENCRYPT  =3D 0x010b;
-   GENERATE_RANDOM     =3D 0x010c;
-+  SIGN_MESSAGE        =3D 0x0110;
-+  VERIFY_MESSAGE      =3D 0x0111;
- }
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-trans=
ac.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac=
.patch
deleted file mode 100644
index a56e0f88..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patc=
h
+++ /dev/null
@@ -1,123 +0,0 @@
-From 9a83c32964ee2b1ecb7b36b4c08466202efd3bf2 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Fri, 11 Feb 2022 14:19:26 +0000
-Subject: [PATCH] Add defence against uninitialised multi-part transactio=
n
-
-Adds checks for the condition where there is an attempt to
-setup a multi-part transaction without first initialising
-transaction state.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I754479260fed0490d8f32b41a077d26028dc9903
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- components/service/crypto/client/psa/psa_cipher.c | 14 +++++++++++++-
- components/service/crypto/client/psa/psa_hash.c   |  8 +++++++-
- components/service/crypto/client/psa/psa_mac.c    | 10 ++++++++--
- 3 files changed, 28 insertions(+), 4 deletions(-)
-
-diff --git a/components/service/crypto/client/psa/psa_cipher.c b/compone=
nts/service/crypto/client/psa/psa_cipher.c
-index 70836ea6..3ab8ea21 100644
---- a/components/service/crypto/client/psa/psa_cipher.c
-+++ b/components/service/crypto/client/psa/psa_cipher.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -13,6 +13,12 @@ psa_status_t psa_cipher_encrypt_setup(psa_cipher_oper=
ation_t *operation,
- 	psa_key_id_t key,
- 	psa_algorithm_t alg)
- {
-+	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
-+		return psa_crypto_client_instance.init_status;
-+
-+	if (operation->handle)
-+		return PSA_ERROR_BAD_STATE;
-+
- 	return crypto_caller_cipher_encrypt_setup(&psa_crypto_client_instance.=
base,
- 		&operation->handle,
- 		key, alg);
-@@ -22,6 +28,12 @@ psa_status_t psa_cipher_decrypt_setup(psa_cipher_oper=
ation_t *operation,
- 	psa_key_id_t key,
- 	psa_algorithm_t alg)
- {
-+	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
-+		return psa_crypto_client_instance.init_status;
-+
-+	if (operation->handle)
-+		return PSA_ERROR_BAD_STATE;
-+
- 	return crypto_caller_cipher_decrypt_setup(&psa_crypto_client_instance.=
base,
- 		&operation->handle,
- 		key, alg);
-diff --git a/components/service/crypto/client/psa/psa_hash.c b/component=
s/service/crypto/client/psa/psa_hash.c
-index 7005c390..83278de6 100644
---- a/components/service/crypto/client/psa/psa_hash.c
-+++ b/components/service/crypto/client/psa/psa_hash.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -14,6 +14,9 @@ psa_status_t psa_hash_setup(psa_hash_operation_t *oper=
ation,
- 	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
- 		return psa_crypto_client_instance.init_status;
-=20
-+	if (operation->handle)
-+		return PSA_ERROR_BAD_STATE;
-+
- 	return crypto_caller_hash_setup(&psa_crypto_client_instance.base,
- 		&operation->handle, alg);
- }
-@@ -55,6 +58,9 @@ psa_status_t psa_hash_verify(psa_hash_operation_t *ope=
ration,
- psa_status_t psa_hash_clone(const psa_hash_operation_t *source_operatio=
n,
- 	psa_hash_operation_t *target_operation)
- {
-+	if (target_operation->handle)
-+		return PSA_ERROR_BAD_STATE;
-+
- 	return crypto_caller_hash_clone(&psa_crypto_client_instance.base,
- 		source_operation->handle,
- 		&target_operation->handle);
-diff --git a/components/service/crypto/client/psa/psa_mac.c b/components=
/service/crypto/client/psa/psa_mac.c
-index 5efa1c4d..5c5eb32a 100644
---- a/components/service/crypto/client/psa/psa_mac.c
-+++ b/components/service/crypto/client/psa/psa_mac.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -16,6 +16,9 @@ psa_status_t psa_mac_sign_setup(psa_mac_operation_t *o=
peration,
- 	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
- 		return psa_crypto_client_instance.init_status;
-=20
-+	if (operation->handle)
-+		return PSA_ERROR_BAD_STATE;
-+
- 	return crypto_caller_mac_sign_setup(&psa_crypto_client_instance.base,
- 		&operation->handle,
- 		key, alg);
-@@ -28,7 +31,10 @@ psa_status_t psa_mac_verify_setup(psa_mac_operation_t=
 *operation,
- 	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
- 		return psa_crypto_client_instance.init_status;
-=20
--	return crypto_caller_mac_sign_setup(&psa_crypto_client_instance.base,
-+	if (operation->handle)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	return crypto_caller_mac_verify_setup(&psa_crypto_client_instance.base=
,
- 		&operation->handle,
- 		key, alg);
- }
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0038-Integrate-AEAD-operation-support.patch b/meta-arm-=
bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038=
-Integrate-AEAD-operation-support.patch
deleted file mode 100644
index 2ad1efb7..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0038-Integrate-AEAD-operation-support.patch
+++ /dev/null
@@ -1,521 +0,0 @@
-From 00b4f777b377c69f948f5a9d68cbfc8fa8c38a86 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Fri, 11 Feb 2022 14:24:53 +0000
-Subject: [PATCH] Integrate AEAD operation support
-
-Resolves issues and integrates AEAD support into the crypto service
-provider and clients.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I5fbe78a2dd825f592e26fd665f60c18b576f9de9
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- .../caller/packed-c/crypto_caller_aead.h      |  70 +++---
- .../client/caller/stub/crypto_caller_aead.h   |  12 +-
- .../service/crypto/client/psa/psa_aead.c      | 221 +++++++++++++++---
- .../factory/full/crypto_provider_factory.c    |  16 +-
- .../component-test/component-test.cmake       |   4 +-
- deployments/crypto/opteesp/CMakeLists.txt     |   4 +-
- deployments/libts/linux-pc/CMakeLists.txt     |   4 +-
- deployments/se-proxy/opteesp/CMakeLists.txt   |   4 +-
- 8 files changed, 263 insertions(+), 72 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index 3d9947d5..c4ffb20c 100644
---- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -20,38 +20,6 @@
- extern "C" {
- #endif
-=20
--static inline psa_status_t crypto_caller_aead_encrypt(struct service_cl=
ient *context,
--	psa_key_id_t key,
--	psa_algorithm_t alg,
--	const uint8_t *nonce,
--	size_t nonce_length,
--	const uint8_t *additional_data,
--	size_t additional_data_length,
--	const uint8_t *plaintext,
--	size_t plaintext_length,
--	uint8_t *aeadtext,
--	size_t aeadtext_size,
--	size_t *aeadtext_length)
--{
--	return PSA_ERROR_NOT_SUPPORTED;
--}
--
--static inline psa_status_t crypto_caller_aead_decrypt(struct service_cl=
ient *context,
--	psa_key_id_t key,
--	psa_algorithm_t alg,
--	const uint8_t *nonce,
--	size_t nonce_length,
--	const uint8_t *additional_data,
--	size_t additional_data_length,
--	const uint8_t *aeadtext,
--	size_t aeadtext_length,
--	uint8_t *plaintext,
--	size_t plaintext_size,
--	size_t *plaintext_length)
--{
--	return PSA_ERROR_NOT_SUPPORTED;
--}
--
- static inline psa_status_t common_aead_setup(struct service_client *con=
text,
- 	uint32_t *op_handle,
- 	psa_key_id_t key,
-@@ -247,7 +215,7 @@ static inline psa_status_t crypto_caller_aead_set_le=
ngths(struct service_client
- {
- 	psa_status_t psa_status =3D PSA_ERROR_GENERIC_ERROR;
- 	struct ts_crypto_aead_set_lengths_in req_msg;
--	size_t req_fixed_len =3D sizeof(struct ts_crypto_aead_abort_in);
-+	size_t req_fixed_len =3D sizeof(struct ts_crypto_aead_set_lengths_in);
- 	size_t req_len =3D req_fixed_len;
-=20
- 	req_msg.op_handle =3D op_handle;
-@@ -611,6 +579,40 @@ static inline psa_status_t crypto_caller_aead_abort=
(struct service_client *conte
- 	return psa_status;
- }
-=20
-+/**
-+ * The maximum data length that may be carried in an update operation w=
ill be
-+ * constrained by the maximum call payload capacity imposed by the end-=
to-end
-+ * RPC call path. These functions return the maximum update size when s=
erialization
-+ * overheads are considered. This allows large paylaods to be processed=
 in
-+ * maximum size chunks.
-+ */
-+static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
-+{
-+	/* Returns the maximum number of bytes of additional data that may be
-+	 * carried as a parameter of the aead_update_ad operation
-+	 * using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D sizeof(struct ts_crypto_aead_update_ad_in) + TLV_H=
DR_LEN;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the aead_update operation
-+	 * using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D sizeof(struct ts_crypto_aead_update_in) + TLV_HDR_=
LEN;
-+
-+	/* Allow for output to be a whole number of blocks */
-+	overhead +=3D PSA_BLOCK_CIPHER_BLOCK_MAX_SIZE;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/caller/stub/crypto_caller_=
aead.h b/components/service/crypto/client/caller/stub/crypto_caller_aead.=
h
-index 18aa8cec..455e7ac1 100644
---- a/components/service/crypto/client/caller/stub/crypto_caller_aead.h
-+++ b/components/service/crypto/client/caller/stub/crypto_caller_aead.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -135,6 +135,16 @@ static inline psa_status_t crypto_caller_aead_abort=
(struct service_client *conte
- 	return PSA_ERROR_NOT_SUPPORTED;
- }
-=20
-+static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
-+{
-+	return 0;
-+}
-+
-+static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
-+{
-+	return 0;
-+}
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
-index 22fd3da1..e4579e63 100644
---- a/components/service/crypto/client/psa/psa_aead.c
-+++ b/components/service/crypto/client/psa/psa_aead.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -8,37 +8,6 @@
- #include "psa_crypto_client.h"
- #include "crypto_caller_selector.h"
-=20
--
--psa_status_t psa_aead_encrypt(psa_key_id_t key,
--	psa_algorithm_t alg,
--	const uint8_t *nonce,
--	size_t nonce_length,
--	const uint8_t *additional_data,
--	size_t additional_data_length,
--	const uint8_t *plaintext,
--	size_t plaintext_length,
--	uint8_t *aeadtext,
--	size_t aeadtext_size,
--	size_t *aeadtext_length)
--{
--	return PSA_ERROR_NOT_SUPPORTED;
--}
--
--psa_status_t psa_aead_decrypt(psa_key_id_t key,
--	psa_algorithm_t alg,
--	const uint8_t *nonce,
--	size_t nonce_length,
--	const uint8_t *additional_data,
--	size_t additional_data_length,
--	const uint8_t *aeadtext,
--	size_t aeadtext_length,
--	uint8_t *plaintext,
--	size_t plaintext_size,
--	size_t *plaintext_length)
--{
--	return PSA_ERROR_NOT_SUPPORTED;
--}
--
- psa_status_t psa_aead_encrypt_setup(psa_aead_operation_t *operation,
- 	psa_key_id_t key,
- 	psa_algorithm_t alg)
-@@ -143,3 +112,191 @@ psa_status_t psa_aead_abort(psa_aead_operation_t *=
operation)
- 	return crypto_caller_aead_abort(&psa_crypto_client_instance.base,
- 		operation->handle);
- }
-+
-+static psa_status_t multi_aead_update_ad(psa_aead_operation_t *operatio=
n,
-+	const uint8_t *input,
-+	size_t input_length)
-+{
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	size_t max_update_size =3D
-+		crypto_caller_aead_max_update_ad_size(&psa_crypto_client_instance.bas=
e);
-+	size_t bytes_input =3D 0;
-+
-+	if (!max_update_size) {
-+
-+		/* Don't know the max update size so assume that the entire
-+		 * input and output can be handled in a single update.  If
-+		 * this isn't true, the first aead update operation will fail
-+		 * safely.
-+		 */
-+		max_update_size =3D input_length;
-+	}
-+
-+	while (bytes_input < input_length) {
-+
-+		size_t bytes_remaining =3D input_length - bytes_input;
-+		size_t update_len =3D (bytes_remaining < max_update_size) ?
-+			bytes_remaining :
-+			max_update_size;
-+
-+		psa_status =3D psa_aead_update_ad(operation,
-+			&input[bytes_input], update_len);
-+
-+		if (psa_status !=3D PSA_SUCCESS) break;
-+
-+		bytes_input +=3D update_len;
-+	}
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t multi_aead_update(psa_aead_operation_t *operation,
-+	const uint8_t *input,
-+	size_t input_length,
-+	uint8_t *output,
-+	size_t output_size,
-+	size_t *output_length)
-+{
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	size_t max_update_size =3D
-+		crypto_caller_aead_max_update_size(&psa_crypto_client_instance.base);
-+	size_t bytes_input =3D 0;
-+	size_t bytes_output =3D 0;
-+
-+	*output_length =3D 0;
-+
-+	if (!max_update_size) {
-+
-+		/* Don't know the max update size so assume that the entire
-+		 * input and output can be handled in a single update.  If
-+		 * this isn't true, the first aead update operation will fail
-+		 * safely.
-+		 */
-+		max_update_size =3D input_length;
-+	}
-+
-+	while ((bytes_input < input_length) && (bytes_output < output_size)) {
-+
-+		size_t update_output_len =3D 0;
-+		size_t bytes_remaining =3D input_length - bytes_input;
-+		size_t update_len =3D (bytes_remaining < max_update_size) ?
-+			bytes_remaining :
-+			max_update_size;
-+
-+		psa_status =3D psa_aead_update(operation,
-+			&input[bytes_input], update_len,
-+			&output[bytes_output], output_size - bytes_output, &update_output_le=
n);
-+
-+		if (psa_status !=3D PSA_SUCCESS) break;
-+
-+		bytes_input +=3D update_len;
-+		bytes_output +=3D update_output_len;
-+	}
-+
-+	if (psa_status =3D=3D PSA_SUCCESS) {
-+
-+		*output_length =3D bytes_output;
-+	}
-+
-+	return psa_status;
-+}
-+
-+psa_status_t psa_aead_encrypt(psa_key_id_t key,
-+	psa_algorithm_t alg,
-+	const uint8_t *nonce,
-+	size_t nonce_length,
-+	const uint8_t *additional_data,
-+	size_t additional_data_length,
-+	const uint8_t *plaintext,
-+	size_t plaintext_length,
-+	uint8_t *aeadtext,
-+	size_t aeadtext_size,
-+	size_t *aeadtext_length)
-+{
-+	psa_aead_operation_t operation =3D psa_aead_operation_init();
-+	size_t bytes_output =3D 0;
-+	*aeadtext_length =3D 0;
-+
-+	psa_status_t psa_status =3D psa_aead_encrypt_setup(&operation, key, al=
g);
-+	if (psa_status !=3D PSA_SUCCESS) return psa_status;
-+
-+	if ((psa_status =3D psa_aead_set_lengths(&operation, additional_data_l=
ength, plaintext_length),
-+			psa_status =3D=3D PSA_SUCCESS) &&
-+		(psa_status =3D psa_aead_set_nonce(&operation, nonce, nonce_length),
-+			psa_status =3D=3D PSA_SUCCESS) &&
-+		(psa_status =3D multi_aead_update_ad(&operation, additional_data, add=
itional_data_length),
-+			psa_status =3D=3D PSA_SUCCESS) &&
-+		(psa_status =3D multi_aead_update(&operation, plaintext, plaintext_le=
ngth,
-+			aeadtext, aeadtext_size, &bytes_output),
-+			psa_status =3D=3D PSA_SUCCESS))
-+	{
-+		size_t remaining_aead_len =3D 0;
-+		size_t tag_len =3D 0;
-+
-+		psa_status =3D psa_aead_finish(&operation,
-+			NULL, 0, &remaining_aead_len,
-+			&aeadtext[bytes_output], aeadtext_size - bytes_output, &tag_len);
-+
-+		if (psa_status =3D=3D PSA_SUCCESS) {
-+
-+			*aeadtext_length =3D bytes_output + remaining_aead_len + tag_len;
-+		}
-+	}
-+	else {
-+
-+		psa_aead_abort(&operation);
-+	}
-+
-+	return psa_status;
-+}
-+
-+psa_status_t psa_aead_decrypt(psa_key_id_t key,
-+	psa_algorithm_t alg,
-+	const uint8_t *nonce,
-+	size_t nonce_length,
-+	const uint8_t *additional_data,
-+	size_t additional_data_length,
-+	const uint8_t *aeadtext,
-+	size_t aeadtext_length,
-+	uint8_t *plaintext,
-+	size_t plaintext_size,
-+	size_t *plaintext_length)
-+{
-+	psa_aead_operation_t operation =3D psa_aead_operation_init();
-+	size_t bytes_output =3D 0;
-+	*plaintext_length =3D 0;
-+
-+	psa_status_t psa_status =3D psa_aead_decrypt_setup(&operation, key, al=
g);
-+	if (psa_status !=3D PSA_SUCCESS) return psa_status;
-+
-+	size_t tag_len =3D PSA_ALG_AEAD_GET_TAG_LENGTH(alg);
-+	size_t ciphertext_len =3D (aeadtext_length > tag_len) ? aeadtext_lengt=
h - tag_len : 0;
-+
-+	if ((psa_status =3D psa_aead_set_lengths(&operation, additional_data_l=
ength, ciphertext_len),
-+			psa_status =3D=3D PSA_SUCCESS) &&
-+		(psa_status =3D psa_aead_set_nonce(&operation, nonce, nonce_length),
-+			psa_status =3D=3D PSA_SUCCESS) &&
-+		(psa_status =3D multi_aead_update_ad(&operation, additional_data, add=
itional_data_length),
-+			psa_status =3D=3D PSA_SUCCESS) &&
-+		(psa_status =3D multi_aead_update(&operation, aeadtext, ciphertext_le=
n,
-+			plaintext, plaintext_size, &bytes_output),
-+			psa_status =3D=3D PSA_SUCCESS))
-+	{
-+		size_t remaining_plaintext_len =3D 0;
-+
-+		psa_status =3D psa_aead_verify(&operation,
-+			NULL, 0, &remaining_plaintext_len,
-+			&aeadtext[bytes_output], aeadtext_length - bytes_output);
-+
-+		if (psa_status =3D=3D PSA_SUCCESS) {
-+
-+			*plaintext_length =3D bytes_output + remaining_plaintext_len;
-+		}
-+	}
-+	else {
-+
-+		psa_aead_abort(&operation);
-+	}
-+
-+	return psa_status;
-+}
-diff --git a/components/service/crypto/factory/full/crypto_provider_fact=
ory.c b/components/service/crypto/factory/full/crypto_provider_factory.c
-index 2d926eb6..ee2b4473 100644
---- a/components/service/crypto/factory/full/crypto_provider_factory.c
-+++ b/components/service/crypto/factory/full/crypto_provider_factory.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -17,6 +17,8 @@
- #include <service/crypto/provider/extension/key_derivation/serializer/p=
acked-c/packedc_key_derivation_provider_serializer.h>
- #include <service/crypto/provider/extension/mac/mac_provider.h>
- #include <service/crypto/provider/extension/mac/serializer/packed-c/pac=
kedc_mac_provider_serializer.h>
-+#include <service/crypto/provider/extension/aead/aead_provider.h>
-+#include <service/crypto/provider/extension/aead/serializer/packed-c/pa=
ckedc_aead_provider_serializer.h>
- #include <service/discovery/provider/discovery_provider.h>
- #include <service/discovery/provider/serializer/packed-c/packedc_discov=
ery_provider_serializer.h>
-=20
-@@ -34,6 +36,7 @@ static struct full_crypto_provider
- 	struct cipher_provider cipher_provider;
- 	struct key_derivation_provider key_derivation_provider;
- 	struct mac_provider mac_provider;
-+	struct aead_provider aead_provider;
-=20
- } instance;
-=20
-@@ -98,6 +101,17 @@ struct crypto_provider *crypto_provider_factory_crea=
te(void)
- 	crypto_provider_extend(&instance.crypto_provider,
- 		&instance.mac_provider.base_provider);
-=20
-+	/**
-+	 * Extend with aead operations
-+	 */
-+	aead_provider_init(&instance.aead_provider);
-+
-+	aead_provider_register_serializer(&instance.aead_provider,
-+		TS_RPC_ENCODING_PACKED_C, packedc_aead_provider_serializer_instance()=
);
-+
-+	crypto_provider_extend(&instance.crypto_provider,
-+		&instance.aead_provider.base_provider);
-+
- 	return &instance.crypto_provider;
- }
-=20
-diff --git a/deployments/component-test/component-test.cmake b/deploymen=
ts/component-test/component-test.cmake
-index a0233c34..c3b015ab 100644
---- a/deployments/component-test/component-test.cmake
-+++ b/deployments/component-test/component-test.cmake
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -85,6 +85,8 @@ add_components(
- 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
- 		"components/service/crypto/provider/extension/mac"
- 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
-+		"components/service/crypto/provider/extension/aead"
-+		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
- 		"components/service/crypto/provider/test"
- 		"components/service/crypto/backend/mbedcrypto"
- 		"components/service/crypto/factory/full"
-diff --git a/deployments/crypto/opteesp/CMakeLists.txt b/deployments/cry=
pto/opteesp/CMakeLists.txt
-index 8ada74e9..eb5d0847 100644
---- a/deployments/crypto/opteesp/CMakeLists.txt
-+++ b/deployments/crypto/opteesp/CMakeLists.txt
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -62,6 +62,8 @@ add_components(TARGET "crypto-sp"
- 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
- 		"components/service/crypto/provider/extension/mac"
- 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
-+		"components/service/crypto/provider/extension/aead"
-+		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
- 		"components/service/crypto/factory/full"
- 		"components/service/crypto/backend/mbedcrypto"
- 		"components/service/crypto/backend/mbedcrypto/trng_adapter/platform"
-diff --git a/deployments/libts/linux-pc/CMakeLists.txt b/deployments/lib=
ts/linux-pc/CMakeLists.txt
-index fc98407c..97eaaa73 100644
---- a/deployments/libts/linux-pc/CMakeLists.txt
-+++ b/deployments/libts/linux-pc/CMakeLists.txt
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -71,6 +71,8 @@ add_components(
- 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
- 		"components/service/crypto/provider/extension/mac"
- 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
-+		"components/service/crypto/provider/extension/aead"
-+		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
- 		"components/service/crypto/factory/full"
- 		"components/service/crypto/backend/mbedcrypto"
- 		"components/service/crypto/backend/mbedcrypto/trng_adapter/linux"
-diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
-index 953bb716..24a8ca65 100644
---- a/deployments/se-proxy/opteesp/CMakeLists.txt
-+++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -70,6 +70,8 @@ add_components(TARGET "se-proxy"
- 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
- 		"components/service/crypto/provider/extension/mac"
- 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
-+		"components/service/crypto/provider/extension/aead"
-+		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
- 		"components/service/crypto/factory/full"
- 		"components/service/secure_storage/include"
- 		"components/service/secure_storage/frontend/secure_storage_provider"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.pat=
ch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/cor=
stone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
deleted file mode 100644
index 0c93a26c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 43388a8e071980d9146f935f486a859d0a04322b Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Tue, 15 Feb 2022 15:46:58 +0000
-Subject: [PATCH] Add IV generation to one-shot cipher operation
-
-The functions psa_cipher_encrypt and psa_cipher_decrypt are
-one-shot operations that can take an arbitrary sized input.
-These operations are implemented as client-side functions
-that use multi-part cipher operations to allow large inputs
-to be handled. The existing implementations were missing the
-generation and setting of the IV at the start of the data.
-This was leading to PSA Arch test failures (248 & 249). This
-commit adds the missing IV handling and resolves the test
-failures.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I4afb555ee7062ebb387e5bb27fb1e082288ad8c7
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- .../service/crypto/client/psa/psa_cipher.c    | 40 +++++++++++++++----
- 1 file changed, 33 insertions(+), 7 deletions(-)
-
-diff --git a/components/service/crypto/client/psa/psa_cipher.c b/compone=
nts/service/crypto/client/psa/psa_cipher.c
-index 3ab8ea21..111af829 100644
---- a/components/service/crypto/client/psa/psa_cipher.c
-+++ b/components/service/crypto/client/psa/psa_cipher.c
-@@ -8,7 +8,6 @@
- #include "psa_crypto_client.h"
- #include "crypto_caller_selector.h"
-=20
--
- psa_status_t psa_cipher_encrypt_setup(psa_cipher_operation_t *operation=
,
- 	psa_key_id_t key,
- 	psa_algorithm_t alg)
-@@ -171,9 +170,16 @@ psa_status_t psa_cipher_encrypt(psa_key_id_t key,
-=20
- 	if (psa_status =3D=3D PSA_SUCCESS) {
-=20
-+		size_t ciphertext_len =3D 0;
-+		size_t iv_len =3D 0;
-+
-+		psa_cipher_generate_iv(&operation, output, output_size, &iv_len);
-+
- 		psa_status =3D multi_cipher_update(&operation,
- 			input, input_length,
--			output, output_size, output_length);
-+			&output[iv_len], output_size - iv_len, &ciphertext_len);
-+
-+		*output_length =3D iv_len + ciphertext_len;
- 	}
-=20
- 	return psa_status;
-@@ -187,14 +193,34 @@ psa_status_t psa_cipher_decrypt(psa_key_id_t key,
- 	size_t output_size,
- 	size_t *output_length)
- {
--	psa_cipher_operation_t operation =3D psa_cipher_operation_init();
--	psa_status_t psa_status =3D psa_cipher_decrypt_setup(&operation, key, =
alg);
-+	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
-+	psa_status_t psa_status =3D psa_get_key_attributes(key, &attributes);
-=20
- 	if (psa_status =3D=3D PSA_SUCCESS) {
-=20
--		psa_status =3D multi_cipher_update(&operation,
--			input, input_length,
--			output, output_size, output_length);
-+		psa_cipher_operation_t operation =3D psa_cipher_operation_init();
-+		psa_status =3D psa_cipher_decrypt_setup(&operation, key, alg);
-+
-+		if (psa_status =3D=3D PSA_SUCCESS) {
-+
-+			size_t iv_len =3D PSA_CIPHER_IV_LENGTH(psa_get_key_type(&attributes)=
, alg);
-+
-+			if (input_length >=3D iv_len) {
-+
-+				psa_cipher_set_iv(&operation, input, iv_len);
-+
-+				psa_status =3D multi_cipher_update(&operation,
-+					&input[iv_len], input_length - iv_len,
-+					output, output_size, output_length);
-+			}
-+			else {
-+
-+				psa_cipher_abort(&operation);
-+				psa_status =3D PSA_ERROR_INVALID_ARGUMENT;
-+			}
-+		}
-+
-+		psa_reset_key_attributes(&attributes);
- 	}
-=20
- 	return psa_status;
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0040-Fix-multi-part-termination-on-error.patch b/meta-a=
rm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0=
040-Fix-multi-part-termination-on-error.patch
deleted file mode 100644
index bdafcead..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0040-Fix-multi-part-termination-on-error.patch
+++ /dev/null
@@ -1,241 +0,0 @@
-From 07277e2ab4b54e5844c28f0cb33e64a91aa5f492 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Wed, 16 Feb 2022 10:37:04 +0000
-Subject: [PATCH] Fix multi-part termination on error
-
-For multi-part operations, the PSA Crypto API specifies that if
-the final operation does not return PSA_SUCCESS, the abort
-operaion must be called by a client to clean-up the operation.
-This change modifies behaviour in-line with the API definition.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Ia3d3ec004164647a7ab5988cac45c39c22e76e9a
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- components/service/crypto/client/psa/psa_aead.c       |  8 ++++++++
- components/service/crypto/client/psa/psa_cipher.c     |  4 ++++
- components/service/crypto/client/psa/psa_hash.c       | 10 ++++++++++
- components/service/crypto/client/psa/psa_mac.c        | 10 ++++++++++
- .../crypto/provider/extension/aead/aead_provider.c    | 10 +++++-----
- .../provider/extension/cipher/cipher_provider.c       |  6 +++---
- .../crypto/provider/extension/hash/hash_provider.c    |  6 +++---
- .../crypto/provider/extension/mac/mac_provider.c      | 11 +++++++----
- 8 files changed, 50 insertions(+), 15 deletions(-)
-
-diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
-index e4579e63..559eb6a3 100644
---- a/components/service/crypto/client/psa/psa_aead.c
-+++ b/components/service/crypto/client/psa/psa_aead.c
-@@ -241,6 +241,10 @@ psa_status_t psa_aead_encrypt(psa_key_id_t key,
-=20
- 			*aeadtext_length =3D bytes_output + remaining_aead_len + tag_len;
- 		}
-+		else {
-+
-+			psa_aead_abort(&operation);
-+		}
- 	}
- 	else {
-=20
-@@ -292,6 +296,10 @@ psa_status_t psa_aead_decrypt(psa_key_id_t key,
-=20
- 			*plaintext_length =3D bytes_output + remaining_plaintext_len;
- 		}
-+		else {
-+
-+			psa_aead_abort(&operation);
-+		}
- 	}
- 	else {
-=20
-diff --git a/components/service/crypto/client/psa/psa_cipher.c b/compone=
nts/service/crypto/client/psa/psa_cipher.c
-index 111af829..4e4264b6 100644
---- a/components/service/crypto/client/psa/psa_cipher.c
-+++ b/components/service/crypto/client/psa/psa_cipher.c
-@@ -146,6 +146,10 @@ static psa_status_t multi_cipher_update(psa_cipher_=
operation_t *operation,
-=20
- 				*output_length =3D bytes_output + finish_output_len;
- 			}
-+			else {
-+
-+				psa_cipher_abort(operation);
-+			}
- 		}
- 		else {
-=20
-diff --git a/components/service/crypto/client/psa/psa_hash.c b/component=
s/service/crypto/client/psa/psa_hash.c
-index 83278de6..e5dd0030 100644
---- a/components/service/crypto/client/psa/psa_hash.c
-+++ b/components/service/crypto/client/psa/psa_hash.c
-@@ -137,6 +137,11 @@ psa_status_t psa_hash_compare(psa_algorithm_t alg,
- 	if (psa_status =3D=3D PSA_SUCCESS) {
-=20
- 		psa_status =3D psa_hash_verify(&operation, hash, hash_length);
-+
-+		if (psa_status !=3D PSA_SUCCESS) {
-+
-+			psa_hash_abort(&operation);
-+		}
- 	}
-=20
- 	return psa_status;
-@@ -155,6 +160,11 @@ psa_status_t psa_hash_compute(psa_algorithm_t alg,
- 	if (psa_status =3D=3D PSA_SUCCESS) {
-=20
- 		psa_status =3D psa_hash_finish(&operation, hash, hash_size, hash_leng=
th);
-+
-+		if (psa_status !=3D PSA_SUCCESS) {
-+
-+			psa_hash_abort(&operation);
-+		}
- 	}
-=20
- 	return psa_status;
-diff --git a/components/service/crypto/client/psa/psa_mac.c b/components=
/service/crypto/client/psa/psa_mac.c
-index 5c5eb32a..a3db8644 100644
---- a/components/service/crypto/client/psa/psa_mac.c
-+++ b/components/service/crypto/client/psa/psa_mac.c
-@@ -129,6 +129,11 @@ psa_status_t psa_mac_verify(psa_key_id_t key,
- 	if (psa_status =3D=3D PSA_SUCCESS) {
-=20
- 		psa_status =3D psa_mac_verify_finish(&operation, mac, mac_length);
-+
-+		if (psa_status !=3D PSA_SUCCESS) {
-+
-+			psa_mac_abort(&operation);
-+		}
- 	}
-=20
- 	return psa_status;
-@@ -153,6 +158,11 @@ psa_status_t psa_mac_compute(psa_key_id_t key,
- 	if (psa_status =3D=3D PSA_SUCCESS) {
-=20
- 		psa_status =3D psa_mac_sign_finish(&operation, mac, mac_size, mac_len=
gth);
-+
-+		if (psa_status !=3D PSA_SUCCESS) {
-+
-+			psa_mac_abort(&operation);
-+		}
- 	}
-=20
- 	return psa_status;
-diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index f4e81a03..14a25436 100644
---- a/components/service/crypto/provider/extension/aead/aead_provider.c
-+++ b/components/service/crypto/provider/extension/aead/aead_provider.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -369,9 +369,9 @@ static rpc_status_t aead_finish_handler(void *contex=
t, struct call_req *req)
- 				rpc_status =3D serializer->serialize_aead_finish_resp(resp_buf,
- 					ciphertext, ciphertext_len,
- 					tag, tag_len);
--			}
-=20
--			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
-+				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
-+			}
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
-@@ -418,9 +418,9 @@ static rpc_status_t aead_verify_handler(void *contex=
t, struct call_req *req)
- 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
- 				rpc_status =3D serializer->serialize_aead_verify_resp(resp_buf,
- 					plaintext, plaintext_len);
--			}
-=20
--			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
-+				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
-+			}
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
-diff --git a/components/service/crypto/provider/extension/cipher/cipher_=
provider.c b/components/service/crypto/provider/extension/cipher/cipher_p=
rovider.c
-index 8e7a86de..a5dd0371 100644
---- a/components/service/crypto/provider/extension/cipher/cipher_provide=
r.c
-+++ b/components/service/crypto/provider/extension/cipher/cipher_provide=
r.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -283,9 +283,9 @@ static rpc_status_t cipher_finish_handler(void *cont=
ext, struct call_req* req)
-=20
- 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
- 				rpc_status =3D serializer->serialize_cipher_finish_resp(resp_buf, o=
utput, output_len);
--			}
-=20
--			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
-+				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
-+			}
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
-diff --git a/components/service/crypto/provider/extension/hash/hash_prov=
ider.c b/components/service/crypto/provider/extension/hash/hash_provider.=
c
-index 2c560513..fd39d440 100644
---- a/components/service/crypto/provider/extension/hash/hash_provider.c
-+++ b/components/service/crypto/provider/extension/hash/hash_provider.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -179,9 +179,9 @@ static rpc_status_t hash_finish_handler(void *contex=
t, struct call_req* req)
-=20
- 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
- 				rpc_status =3D serializer->serialize_hash_finish_resp(resp_buf, has=
h, hash_len);
--			}
-=20
--			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
-+				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
-+			}
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
-diff --git a/components/service/crypto/provider/extension/mac/mac_provid=
er.c b/components/service/crypto/provider/extension/mac/mac_provider.c
-index 96fe4cf3..eef55586 100644
---- a/components/service/crypto/provider/extension/mac/mac_provider.c
-+++ b/components/service/crypto/provider/extension/mac/mac_provider.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -181,9 +181,9 @@ static rpc_status_t mac_sign_finish_handler(void *co=
ntext, struct call_req* req)
-=20
- 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
- 				rpc_status =3D serializer->serialize_mac_sign_finish_resp(resp_buf,=
 mac, mac_len);
--			}
-=20
--			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
-+				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
-+			}
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
-@@ -220,7 +220,10 @@ static rpc_status_t mac_verify_finish_handler(void =
*context, struct call_req* re
-=20
- 			psa_status =3D psa_mac_verify_finish(&crypto_context->op.mac, mac, m=
ac_len);
-=20
--			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
-+			if (psa_status =3D=3D PSA_SUCCESS) {
-+
-+				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
-+			}
- 		}
-=20
- 		call_req_set_opstatus(req, psa_status);
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-=
to.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to=
.patch
deleted file mode 100644
index 6a11552d..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patc=
h
+++ /dev/null
@@ -1,49 +0,0 @@
-From 92987ec20beedb44d08d429947958c1c068d815c Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Wed, 16 Feb 2022 11:36:09 +0000
-Subject: [PATCH] Abort AEAD operation if client provided buffer is too s=
mall
-
-To enable PSA Arch test c258 to pass, handling is added in the
-PSA API client adaptor for AEAD (psa_aead.c) to abort an AEAD
-operation if an update operation is performed but the client
-provided buffer for the output is too small.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Ib4b26ebc0a83a8928e1b643fba4becd935f6deb0
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- components/service/crypto/client/psa/psa_aead.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
-index 559eb6a3..c820d222 100644
---- a/components/service/crypto/client/psa/psa_aead.c
-+++ b/components/service/crypto/client/psa/psa_aead.c
-@@ -74,10 +74,22 @@ psa_status_t psa_aead_update(psa_aead_operation_t *o=
peration,
- 	size_t output_size,
- 	size_t *output_length)
- {
--	return crypto_caller_aead_update(&psa_crypto_client_instance.base,
-+	psa_status_t status =3D crypto_caller_aead_update(&psa_crypto_client_i=
nstance.base,
- 		operation->handle,
- 		input, input_length,
- 		output, output_size, output_length);
-+
-+	/*
-+	 * If too small a buffer has been provided for the output, the operati=
on
-+	 * state will have been updated but the result can't be put anywhere. =
This
-+	 * is an unrecoveral condition so abort the operation.
-+	 */
-+	if (status =3D=3D PSA_ERROR_BUFFER_TOO_SMALL) {
-+
-+		psa_aead_abort(operation);
-+	}
-+
-+	return status;
- }
-=20
- psa_status_t psa_aead_finish(psa_aead_operation_t *operation,
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch b/met=
a-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone100=
0/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
deleted file mode 100644
index fedb79ce..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 75c0689513e7da7fb26bf23c1da4e1aa49783d46 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Tue, 11 Jan 2022 09:43:52 +0000
-Subject: [PATCH] Peg to updated t_cose version fc3a4b2c
-
-The current version of TS fails to build due to a regression introduced
-by a new t_cose version in the upstream project.
-The issue is caused by the t_cose external component incorrectly using
-tip of master as the upstream version id, which makes strict dependency
-control impossible. Change the upstream version id to an SHA, to enable
-controlling compatibility issues introduced by future upstream updates.
-
-At the same time update the dependency to the current latest version.
-The upstream project is now compatile with mbedtls 3.0.0 API changes
-so the previously required compatibility patch has been removed.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I9491a5210904cc369846da2af45b0f7e5913bed8
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- .../0002-add-tls3_0_0-compatibility.patch     | 31 -------------------
- external/t_cose/t_cose.cmake                  |  5 ++-
- 2 files changed, 2 insertions(+), 34 deletions(-)
- delete mode 100644 external/t_cose/0002-add-tls3_0_0-compatibility.patc=
h
-
-diff --git a/external/t_cose/0002-add-tls3_0_0-compatibility.patch b/ext=
ernal/t_cose/0002-add-tls3_0_0-compatibility.patch
-deleted file mode 100644
-index 20a7d131..00000000
---- a/external/t_cose/0002-add-tls3_0_0-compatibility.patch
-+++ /dev/null
-@@ -1,31 +0,0 @@
--diff --git a/crypto_adapters/t_cose_psa_crypto.c b/crypto_adapters/t_co=
se_psa_crypto.c
--index 49c5b60..3aa7b58 100644
----- a/crypto_adapters/t_cose_psa_crypto.c
--+++ b/crypto_adapters/t_cose_psa_crypto.c
--@@ -99,7 +99,7 @@ static enum t_cose_err_t psa_status_to_t_cose_error_s=
igning(psa_status_t err)
--            err =3D=3D PSA_ERROR_INVALID_SIGNATURE   ? T_COSE_ERR_SIG_V=
ERIFY :
--            err =3D=3D PSA_ERROR_NOT_SUPPORTED       ? T_COSE_ERR_UNSUP=
PORTED_SIGNING_ALG:
--            err =3D=3D PSA_ERROR_INSUFFICIENT_MEMORY ? T_COSE_ERR_INSUF=
FICIENT_MEMORY :
---           err =3D=3D PSA_ERROR_TAMPERING_DETECTED  ? T_COSE_ERR_TAMPE=
RING_DETECTED :
--+           err =3D=3D PSA_ERROR_CORRUPTION_DETECTED ? T_COSE_ERR_TAMPE=
RING_DETECTED :
--                                                   T_COSE_ERR_SIG_FAIL;
-- }
--=20
--@@ -152,7 +152,7 @@ t_cose_crypto_pub_key_verify(int32_t               =
cose_algorithm_id,
--      * Crypto ceases providing backwards compatibility then this code
--      * has to be changed to use psa_verify_hash().
--      */
---    psa_result =3D psa_asymmetric_verify(verification_key_psa,
--+    psa_result =3D psa_verify_hash(verification_key_psa,
--                                        psa_alg_id,
--                                        hash_to_verify.ptr,
--                                        hash_to_verify.len,
--@@ -212,7 +212,7 @@ t_cose_crypto_pub_key_sign(int32_t                c=
ose_algorithm_id,
--      * providing backwards compatibility then this code has to be
--      * changed to use psa_sign_hash().
--      */
---    psa_result =3D psa_asymmetric_sign(signing_key_psa,
--+    psa_result =3D psa_sign_hash(signing_key_psa,
--                                      psa_alg_id,
--                                      hash_to_sign.ptr,
--                                      hash_to_sign.len,
-diff --git a/external/t_cose/t_cose.cmake b/external/t_cose/t_cose.cmake
-index 660824bd..9321466f 100644
---- a/external/t_cose/t_cose.cmake
-+++ b/external/t_cose/t_cose.cmake
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -16,7 +16,7 @@ endif()
-=20
- # External component details
- set(T_COSE_URL "https://github.com/laurencelundblade/t_cose.git" CACHE =
STRING "t_cose repository URL")
--set(T_COSE_REFSPEC "master" CACHE STRING "t_cose git refspec")
-+set(T_COSE_REFSPEC "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f" CACHE STR=
ING "t_cose git refspec")
- set(T_COSE_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/t_cose_install" CA=
CHE PATH "t_cose installation directory")
- set(T_COSE_PACKAGE_PATH "${T_COSE_INSTALL_PATH}/libt_cose/cmake" CACHE =
PATH "t_cose CMake package directory")
-=20
-@@ -37,7 +37,6 @@ FetchContent_Declare(
-=20
- 	PATCH_COMMAND git stash
- 		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0001-add-install-definition.=
patch
--		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/0002-add-tls3_0_0-compati=
bility.patch
- 		COMMAND git reset HEAD~1
-=20
- )
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0043-pass-sysroot_yocto.patch b/meta-arm-bsp/recipes-se=
curity/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_=
yocto.patch
deleted file mode 100644
index 64ac0940..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0043-pass-sysroot_yocto.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 24436d459ddde697c89ff947c821cec9c5e0906e Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 16 Feb 2022 15:55:55 +0000
-Subject: [PATCH] pass sysroot_yocto
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- deployments/libts/libts-import.cmake         |  3 +++
- external/MbedTLS/MbedTLS.cmake               |  1 +
- external/psa_arch_tests/psa_arch_tests.cmake | 25 +++++++++++++-------
- 3 files changed, 20 insertions(+), 9 deletions(-)
-
-diff --git a/deployments/libts/libts-import.cmake b/deployments/libts/li=
bts-import.cmake
-index 792ba86c..b900ce3f 100644
---- a/deployments/libts/libts-import.cmake
-+++ b/deployments/libts/libts-import.cmake
-@@ -27,9 +27,12 @@ set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_de=
ps/libts-build" CACHE PATH
-=20
- file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
-=20
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=3D${SYSROOT_YOCTO}")
-+
- #Configure the library
- execute_process(COMMAND
- 	${CMAKE_COMMAND}
-+                -DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
- 		-DCMAKE_INSTALL_PREFIX=3D${LIBTS_INSTALL_PATH}
- 		-GUnix\ Makefiles
- 		${LIBTS_SOURCE_DIR}
-diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
-index 3350d8a0..33467cf0 100644
---- a/external/MbedTLS/MbedTLS.cmake
-+++ b/external/MbedTLS/MbedTLS.cmake
-@@ -103,6 +103,7 @@ if (NOT MBEDCRYPTO_LIB_FILE)
- 	execute_process(COMMAND
- 		${CMAKE_COMMAND} -E env CROSS_COMPILE=3D${CROSS_COMPILE}
- 			${CMAKE_COMMAND}
-+                                -DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
- 				-DENABLE_PROGRAMS=3DOFF
- 				-DENABLE_TESTING=3DOFF
- 				-DUNSAFE_BUILD=3DON
-diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
-index f6d2fb9f..42f73a37 100644
---- a/external/psa_arch_tests/psa_arch_tests.cmake
-+++ b/external/psa_arch_tests/psa_arch_tests.cmake
-@@ -5,30 +5,33 @@
- #
- #----------------------------------------------------------------------=
---------
-=20
--# Temporarily using modified tests used for tf-m verification
-+# Determine the number of processes to run while running parallel build=
s.
-+# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
-+if(NOT DEFINED PROCESSOR_COUNT)
-+	include(ProcessorCount)
-+	ProcessorCount(PROCESSOR_COUNT)
-+	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
-+endif()
-+
- set(PSA_ARCH_TESTS_URL "https://github.com/bensze01/psa-arch-tests.git"=
 CACHE STRING "psa-arch-tests repository URL")
- set(PSA_ARCH_TESTS_REFSPEC "fix-multipart-aead" CACHE STRING "psa-arch-=
tests git refspec")
--
--#set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests=
.git" CACHE STRING "psa-arch-tests repository URL")
--#set(PSA_ARCH_TESTS_REFSPEC "2a1852252a9b9af655cbe02d5d3c930952d0d798" =
CACHE STRING "psa-arch-tests v22.01_API1.4_ADAC_BETA")
- set(PSA_ARCH_TESTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/psa-arch-t=
ests_install" CACHE PATH "psa-arch-tests installation directory")
- set(PSA_ARCH_TESTS_PACKAGE_PATH "${PSA_ARCH_TESTS_INSTALL_PATH}/libpsa-=
arch-tests/cmake" CACHE PATH "psa-arch-tests CMake package directory")
--set(PSA_ARCH_TESTS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/psa_ar=
ch_tests-src" CACHE PATH "psa-arch-tests source.")
-+
-+include(FetchContent)
-=20
- # Checking git
- find_program(GIT_COMMAND "git")
- if (NOT GIT_COMMAND)
- 	message(FATAL_ERROR "Please install git")
- endif()
--
-+if ("${PSA_ARCH_TESTS_PATH}" STREQUAL "DOWNLOAD")
- # Fetching psa-arch-tests
- FetchContent_Declare(
- 	psa-arch-tests
- 	GIT_REPOSITORY ${PSA_ARCH_TESTS_URL}
- 	GIT_TAG ${PSA_ARCH_TESTS_REFSPEC}
- 	GIT_SHALLOW TRUE
--	PATCH_COMMAND git stash
--		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/modify_attest_config.patc=
h
- )
-=20
- # FetchContent_GetProperties exports psa-arch-tests_SOURCE_DIR and psa-=
arch-tests_BINARY_DIR variables
-@@ -37,7 +40,10 @@ if(NOT psa-arch-tests_POPULATED)
- 	message(STATUS "Fetching psa-arch-tests")
- 	FetchContent_Populate(psa-arch-tests)
- endif()
--
-+else()
-+    set(psa-arch-tests_SOURCE_DIR "${TS_ROOT}/../psa-arch-tests")
-+    set(psa-arch-tests_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}")
-+endif()
- # Ensure list of include paths is separated correctly
- string(REPLACE ";" "\\;" PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS "${PSA_A=
RCH_TESTS_EXTERNAL_INCLUDE_PATHS}")
-=20
-@@ -47,6 +53,7 @@ string(REPLACE ";" " " PSA_ARCH_TEST_EXTERNAL_DEFS "${=
PSA_ARCH_TEST_EXTERNAL_DEF
- # Configure the psa-arch-test library
- execute_process(COMMAND
- 	${CMAKE_COMMAND}
-+			-DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
- 			-DTOOLCHAIN=3DINHERIT
- 			-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
- 			-DPSA_INCLUDE_PATHS=3D${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-c=
ha.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha=
.patch
deleted file mode 100644
index 68d0a978..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patc=
h
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0a0007d594db2fceed413cd73e7f08dd8d8ddd57 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 13 Feb 2022 09:01:10 +0000
-Subject: [PATCH] Fix: Crypto interface structure aligned with tf-m chang=
e.
-
-NO NEED TO RAISE PR: The PR for this FIX  is raied by Emek.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-index c13c20e8..ec25eaf8 100644
---- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-@@ -38,7 +38,8 @@ struct psa_ipc_crypto_pack_iovec {
- 				      *   multipart operation
- 				      */
- 	uint32_t capacity;             /*!< Key derivation capacity */
--
-+	uint32_t ad_length;            /*!< Additional Data length for multipa=
rt AEAD */
-+	uint32_t plaintext_length;     /*!< Plaintext length for multipart AEA=
D */
- 	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily=
 used for
- 							    *   AEAD until the API is
- 							    *   restructured
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0045-Integrate-remaining-psa-ipc-client-APIs.patch
deleted file mode 100644
index a08ab32f..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch
+++ /dev/null
@@ -1,494 +0,0 @@
-From b8060d9e15b1b910cf9b466a3f43088c71d7a38f Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 13 Feb 2022 09:49:51 +0000
-Subject: [PATCH] Integrate remaining psa-ipc client APIs.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- .../caller/psa_ipc/crypto_caller_aead.h       | 297 +++++++++++++++++-
- .../caller/psa_ipc/crypto_caller_sign_hash.h  |  35 +++
- .../psa_ipc/crypto_caller_verify_hash.h       |  33 +-
- 3 files changed, 352 insertions(+), 13 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-index 78517fe3..f6aadd8b 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -152,7 +152,27 @@ static inline psa_status_t crypto_caller_aead_encry=
pt_setup(
- 					    psa_key_id_t key,
- 					    psa_algorithm_t alg)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
-+	    .key_id =3D key,
-+	    .alg =3D alg,
-+	    .op_handle =3D (*op_handle),
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_decrypt_setup(
-@@ -161,7 +181,26 @@ static inline psa_status_t crypto_caller_aead_decry=
pt_setup(
- 					    psa_key_id_t key,
- 					    psa_algorithm_t alg)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
-+	    .key_id =3D key,
-+	    .alg =3D alg,
-+	    .op_handle =3D (*op_handle),
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_generate_nonce(
-@@ -171,7 +210,27 @@ static inline psa_status_t crypto_caller_aead_gener=
ate_nonce(
- 					     size_t nonce_size,
- 					     size_t *nonce_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_size}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*nonce_length =3D out_vec[1].len;
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_set_nonce(
-@@ -180,7 +239,25 @@ static inline psa_status_t crypto_caller_aead_set_n=
once(
- 						const uint8_t *nonce,
- 						size_t nonce_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_set_lengths(
-@@ -189,7 +266,27 @@ static inline psa_status_t crypto_caller_aead_set_l=
engths(
- 					  size_t ad_length,
- 					  size_t plaintext_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
-+	    .ad_length =3D ad_length,
-+	    .plaintext_length =3D plaintext_length,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_update_ad(
-@@ -198,7 +295,35 @@ static inline psa_status_t crypto_caller_aead_updat=
e_ad(
- 						const uint8_t *input,
- 						size_t input_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional input */
-+	if ((input =3D=3D NULL) && (input_length !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	size_t in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (input =3D=3D NULL) {
-+	    in_len--;
-+	}
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   in_len, out_vec, IOVEC_LEN(out_vec));
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_update(
-@@ -210,7 +335,38 @@ static inline psa_status_t crypto_caller_aead_updat=
e(
- 					     size_t output_size,
- 					     size_t *output_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional input */
-+	if ((input =3D=3D NULL) && (input_length !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_const_to_u32(output), .len =3D output_size},
-+	};
-+
-+	size_t in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (input =3D=3D NULL) {
-+	    in_len--;
-+	}
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[1].len;
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_finish(
-@@ -223,7 +379,48 @@ static inline psa_status_t crypto_caller_aead_finis=
h(
- 					     size_t tag_size,
- 					     size_t *tag_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional output */
-+	if ((aeadtext =3D=3D NULL) && (aeadtext_size !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_const_to_u32(tag), .len =3D tag_size},
-+	    {.base =3D psa_ptr_const_to_u32(aeadtext), .len =3D aeadtext_size}
-+	};
-+
-+	size_t out_len =3D IOVEC_LEN(out_vec);
-+
-+	if (aeadtext =3D=3D NULL || aeadtext_size =3D=3D 0) {
-+	    out_len--;
-+	}
-+	if ((out_len =3D=3D 3) && (aeadtext_length =3D=3D NULL)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, out_len);
-+
-+	*tag_length =3D out_vec[1].len;
-+
-+	if (out_len =3D=3D 3) {
-+	    *aeadtext_length =3D out_vec[2].len;
-+	} else {
-+	    *aeadtext_length =3D 0;
-+	}
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_verify(
-@@ -235,14 +432,94 @@ static inline psa_status_t crypto_caller_aead_veri=
fy(
- 					     const uint8_t *tag,
- 					     size_t tag_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional output */
-+	if ((plaintext =3D=3D NULL) && (plaintext_size !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_const_to_u32(tag), .len =3D tag_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_const_to_u32(plaintext), .len =3D plaintext_siz=
e},
-+	};
-+
-+	size_t out_len =3D IOVEC_LEN(out_vec);
-+
-+	if (plaintext =3D=3D NULL || plaintext_size =3D=3D 0) {
-+	    out_len--;
-+	}
-+	if ((out_len =3D=3D 2) && (plaintext_length =3D=3D NULL)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, out_len);
-+
-+	if (out_len =3D=3D 2) {
-+	    *plaintext_length =3D out_vec[1].len;
-+	} else {
-+	    *plaintext_length =3D 0;
-+	}
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_abort(
- 					    struct service_client *context,
- 					    uint32_t op_handle)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	return status;
-+}
-+
-+static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
-+{
-+       /* Returns the maximum number of bytes that may be
-+        * carried as a parameter of the mac_update operation
-+        *  using the packed-c encoding.
-+        */
-+       size_t payload_space =3D context->service_info.max_payload;
-+       size_t overhead =3D iov_size;
-+
-+       return (payload_space > overhead) ? payload_space - overhead : 0=
;
-+}
-+
-+static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the mac_update operation
-+	 *  using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
- }
-=20
- #ifdef __cplusplus
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-index 71d88ced..e4a2b167 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-@@ -57,6 +57,41 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
- 	return status;
- }
-=20
-+static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
-+						   psa_key_id_t id,
-+						   psa_algorithm_t alg,
-+						   const uint8_t *hash,
-+						   size_t hash_length,
-+						   uint8_t *signature,
-+						   size_t signature_size,
-+						   size_t *signature_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_SIGN_MESSAGE_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(signature), .len =3D signature_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*signature_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-index e16f6e54..cc9279ee 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-@@ -24,19 +24,20 @@
- extern "C" {
- #endif
-=20
--static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+static inline psa_status_t crypto_caller_common(struct service_client *=
context,
- 						     psa_key_id_t id,
- 						     psa_algorithm_t alg,
- 						     const uint8_t *hash,
- 						     size_t hash_length,
- 						     const uint8_t *signature,
--						     size_t signature_length)
-+						     size_t signature_length,
-+						     uint32_t sfn_id)
- {
- 	struct service_client *ipc =3D context;
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_VERIFY_HASH_SID,
-+		.sfn_id =3D sfn_id,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-@@ -52,6 +53,32 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
- 	return status;
- }
-=20
-+static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+						     psa_key_id_t id,
-+						     psa_algorithm_t alg,
-+						     const uint8_t *hash,
-+						     size_t hash_length,
-+						     const uint8_t *signature,
-+						     size_t signature_length)
-+{
-+
-+	return crypto_caller_common(context,id,alg,hash,hash_length,
-+			signature,signature_length, TFM_CRYPTO_VERIFY_HASH_SID);
-+}
-+
-+static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
-+						     psa_key_id_t id,
-+						     psa_algorithm_t alg,
-+						     const uint8_t *hash,
-+						     size_t hash_length,
-+						     const uint8_t *signature,
-+						     size_t signature_length)
-+{
-+
-+	return crypto_caller_common(context,id,alg,hash,hash_length,
-+			signature,signature_length, TFM_CRYPTO_VERIFY_MESSAGE_SID);
-+}
-+
- #ifdef __cplusplus
- }
- #endif
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-t=
he.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the=
.patch
deleted file mode 100644
index 4bd846d2..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patc=
h
+++ /dev/null
@@ -1,40 +0,0 @@
-From a037ef21c0334117ad0741776a4b7b6e1a428d19 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Mon, 14 Feb 2022 17:52:00 +0000
-Subject: [PATCH] Fix : update psa_set_key_usage_flags definition to the =
latest
- from the tf-m
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- components/service/crypto/include/psa/crypto_struct.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/components/service/crypto/include/psa/crypto_struct.h b/com=
ponents/service/crypto/include/psa/crypto_struct.h
-index 1bc55e37..b4a7ed4b 100644
---- a/components/service/crypto/include/psa/crypto_struct.h
-+++ b/components/service/crypto/include/psa/crypto_struct.h
-@@ -155,9 +155,19 @@ static inline psa_key_lifetime_t psa_get_key_lifeti=
me(
-     return( attributes->lifetime );
- }
-=20
-+static inline void psa_extend_key_usage_flags( psa_key_usage_t *usage_f=
lags )
-+{
-+    if( *usage_flags & PSA_KEY_USAGE_SIGN_HASH )
-+        *usage_flags |=3D PSA_KEY_USAGE_SIGN_MESSAGE;
-+
-+    if( *usage_flags & PSA_KEY_USAGE_VERIFY_HASH )
-+        *usage_flags |=3D PSA_KEY_USAGE_VERIFY_MESSAGE;
-+}
-+
- static inline void psa_set_key_usage_flags(psa_key_attributes_t *attrib=
utes,
-                                            psa_key_usage_t usage_flags)
- {
-+    psa_extend_key_usage_flags( &usage_flags );
-     attributes->usage =3D usage_flags;
- }
-=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/=
meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone=
1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
deleted file mode 100644
index 4ad4be00..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 55463b12cca39d2c6a3fd18bbd3d28ae95dff8cf Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH] Fixes in AEAD for psa-arch test 54 and 58.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-
----
- .../crypto/client/caller/packed-c/crypto_caller_aead.h    | 1 +
- components/service/crypto/include/psa/crypto_sizes.h      | 2 +-
- .../crypto/provider/extension/aead/aead_provider.c        | 8 ++++++--
- .../extension/aead/serializer/aead_provider_serializer.h  | 1 +
- .../packed-c/packedc_aead_provider_serializer.c           | 2 ++
- protocols/service/crypto/packed-c/aead.h                  | 1 +
- 6 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index c4ffb20c..a91f66c1 100644
---- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-@@ -309,6 +309,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
- 	size_t req_len =3D req_fixed_len;
-=20
- 	*output_length =3D 0;
-+        req_msg.output_size =3D output_size;
- 	req_msg.op_handle =3D op_handle;
-=20
- 	/* Mandatory input data parameter */
-diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 4d7bf6e9..e3c4df29 100644
---- a/components/service/crypto/include/psa/crypto_sizes.h
-+++ b/components/service/crypto/include/psa/crypto_sizes.h
-@@ -351,7 +351,7 @@
-  *       just the largest size that may be generated by
-  *       #psa_aead_generate_nonce().
-  */
--#define PSA_AEAD_NONCE_MAX_SIZE 12
-+#define PSA_AEAD_NONCE_MAX_SIZE 16
-=20
- /** A sufficient output buffer size for psa_aead_update().
-  *
-diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index 14a25436..6b144db8 100644
---- a/components/service/crypto/provider/extension/aead/aead_provider.c
-+++ b/components/service/crypto/provider/extension/aead/aead_provider.c
-@@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct call_req *req)
- 	uint32_t op_handle;
- 	const uint8_t *input;
- 	size_t input_len;
-+        uint32_t recv_output_size;
-=20
- 	if (serializer)
- 		rpc_status =3D serializer->deserialize_aead_update_req(req_buf, &op_h=
andle,
--			&input, &input_len);
-+			&recv_output_size, &input, &input_len);
-=20
- 	if (rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
-=20
-@@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct call_req *req)
- 		if (crypto_context) {
-=20
- 			size_t output_len =3D 0;
--			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(input_len);
-+			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(24);
- 			uint8_t *output =3D malloc(output_size);
-=20
-+                        if (recv_output_size < output_size) {
-+                            output_size =3D recv_output_size;
-+                        }
- 			if (output) {
-=20
- 				psa_status =3D psa_aead_update(&crypto_context->op.aead,
-diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
-index bb1a2a97..0156aaba 100644
---- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
-+++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
-@@ -51,6 +51,7 @@ struct aead_provider_serializer {
- 	/* Operation: aead_update */
- 	rpc_status_t (*deserialize_aead_update_req)(const struct call_param_bu=
f *req_buf,
- 		uint32_t *op_handle,
-+                uint32_t *output_size,
- 		const uint8_t **input, size_t *input_len);
-=20
- 	rpc_status_t (*serialize_aead_update_resp)(struct call_param_buf *resp=
_buf,
-diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
-index 6f00b3e3..45c739ab 100644
---- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
-+++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
-@@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct call_param_buf *
- /* Operation: aead_update */
- static rpc_status_t deserialize_aead_update_req(const struct call_param=
_buf *req_buf,
- 	uint32_t *op_handle,
-+        uint32_t *output_size,
- 	const uint8_t **input, size_t *input_len)
- {
- 	rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
-@@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(cons=
t struct call_param_buf *req
- 		memcpy(&recv_msg, req_buf->data, expected_fixed_len);
-=20
- 		*op_handle =3D recv_msg.op_handle;
-+                *output_size =3D recv_msg.output_size;
-=20
- 		tlv_const_iterator_begin(&req_iter,
- 			(uint8_t*)req_buf->data + expected_fixed_len,
-diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
-index 0be266b5..435fd3b5 100644
---- a/protocols/service/crypto/packed-c/aead.h
-+++ b/protocols/service/crypto/packed-c/aead.h
-@@ -98,6 +98,7 @@ enum
- struct __attribute__ ((__packed__)) ts_crypto_aead_update_in
- {
-   uint32_t op_handle;
-+  uint32_t output_size;
- };
-=20
- /* Variable length input parameter tags */
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0048-Fix-UEFI-get_variable-with-small-buffer.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0048-Fix-UEFI-get_variable-with-small-buffer.patch
deleted file mode 100644
index e4573a51..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0048-Fix-UEFI-get_variable-with-small-buffer.patch
+++ /dev/null
@@ -1,407 +0,0 @@
-Upstream-Status: Pending=20
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 2d975e5ec5df6f81d6c35fe927f72d49181142f8 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Tue, 19 Jul 2022 12:43:30 +0100
-Subject: [PATCH] Fix UEFI get_variable with small buffer
-
-The handling of the UEFI get_variable operation was incorrect when
-a small or zero data length was specified by a requester. A zero
-length data length is a legitimate way to discover the size of a
-variable without actually retrieving its data. This change adds
-test cases that reproduce the problem and a fix.
-
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: Iec087fbf9305746d1438888e871602ec0ce15824
----
- .../backend/test/variable_store_tests.cpp     | 60 ++++++++++++++++--
- .../backend/uefi_variable_store.c             | 46 +++++++++++---
- .../client/cpp/smm_variable_client.cpp        | 33 +++++-----
- .../client/cpp/smm_variable_client.h          |  8 ++-
- .../provider/smm_variable_provider.c          |  2 +-
- .../service/smm_variable_service_tests.cpp    | 62 +++++++++++++++++++
- 6 files changed, 179 insertions(+), 32 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/test/variable_store=
_tests.cpp b/components/service/smm_variable/backend/test/variable_store_=
tests.cpp
-index 235642e6..98faf761 100644
---- a/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-+++ b/components/service/smm_variable/backend/test/variable_store_tests.=
cpp
-@@ -128,7 +128,8 @@ TEST_GROUP(UefiVariableStoreTests)
-=20
- 	efi_status_t get_variable(
- 		const std::wstring &name,
--		std::string &data)
-+		std::string &data,
-+		size_t data_len_clamp =3D VARIABLE_BUFFER_SIZE)
- 	{
- 		std::vector<int16_t> var_name =3D to_variable_name(name);
- 		size_t name_size =3D var_name.size() * sizeof(int16_t);
-@@ -144,21 +145,40 @@ TEST_GROUP(UefiVariableStoreTests)
- 		access_variable->NameSize =3D name_size;
- 		memcpy(access_variable->Name, var_name.data(), name_size);
-=20
--		access_variable->DataSize =3D 0;
-+		size_t max_data_len =3D (data_len_clamp =3D=3D VARIABLE_BUFFER_SIZE) =
?
-+			VARIABLE_BUFFER_SIZE -
-+				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(access_variabl=
e) :
-+			data_len_clamp;
-+
-+		access_variable->DataSize =3D max_data_len;
-=20
- 		efi_status_t status =3D uefi_variable_store_get_variable(
- 			&m_uefi_variable_store,
- 			access_variable,
--			VARIABLE_BUFFER_SIZE -
--				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(access_variabl=
e),
-+			max_data_len,
- 			&total_size);
-=20
-+		data.clear();
-+
- 		if (status =3D=3D EFI_SUCCESS) {
-=20
- 			const char *data_start =3D (const char*)(msg_buffer +
- 				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(access_variabl=
e));
-=20
- 			data =3D std::string(data_start, access_variable->DataSize);
-+
-+			UNSIGNED_LONGLONGS_EQUAL(
-+				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_TOTAL_SIZE(access_variable=
),
-+				total_size);
-+		}
-+		else if (status =3D=3D EFI_BUFFER_TOO_SMALL) {
-+
-+			/* String length set to reported variable length */
-+			data.insert(0, access_variable->DataSize, '!');
-+
-+			UNSIGNED_LONGLONGS_EQUAL(
-+				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(access_variabl=
e),
-+				total_size);
- 		}
-=20
- 		return status;
-@@ -336,6 +356,38 @@ TEST(UefiVariableStoreTests, persistentSetGet)
- 	LONGS_EQUAL(0, input_data.compare(output_data));
- }
-=20
-+TEST(UefiVariableStoreTests, getWithSmallBuffer)
-+{
-+	efi_status_t status =3D EFI_SUCCESS;
-+	std::wstring var_name =3D L"test_variable";
-+	std::string input_data =3D "quick brown fox";
-+	std::string output_data;
-+
-+	/* A get with a zero length buffer is a legitimate way to
-+	 * discover the variable size. This test performs GetVariable
-+	 * operations with various buffer small buffer sizes. */
-+	status =3D set_variable(var_name, input_data, 0);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	/* First get the variable without a constrained buffer */
-+	status =3D get_variable(var_name, output_data);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-+
-+	/* Expect got variable data to be the same as the set value */
-+	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
-+	LONGS_EQUAL(0, input_data.compare(output_data));
-+
-+	/* Now try with a zero length buffer */
-+	status =3D get_variable(var_name, output_data, 0);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, status);
-+	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
-+
-+	/* Try with a non-zero length but too small buffer */
-+	status =3D get_variable(var_name, output_data, input_data.size() -1);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, status);
-+	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
-+}
-+
- TEST(UefiVariableStoreTests, removeVolatile)
- {
- 	efi_status_t status =3D EFI_SUCCESS;
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index e8771c21..90d648de 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -294,7 +294,10 @@ efi_status_t uefi_variable_store_get_variable(
-=20
- 			status =3D load_variable_data(context, info, var, max_data_len);
- 			var->Attributes =3D info->metadata.attributes;
--			*total_length =3D SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_TOTAL_SIZ=
E(var);
-+
-+			*total_length =3D (status =3D=3D EFI_SUCCESS) ?
-+				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_TOTAL_SIZE(var) :
-+				SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(var);
- 		}
- 	}
-=20
-@@ -682,7 +685,6 @@ static efi_status_t load_variable_data(
- {
- 	EMSG("In func %s\n", __func__);
- 	psa_status_t psa_status =3D PSA_SUCCESS;
--	size_t data_len =3D 0;
- 	uint8_t *data =3D (uint8_t*)var +
- 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(var);
-=20
-@@ -692,17 +694,41 @@ static efi_status_t load_variable_data(
-=20
- 	if (delegate_store->storage_backend) {
-=20
--		psa_status =3D delegate_store->storage_backend->interface->get(
-+		struct psa_storage_info_t storage_info;
-+
-+		psa_status =3D delegate_store->storage_backend->interface->get_info(
- 			delegate_store->storage_backend->context,
- 			context->owner_id,
- 			info->metadata.uid,
--			0,
--			max_data_len,
--			data,
--			&data_len);
--		EMSG("In func %s get status is %d\n", __func__, psa_status);
-+			&storage_info);
-+
-+		if (psa_status =3D=3D PSA_SUCCESS) {
-=20
--		var->DataSize =3D data_len;
-+			size_t get_limit =3D (var->DataSize < max_data_len) ?
-+				var->DataSize :
-+				max_data_len;
-+
-+			if (get_limit >=3D storage_info.size) {
-+
-+				size_t got_len =3D 0;
-+
-+				psa_status =3D delegate_store->storage_backend->interface->get(
-+					delegate_store->storage_backend->context,
-+					context->owner_id,
-+					info->metadata.uid,
-+					0,
-+					max_data_len,
-+					data,
-+					&got_len);
-+
-+				var->DataSize =3D got_len;
-+			}
-+			else {
-+
-+				var->DataSize =3D storage_info.size;
-+				psa_status =3D PSA_ERROR_BUFFER_TOO_SMALL;
-+			}
-+		}
- 	}
-=20
- 	return psa_to_efi_storage_status(psa_status);
-diff --git a/components/service/smm_variable/client/cpp/smm_variable_cli=
ent.cpp b/components/service/smm_variable/client/cpp/smm_variable_client.=
cpp
-index 8438285b..b6b4ed90 100644
---- a/components/service/smm_variable/client/cpp/smm_variable_client.cpp
-+++ b/components/service/smm_variable/client/cpp/smm_variable_client.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -122,21 +122,22 @@ efi_status_t smm_variable_client::get_variable(
- 		guid,
- 		name,
- 		data,
--		0);
-+		0,
-+		MAX_VAR_DATA_SIZE);
- }
-=20
- efi_status_t smm_variable_client::get_variable(
- 	const EFI_GUID &guid,
- 	const std::wstring &name,
- 	std::string &data,
--	size_t override_name_size)
-+	size_t override_name_size,
-+	size_t max_data_size)
- {
- 	efi_status_t efi_status =3D EFI_NOT_READY;
-=20
- 	std::vector<int16_t> var_name =3D to_variable_name(name);
- 	size_t name_size =3D var_name.size() * sizeof(int16_t);
--	size_t data_size =3D 0;
--	size_t req_len =3D SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_SIZE(name_=
size, data_size);
-+	size_t req_len =3D SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_SIZE(name_=
size, 0);
-=20
- 	rpc_call_handle call_handle;
- 	uint8_t *req_buf;
-@@ -154,7 +155,7 @@ efi_status_t smm_variable_client::get_variable(
-=20
- 		access_var->Guid =3D guid;
- 		access_var->NameSize =3D name_size;
--		access_var->DataSize =3D data_size;
-+		access_var->DataSize =3D max_data_size;
-=20
- 		memcpy(access_var->Name, var_name.data(), name_size);
-=20
-@@ -168,26 +169,28 @@ efi_status_t smm_variable_client::get_variable(
-=20
- 			efi_status =3D opstatus;
-=20
--			if (efi_status =3D=3D EFI_SUCCESS) {
--
--				efi_status =3D EFI_PROTOCOL_ERROR;
-+			if (resp_len >=3D SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_OFFS=
ET) {
-=20
--				if (resp_len >=3D SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_OFF=
SET) {
-+				access_var =3D (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE*)resp_buf;
-+				size_t data_size =3D access_var->DataSize;
-=20
--					access_var =3D (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE*)resp_buf=
;
-+				if (resp_len >=3D
-+					SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_TOTAL_SIZE(access_var)) {
-=20
--					if (resp_len >=3D
--						SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_TOTAL_SIZE(access_var)) =
{
-+					if (efi_status =3D=3D EFI_SUCCESS) {
-=20
--						data_size =3D access_var->DataSize;
- 						const char *data_start =3D (const char*)
- 						&resp_buf[
- 							SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(access_var)=
];
-=20
- 						data.assign(data_start, data_size);
--						efi_status =3D EFI_SUCCESS;
- 					}
- 				}
-+				else if (efi_status =3D=3D EFI_BUFFER_TOO_SMALL) {
-+
-+					data.clear();
-+					data.insert(0, data_size, '!');
-+				}
- 			}
- 		}
- 		else {
-diff --git a/components/service/smm_variable/client/cpp/smm_variable_cli=
ent.h b/components/service/smm_variable/client/cpp/smm_variable_client.h
-index c7973916..3d2371a8 100644
---- a/components/service/smm_variable/client/cpp/smm_variable_client.h
-+++ b/components/service/smm_variable/client/cpp/smm_variable_client.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -56,7 +56,8 @@ public:
- 		const EFI_GUID &guid,
- 		const std::wstring &name,
- 		std::string &data,
--		size_t override_name_size);
-+		size_t override_name_size,
-+		size_t max_data_size =3D MAX_VAR_DATA_SIZE);
-=20
- 	/* Remove a variable */
- 	efi_status_t remove_variable(
-@@ -113,6 +114,9 @@ public:
-=20
-=20
- private:
-+
-+	static const size_t MAX_VAR_DATA_SIZE =3D 65536;
-+
- 	efi_status_t rpc_to_efi_status() const;
-=20
- 	static std::vector<int16_t> to_variable_name(const std::wstring &strin=
g);
-diff --git a/components/service/smm_variable/provider/smm_variable_provi=
der.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index 1f362c17..95c4fdc9 100644
---- a/components/service/smm_variable/provider/smm_variable_provider.c
-+++ b/components/service/smm_variable/provider/smm_variable_provider.c
-@@ -165,7 +165,7 @@ static rpc_status_t get_variable_handler(void *conte=
xt, struct call_req *req)
- 		}
- 		else {
-=20
--			/* Reponse buffer not big enough */
-+			/* Response buffer not big enough */
- 			efi_status =3D EFI_BAD_BUFFER_SIZE;
- 		}
- 	}
-diff --git a/components/service/smm_variable/test/service/smm_variable_s=
ervice_tests.cpp b/components/service/smm_variable/test/service/smm_varia=
ble_service_tests.cpp
-index 38c08ebe..989a3e63 100644
---- a/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-+++ b/components/service/smm_variable/test/service/smm_variable_service_=
tests.cpp
-@@ -284,6 +284,68 @@ TEST(SmmVariableServiceTests, setAndGetNv)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
- }
-=20
-+TEST(SmmVariableServiceTests, getVarSize)
-+{
-+	efi_status_t efi_status =3D EFI_SUCCESS;
-+	std::wstring var_name =3D L"test_variable";
-+	std::string set_data =3D "UEFI variable data string";
-+	std::string get_data;
-+
-+	efi_status =3D m_client->set_variable(
-+		m_common_guid,
-+		var_name,
-+		set_data,
-+		0);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+
-+	/* Get with the data size set to zero. This is the standard way
-+	 * to discover the variable size. */
-+	efi_status =3D m_client->get_variable(
-+		m_common_guid,
-+		var_name,
-+		get_data,
-+		0, 0);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, efi_status);
-+	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
-+
-+	/* Expect remove to be permitted */
-+	efi_status =3D m_client->remove_variable(m_common_guid, var_name);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+}
-+
-+TEST(SmmVariableServiceTests, getVarSizeNv)
-+{
-+	efi_status_t efi_status =3D EFI_SUCCESS;
-+	std::wstring var_name =3D L"test_variable";
-+	std::string set_data =3D "UEFI variable data string";
-+	std::string get_data;
-+
-+	efi_status =3D m_client->set_variable(
-+		m_common_guid,
-+		var_name,
-+		set_data,
-+		EFI_VARIABLE_NON_VOLATILE);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+
-+	/* Get with the data size set to zero. This is the standard way
-+	 * to discover the variable size. */
-+	efi_status =3D m_client->get_variable(
-+		m_common_guid,
-+		var_name,
-+		get_data,
-+		0, 0);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, efi_status);
-+	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
-+
-+	/* Expect remove to be permitted */
-+	efi_status =3D m_client->remove_variable(m_common_guid, var_name);
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-+}
-+
- TEST(SmmVariableServiceTests, enumerateStoreContents)
- {
- 	efi_status_t efi_status =3D EFI_SUCCESS;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch =
b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corsto=
ne1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch
deleted file mode 100644
index 649b9678..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0d8394ee5c52e97e82ebe4641cf0d9ebcbe147ff Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 6 Sep 2022 16:47:06 +0100
-Subject: [PATCH] Add atomic outline to fix build for opemamp
-
-Add memory model 5 atomic ouline support (_sync) to fix
-missing symbol when compiling with recent gcc (12.2).
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
----
- deployments/se-proxy/opteesp/lse.S | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/o=
pteesp/lse.S
-index 840683a6671a..8e466d65fc2b 100644
---- a/deployments/se-proxy/opteesp/lse.S
-+++ b/deployments/se-proxy/opteesp/lse.S
-@@ -5,6 +5,7 @@
-=20
- .text
- .globl __aarch64_cas4_acq_rel
-+.globl __aarch64_cas4_sync
-=20
- __aarch64_cas4_acq_rel:
- 	mov	w16, w0
-@@ -16,4 +17,12 @@ __aarch64_cas4_acq_rel:
- 	cbnz	w17, 0b
- 1:	ret
-=20
-+__aarch64_cas4_sync:
-+	mov	w16, w0
-+	ldxr	w0, [x2]
-+	cmp	w0, w16
-+0:	bne	1f
-=20
-+	stlxr	w17, w1, [x2]
-+	cbnz	w17, 0b
-+1:	ret
---=20
-2.37.3
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index 9d1c3272..4098ea28 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -1,128 +1,10 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/secure-partitions/corstone1000:=
"
-
-COMPATIBLE_MACHINE =3D "corstone1000"
-
-LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57 \
-                     file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a39943=
84112efcdb37c01f \
-                     file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf99=
36a1e1413585ecbf \
-		     file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f0813b606d15a3df3=
d3c \
-		     file://../psa-arch-tests/LICENSE.md;md5=3D2a944942e1496af1886903d=
274dedb13 \
-		     "
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/corstone1000:"
=20
 SRC_URI:append =3D " \
-                  ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP=
} ${SRC_URI_LIBMETAL} ${SRC_URI_ARCH-TESTS}\
-                  file://0001-tools-cmake-common-applying-lowercase-proj=
ect-conven.patch \
-                  file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
-                  file://0003-se-proxy-dts-add-se-proxy-as-child-node.pa=
tch \
-                  file://0004-Update-mm-comm-buffer-region-in-dts-file.p=
atch \
-                  file://0005-Configure-NV-storage-macro.patch \
-                  file://0006-Use-device-region.patch \
-                  file://0007-Add-openamp-to-SE-proxy-deployment.patch \
-                  file://0008-Implement-mhu-driver-and-the-OpenAmp-conve=
rsion-laye.patch \
-                  file://0009-Add-openamp-rpc-caller.patch \
-                  file://0010-add-psa-client-definitions-for-ff-m.patch =
\
-                  file://0011-Add-common-service-component-to-ipc-suppor=
t.patch \
-                  file://0012-Add-secure-storage-ipc-backend.patch \
-                  file://0013-Use-secure-storage-ipc-and-openamp-for-se_=
proxy.patch \
-                  file://0014-Add-uefi-variable-append-write-support.pat=
ch \
-                  file://0015-Add-UEFI-variable-support-for-QueryVariabl=
eInfo.patch \
-                  file://0016-Add-uefi-test-deployment.patch \
-                  file://0017-Fix-interface-ID-parameter-setting-in-sp-f=
farpc_call.patch \
-                  file://0018-Support-FFARPC-call-requests-with-no-share=
d-buffer.patch \
-                  file://0019-Run-psa-arch-test.patch \
-                  file://0020-Use-address-instead-of-pointers.patch \
-                  file://0021-Add-psa-ipc-attestation-to-se-proxy.patch =
\
-                  file://0022-Setup-its-backend-as-openamp-rpc-using-sec=
ure-storag.patch \
-                  file://0023-add-psa-ipc-crypto-backend.patch \
-                  file://0024-Increase-SMM-gateway-UEFI-variable-macro-v=
alue.patch \
-                  file://0025-Add-stub-capsule-update-service-components=
.patch \
-                  file://0026-Add-logs-to-functions-in-SMM-gateway-SP.pa=
tch \
-                  file://0027-Configure-storage-size.patch \
-                  file://0028-Revert-Add-uefi-variable-append-write-supp=
ort.patch \
-                  file://0029-Change-UID-of-variable-index-in-SMM.patch =
\
-                  file://0030-Add-missing-features-to-setVariable.patch =
\
-                  file://0031-Add-invalid-parameter-check-in-getNextVari=
ableName.patch \
-                  file://0032-smm_gateway-add-checks-for-null-attributes=
.patch \
-		  file://0033-Enhance-mbedtls-fetch-process.patch \
-		  file://0034-Fix-format-specifier-in-logging_caller.patch \
-		  file://0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.pat=
ch \
-		  file://0036-Separate-sign-verify-message-and-hash-operations.patch \
-		  file://0037-Add-defence-against-uninitialised-multi-part-transac.pat=
ch \
-		  file://0038-Integrate-AEAD-operation-support.patch \
-		  file://0039-Add-IV-generation-to-one-shot-cipher-operation.patch \
-		  file://0040-Fix-multi-part-termination-on-error.patch \
-		  file://0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.pat=
ch \
-		  file://0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch \
-		  file://0043-pass-sysroot_yocto.patch \
-		  file://0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.pat=
ch \
-		  file://0045-Integrate-remaining-psa-ipc-client-APIs.patch \
-		  file://0046-Fix-update-psa_set_key_usage_flags-definition-to-the.pat=
ch \
-		  file://0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
-		  file://0003-corstone1000-port-crypto-config.patch;patchdir=3D../psa-=
arch-tests \
-                  file://0048-Fix-UEFI-get_variable-with-small-buffer.pa=
tch \
-                  file://0049-Add-atomic-outline-to-fix-build-for-opemam=
p.patch \
-                  "
-
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhtt=
ps;branch=3Ddevelopment;name=3Dmbedtls;destsuffix=3Dgit/mbedtls"
-SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
-
-SRC_URI_NANOPB =3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/nanopb"
-SRCREV_nanopb =3D "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
-
-SRC_URI_OPENAMP =3D "git://github.com/OpenAMP/open-amp.git;name=3Dopenam=
p;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/openamp"
-SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
-
-SRC_URI_LIBMETAL =3D "git://github.com/OpenAMP/libmetal.git;name=3Dlibme=
tal;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/libmetal"
-SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
-
-SRC_URI_ARCH-TESTS =3D "git://github.com/bensze01/psa-arch-tests.git;nam=
e=3Dpsa-arch-tests;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/psa-arc=
h-tests"
-SRCREV_psa-arch-tests =3D "5d1a87f9c0a82e1632a3145687b4c8d7cbbeed2d"
-
-TS_ENVIRONMENT_LINUX =3D "arm-linux"
-TS_PLATFORM =3D "arm/corstone1000"
-TS_ENVIRONMENT =3D "opteesp"
-SP_PACKAGING_METHOD =3D "embedded"
-
-# Secure Enclave proxy secure partition
-TS_DEPLOYMENTS +=3D "'deployments/se-proxy/${TS_ENVIRONMENT}'"
-
-# smm-gateway secure partition
-TS_DEPLOYMENTS +=3D "'deployments/smm-gateway/${TS_ENVIRONMENT}'"
-
-PSA_API_TESTS =3D "deployments/psa-api-test/protected_storage/${TS_ENVIR=
ONMENT_LINUX}"
-PSA_API_TESTS +=3D "deployments/psa-api-test/internal_trusted_storage/${=
TS_ENVIRONMENT_LINUX}"
-PSA_API_TESTS +=3D "deployments/psa-api-test/initial_attestation/${TS_EN=
VIRONMENT_LINUX}"
-PSA_API_TESTS +=3D "deployments/psa-api-test/crypto/${TS_ENVIRONMENT_LIN=
UX}"
-
-# ffa-debugfs-mod provides arm_ffa_user.h needed by psa-arch-tests sourc=
e-code
-DEPENDS +=3D "ffa-debugfs-mod"
-
-do_configure:append() {
-    for PSA_API_TEST in ${PSA_API_TESTS}; do
-        cmake \
-	    -DSYSROOT_YOCTO=3D${RECIPE_SYSROOT} \
-	    -S ${S}/$PSA_API_TEST -B "${B}/$PSA_API_TEST"
-    done
-}
-
-do_compile:append() {
-    for PSA_API_TEST in ${PSA_API_TESTS}; do
-        cmake --build "${B}/$PSA_API_TEST"
-    done
-}
+                  file://0026-plat-add-corstone1000-platform-to-drivers-=
arm.patch \
+		  "
=20
-do_install:append() {
-    for PSA_API_TEST in ${PSA_API_TESTS}; do
-        install -d -m 0755 ${D}${libdir}/${PSA_API_TEST}
-        install -d -m 0755 ${D}${includedir}/${PSA_API_TEST}
-        psafile_fullpath=3D`ls ${B}/${PSA_API_TEST}/psa-*`
-        psafile_filename=3D"`basename -s .bin ${psafile_fullpath}`"
-        install -D -p -m 0755 ${psafile_fullpath} ${D}/${bindir}/${psafi=
le_filename}
-   done
-   cp -rf ${B}/${PSA_API_TEST}/libts_install/arm-linux/lib/*.so* ${D}/${=
libdir}
-}
=20
-FILES:${PN}-dev =3D "${includedir}/deployments/psa-api-test/"
-INSANE_SKIP:${PN}-psa-api-tests +=3D "rpaths dev-so buildpaths"
-PACKAGES +=3D "${PN}-psa-api-tests"
-FILES:${PN}-psa-api-tests =3D "${libdir} ${bindir}"
+EXTRA_OECMAKE:append =3D "-DMM_COMM_BUFFER_ADDRESS=3D"0x00000000 0x02000=
000" \
+                                             -DMM_COMM_BUFFER_PAGE_COUNT=
=3D"1" \
+"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-prox=
y_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-pr=
oxy_%.bbappend
new file mode 100644
index 00000000..8a37a281
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
@@ -0,0 +1,4 @@
+MACHINE_TS_REQUIRE ?=3D ""
+MACHINE_TS_REQUIRE:corstone1000 =3D "ts-corstone1000.inc"
+
+require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
new file mode 100644
index 00000000..8a37a281
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -0,0 +1,4 @@
+MACHINE_TS_REQUIRE ?=3D ""
+MACHINE_TS_REQUIRE:corstone1000 =3D "ts-corstone1000.inc"
+
+require ${MACHINE_TS_REQUIRE}
--=20
2.17.1


