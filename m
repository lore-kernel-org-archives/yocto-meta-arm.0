Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3C8CAC59F
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:00:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.635.1758034820766319486
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 08:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B989FEC;
	Tue, 16 Sep 2025 08:00:12 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D6433F694;
	Tue, 16 Sep 2025 08:00:19 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 2/4] arm/trusted-services: Upgrade Trusted Services to v1.2.0
Date: Tue, 16 Sep 2025 16:00:11 +0100
Message-ID: <20250916150013.30666-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916150013.30666-1-hugues.kambampiana@arm.com>
References: <20250916150013.30666-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Sep 2025 15:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6712

* Update Trusted Services from v1.1.0 to v1.2.0
* De-list obsolete Corstone-1000 TS patches
* Rework remaining Corstone-1000 TS patches for correct application
* Mark remaining Corstone-1000 TS patches as Backport in upstream status
* Reorder Corstone-1000 TS patches to match upstream application order

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Signed=E2=80=91off=E2=80=91by: Bence Balogh <bence.balogh@arm.com>
---
 .../0003-Remove-Werror-flag.patch             |  65 +-
 ...M_HAS_ATTEST_PK-define-from-IAT-test.patch |  17 +-
 ...-store-UEFI-variable-index-in-chunks.patch |  26 +-
 ...007-fwu-proxy-refactor-image-mapping.patch | 856 ++++++++++++++++++
 ...e1000-Add-CORSTONE_1000_TYPE-variabl.patch |  30 +-
 ...C-psa_fwu_install-return-value-check.patch |  75 +-
 .../0014-fwu-Add-EFI-ESRT-v1-support.patch    | 228 +++--
 ...orstone1000-Add-event-provider-proxy.patch | 283 +++---
 ...ne1000-Define-GUID-for-each-payloads.patch | 290 ++++--
 ...he-com-buffer-address-and-page-count.patch |  31 +-
 ...ting-warnings-as-errors-configurable.patch | 194 ++++
 ...crypto-fix-AEAD-block-cypher-support.patch |  73 ++
 .../trusted-services/ts-arm-platforms.inc     |  26 +-
 .../trusted-services/trusted-services-src.inc |   3 +-
 14 files changed, 1786 insertions(+), 411 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-fwu-proxy-refactor-image-mapping.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0022-Make-treating-warnings-as-errors-configurable.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0024-psa-crypto-fix-AEAD-block-cypher-support.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-Remove-Werror-flag.patch b/meta-arm-bsp/recipes-security/trusted-ser=
vices/corstone1000/0003-Remove-Werror-flag.patch
index cbb9780c..7d4f17e6 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Re=
move-Werror-flag.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Re=
move-Werror-flag.patch
@@ -1,22 +1,24 @@
-From 5456cf76e45fc4b06d67b31b53f66a96833c67d9 Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <gyorgy.szing@arm.com>
+From c50ad182f8375eacb315b894229eec7f4cad1b30 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Fri, 18 Oct 2024 11:50:32 +0000
-Subject: [PATCH 08/12] Remove Werror flag
+Subject: [PATCH 6/7] smm-gateway/config: Remove `Werror` compile option
=20
-Remove Werror flag due to compilation issues for TS in yocto
+Adding `-Werror` to CMakeLists.txt unintended when
+originally committed.
=20
-Upstream-Status: Inappropriate [Only for meta-arm]
+Remove the compilation option from `default-opteesp` and
+`default-sp` configuration CMakeLists.txt files.
+
+Upstream-Status: Backport [c50ad182f8375eacb315b894229eec7f4cad1b30]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 ---
  deployments/smm-gateway/config/default-opteesp/CMakeLists.txt | 1 -
  deployments/smm-gateway/config/default-sp/CMakeLists.txt      | 1 -
- environments/arm-linux/default_toolchain_file.cmake           | 2 +-
- environments/linux-pc/default_toolchain_file.cmake            | 2 +-
- environments/opteesp/default_toolchain_file.cmake             | 2 +-
- 5 files changed, 3 insertions(+), 5 deletions(-)
+ 2 files changed, 2 deletions(-)
=20
 diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-index 94ff14c2c..42385635d 100644
+index 94ff14c2..42385635 100644
 --- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
 +++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
 @@ -92,7 +92,6 @@ target_compile_definitions(smm-gateway PRIVATE
@@ -28,7 +30,7 @@ index 94ff14c2c..42385635d 100644
 =20
  endif()
 diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
-index e92f16384..578027163 100644
+index e92f1638..57802716 100644
 --- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
 +++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
 @@ -89,7 +89,6 @@ target_compile_definitions(smm-gateway PRIVATE
@@ -39,45 +41,6 @@ index e92f16384..578027163 100644
  	)
 =20
  endif()
-diff --git a/environments/arm-linux/default_toolchain_file.cmake b/envir=
onments/arm-linux/default_toolchain_file.cmake
-index 7e565dd20..ad11248b3 100644
---- a/environments/arm-linux/default_toolchain_file.cmake
-+++ b/environments/arm-linux/default_toolchain_file.cmake
-@@ -19,7 +19,7 @@ set(CMAKE_SYSTEM_PROCESSOR arm)
-=20
- set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
- set(TS_MANDATORY_AARCH_FLAGS "-mstrict-align -march=3Darmv8-a+crc -DARM=
64=3D1" CACHE STRING "Compiler flags configuring architecture specific ")
--set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
-+set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
- set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
-=20
- # branch-protection enables bti/pac while compile force-bti tells the l=
inker to
-diff --git a/environments/linux-pc/default_toolchain_file.cmake b/enviro=
nments/linux-pc/default_toolchain_file.cmake
-index 2215d6b5d..74d8b6806 100644
---- a/environments/linux-pc/default_toolchain_file.cmake
-+++ b/environments/linux-pc/default_toolchain_file.cmake
-@@ -11,7 +11,7 @@ include_guard(GLOBAL)
-=20
- set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
- set(TS_MANDATORY_AARCH_FLAGS "" CACHE STRING "Compiler flags configurin=
g architecture specific ")
--set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
-+set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
- set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
-=20
- # Set flags affecting all build types
-diff --git a/environments/opteesp/default_toolchain_file.cmake b/environ=
ments/opteesp/default_toolchain_file.cmake
-index b150b8528..297b5f886 100644
---- a/environments/opteesp/default_toolchain_file.cmake
-+++ b/environments/opteesp/default_toolchain_file.cmake
-@@ -21,7 +21,7 @@ set(CMAKE_POSITION_INDEPENDENT_CODE True)
-=20
- set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
- set(TS_MANDATORY_AARCH_FLAGS "-fpic -mstrict-align -march=3Darmv8-a+crc=
" CACHE STRING "Compiler flags configuring architecture specific ")
--set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
-+set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
- set(TS_MANDATORY_LINKER_FLAGS "-pie -Wl,--as-needed -Wl,--sort-section=3D=
alignment -zmax-page-size=3D4096"
- 	CACHE STRING "Linker flags needed for correct builds.")
-=20
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0004-Remove-PLATFORM_H=
AS_ATTEST_PK-define-from-IAT-test.patch
index e95fe821..44f2bdd0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-Re=
move-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-Re=
move-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
@@ -1,10 +1,23 @@
 From cee283641224d2a6660cde0ad83e59bdddbc2f37 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Tue, 14 May 2024 15:58:15 +0200
-Subject: [PATCH 09/12] Remove PLATFORM_HAS_ATTEST_PK define from IAT tes=
t
+Subject: [PATCH] Remove PLATFORM_HAS_ATTEST_PK define from IAT test
=20
+The `PLATFORM_HAS_ATTEST_PK` flag is removed to allow
+`PLATFORM_OVERRIDE_ATTEST_PK` to be defined in `psa-api-test`.
+
+When `PLATFORM_HAS_ATTEST_PK` is set, `psa-api-test` does not define
+`PLATFORM_OVERRIDE_ATTEST_PK`, preventing use of the hard-coded
+attestation public key.
+This is required for the Corstone-1000, which is a Cortex-A+Cortex-M
+platform, as it cannot retrieve the attestation PK from the Secure
+Enclave.
+
+Cortex-A based IAT deployments are unaffected, as they can retrieve
+the attestation public key directly.
+
+Upstream-Status: Inappropriate [The change is only necessary for A+M pla=
tforms]
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Inappropriate [Should remove the flag only for CS1000]
 ---
  deployments/psa-api-test/initial_attestation/iat-api-test.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0007-Revert-Load-and-=
store-UEFI-variable-index-in-chunks.patch
index 176900b5..e076759b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Re=
vert-Load-and-store-UEFI-variable-index-in-chunks.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Re=
vert-Load-and-store-UEFI-variable-index-in-chunks.patch
@@ -1,7 +1,7 @@
-From a986e751f6d4ef34bdc3847cfb02e6f24fbb0702 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 25 Nov 2024 22:13:15 +0100
-Subject: [PATCH 01/12] Revert "Load and store UEFI variable index in chu=
nks"
+From ce6571f7d1054ff003a29e7f977588f1c8e96cc8 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Fri, 12 Sep 2025 15:41:10 +0100
+Subject: [PATCH] Revert "Load and store UEFI variable index in chunks"
=20
 This reverts commit a0a08571084238af2a24d4e6e580308f86ab59a2.
 The PSA IPC backend for the Protected Storage doesn't support the option=
al
@@ -13,11 +13,13 @@ APIs are not optional in the SMM-Gateway.
 Upstream-Status: Inappropriate [To be redesigned]
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 ---
  .../backend/test/variable_store_tests.cpp     | 100 +--------------
  .../backend/uefi_variable_store.c             | 115 ++++--------------
  deployments/smm-gateway/common/smm_gateway.c  |   4 +
- 3 files changed, 28 insertions(+), 191 deletions(-)
+ .../providers/arm/corstone1000/platform.cmake |   1 +
+ 4 files changed, 29 insertions(+), 191 deletions(-)
=20
 diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
 index 0f962f20..7c7435fb 100644
@@ -318,6 +320,18 @@ index 3ab45ccf..eaa86137 100644
  /**
   * The SP heap must be large enough for storing the UEFI variable index=
, the RPC shared memory and
   * ~16kB of miscellaneous data.
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index 91158e93..7da375f0 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -52,6 +52,7 @@ target_compile_definitions(${TGT} PRIVATE
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
+ 	CORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE_INT}
+ 	TFM_FWU_MAX_DIGEST_SIZE=3D${TFM_FWU_MAX_DIGEST_SIZE}
++   SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
 --=20
-2.34.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-fwu-proxy-refactor-image-mapping.patch b/meta-arm-bsp/recipes-securi=
ty/trusted-services/corstone1000/0007-fwu-proxy-refactor-image-mapping.pa=
tch
new file mode 100644
index 00000000..591ff58f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-fw=
u-proxy-refactor-image-mapping.patch
@@ -0,0 +1,856 @@
+From ca3870a123f3449407d460dcbc6bc0ba0d135e1e Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Tue, 26 Aug 2025 15:01:44 +0200
+Subject: [PATCH 7/7] fwu-proxy: refactor image mapping
+
+Stop defining the size of the image mapping and the number of mappings
+at different places (C code vs cmake). Move the number of images to the
+image mapping structure of the FWU proxy. This simplifies the API and
+makes consistent configuration easier.
+
+Upstream-Status: Backport [ca3870a123f3449407d460dcbc6bc0ba0d135e1e]
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+---
+ .../psa_fwu_m/agent/psa_fwu_m_update_agent.c  |  24 +-
+ .../psa_fwu_m/agent/psa_fwu_m_update_agent.h  |  14 +-
+ .../test/test_psa_fwu_m_update_agent.cpp      | 214 +++++++++---------
+ .../infra/corstone1000/corstone1000_config.c  |  71 +++---
+ .../infra/corstone1000/corstone1000_config.h  |   2 +
+ deployments/se-proxy/infra/rse/spf_fwu.c      |  27 +--
+ .../infra/stub/service_proxy_factory.c        |   2 +-
+ .../providers/arm/corstone1000/platform.cmake |  16 +-
+ 8 files changed, 191 insertions(+), 179 deletions(-)
+
+diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.c b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
+index 26972fc0..650a6d04 100644
+--- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
++++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
+@@ -646,7 +646,7 @@ static const struct update_agent_interface interface=
 =3D {
+ };
+=20
+ struct update_agent *psa_fwu_m_update_agent_init(
+-	const struct psa_fwu_m_image_mapping image_mapping[], size_t image_cou=
nt,
++	const struct psa_fwu_m_image_mapping *image_mapping,
+ 	uint32_t max_payload_size)
+ {
+ 	psa_status_t psa_status =3D PSA_ERROR_GENERIC_ERROR;
+@@ -658,8 +658,11 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 	uint8_t esrt_image_uuid[OSF_UUID_OCTET_LEN];
+ 	size_t i =3D 0;
+=20
++	if (!image_mapping)
++		return NULL;
++
+ 	/* Allocate +1 image for the Image directory */
+-	images =3D (struct psa_fwu_m_image *)calloc(image_count + 1, sizeof(*i=
mages));
++	images =3D (struct psa_fwu_m_image *)calloc(image_mapping->count + 1, =
sizeof(*images));
+ 	if (!images)
+ 		return NULL; /* LCOV_EXCL_LINE */
+=20
+@@ -680,8 +683,8 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 		/* LCOV_EXCL_STOP */
+ 	}
+=20
+-	for (i =3D 0; i < image_count; i++) {
+-		psa_status =3D psa_fwu_query(image_mapping[i].component, &info);
++	for (i =3D 0; i < image_mapping->count; i++) {
++		psa_status =3D psa_fwu_query(image_mapping->images[i].component, &inf=
o);
+ 		if (psa_status !=3D PSA_SUCCESS) {
+ 			free(images);
+ 			free(context);
+@@ -689,8 +692,8 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 			return NULL;
+ 		}
+=20
+-		images[i].uuid =3D image_mapping[i].uuid;
+-		images[i].component =3D image_mapping[i].component;
++		images[i].uuid =3D image_mapping->images[i].uuid;
++		images[i].component =3D image_mapping->images[i].component;
+ 		if (info.state =3D=3D PSA_FWU_TRIAL) {
+ 			images[i].selected_for_staging =3D true;
+ 			state =3D trial;
+@@ -711,14 +714,15 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 	}
+=20
+ 	/* Insert Image directory as the last image */
+-	uuid_octets_from_canonical(&images[image_count].uuid, FWU_DIRECTORY_CA=
NONICAL_UUID);
+-	images[image_count].component =3D 0;
+-	images[image_count].selected_for_staging =3D false;
++	uuid_octets_from_canonical(&images[image_mapping->count].uuid,
++				   FWU_DIRECTORY_CANONICAL_UUID);
++	images[image_mapping->count].component =3D 0;
++	images[image_mapping->count].selected_for_staging =3D false;
+ 	images[i].read =3D image_directory_read;
+ 	images[i].write =3D NULL; /* Cannot write Images directory */
+=20
+ 	context->images =3D images;
+-	context->image_count =3D image_count + 1;
++	context->image_count =3D image_mapping->count + 1;
+ 	context->max_payload_size =3D max_payload_size;
+ 	context->state =3D state;
+=20
+diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.h b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h
+index 6354b8ba..ca5f9949 100644
+--- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h
++++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2024, Arm Limited. All rights reserved.
++ * Copyright (c) 2024-2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -17,21 +17,23 @@ extern "C" {
+ #endif
+=20
+ struct psa_fwu_m_image_mapping {
+-	struct uuid_octets uuid;
+-	psa_fwu_component_t component;
++	size_t count;
++	struct {
++		struct uuid_octets uuid;
++		psa_fwu_component_t component;
++	} images[];
+ };
+=20
+ /**
+  * \brief Initialise the PSA FWU M update_agent
+  *
+  * \param[in]  image_mapping    Component mapping array
+- * \param[in]  image_count      Component mapping count
+  * \param[in]  max_payload_size The maximum number of bytes that a payl=
oad can contain
+  *
+  * \return  The update_agent
+  */
+ struct update_agent *psa_fwu_m_update_agent_init(
+-	const struct psa_fwu_m_image_mapping image_mapping[], size_t image_cou=
nt,
++	const struct psa_fwu_m_image_mapping *image_mapping,
+ 	uint32_t max_payload_size);
+=20
+ /**
+@@ -42,7 +44,7 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ void psa_fwu_m_update_agent_deinit(struct update_agent *update_agent);
+=20
+ /* This should be defined by the platform */
+-extern struct psa_fwu_m_image_mapping img_mapping[];
++extern struct psa_fwu_m_image_mapping img_mapping;
+=20
+ #ifdef __cplusplus
+ }
+diff --git a/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_=
update_agent.cpp b/components/service/fwu/psa_fwu_m/agent/test/test_psa_f=
wu_m_update_agent.cpp
+index 3805d182..919ce897 100644
+--- a/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_update_=
agent.cpp
++++ b/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_update_=
agent.cpp
+@@ -12,12 +12,37 @@
+ #include <CppUTest/TestHarness.h>
+ #include <CppUTestExt/MockSupport.h>
+=20
++static const psa_fwu_m_image_mapping * get_image_mapping()
++{
++	static const psa_fwu_m_image_mapping image_mapping =3D {
++		.count =3D 2,
++		.images =3D {
++			{
++				.uuid =3D {
++					0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
++					0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
++				},
++				.component =3D 3
++			},
++			{
++				.uuid =3D {
++					0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
++					0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
++				},
++				.component =3D 2
++			},
++		}
++	};
++	return &image_mapping;
++}
++
+ TEST_GROUP(psa_fwu_m_update_agent) {
+ 	TEST_SETUP() {
+ 		psa_fwu_component_info_t info =3D {0};
+-		expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_SUCCESS);
+-		expect_mock_psa_fwu_query(mapping[1].component, &info, PSA_SUCCESS);
+-		agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
++		mapping =3D get_image_mapping();
++		expect_mock_psa_fwu_query(mapping->images[0].component, &info, PSA_SU=
CCESS);
++		expect_mock_psa_fwu_query(mapping->images[1].component, &info, PSA_SU=
CCESS);
++		agent =3D psa_fwu_m_update_agent_init(mapping, 4096);
+ 		handle =3D 0;
+ 		progress =3D 0;
+ 		total_work =3D 0;
+@@ -31,14 +56,14 @@ TEST_GROUP(psa_fwu_m_update_agent) {
+ 	}
+=20
+ 	void begin_staging() {
+-		expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_SUCCESS)=
;
+-		expect_mock_psa_fwu_start(mapping[1].component, NULL, 0, PSA_SUCCESS)=
;
++		expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_=
SUCCESS);
++		expect_mock_psa_fwu_start(mapping->images[1].component, NULL, 0, PSA_=
SUCCESS);
+ 		LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_begin_staging(agent, 0, =
0, NULL));
+ 	}
+=20
+ 	void end_staging() {
+-		expect_mock_psa_fwu_finish(mapping[0].component, PSA_SUCCESS);
+-		expect_mock_psa_fwu_finish(mapping[1].component, PSA_SUCCESS);
++		expect_mock_psa_fwu_finish(mapping->images[0].component, PSA_SUCCESS)=
;
++		expect_mock_psa_fwu_finish(mapping->images[1].component, PSA_SUCCESS)=
;
+=20
+ 		expect_mock_psa_fwu_install(PSA_SUCCESS);
+=20
+@@ -47,11 +72,11 @@ TEST_GROUP(psa_fwu_m_update_agent) {
+=20
+ 	void open() {
+ 		LONGS_EQUAL(FWU_STATUS_SUCCESS,
+-			    update_agent_open(agent, &mapping[0].uuid, FWU_OP_TYPE_WRITE, &h=
andle));
++			    update_agent_open(agent, &mapping->images[0].uuid, FWU_OP_TYPE_W=
RITE, &handle));
+ 	}
+=20
+ 	void write(const uint8_t *data, size_t data_len) {
+-		expect_mock_psa_fwu_write(mapping[0].component, 0, NULL, 0, PSA_SUCCE=
SS);
++		expect_mock_psa_fwu_write(mapping->images[0].component, 0, NULL, 0, P=
SA_SUCCESS);
+ 		LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 			    update_agent_write_stream(agent, handle, data, data_len));
+ 	}
+@@ -61,27 +86,12 @@ TEST_GROUP(psa_fwu_m_update_agent) {
+ 	uint32_t progress;
+ 	uint32_t total_work;
+=20
+-	const psa_fwu_m_image_mapping mapping[2] =3D {
+-		{
+-			.uuid =3D {
+-				0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+-				0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
+-			},
+-			.component =3D 3
+-		},
+-		{
+-			.uuid =3D {
+-				0x0f, 0x0e, 0x0d, 0x0c, 0x0b, 0x0a, 0x09, 0x08,
+-				0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
+-			},
+-			.component =3D 2
+-		},
+-	};
+-
+ 	const struct uuid_octets image_directory_uuid =3D {
+ 		0xde, 0xee, 0x58, 0xd9, 0x51, 0x47, 0x4a, 0xd3,
+ 		0xa2, 0x90, 0x77, 0x66, 0x6e, 0x23, 0x41, 0xa5
+ 	};
++
++	const psa_fwu_m_image_mapping *mapping;
+ };
+=20
+ TEST(psa_fwu_m_update_agent, discover)
+@@ -98,16 +108,16 @@ TEST(psa_fwu_m_update_agent, discover)
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging_start_fail)
+ {
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_ERROR_GEN=
ERIC_ERROR);
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_clean(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_E=
RROR_GENERIC_ERROR);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[1].component, PSA_SUCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_UNKNOWN, update_agent_begin_staging(agent, 0, 0=
, NULL));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging_start_and_clean_fail)
+ {
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_ERROR_GEN=
ERIC_ERROR);
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_ERROR_GENERIC_ERRO=
R);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_E=
RROR_GENERIC_ERROR);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_ERROR_GENE=
RIC_ERROR);
+ 	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_begin_staging(agent, 0, 0,=
 NULL));
+ }
+=20
+@@ -115,42 +125,42 @@ TEST(psa_fwu_m_update_agent, begin_staging_partial=
_invalid_uuid)
+ {
+ 	const struct uuid_octets update_guid =3D { 0 };
+=20
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_clean(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[1].component, PSA_SUCCESS);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_UNKNOWN, update_agent_begin_staging(agent, 0, 1=
, &update_guid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging_partial_image_directory_uuid=
)
+ {
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_clean(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[1].component, PSA_SUCCESS);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_UNKNOWN, update_agent_begin_staging(agent, 0, 1=
, &image_directory_uuid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging_partial_start_fail)
+ {
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_ERROR_GEN=
ERIC_ERROR);
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_clean(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_E=
RROR_GENERIC_ERROR);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[1].component, PSA_SUCCESS);
+=20
+-	LONGS_EQUAL(FWU_STATUS_UNKNOWN, update_agent_begin_staging(agent, 0, 1=
, &mapping[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_UNKNOWN, update_agent_begin_staging(agent, 0, 1=
, &mapping->images[0].uuid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging_partial_start_and_clean_fail=
)
+ {
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_ERROR_GEN=
ERIC_ERROR);
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_ERROR_GENERIC_ERRO=
R);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_E=
RROR_GENERIC_ERROR);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_ERROR_GENE=
RIC_ERROR);
+=20
+-	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_begin_staging(agent, 0, 1,=
 &mapping[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_begin_staging(agent, 0, 1,=
 &mapping->images[0].uuid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging_partial)
+ {
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_SUCCESS);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_S=
UCCESS);
+=20
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_begin_staging(agent, 0, 1=
, &mapping[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_begin_staging(agent, 0, 1=
, &mapping->images[0].uuid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, begin_staging)
+@@ -162,11 +172,11 @@ TEST(psa_fwu_m_update_agent, begin_staging_repeate=
d_cancel_fail)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_cancel(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_cancel(mapping[1].component, PSA_ERROR_GENERIC_ERR=
OR);
++	expect_mock_psa_fwu_cancel(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[1].component, PSA_ERROR_GEN=
ERIC_ERROR);
+=20
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_clean(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[1].component, PSA_SUCCESS);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_UNKNOWN, update_agent_begin_staging(agent, 0, 0=
, NULL));
+ }
+@@ -175,10 +185,10 @@ TEST(psa_fwu_m_update_agent, begin_staging_repeate=
d_clean_fail)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_cancel(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_cancel(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[1].component, PSA_SUCCESS);
+=20
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_ERROR_GENERIC_ERRO=
R);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_ERROR_GENE=
RIC_ERROR);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_begin_staging(agent, 0, 0,=
 NULL));
+ }
+@@ -187,14 +197,14 @@ TEST(psa_fwu_m_update_agent, begin_staging_repeate=
d)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_cancel(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_cancel(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[1].component, PSA_SUCCESS);
+=20
+-	expect_mock_psa_fwu_clean(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_clean(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_clean(mapping->images[1].component, PSA_SUCCESS);
+=20
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_SUCCESS);
+-	expect_mock_psa_fwu_start(mapping[1].component, NULL, 0, PSA_SUCCESS);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_S=
UCCESS);
++	expect_mock_psa_fwu_start(mapping->images[1].component, NULL, 0, PSA_S=
UCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_begin_staging(agent, 0, 0=
, NULL));
+ }
+=20
+@@ -214,8 +224,8 @@ TEST(psa_fwu_m_update_agent, end_staging_finish_fail=
)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_finish(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_finish(mapping[1].component, PSA_ERROR_GENERIC_ERR=
OR);
++	expect_mock_psa_fwu_finish(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_finish(mapping->images[1].component, PSA_ERROR_GEN=
ERIC_ERROR);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_end_staging(agent));
+ }
+@@ -224,8 +234,8 @@ TEST(psa_fwu_m_update_agent, end_staging_install_fai=
l)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_finish(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_finish(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_finish(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_finish(mapping->images[1].component, PSA_SUCCESS);
+=20
+ 	expect_mock_psa_fwu_install(PSA_ERROR_GENERIC_ERROR);
+=20
+@@ -254,17 +264,17 @@ TEST(psa_fwu_m_update_agent, end_staging_all_accep=
ted_accept_fail)
+ 	begin_staging();
+=20
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+-		    update_agent_open(agent, &mapping[0].uuid, FWU_OP_TYPE_WRITE, &ha=
ndle));
++		    update_agent_open(agent, &mapping->images[0].uuid, FWU_OP_TYPE_WR=
ITE, &handle));
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_commit(agent, handle, true, 0, &progress, &total_wor=
k));
+=20
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+-		    update_agent_open(agent, &mapping[1].uuid, FWU_OP_TYPE_WRITE, &ha=
ndle));
++		    update_agent_open(agent, &mapping->images[1].uuid, FWU_OP_TYPE_WR=
ITE, &handle));
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_commit(agent, handle, true, 0, &progress, &total_wor=
k));
+=20
+-	expect_mock_psa_fwu_finish(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_finish(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_finish(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_finish(mapping->images[1].component, PSA_SUCCESS);
+=20
+ 	expect_mock_psa_fwu_install(PSA_SUCCESS);
+=20
+@@ -278,12 +288,12 @@ TEST(psa_fwu_m_update_agent, end_staging_all_accep=
ted)
+ 	begin_staging();
+=20
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+-		    update_agent_open(agent, &mapping[0].uuid, FWU_OP_TYPE_WRITE, &ha=
ndle));
++		    update_agent_open(agent, &mapping->images[0].uuid, FWU_OP_TYPE_WR=
ITE, &handle));
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_commit(agent, handle, true, 0, &progress, &total_wor=
k));
+=20
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+-		    update_agent_open(agent, &mapping[1].uuid, FWU_OP_TYPE_WRITE, &ha=
ndle));
++		    update_agent_open(agent, &mapping->images[1].uuid, FWU_OP_TYPE_WR=
ITE, &handle));
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_commit(agent, handle, true, 0, &progress, &total_wor=
k));
+=20
+@@ -303,7 +313,7 @@ TEST(psa_fwu_m_update_agent, cancel_staging_cancel_f=
ail)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_cancel(mapping[0].component, PSA_ERROR_GENERIC_ERR=
OR);
++	expect_mock_psa_fwu_cancel(mapping->images[0].component, PSA_ERROR_GEN=
ERIC_ERROR);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_cancel_staging(agent));
+ }
+@@ -312,15 +322,15 @@ TEST(psa_fwu_m_update_agent, cancel_staging)
+ {
+ 	begin_staging();
+=20
+-	expect_mock_psa_fwu_cancel(mapping[0].component, PSA_SUCCESS);
+-	expect_mock_psa_fwu_cancel(mapping[1].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[0].component, PSA_SUCCESS);
++	expect_mock_psa_fwu_cancel(mapping->images[1].component, PSA_SUCCESS);
+=20
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_cancel_staging(agent));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, open_for_write_not_staging)
+ {
+-	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_open(agent, &mapping[0].uu=
id,
++	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_open(agent, &mapping->imag=
es[0].uuid,
+ 		    FWU_OP_TYPE_WRITE, &handle));
+ }
+=20
+@@ -345,12 +355,12 @@ TEST(psa_fwu_m_update_agent, open_for_write_image_=
directory)
+=20
+ TEST(psa_fwu_m_update_agent, open_for_write_partial_not_staging)
+ {
+-	expect_mock_psa_fwu_start(mapping[0].component, NULL, 0, PSA_SUCCESS);
++	expect_mock_psa_fwu_start(mapping->images[0].component, NULL, 0, PSA_S=
UCCESS);
+=20
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_begin_staging(agent, 0, 1=
, &mapping[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_begin_staging(agent, 0, 1=
, &mapping->images[0].uuid));
+=20
+ 	LONGS_EQUAL(FWU_STATUS_DENIED,
+-		    update_agent_open(agent, &mapping[1].uuid, FWU_OP_TYPE_WRITE, &ha=
ndle));
++		    update_agent_open(agent, &mapping->images[1].uuid, FWU_OP_TYPE_WR=
ITE, &handle));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, open_for_read)
+@@ -358,7 +368,7 @@ TEST(psa_fwu_m_update_agent, open_for_read)
+ 	begin_staging();
+=20
+ 	LONGS_EQUAL(FWU_STATUS_NOT_AVAILABLE,
+-		    update_agent_open(agent, &mapping[0].uuid, FWU_OP_TYPE_READ, &han=
dle));
++		    update_agent_open(agent, &mapping->images[0].uuid, FWU_OP_TYPE_RE=
AD, &handle));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, open)
+@@ -374,7 +384,7 @@ TEST(psa_fwu_m_update_agent, open_too_many)
+ 	while (1) {
+ 		int result =3D FWU_STATUS_DENIED;
+=20
+-		result =3D update_agent_open(agent, &mapping[0].uuid, FWU_OP_TYPE_WRI=
TE, &handle);
++		result =3D update_agent_open(agent, &mapping->images[0].uuid, FWU_OP_=
TYPE_WRITE, &handle);
+ 		if (result =3D=3D FWU_STATUS_NOT_AVAILABLE) {
+ 			break;
+ 		} else {
+@@ -410,7 +420,7 @@ TEST(psa_fwu_m_update_agent, write_stream_write_fail=
)
+ 	begin_staging();
+ 	open();
+=20
+-	expect_mock_psa_fwu_write(mapping[0].component, 0, NULL, 0, PSA_ERROR_=
GENERIC_ERROR);
++	expect_mock_psa_fwu_write(mapping->images[0].component, 0, NULL, 0, PS=
A_ERROR_GENERIC_ERROR);
+ 	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_write_stream(agent, handle=
, NULL, 0));
+ }
+=20
+@@ -423,7 +433,7 @@ TEST(psa_fwu_m_update_agent, write_stream_overflow)
+ 	begin_staging();
+ 	open();
+=20
+-	expect_mock_psa_fwu_write(mapping[0].component, 0, data, sizeof(data),=
 PSA_SUCCESS);
++	expect_mock_psa_fwu_write(mapping->images[0].component, 0, data, sizeo=
f(data), PSA_SUCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_write_stream(agent, handle, data, sizeof(data)));
+=20
+@@ -440,11 +450,11 @@ TEST(psa_fwu_m_update_agent, write_stream)
+ 	begin_staging();
+ 	open();
+=20
+-	expect_mock_psa_fwu_write(mapping[0].component, 0, data, sizeof(data),=
 PSA_SUCCESS);
++	expect_mock_psa_fwu_write(mapping->images[0].component, 0, data, sizeo=
f(data), PSA_SUCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_write_stream(agent, handle, data, sizeof(data)));
+=20
+-	expect_mock_psa_fwu_write(mapping[0].component, sizeof(data), data, si=
zeof(data), PSA_SUCCESS);
++	expect_mock_psa_fwu_write(mapping->images[0].component, sizeof(data), =
data, sizeof(data), PSA_SUCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_write_stream(agent, handle, data, sizeof(data)));
+ }
+@@ -492,7 +502,7 @@ TEST(psa_fwu_m_update_agent, read_image_directory_qu=
ery_fail)
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_open(agent, &image_directory_uuid, FWU_OP_TYPE_READ,=
 &handle));
+=20
+-	expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_ERROR_GENER=
IC_ERROR);
++	expect_mock_psa_fwu_query(mapping->images[0].component, &info, PSA_ERR=
OR_GENERIC_ERROR);
+ 	LONGS_EQUAL(FWU_STATUS_DENIED,
+ 		    update_agent_read_stream(agent, handle, buffer, sizeof(buffer), &=
read_len,
+ 		    			     &total_len));
+@@ -522,8 +532,8 @@ TEST(psa_fwu_m_update_agent, read_image_directory)
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_open(agent, &image_directory_uuid, FWU_OP_TYPE_READ,=
 &handle));
+=20
+-	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
+-	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
++	expect_mock_psa_fwu_query(mapping->images[0].component, &info0, PSA_SU=
CCESS);
++	expect_mock_psa_fwu_query(mapping->images[1].component, &info1, PSA_SU=
CCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS,
+ 		    update_agent_read_stream(agent, handle, buffer, sizeof(buffer), &=
read_len,
+ 		    			     &total_len));
+@@ -538,8 +548,8 @@ TEST(psa_fwu_m_update_agent, read_image_directory)
+ 	UNSIGNED_LONGS_EQUAL(0, directory->correct_boot);
+ 	UNSIGNED_LONGS_EQUAL(0x28, directory->img_info_size);
+=20
+-	MEMCMP_EQUAL(&mapping[0].uuid, directory->img_info_entry[0].img_type_u=
uid,
+-		     sizeof(mapping[0].uuid));
++	MEMCMP_EQUAL(&mapping->images[0].uuid, directory->img_info_entry[0].im=
g_type_uuid,
++		     sizeof(mapping->images[0].uuid));
+ 	UNSIGNED_LONGS_EQUAL(1, directory->img_info_entry[0].client_permission=
s);
+ 	UNSIGNED_LONGS_EQUAL(info0.max_size, directory->img_info_entry[0].img_=
max_size);
+ 	UNSIGNED_LONGS_EQUAL(0, directory->img_info_entry[0].lowest_accepted_v=
ersion);
+@@ -547,8 +557,8 @@ TEST(psa_fwu_m_update_agent, read_image_directory)
+ 	UNSIGNED_LONGS_EQUAL(0, directory->img_info_entry[0].accepted);
+ 	UNSIGNED_LONGS_EQUAL(0, directory->img_info_entry[0].reserved);
+=20
+-	MEMCMP_EQUAL(&mapping[1].uuid, directory->img_info_entry[1].img_type_u=
uid,
+-		     sizeof(mapping[1].uuid));
++	MEMCMP_EQUAL(&mapping->images[1].uuid, directory->img_info_entry[1].im=
g_type_uuid,
++		     sizeof(mapping->images[1].uuid));
+ 	UNSIGNED_LONGS_EQUAL(1, directory->img_info_entry[1].client_permission=
s);
+ 	UNSIGNED_LONGS_EQUAL(info1.max_size, directory->img_info_entry[1].img_=
max_size);
+ 	UNSIGNED_LONGS_EQUAL(0, directory->img_info_entry[1].lowest_accepted_v=
ersion);
+@@ -608,7 +618,7 @@ TEST(psa_fwu_m_update_agent, accept_image_one)
+ {
+ 	begin_staging();
+ 	end_staging();
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing->images[0].uuid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, accept_image_accept_fail)
+@@ -617,8 +627,8 @@ TEST(psa_fwu_m_update_agent, accept_image_accept_fai=
l)
+ 	end_staging();
+=20
+ 	expect_mock_psa_fwu_accept(PSA_ERROR_GENERIC_ERROR);
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[0].uuid));
+-	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_accept_image(agent, &mappi=
ng[1].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing->images[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_accept_image(agent, &mappi=
ng->images[1].uuid));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, accept_image)
+@@ -627,8 +637,8 @@ TEST(psa_fwu_m_update_agent, accept_image)
+ 	end_staging();
+=20
+ 	expect_mock_psa_fwu_accept(PSA_SUCCESS);
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[0].uuid));
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[1].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing->images[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing->images[1].uuid));
+ }
+=20
+=20
+@@ -675,8 +685,8 @@ TEST(psa_fwu_m_update_agent, select_previous)
+ TEST(psa_fwu_m_update_agent, boot_in_trial_mode_query_fail) {
+ 	psa_fwu_component_info_t info =3D {0};
+=20
+-	expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_ERROR_GENER=
IC_ERROR);
+-	POINTERS_EQUAL(NULL, psa_fwu_m_update_agent_init(mapping, 2, 4096));
++	expect_mock_psa_fwu_query(mapping->images[0].component, &info, PSA_ERR=
OR_GENERIC_ERROR);
++	POINTERS_EQUAL(NULL, psa_fwu_m_update_agent_init(mapping, 4096));
+ }
+=20
+ TEST(psa_fwu_m_update_agent, boot_in_trial_mode_select_previous) {
+@@ -685,10 +695,10 @@ TEST(psa_fwu_m_update_agent, boot_in_trial_mode_se=
lect_previous) {
+=20
+ 	info1.state =3D PSA_FWU_TRIAL;
+=20
+-	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
+-	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
++	expect_mock_psa_fwu_query(mapping->images[0].component, &info0, PSA_SU=
CCESS);
++	expect_mock_psa_fwu_query(mapping->images[1].component, &info1, PSA_SU=
CCESS);
+=20
+-	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
++	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 4096);
+=20
+ 	expect_mock_psa_fwu_reject(0, PSA_SUCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_select_previous(agent));
+@@ -702,14 +712,14 @@ TEST(psa_fwu_m_update_agent, boot_in_trial_mode_ac=
cept) {
+=20
+ 	info1.state =3D PSA_FWU_TRIAL;
+=20
+-	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
+-	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
++	expect_mock_psa_fwu_query(mapping->images[0].component, &info0, PSA_SU=
CCESS);
++	expect_mock_psa_fwu_query(mapping->images[1].component, &info1, PSA_SU=
CCESS);
+=20
+-	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
++	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 4096);
+=20
+ 	expect_mock_psa_fwu_accept(PSA_SUCCESS);
+-	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_accept_image(agent, &mappi=
ng[0].uuid));
+-	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[1].uuid));
++	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_accept_image(agent, &mappi=
ng->images[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing->images[1].uuid));
+=20
+ 	psa_fwu_m_update_agent_deinit(agent);
+ }
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.c b/deployments/se-proxy/infra/corstone1000/corstone1000_config.c
+index 0cc0dee9..7466120f 100644
+--- a/deployments/se-proxy/infra/corstone1000/corstone1000_config.c
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.c
+@@ -14,43 +14,48 @@
+ #error "CORSTONE_1000_TYPE is not defined."
+ #endif
+=20
+-struct psa_fwu_m_image_mapping img_mapping[IMAGE_MAPPING_ELEMENT_COUNT]=
 =3D {
++struct psa_fwu_m_image_mapping img_mapping =3D {
++	.count =3D FWU_IMAGE_INDEX_COUNT,
++	.images =3D {
+ #if (CORSTONE_1000_TYPE =3D=3D CORSTONE_1000_TYPE_CORTEX_A35_FVP)
+-	{
+-		.uuid =3D FWU_FVP_BL2_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
+-	},
+-	{
+-		.uuid =3D FWU_FVP_TFM_S_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
+-	},
+-	{
+-		.uuid =3D FWU_FVP_FIP_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
+-	},
+-	{
+-		.uuid =3D FWU_FVP_INITRAMFS_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
+-	},
++		{
++			.uuid =3D {FWU_FVP_BL2_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
++		},
++		{
++			.uuid =3D {FWU_FVP_TFM_S_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
++		},
++		{
++			.uuid =3D {FWU_FVP_FIP_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
++		},
++		{
++			.uuid =3D {FWU_FVP_INITRAMFS_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
++		},
+ #elif (CORSTONE_1000_TYPE =3D=3D CORSTONE_1000_TYPE_CORTEX_A35_MPS3)
+-	{
+-		.uuid =3D FWU_MPS3_BL2_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
+-	},
+-	{
+-		.uuid =3D FWU_MPS3_TFM_S_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
+-	},
+-	{
+-		.uuid =3D FWU_MPS3_FIP_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
+-	},
+-	{
+-		.uuid =3D FWU_MPS3_INITRAMFS_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
+-	},
++		{
++			.uuid =3D {FWU_MPS3_BL2_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
++		},
++		{
++			.uuid =3D {FWU_MPS3_TFM_S_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
++		},
++		{
++			.uuid =3D {FWU_MPS3_FIP_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
++		},
++		{
++			.uuid =3D {FWU_MPS3_INITRAMFS_CAPSULE_UUID},
++			.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
++		},
+ #else
+ #error "Unsupported CORSTONE_1000_TYPE value. Valid values are: 0 (Cors=
tone-1000 with " \
+ 		"Cortex-A35 FVP), 1 (Corstone-1000 with Cortex-A35 MPS3)"
+ #endif
++		/* Placeholder for ESRT entry; will be populated at runtime */
++		{} /* ESRT image */
++	}
+ };
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+index 59662ee3..99b15c21 100644
+--- a/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+@@ -51,6 +51,8 @@ enum fwu_image_index {
+ 	FWU_IMAGE_INDEX_CAPSULE_TFM_S,
+ 	FWU_IMAGE_INDEX_CAPSULE_FIP,
+ 	FWU_IMAGE_INDEX_CAPSULE_INITRAMFS,
++
++	// The ESRT image index should always be the last one
+ 	FWU_IMAGE_INDEX_ESRT,
+=20
+ 	FWU_IMAGE_INDEX_LAST =3D FWU_IMAGE_INDEX_ESRT,
+diff --git a/deployments/se-proxy/infra/rse/spf_fwu.c b/deployments/se-p=
roxy/infra/rse/spf_fwu.c
+index 713d932d..714edfaf 100644
+--- a/deployments/se-proxy/infra/rse/spf_fwu.c
++++ b/deployments/se-proxy/infra/rse/spf_fwu.c
+@@ -17,23 +17,9 @@
+ #include "service/fwu/provider/fwu_provider.h"
+ #include "service/fwu/common/update_agent_interface.h"
+ #include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
+-
+ #include <protocols/service/fwu/fwu_proto.h>
+-#include "corstone1000_config.h"
+-#include "corstone1000_event_handling.h"
+-
+-#ifndef IMAGE_MAPPING_ELEMENT_COUNT
+-#define IMAGE_MAPPING_ELEMENT_COUNT 0
+-#endif
+=20
+-#ifndef MAX_PAYLOAD_SIZE
+ #define MAX_PAYLOAD_SIZE 4096
+-#endif
+-
+-/* The index to access the ESRT image in the psa_fwu_m_image_mapping st=
ructure
+- * collection. The ESRT image is always accessed at the end of the coll=
ection.
+- */
+-#define IMAGE_MAPPING_ESRT_INDEX (IMAGE_MAPPING_ELEMENT_COUNT - 1)
+=20
+ static void define_esrt_image_mapping(void);
+=20
+@@ -61,8 +47,7 @@ struct rpc_service_interface *fwu_proxy_create(void)
+ 		return NULL;
+=20
+ 	define_esrt_image_mapping();
+-	agent =3D psa_fwu_m_update_agent_init(img_mapping, IMAGE_MAPPING_ELEME=
NT_COUNT,
+-					    MAX_PAYLOAD_SIZE);
++	agent =3D psa_fwu_m_update_agent_init(&img_mapping, MAX_PAYLOAD_SIZE);
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
+@@ -72,9 +57,15 @@ struct rpc_service_interface *fwu_proxy_create(void)
+  */
+ static void define_esrt_image_mapping(void)
+ {
+-	uuid_octets_from_canonical(&img_mapping[IMAGE_MAPPING_ESRT_INDEX].uuid=
,
++	/*
++	 * The index to access the ESRT image in the psa_fwu_m_image_mapping s=
tructure
++	 * collection. The ESRT image is always accessed at the end of the col=
lection.
++	 */
++	size_t esrt_index =3D img_mapping.count - 1;
++
++	uuid_octets_from_canonical(&img_mapping.images[esrt_index].uuid,
+ 				   EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
+-	img_mapping[IMAGE_MAPPING_ESRT_INDEX].component =3D FWU_IMAGE_INDEX_ES=
RT;
++	img_mapping.images[esrt_index].component =3D img_mapping.count;
+ }
+=20
+ ADD_PROXY_SERVICE_FACTORY(fwu_proxy_create, FWU_PROXY, SE_PROXY_INTERFA=
CE_PRIO_FWU);
+diff --git a/deployments/se-proxy/infra/stub/service_proxy_factory.c b/d=
eployments/se-proxy/infra/stub/service_proxy_factory.c
+index c6c715e5..078984e0 100644
+--- a/deployments/se-proxy/infra/stub/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/stub/service_proxy_factory.c
+@@ -89,7 +89,7 @@ struct rpc_service_interface *fwu_proxy_create(void)
+ 	static struct update_agent *agent;
+ 	static struct fwu_provider fwu_provider =3D { 0 };
+=20
+-	agent =3D psa_fwu_m_update_agent_init(NULL, 0, 4096);
++	agent =3D psa_fwu_m_update_agent_init(NULL, 4096);
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index baddf0be..f5a9c48f 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -34,25 +34,23 @@ set(MM_COMM_BUFFER_PAGE_COUNT 0x1 CACHE STRING "MM C=
ommunication buffer page cou
+=20
+=20
+ # For ESRT v1 details : https://uefi.org/specs/UEFI/2.9_A/23_Firmware_U=
pdate_and_Reporting.html#efi-system-resource-table
+-set(FWU_IMAGE_CAPSULE_COUNT 4 CACHE STRING "Maximum number of FWU Image=
s in a capsule to be updated")
+-set(ESRT_IMAGE_ENTRY_SIZE 40 CACHE STRING "Size of one ESRT v1 Image en=
try structure object")
+-set(ESRT_REMAINING_FIELDS_SIZE 16 CACHE STRING "Size of remaining field=
s of ESRT v1 table structure")
++# `FWU_IMAGE_CAPSULE_COUNT` has to match the number of images declared =
in corstone_config.h. Note that this does not include the ESRT image.
++# Maximum number of FWU Images in a capsule to be updated
++set(FWU_IMAGE_CAPSULE_COUNT 4)
++# Size of one ESRT v1 Image entry structure object
++set(ESRT_IMAGE_ENTRY_SIZE 40)
++# Size of remaining fields of ESRT v1 table structure
++set(ESRT_REMAINING_FIELDS_SIZE 16)
+ math(EXPR TOTAL_ESRT_SIZE "${FWU_IMAGE_CAPSULE_COUNT} * ${ESRT_IMAGE_EN=
TRY_SIZE} + ${ESRT_REMAINING_FIELDS_SIZE}" OUTPUT_FORMAT DECIMAL)
+=20
+ set(TFM_FWU_MAX_DIGEST_SIZE ${TOTAL_ESRT_SIZE} CACHE STRING "Maximum si=
ze of ESRT entries of all the images in a bank")
+=20
+-set(ESRT_IMAGE_COUNT 1 CACHE STRING "The immutable number of ESRT image=
")
+-math(EXPR IMAGE_MAPPING_ELEMENT_COUNT "${FWU_IMAGE_CAPSULE_COUNT} + ${E=
SRT_IMAGE_COUNT}" OUTPUT_FORMAT DECIMAL)
+-
+ target_compile_definitions(${TGT} PRIVATE
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
+ 	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
+ 	CORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE_INT}
+ 	TFM_FWU_MAX_DIGEST_SIZE=3D${TFM_FWU_MAX_DIGEST_SIZE}
+-	FWU_IMAGE_CAPSULE_COUNT=3D${FWU_IMAGE_CAPSULE_COUNT}
+-	IMAGE_MAPPING_ELEMENT_COUNT=3D${IMAGE_MAPPING_ELEMENT_COUNT}
+-	MAX_PAYLOAD_SIZE=3D4096
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0009-platform-corsto=
ne1000-Add-CORSTONE_1000_TYPE-variabl.patch
index 8b387694..47fab7a1 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
atform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
atform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
@@ -1,8 +1,8 @@
-From a644191e6f184e39fbe60a8fd79bf34a9a88eb17 Mon Sep 17 00:00:00 2001
+From 2cd4db9828f244de77e402ad31c52d9c4ba3c600 Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Date: Thu, 11 Sep 2025 14:25:04 +0100
-Subject: [PATCH] platform: corstone1000: Add CORSTONE_1000_TYPE variable=
 for
- platform selection
+Date: Tue, 5 Aug 2025 14:05:49 +0100
+Subject: [PATCH 1/7] platform: corstone1000: Add CORSTONE_1000_TYPE vari=
able
+ for platform selection
=20
 This change introduces a CORSTONE_1000_TYPE variable in both CMake
 and C code to differentiate between Corstone-1000 platform types:
@@ -21,20 +21,14 @@ Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampian=
a@arm.com>
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- .../providers/arm/corstone1000/platform.cmake | 21 ++++++++++++++++++-
- 1 file changed, 20 insertions(+), 1 deletion(-)
+ .../providers/arm/corstone1000/platform.cmake | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index d39b7903..478a394d 100644
+index 37c6accf..4b6b9675 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -1,11 +1,29 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2021-2025, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
+@@ -6,6 +6,24 @@
  # Platform definition for the Corstone-1000 platform.
  #----------------------------------------------------------------------=
---------
 =20
@@ -59,10 +53,10 @@ index d39b7903..478a394d 100644
  set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
  set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
  set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
-@@ -14,6 +32,7 @@ target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
- 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
- 	COMMS_MHU_MSG_SIZE=3D0x3500
+@@ -19,6 +37,7 @@ target_compile_definitions(${TGT} PRIVATE
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
+ 	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
 +	CORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE_INT}
  )
 =20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0013-Fix-PSA-FWU-IPC-p=
sa_fwu_install-return-value-check.patch
index da948bd0..4ef78eb3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Fi=
x-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Fi=
x-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
@@ -1,31 +1,74 @@
-From d43ec82f7e419e6f1e9f5bd002c324b788ee901f Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 6 Feb 2025 11:32:04 +0000
-Subject: [PATCH 4/8] Fix PSA FWU IPC psa_fwu_install() return value chec=
k
+From 8b8eb4a2d512de06d3ee8a17dd9295cd38efd68d Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Tue, 5 Aug 2025 14:42:17 +0100
+Subject: [PATCH 4/7] fwu: Coerce PSA_SUCCESS_REBOOT and PSA_SUCCESS_REST=
ART to
+ PSA_SUCCESS
=20
-This change adds support to validate if the return type in psa_fwu_insta=
ll()
-is either PSA_SUCCESS or PSA_SUCCESS_REBOOT. Both the return values are =
expected.
-Earlier, only PSA_SUCCESS is validated.
+Map `PSA_SUCCESS_REBOOT` and `PSA_SUCCESS_RESTART` (returned by
+FWU-M after a successful install) to plain `PSA_SUCCESS` in the FWU PSA
+IPC client.
+This is useful on A+M systems since FWU-A does not define equivalent
+return codes, and avoids exposing non-zero success codes to FWU-A
+clients.
=20
-Upstream-Status: Pending
+Key changes:
+- Update `psa_fwu_ipc.c` to coerce `PSA_SUCCESS_REBOOT` and
+  `PSA_SUCCESS_RESTART` to `PSA_SUCCESS` in `psa_fwu_install()``.
+- Extend FWU documentation to describe the behavior.
+
+Note: When this option is enabled, the normal world must still arrange
+a system reboot through its own mechanism.
+
+Upstream-Status: Backport [8b8eb4a2d512de06d3ee8a17dd9295cd38efd68d]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 ---
- .../service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c       | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ .../fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c        | 6 +++++-
+ docs/services/fwu/psa-fwu-m.rst                          | 9 ++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
=20
 diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_=
ipc.c b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
-index a47ae539..3947a809 100644
+index a47ae539..174b06f8 100644
 --- a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
 +++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
-@@ -190,7 +190,7 @@ psa_status_t psa_fwu_install(void)
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2024-2025, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -190,6 +190,10 @@ psa_status_t psa_fwu_install(void)
  	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
  			  TFM_FWU_INSTALL, in_vec, 0,
  			  NULL, 0);
--	if (status !=3D PSA_SUCCESS)
-+	if (status !=3D PSA_SUCCESS && status !=3D PSA_SUCCESS_REBOOT)
++
++	if ((status =3D=3D PSA_SUCCESS_REBOOT) || (status =3D=3D PSA_SUCCESS_R=
ESTART))
++		status =3D PSA_SUCCESS;
++
+ 	if (status !=3D PSA_SUCCESS)
  		EMSG("failed to psa_call: %d", status);
 =20
- 	return status;
+diff --git a/docs/services/fwu/psa-fwu-m.rst b/docs/services/fwu/psa-fwu=
-m.rst
+index 1358015f..c3217159 100644
+--- a/docs/services/fwu/psa-fwu-m.rst
++++ b/docs/services/fwu/psa-fwu-m.rst
+@@ -76,9 +76,12 @@ agent switches to trial state, so the client can vali=
date the new set of images
+=20
+ On calling ``fwu_end_staging()`` the agent calls ``psa_fwu_finish()`` o=
n each selected image, then calls
+ ``psa_fwu_install()``. If all images have been accepted (see ``fwu_comm=
it()``) it also calls ``psa_fwu_accept()``.
+-The implementation treats ``PSA_SUCCESS_REBOOT`` and ``PSA_SUCCESS_REST=
ART`` status values as error. In an A+M system the M
+-class side shouldn't restart the system, so calling ``psa_fwu_request_r=
eboot()`` does not fit the system. There's also no
+-PSA FWU A return code for inidicating the restart request to the normal=
 world. If the normal world has to restart the
++
++Since FWU-M may return ``PSA_SUCCESS_REBOOT`` or ``PSA_SUCCESS_RESTART`=
` for A+M systems, the FWU PSA IPC client coerces
++these statuses to ``PSA_SUCCESS`` because FWU-A does not define an equi=
valent return code.
++
++In an A+M system the M class side shouldn't restart the system, so call=
ing ``psa_fwu_request_reboot()`` does not fit the system.
++There's also no PSA FWU A return code for inidicating the restart reque=
st to the normal world. If the normal world has to restart the
+ system after ending the staging phase, it has to do it in an implementa=
tion defined way.
+=20
+ .. uml:: ../uml/psa_fwu_m_update_agent/fwu_end_staging.puml
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-fwu-Add-EFI-ESRT-v1-support.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0014-fwu-Add-EFI-ESRT-v1-support.patch
index ce810a35..c10a88a8 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-fw=
u-Add-EFI-ESRT-v1-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-fw=
u-Add-EFI-ESRT-v1-support.patch
@@ -1,45 +1,69 @@
-From 740359ba2a73f5ce0015c9023cc1aa69506f99bf Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Fri, 28 Feb 2025 21:12:25 +0000
-Subject: [PATCH 5/8] fwu: Add EFI ESRT v1 support
+From d5ca8c5b73c3ff3bc5c137828932e440c6a7f187 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Tue, 5 Aug 2025 15:05:33 +0100
+Subject: [PATCH 5/7] fwu: Add support for ESRT v1 in PSA FWU-M agent
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
=20
-Add EFI ESRT v1 support for PSA FWU M agent.
-ESRT functionality is implemented using unique image dedicated
-for ESRT data having its own UUID. In PSA FWU M agent's context,
-this image has read only attributes. The ESRT data can be read
-using image_read_directory by using ESRT image UUID handle. The
-ESRT data is queried from Secure Enclave using psa_fwu_query()
-and ESRT data can be read from psa_fwu_impl_info_t structure
-object defined in psa_fwu_component_info_t.
+This patch introduces support for ESRT v1, enabling the PSA Firmware
+Update Management (FWU-M) agent to expose UEFI-compliant firmware
+resource metadata via a dedicated image UUID.
=20
-This commit includes the following changes:
-1. Declare EFI ESRT v1 data structures.
-2. Modify image_directory_read() to include EFI ESRT data read support
-3. Modify psa_fwu_m_update_agent_init to initialize ESRT image
-attributes
+Key changes:
+- Declares ESRT v1 data structures (`efi_system_resource_entry` and
+  `efi_system_resource_table`) as specified by the UEFI 2.9 standard.
+- Extends `image_directory_read()` to detect ESRT image reads and serve
+  the data stored in `candidate_digest` from `psa_fwu_query()`.
+- Modifies `psa_fwu_m_update_agent_init()` to properly initialize the
+  ESRT image with read-only attributes and hook `image_directory_read()`
+  as its read handler.
+- Defines `FWU_IMAGE_CAPSULE_COUNT`, `ESRT_IMAGE_ENTRY_SIZE`, and
+  `ESRT_REMAINING_FIELDS_SIZE` to represent the structure of the ESRT v1
+  table.
+- Calculates `TOTAL_ESRT_SIZE` based on capsule count and ESRT entry
+  sizes.
+- Sets `TFM_FWU_MAX_DIGEST_SIZE` to `TOTAL_ESRT_SIZE` to ensure the PSA
+  FWU
+  agent allocates sufficient buffer space for ESRT data.
+- Exposes these constants via `target_compile_definitions()` for use in
+  the FWU runtime. This platform configuration ensures correct ESRT
+  memory sizing and enables firmware metadata reporting according to UEF=
I
+  2.9 specification.
=20
-The ESRT v1 details can be found here :
-https://uefi.org/specs/UEFI/2.9_A/23_Firmware_Update_and_Reporting.html#=
efi-system-resource-table
+ESRT data can now be queried by update clients using the ESRT image UUID
+handle. This enables standardized firmware reporting and diagnostics
+in accordance with UEFI specifications.
=20
-Upstream-Status: Pending
+Specification reference:
+UEFI 2.9 =C2=A723 - Firmware Update and Reporting:
+https://uefi.org/specs/UEFI/2.9_A/23_Firmware_Update_and_Reporting.html
+
+Upstream-Status: Backport [d5ca8c5b73c3ff3bc5c137828932e440c6a7f187]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 ---
- .../psa_fwu_m/agent/psa_fwu_m_update_agent.c  | 50 +++++++++++++++++--
- protocols/service/fwu/fwu_proto.h             | 29 +++++++++--
- 2 files changed, 71 insertions(+), 8 deletions(-)
+ .../psa_fwu_m/agent/psa_fwu_m_update_agent.c  | 57 +++++++++++++++++--
+ deployments/se-proxy/infra/rse/spf_fwu.c      | 23 ++++++++
+ .../providers/arm/corstone1000/platform.cmake | 15 +++++
+ protocols/service/fwu/fwu_proto.h             | 29 ++++++++--
+ 4 files changed, 116 insertions(+), 8 deletions(-)
=20
 diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.c b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
-index 48b86f6e..d0464bf5 100644
+index 48b86f6e..26972fc0 100644
 --- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
 +++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
-@@ -115,13 +115,22 @@ uint32_t image_version_to_uint(psa_fwu_image_versi=
on_t version)
+@@ -115,13 +115,25 @@ uint32_t image_version_to_uint(psa_fwu_image_versi=
on_t version)
  	return result;
  }
 =20
 +/* image_directory_read
 + * This function is used for two purposes:
-+ * -> Send the details of firmware images to update client when read re=
quest is made for FWU_DIRECTORY_CANONICAL_UUID
-+ * -> Send ESRT data to update client when read request is made for EFI=
_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID
++ * -> Send the details of firmware images to update client when read re=
quest is
++ *    made for FWU_DIRECTORY_CANONICAL_UUID
++ * -> Send ESRT data to update client when read request is
++ *    made for EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID
 + */
  int image_directory_read(struct psa_fwu_m_update_agent *agent, struct p=
sa_fwu_m_image *image,
  			 uint8_t *buf, size_t buf_size, size_t *read_len, size_t *total_len)
@@ -49,14 +73,15 @@ index 48b86f6e..d0464bf5 100644
  	struct fwu_image_directory *directory =3D NULL;
 -	size_t image_count =3D agent->image_count - 1; /* Do not return Image =
directory */
 +	uint8_t esrt_image_uuid[OSF_UUID_OCTET_LEN];
-+	size_t image_count =3D agent->image_count - 1; /* Do not return Image =
directory
-+						      * If update client uses ESRT UUID for ESRT data, then ESRT =
image UUID
-+						      * is considered as a separate image included in this count
-+						      */
++	/* Do not return Image directory
++	 * If update client uses ESRT UUID for ESRT data, then ESRT image UUID
++	 * is considered as a separate image included in this count
++	 */
++	size_t image_count =3D agent->image_count - 1;
  	size_t image_info_size =3D 0;
  	size_t i =3D 0;
 =20
-@@ -136,12 +145,36 @@ int image_directory_read(struct psa_fwu_m_update_a=
gent *agent, struct psa_fwu_m_
+@@ -136,12 +148,40 @@ int image_directory_read(struct psa_fwu_m_update_a=
gent *agent, struct psa_fwu_m_
  		return FWU_STATUS_DENIED; /* LCOV_EXCL_LINE */
 =20
  	/*
@@ -67,21 +92,25 @@ index 48b86f6e..d0464bf5 100644
  	if (*total_len > buf_size)
  		return FWU_STATUS_SUCCESS;
 =20
-+	/* Query ESRT data from Secure Enclave and Copy the ESRT entries from =
component_info.impl.candidate_digest
-+	 * to buf in case of ESRT image UUID.
-+	 * This is needed because Secure Enclave fills component_info.impl.can=
didate_digest with ESRT data
-+	 * which needs to be transferred to normal world buffer
++	/* Query ESRT data from Secure Enclave and Copy the ESRT entries
++	 * from component_info.impl.candidate_digest to buf in case of ESRT im=
age UUID.
++	 * This is needed because Secure Enclave fills component_info.impl.can=
didate_digest
++	 *  with ESRT data which needs to be transferred to normal world buffe=
r
 +	 */
-+	uuid_octets_from_canonical((struct uuid_octets *)&esrt_image_uuid, EFI=
_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
++	uuid_octets_from_canonical((struct uuid_octets *)&esrt_image_uuid,
++				   EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
 +	if (!memcmp(&esrt_image_uuid, &image->uuid, sizeof(esrt_image_uuid))) =
{
 +		/* Query ESRT data */
 +		psa_status =3D psa_fwu_query(image->component, &component_info);
 +		if (psa_status !=3D PSA_SUCCESS)
 +			return psa_status_to_fwu_status(psa_status);
 +
-+		struct efi_system_resource_table *esrt =3D (struct efi_system_resourc=
e_table *)component_info.impl.candidate_digest;
-+		size_t esrt_size_recv =3D (esrt->fw_resource_count * sizeof(struct ef=
i_system_resource_entry) ) + sizeof(struct efi_system_resource_table);
-+		if(esrt_size_recv > TFM_FWU_MAX_DIGEST_SIZE)
++		struct efi_system_resource_table *esrt =3D
++			(struct efi_system_resource_table *)component_info.impl.candidate_di=
gest;
++		size_t esrt_size_recv =3D (esrt->fw_resource_count *
++			sizeof(struct efi_system_resource_entry))
++		+ sizeof(struct efi_system_resource_table);
++		if  (esrt_size_recv > TFM_FWU_MAX_DIGEST_SIZE)
 +			return FWU_STATUS_OUT_OF_BOUNDS;
 +
 +		/* Copy the ESRT entries to the buf */
@@ -94,7 +123,7 @@ index 48b86f6e..d0464bf5 100644
  	directory =3D (struct fwu_image_directory *)buf;
  	directory->directory_version =3D FWU_IMAGE_DIRECTORY_VERSION;
  	directory->img_info_offset =3D offsetof(struct fwu_image_directory, im=
g_info_entry);
-@@ -615,6 +648,7 @@ struct update_agent *psa_fwu_m_update_agent_init(
+@@ -615,6 +655,7 @@ struct update_agent *psa_fwu_m_update_agent_init(
  	struct psa_fwu_m_image *images =3D NULL;
  	enum psa_fwu_m_state state =3D regular;
  	struct update_agent *agent =3D NULL;
@@ -102,27 +131,110 @@ index 48b86f6e..d0464bf5 100644
  	size_t i =3D 0;
 =20
  	/* Allocate +1 image for the Image directory */
-@@ -657,8 +691,16 @@ struct update_agent *psa_fwu_m_update_agent_init(
+@@ -657,8 +698,16 @@ struct update_agent *psa_fwu_m_update_agent_init(
  			images[i].selected_for_staging =3D false;
  		}
 =20
 -		images[i].read =3D NULL; /* Cannot read images */
 -		images[i].write =3D image_write;
-+		uuid_octets_from_canonical((struct uuid_octets *)&esrt_image_uuid, EF=
I_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
++		uuid_octets_from_canonical((struct uuid_octets *)&esrt_image_uuid,
++					   EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
 +		if (!memcmp(&esrt_image_uuid, &images[i].uuid, sizeof(esrt_image_uuid=
))) {
 +			images[i].read =3D image_directory_read;
 +			images[i].write =3D NULL;
 +			images[i].selected_for_staging =3D false;
-+		}
-+		else {
++		} else {
 +			images[i].read =3D NULL; /* Cannot read images */
 +			images[i].write =3D image_write;
 +		}
  	}
 =20
  	/* Insert Image directory as the last image */
+diff --git a/deployments/se-proxy/infra/rse/spf_fwu.c b/deployments/se-p=
roxy/infra/rse/spf_fwu.c
+index 90f200e1..713d932d 100644
+--- a/deployments/se-proxy/infra/rse/spf_fwu.c
++++ b/deployments/se-proxy/infra/rse/spf_fwu.c
+@@ -18,6 +18,10 @@
+ #include "service/fwu/common/update_agent_interface.h"
+ #include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
+=20
++#include <protocols/service/fwu/fwu_proto.h>
++#include "corstone1000_config.h"
++#include "corstone1000_event_handling.h"
++
+ #ifndef IMAGE_MAPPING_ELEMENT_COUNT
+ #define IMAGE_MAPPING_ELEMENT_COUNT 0
+ #endif
+@@ -26,6 +30,13 @@
+ #define MAX_PAYLOAD_SIZE 4096
+ #endif
+=20
++/* The index to access the ESRT image in the psa_fwu_m_image_mapping st=
ructure
++ * collection. The ESRT image is always accessed at the end of the coll=
ection.
++ */
++#define IMAGE_MAPPING_ESRT_INDEX (IMAGE_MAPPING_ELEMENT_COUNT - 1)
++
++static void define_esrt_image_mapping(void);
++
+ struct rpc_service_interface *fwu_proxy_create(void)
+ {
+ 	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
+@@ -48,10 +59,22 @@ struct rpc_service_interface *fwu_proxy_create(void)
+=20
+ 	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
+ 		return NULL;
++
++	define_esrt_image_mapping();
+ 	agent =3D psa_fwu_m_update_agent_init(img_mapping, IMAGE_MAPPING_ELEME=
NT_COUNT,
+ 					    MAX_PAYLOAD_SIZE);
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
+=20
++/* Every platform needs to define esrt image mapping,
++ * if ESRT image UUID is to be used to extract ESRT data
++ */
++static void define_esrt_image_mapping(void)
++{
++	uuid_octets_from_canonical(&img_mapping[IMAGE_MAPPING_ESRT_INDEX].uuid=
,
++				   EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
++	img_mapping[IMAGE_MAPPING_ESRT_INDEX].component =3D FWU_IMAGE_INDEX_ES=
RT;
++}
++
+ ADD_PROXY_SERVICE_FACTORY(fwu_proxy_create, FWU_PROXY, SE_PROXY_INTERFA=
CE_PRIO_FWU);
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index 4b6b9675..baddf0be 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -33,11 +33,26 @@ set(MM_COMM_BUFFER_ADDRESS "0x00000000 0x81FFF000" C=
ACHE STRING "MM Communicatio
+ set(MM_COMM_BUFFER_PAGE_COUNT 0x1 CACHE STRING "MM Communication buffer=
 page count")
+=20
+=20
++# For ESRT v1 details : https://uefi.org/specs/UEFI/2.9_A/23_Firmware_U=
pdate_and_Reporting.html#efi-system-resource-table
++set(FWU_IMAGE_CAPSULE_COUNT 4 CACHE STRING "Maximum number of FWU Image=
s in a capsule to be updated")
++set(ESRT_IMAGE_ENTRY_SIZE 40 CACHE STRING "Size of one ESRT v1 Image en=
try structure object")
++set(ESRT_REMAINING_FIELDS_SIZE 16 CACHE STRING "Size of remaining field=
s of ESRT v1 table structure")
++math(EXPR TOTAL_ESRT_SIZE "${FWU_IMAGE_CAPSULE_COUNT} * ${ESRT_IMAGE_EN=
TRY_SIZE} + ${ESRT_REMAINING_FIELDS_SIZE}" OUTPUT_FORMAT DECIMAL)
++
++set(TFM_FWU_MAX_DIGEST_SIZE ${TOTAL_ESRT_SIZE} CACHE STRING "Maximum si=
ze of ESRT entries of all the images in a bank")
++
++set(ESRT_IMAGE_COUNT 1 CACHE STRING "The immutable number of ESRT image=
")
++math(EXPR IMAGE_MAPPING_ELEMENT_COUNT "${FWU_IMAGE_CAPSULE_COUNT} + ${E=
SRT_IMAGE_COUNT}" OUTPUT_FORMAT DECIMAL)
++
+ target_compile_definitions(${TGT} PRIVATE
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
+ 	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
+ 	CORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE_INT}
++	TFM_FWU_MAX_DIGEST_SIZE=3D${TFM_FWU_MAX_DIGEST_SIZE}
++	FWU_IMAGE_CAPSULE_COUNT=3D${FWU_IMAGE_CAPSULE_COUNT}
++	IMAGE_MAPPING_ELEMENT_COUNT=3D${IMAGE_MAPPING_ELEMENT_COUNT}
++	MAX_PAYLOAD_SIZE=3D4096
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
 diff --git a/protocols/service/fwu/fwu_proto.h b/protocols/service/fwu/f=
wu_proto.h
-index 4bcacb1f..aa5d2561 100644
+index 4bcacb1f..85296e5b 100644
 --- a/protocols/service/fwu/fwu_proto.h
 +++ b/protocols/service/fwu/fwu_proto.h
 @@ -1,5 +1,5 @@
@@ -139,10 +251,10 @@ index 4bcacb1f..aa5d2561 100644
 -#define FWU_UPDATE_AGENT_CANONICAL_UUID "6823a838-1b06-470e-9774-0cce8b=
fb53fd"
 -#define FWU_DIRECTORY_CANONICAL_UUID	"deee58d9-5147-4ad3-a290-77666e234=
1a5"
 -#define FWU_METADATA_CANONICAL_UUID	"8a7a84a0-8387-40f6-ab41-a8b9a5a60d=
23"
-+#define FWU_UPDATE_AGENT_CANONICAL_UUID 		"6823a838-1b06-470e-9774-0cce=
8bfb53fd"
-+#define FWU_DIRECTORY_CANONICAL_UUID			"deee58d9-5147-4ad3-a290-77666e2=
341a5"
-+#define FWU_METADATA_CANONICAL_UUID			"8a7a84a0-8387-40f6-ab41-a8b9a5a6=
0d23"
-+#define EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID	"63a222b1-6136-684f-99=
29-78f8b0d62180"
++#define FWU_UPDATE_AGENT_CANONICAL_UUID             "6823a838-1b06-470e=
-9774-0cce8bfb53fd"
++#define FWU_DIRECTORY_CANONICAL_UUID                "deee58d9-5147-4ad3=
-a290-77666e2341a5"
++#define FWU_METADATA_CANONICAL_UUID                 "8a7a84a0-8387-40f6=
-ab41-a8b9a5a60d23"
++#define EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID    "63a222b1-6136-684f=
-9929-78f8b0d62180"
 =20
  #define FWU_OPEN_OP_TYPE_READ  (0)
  #define FWU_OPEN_OP_TYPE_WRITE (1)
@@ -154,13 +266,13 @@ index 4bcacb1f..aa5d2561 100644
 + * @brief Information about the ESRT v1.
 + */
 +struct __attribute__((__packed__)) efi_system_resource_entry {
-+        uint8_t fw_class[OSF_UUID_OCTET_LEN];
-+        uint32_t fw_type;
-+        uint32_t fw_version;
-+        uint32_t lowest_supported_fw_version;
-+        uint32_t capsule_flags;
-+        uint32_t last_attempt_version;
-+        uint32_t last_attempt_status;
++		uint8_t fw_class[OSF_UUID_OCTET_LEN];
++		uint32_t fw_type;
++		uint32_t fw_version;
++		uint32_t lowest_supported_fw_version;
++		uint32_t capsule_flags;
++		uint32_t last_attempt_version;
++		uint32_t last_attempt_status;
 +};
 +
 +struct __attribute__((__packed__)) efi_system_resource_table {
@@ -174,5 +286,5 @@ index 4bcacb1f..aa5d2561 100644
  	uint8_t img_type_uuid[OSF_UUID_OCTET_LEN];
  	uint32_t client_permissions;
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-platform-corstone1000-Add-event-provider-proxy.patch b/meta-arm-bsp/=
recipes-security/trusted-services/corstone1000/0016-platform-corstone1000=
-Add-event-provider-proxy.patch
index e92b80ef..86868071 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-pl=
atform-corstone1000-Add-event-provider-proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-pl=
atform-corstone1000-Add-event-provider-proxy.patch
@@ -1,31 +1,84 @@
-From 7953806fd3fdb743c40b76e363b917fac786c636 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Tue, 11 Mar 2025 13:33:36 +0000
-Subject: [PATCH 10/11] platform: corstone1000: Add event provider proxy
+From 6a4cedce9d433bc42a71ac77c3cd90dde4242951 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Tue, 5 Aug 2025 15:22:44 +0100
+Subject: [PATCH 2/7] platform: corstone1000: Add event provider proxy fo=
r boot
+ confirmation handling
=20
-Normal world needs to send boot confirmation event
-to Secure Enclave and Trusted-Services is responsible
-to transfer the event to Secure Enclave.
-This commit implements the event handling framework in
-SE-proxy-SP and develops event provider proxy which
-forwards the event to Secure Enclave via psa calls.
-This change is introduced for Corstone-1000
+This patch introduces an event forwarding framework to support
+delivery of boot confirmation events from the normal world to the
+Secure Enclave for the Corstone-1000 platform.
=20
-Upstream-Status: Pending
+Key changes:
+- Implements an `event_provider` service in the SE-Proxy SP that
+  processes boot confirmation events received from the host.
+- Forwards the events to the Secure Enclave using PSA calls to
+  the `TFM_PLATFORM_SERVICE_HANDLE` and `TFM_PLATFORM_API_ID_IOCTL`.
+- Defines and registers a proxy factory (`event_handler_proxy_create`)
+  to initialize and connect the event provider with the RSE comms
+  backend.
+- Adds associated infrastructure in `infra.cmake` and headers to
+  support integration with the service framework.
+
+This mechanism ensures the SE-Proxy SP can relay important boot status
+events (e.g., FWU boot confirmation) to the Secure Enclave for secure
+state updates and lifecycle management.
+
+Upstream-Status: Backport [6a4cedce9d433bc42a71ac77c3cd90dde4242951]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 ---
+ .../service/common/include/psa/client.h       | 28 +++++++
  components/service/common/include/psa/sid.h   |  9 ++
- .../se-proxy/env/commonsp/se_proxy_sp.c       | 16 +++-
- .../corstone1000_event_handling.c             | 91 +++++++++++++++++++
- .../corstone1000_event_handling.h             | 42 +++++++++
- .../se-proxy/infra/corstone1000/infra.cmake   |  1 +
- .../corstone1000/service_proxy_factory.c      | 27 ++++++
- 6 files changed, 184 insertions(+), 2 deletions(-)
+ .../corstone1000_event_handling.c             | 83 +++++++++++++++++++
+ .../corstone1000_event_handling.h             | 40 +++++++++
+ .../se-proxy/infra/corstone1000/infra.cmake   |  6 ++
+ .../infra/corstone1000/spf_event_handler.c    | 44 ++++++++++
+ 6 files changed, 210 insertions(+)
  create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_event_handling.c
  create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_event_handling.h
+ create mode 100644 deployments/se-proxy/infra/corstone1000/spf_event_ha=
ndler.c
=20
+diff --git a/components/service/common/include/psa/client.h b/components=
/service/common/include/psa/client.h
+index db40d7af..7e3092ae 100644
+--- a/components/service/common/include/psa/client.h
++++ b/components/service/common/include/psa/client.h
+@@ -96,6 +96,34 @@ inline static uint32_t psa_ptr_const_to_u32(const voi=
d *ptr)
+ 	return (uintptr_t)ptr;
+ }
+=20
++static inline bool psa_ptr_would_truncate_u32(const void *ptr)
++{
++#if UINTPTR_MAX > UINT32_MAX
++	return (uintptr_t)ptr & ~((uintptr_t)UINT32_MAX);
++#else
++	(void)ptr;
++	return false;
++#endif
++}
++
++static inline psa_status_t psa_ptr_const_to_u32_checked(const void *src=
, uint32_t *dst)
++{
++	if (psa_ptr_would_truncate_u32(src))
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	*dst =3D (uint32_t)(uintptr_t)src;
++	return PSA_SUCCESS;
++}
++
++static inline psa_status_t psa_ptr_to_u32_checked(void *src, uint32_t *=
dst)
++{
++	if (psa_ptr_would_truncate_u32(src))
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	*dst =3D (uint32_t)(uintptr_t)src;
++	return PSA_SUCCESS;
++}
++
+ /*************************** PSA Client API ***************************=
*******/
+=20
+ /**
 diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 0235764d..9f5ea05e 100644
+index 0235764d..baf16fed 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
 @@ -40,6 +40,15 @@ extern "C" {
@@ -39,57 +92,17 @@ index 0235764d..9f5ea05e 100644
 +/**
 + * \brief Define a progressive numerical value for each SID which can b=
e used
 + *        when dispatching the requests to the service
-+*/
++ */
 +
  /******** TFM_SP_PLATFORM ********/
  #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
  #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
-diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 9f94092b..ce1410b2 100644
---- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-+++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-@@ -1,6 +1,6 @@
- // SPDX-License-Identifier: BSD-3-Clause
- /*
-- * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
-  */
-=20
- #include "components/rpc/common/endpoint/rpc_service_interface.h"
-@@ -42,7 +42,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
- 		goto fatal_error;
- 	}
-=20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 7, 16);
- 	if (rpc_status !=3D RPC_SUCCESS) {
- 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
- 		goto fatal_error;
-@@ -97,6 +97,18 @@ void __noreturn sp_main(union ffa_boot_info *boot_inf=
o)
- 		goto fatal_error;
- 	}
-=20
-+	rpc_iface =3D event_handler_proxy_create();
-+	if (!rpc_iface) {
-+		EMSG("Failed to create Capsule Update proxy");
-+		goto fatal_error;
-+	}
-+
-+	rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, rpc_iface=
);
-+	if (rpc_status !=3D RPC_SUCCESS) {
-+		EMSG("Failed to add service to RPC endpoint: %d", rpc_status);
-+		goto fatal_error;
-+	}
-+
- 	rpc_iface =3D fwu_proxy_create();
- 	if (!rpc_iface) {
- 		EMSG("Failed to create FWU proxy");
 diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_event_=
handling.c b/deployments/se-proxy/infra/corstone1000/corstone1000_event_h=
andling.c
 new file mode 100644
-index 00000000..faf450f2
+index 00000000..524db58d
 --- /dev/null
 +++ b/deployments/se-proxy/infra/corstone1000/corstone1000_event_handlin=
g.c
-@@ -0,0 +1,91 @@
+@@ -0,0 +1,83 @@
 +/*
 + * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
 + *
@@ -115,78 +128,70 @@ index 00000000..faf450f2
 +
 +/* Handler mapping table for service */
 +static const struct service_handler handler_table[] =3D {
-+	{OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
++	{.opcode =3D OPCODE_BOOT_CONFIRMED, .invoke =3D boot_confirmed_handler=
}
 +};
 +
-+struct rpc_service_interface *corstone1000_event_provider_init(
-+	struct event_provider *context)
++struct rpc_service_interface *corstone1000_event_provider_init(struct e=
vent_provider *context)
 +{
-+	struct rpc_service_interface *rpc_interface =3D NULL;
-+	const struct rpc_uuid dummy_uuid =3D { .uuid =3D { 0 }};
 +	if (!context)
 +		return NULL;
 +
-+	service_provider_init(
-+		&context->base_provider,
-+		context,
-+		&dummy_uuid,
-+		handler_table,
-+		sizeof(handler_table)/sizeof(struct service_handler));
-+
-+	rpc_interface =3D service_provider_get_rpc_interface(&context->base_pr=
ovider);
++	service_provider_init(&context->base_provider, context,
++			      &(const struct rpc_uuid){.uuid =3D { 0 }}, handler_table,
++		sizeof(handler_table) / sizeof(struct service_handler));
 +
-+	return rpc_interface;
++	return service_provider_get_rpc_interface(&context->base_provider);
 +}
 +
 +static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller_in=
terface *caller)
 +{
++	if (!caller) {
++		EMSG("%s rpc_caller is NULL", __func__);
++		return TS_RPC_ERROR_RESOURCE_FAILURE;
++	}
++
++	IMSG("%s opcode %x", __func__, opcode);
++
 +	uint32_t ioctl_id;
-+	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
++	uint32_t mem_buf_start_addr;
++
++	if (psa_ptr_to_u32_checked(&ioctl_id, &mem_buf_start_addr) !=3D PSA_SU=
CCESS) {
++		EMSG("%s start address of the memory buffer does not fit in 32 bits",=
 __func__);
++		return TS_RPC_ERROR_INTERNAL;
++	}
 +
 +	struct psa_invec in_vec[] =3D {
-+			{ .base =3D &ioctl_id, .len =3D sizeof(ioctl_id) }
++		{ .base =3D mem_buf_start_addr, .len =3D sizeof(ioctl_id) }
 +	};
 +
-+	if(!caller) {
-+		EMSG("event_handler rpc_caller is NULL");
-+		rpc_status =3D TS_RPC_ERROR_RESOURCE_FAILURE;
-+		return rpc_status;
-+	}
-+
-+	IMSG("event handler opcode %x", opcode);
-+	switch(opcode) {
-+		case OPCODE_BOOT_CONFIRMED:
++	switch (opcode) {
++	case OPCODE_BOOT_CONFIRMED:
 +		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
-+		/* Boot Confirmed event from Normal World  */
-+	=09
-+		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
-+			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++
++		psa_call(caller, TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOC=
TL, in_vec,
++			 IOVEC_LEN(in_vec), NULL, 0);
 +		break;
-+		default:
-+			EMSG("%s unsupported opcode", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
++
++	default:
++		EMSG("%s unsupported opcode", __func__);
++		return TS_RPC_ERROR_INVALID_PARAMETER;
 +	}
-+	return rpc_status;
 +
++	return TS_RPC_CALL_ACCEPTED;
 +}
 +
 +static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req)
 +{
-+	struct event_provider *this_instance =3D (struct event_provider*)conte=
xt;
-+	struct rpc_caller_interface *caller =3D this_instance->client.session-=
>caller;
-+	uint32_t opcode =3D req->opcode;
-+	rpc_status_t rpc_status;
-+
-+	rpc_status =3D event_handler(opcode, caller);
++	struct event_provider *this_instance =3D (struct event_provider *)cont=
ext;
 +
-+	return rpc_status;
++	return event_handler(req->opcode, this_instance->client.session->calle=
r);
 +}
 diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_event_=
handling.h b/deployments/se-proxy/infra/corstone1000/corstone1000_event_h=
andling.h
 new file mode 100644
-index 00000000..e8e60dae
+index 00000000..ecb2d6b8
 --- /dev/null
 +++ b/deployments/se-proxy/infra/corstone1000/corstone1000_event_handlin=
g.h
-@@ -0,0 +1,42 @@
+@@ -0,0 +1,40 @@
 +/*
 + * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
 + *
@@ -208,8 +213,7 @@ index 00000000..e8e60dae
 + * The event_provider is a service provider that accepts events
 + * and delegates them to a suitable backend.
 + */
-+struct event_provider
-+{
++struct event_provider {
 +	struct service_provider base_provider;
 +	struct service_client client;
 +};
@@ -221,8 +225,7 @@ index 00000000..e8e60dae
 + *
 + * \return An rpc_service_interface or NULL on failure
 + */
-+struct rpc_service_interface *corstone1000_event_provider_init(
-+	struct event_provider *context);
++struct rpc_service_interface *corstone1000_event_provider_init(struct e=
vent_provider *context);
 +
 +#ifdef __cplusplus
 +} /* extern "C" */
@@ -230,34 +233,48 @@ index 00000000..e8e60dae
 +
 +#endif /* CORSTONE1000_EVENT_HANDLING_H */
 diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 2bf6b36e..1ec43700 100644
+index 22d1542d..f0c2e58e 100644
 --- a/deployments/se-proxy/infra/corstone1000/infra.cmake
 +++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
-@@ -33,4 +33,5 @@ add_components(TARGET "se-proxy"
- target_sources(se-proxy PRIVATE
-=20
- 	${CMAKE_CURRENT_LIST_DIR}/service_proxy_factory.c
+@@ -14,6 +14,12 @@ set(CFG_ENABLE_CRYPTO        On)
+ set(CFG_ENABLE_CRYPTO_NANO   On)
+ set(CFG_ENABLE_IAT           On)
+ set(CFG_ENABLE_FWU           On)
++
++target_sources(se-proxy PRIVATE
++	${CMAKE_CURRENT_LIST_DIR}/spf_event_handler.c
 +	${CMAKE_CURRENT_LIST_DIR}/corstone1000_event_handling.c
- )
-diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index a754ace7..6d8c3855 100644
---- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-+++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -20,6 +20,7 @@
- #include <protocols/service/fwu/fwu_proto.h>
- #include <trace.h>
- #include "corstone1000_config.h"
++)
++
+ #----------------------------------------------------------------------=
---------
+ # Infrastructure components
+ #
+diff --git a/deployments/se-proxy/infra/corstone1000/spf_event_handler.c=
 b/deployments/se-proxy/infra/corstone1000/spf_event_handler.c
+new file mode 100644
+index 00000000..92820259
+--- /dev/null
++++ b/deployments/se-proxy/infra/corstone1000/spf_event_handler.c
+@@ -0,0 +1,44 @@
++/*
++ * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include "deployments/se-proxy/env/commonsp/proxy_service_factory_list.=
h"
++#include "rpc/common/caller/rpc_caller.h"
++#include "rpc/common/caller/rpc_caller_session.h"
++#include "rpc/common/interface/rpc_status.h"
++#include "rpc/common/interface/rpc_uuid.h"
++#include "rpc/rse_comms/caller/sp/rse_comms_caller.h"
++
 +#include "corstone1000_event_handling.h"
-=20
- /* backends */
- #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-@@ -164,6 +165,32 @@ struct rpc_service_interface *its_proxy_create(void=
)
- 	return secure_storage_provider_init(&its_provider, backend, &its_uuid)=
;
- }
-=20
++
 +struct rpc_service_interface *event_handler_proxy_create(void)
 +{
 +	static struct event_provider event_provider =3D {0};
++	const struct rpc_uuid dummy_uuid =3D { .uuid =3D { 0 }};
 +	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
 +
 +	/* Static objects for proxy instance */
@@ -272,7 +289,6 @@ index a754ace7..6d8c3855 100644
 +	if (rpc_status !=3D RPC_SUCCESS)
 +		return NULL;
 +
-+
 +	event_provider.client.session =3D &rpc_session;
 +	event_provider.client.rpc_status =3D RPC_SUCCESS;
 +	event_provider.client.service_info.supported_encodings =3D 0;
@@ -281,9 +297,8 @@ index a754ace7..6d8c3855 100644
 +	return corstone1000_event_provider_init(&event_provider);
 +}
 +
- struct rpc_service_interface *fwu_proxy_create(void)
- {
- 	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
++ADD_PROXY_SERVICE_FACTORY(event_handler_proxy_create,
++			  EVENT_HANDLER_PROXY, SE_PROXY_INTERFACE_PRIO_FWU + 1);
 --=20
-2.34.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-platform-corstone1000-Define-GUID-for-each-payloads.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0017-platform-corston=
e1000-Define-GUID-for-each-payloads.patch
index 61ab4680..8d13cedf 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-pl=
atform-corstone1000-Define-GUID-for-each-payloads.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-pl=
atform-corstone1000-Define-GUID-for-each-payloads.patch
@@ -1,30 +1,148 @@
-From 6a26d67c0b531af07537aefcbe7a46fc71471d4f Mon Sep 17 00:00:00 2001
-From: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Date: Thu, 27 Mar 2025 13:42:03 +0000
-Subject: [PATCH 8/8] platform: corstone1000: Define GUID for FWU payload=
s
+From a518c74b7ce050bba2d0aaece701086dc50ffa53 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Tue, 5 Aug 2025 13:54:13 +0100
+Subject: [PATCH 3/7] fwu:se-proxy: Allow platform override of FWU mappin=
g and
+ payload size
=20
-Specify the Global Unique Identifiers (GUIDs) for firmware update (FWU)
-payloads, which include BL2, TFM_S, FIP, and INITRAMFS.
-Note that the GUIDs differ between FVP and MPS3 platforms.
+Allow platform override of FWU mapping and payload size
+by updating the SE-Proxy deployment to support
+platform-specific overrides for Firmware Update configuration
+parameters.
=20
-Upstream-Status: Pending
-Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Specifically, it introduces configurable macros for the image mapping
+table (`img_mapping`), the number of mapping entries
+(`IMAGE_MAPPING_ELEMENT_COUNT`), and the maximum payload size
+(`MAX_PAYLOAD_SIZE`).
+Default values are provided if not defined by the platform.
+
+Corstone-1000 is supplying its own image mapping
+layout and FWU buffer size by defining these symbols.
+
+`corstone1000_config.h` and `corstone1000_config.c` containing
+platform-specific FWU configuration parameters for Corstone-1000
+are added.
+
+Key definitions include:
+- UUIDs for firmware images used on FVP and MPS3 variants.
+- An enum `fwu_image_index` to identify the image index in the capsule.
+
+This configuration enables consistent and reusable FWU integration
+across Corstone-1000 platforms in the SE-Proxy deployment.
+
+Additionaly `psa_fwu_m_update_agent_init()` call is moved after
+`psa_fwu_ipc_init()` because the former uses PSA API calls which can
+only be used when the IPC framework has been initialized.
+
+Upstream-Status: Backport [a518c74b7ce050bba2d0aaece701086dc50ffa53]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 ---
- .../infra/corstone1000/corstone1000_config.h  | 43 ++++++++++++++++---
- .../corstone1000/service_proxy_factory.c      | 41 +++++++++++++++---
- 2 files changed, 73 insertions(+), 11 deletions(-)
+ .../psa_fwu_m/agent/psa_fwu_m_update_agent.h  |  3 +
+ .../infra/corstone1000/corstone1000_config.c  | 56 +++++++++++++++++
+ .../infra/corstone1000/corstone1000_config.h  | 60 +++++++++++++++++++
+ .../se-proxy/infra/corstone1000/infra.cmake   | 10 ++++
+ deployments/se-proxy/infra/rse/spf_fwu.c      | 11 +++-
+ 5 files changed, 139 insertions(+), 1 deletion(-)
+ create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_config.c
+ create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_config.h
=20
+diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.h b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h
+index 3c06570d..6354b8ba 100644
+--- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h
++++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h
+@@ -41,6 +41,9 @@ struct update_agent *psa_fwu_m_update_agent_init(
+  */
+ void psa_fwu_m_update_agent_deinit(struct update_agent *update_agent);
+=20
++/* This should be defined by the platform */
++extern struct psa_fwu_m_image_mapping img_mapping[];
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.c b/deployments/se-proxy/infra/corstone1000/corstone1000_config.c
+new file mode 100644
+index 00000000..0cc0dee9
+--- /dev/null
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.c
+@@ -0,0 +1,56 @@
++/*
++ * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h"
++#include "protocols/service/fwu/fwu_proto.h"
++
++#include "corstone1000_config.h"
++
++#ifndef CORSTONE_1000_TYPE
++#error "CORSTONE_1000_TYPE is not defined."
++#endif
++
++struct psa_fwu_m_image_mapping img_mapping[IMAGE_MAPPING_ELEMENT_COUNT]=
 =3D {
++#if (CORSTONE_1000_TYPE =3D=3D CORSTONE_1000_TYPE_CORTEX_A35_FVP)
++	{
++		.uuid =3D FWU_FVP_BL2_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
++	},
++	{
++		.uuid =3D FWU_FVP_TFM_S_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
++	},
++	{
++		.uuid =3D FWU_FVP_FIP_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
++	},
++	{
++		.uuid =3D FWU_FVP_INITRAMFS_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
++	},
++#elif (CORSTONE_1000_TYPE =3D=3D CORSTONE_1000_TYPE_CORTEX_A35_MPS3)
++	{
++		.uuid =3D FWU_MPS3_BL2_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
++	},
++	{
++		.uuid =3D FWU_MPS3_TFM_S_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
++	},
++	{
++		.uuid =3D FWU_MPS3_FIP_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
++	},
++	{
++		.uuid =3D FWU_MPS3_INITRAMFS_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
++	},
++#else
++#error "Unsupported CORSTONE_1000_TYPE value. Valid values are: 0 (Cors=
tone-1000 with " \
++		"Cortex-A35 FVP), 1 (Corstone-1000 with Cortex-A35 MPS3)"
++#endif
++};
 diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-index 4a68c2fa..c4bd9c2c 100644
---- a/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+new file mode 100644
+index 00000000..59662ee3
+--- /dev/null
 +++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-@@ -11,17 +11,48 @@
- /* Maximum payload size to be transferred at once to Secure Enclave */
- #define MAX_PAYLOAD_SIZE 4096
-=20
--#define CORSTONE1000_FVP_FULL_CAPSULE_UUID  \
--{ 0x4e, 0x3a, 0x9f, 0x98, 0xe0, 0x46, 0xd0, 0x4c, 0x98, 0x77, 0xa2, 0x5=
c, 0x70, 0xc0, 0x13, 0x29, }
+@@ -0,0 +1,60 @@
++/*
++ * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef CORSTONE1000_CONFIG_H
++#define CORSTONE1000_CONFIG_H
++
++#define CORSTONE_1000_TYPE_CORTEX_A35_FVP  0 // Corstone-1000 with Cort=
ex-A35 FVP
++#define CORSTONE_1000_TYPE_CORTEX_A35_MPS3 1 // Corstone-1000 with Cort=
ex-A35 MPS3
++
 +/*
 + * GUIDs for capsule updatable firmware images
 + *
@@ -55,87 +173,73 @@ index 4a68c2fa..c4bd9c2c 100644
 +
 +#define FWU_MPS3_FIP_CAPSULE_UUID  \
 +{ 0x96, 0x2f, 0x30, 0x55, 0xf0, 0xc4, 0xf9, 0x5c, 0x86, 0x24, 0xe7, 0xc=
c, 0x38, 0x8f, 0x2b, 0x68, }
-=20
--#define CORSTONE1000_MPS3_FULL_CAPSULE_UUID  \
--{ 0xd1, 0x65, 0x18, 0xdf, 0xfb, 0x90, 0x59, 0x4d, 0x9c, 0x38, 0xc9, 0xf=
2, 0xc1, 0xbb, 0xa8, 0xcc, }
++
 +#define FWU_MPS3_INITRAMFS_CAPSULE_UUID  \
 +{ 0x72, 0xc9, 0x8a, 0x3e, 0x3c, 0xc3, 0xc9, 0x5c, 0x90, 0xa0, 0xcd, 0xd=
3, 0x15, 0x96, 0x83, 0xea, }
-=20
- /* Image indexes in the UEFI capsule */
- enum fwu_image_index
- {
--	FWU_IMAGE_INDEX_FULL_CAPSULE =3D 1,
--	FWU_IMAGE_INDEX_ESRT,
++
++ /* Image indexes in the UEFI capsule */
++enum fwu_image_index {
 +	FWU_IMAGE_INDEX_CAPSULE_BL2 =3D 1,
 +	FWU_IMAGE_INDEX_CAPSULE_TFM_S,
 +	FWU_IMAGE_INDEX_CAPSULE_FIP,
 +	FWU_IMAGE_INDEX_CAPSULE_INITRAMFS,
-+	FWU_IMAGE_INDEX_ESRT ,
- };
++	FWU_IMAGE_INDEX_ESRT,
++
++	FWU_IMAGE_INDEX_LAST =3D FWU_IMAGE_INDEX_ESRT,
++	FWU_IMAGE_INDEX_COUNT =3D FWU_IMAGE_INDEX_LAST,
++};
++
++#endif /* CORSTONE1000_CONFIG_H */
+diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
+index f0c2e58e..8e0ac95f 100644
+--- a/deployments/se-proxy/infra/corstone1000/infra.cmake
++++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
+@@ -33,4 +33,14 @@ add_components(TARGET "se-proxy"
+ 		"components/messaging/rse_comms/sp"
+ )
 =20
- #endif /* CORSTONE1000_CONFIG_H */
-diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index ed42e2cb..43a9ac37 100644
---- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-+++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -28,7 +28,14 @@
- #include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
- #include <service/attestation/client/psa/iat_client.h>
++if (CFG_ENABLE_FWU)
++    target_sources(se-proxy PRIVATE
++        ${CMAKE_CURRENT_LIST_DIR}/corstone1000_config.c
++    )
++
++    target_include_directories(se-proxy PRIVATE
++        ${CMAKE_CURRENT_LIST_DIR}
++    )
++endif()
++
+ include(../../infra/rse/service_proxy_factory.cmake REQUIRED)
+diff --git a/deployments/se-proxy/infra/rse/spf_fwu.c b/deployments/se-p=
roxy/infra/rse/spf_fwu.c
+index 4f123ba1..90f200e1 100644
+--- a/deployments/se-proxy/infra/rse/spf_fwu.c
++++ b/deployments/se-proxy/infra/rse/spf_fwu.c
+@@ -18,6 +18,14 @@
+ #include "service/fwu/common/update_agent_interface.h"
+ #include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
 =20
--/* IMAGE_MAPPING_ELEMENT_COUNT includes the number of images to be upda=
ted and ESRT image */
-+/* IMAGE_MAPPING_ELEMENT_COUNT includes the number of images to be upda=
ted and ESRT image.
-+ * It includes:
-+ * - BL2
-+ * - TFM_S
-+ * - FIP
-+ * - INITRAMFS
-+ * - ESRT
-+ */
- #define IMAGE_MAPPING_ELEMENT_COUNT (FWU_IMAGE_CAPSULE_COUNT + 1)
++#ifndef IMAGE_MAPPING_ELEMENT_COUNT
++#define IMAGE_MAPPING_ELEMENT_COUNT 0
++#endif
++
++#ifndef MAX_PAYLOAD_SIZE
++#define MAX_PAYLOAD_SIZE 4096
++#endif
++
+ struct rpc_service_interface *fwu_proxy_create(void)
+ {
+ 	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
+@@ -38,9 +46,10 @@ struct rpc_service_interface *fwu_proxy_create(void)
+ 	if (rpc_status !=3D RPC_SUCCESS)
+ 		return NULL;
 =20
- /* The index to access the ESRT image in the psa_fwu_m_image_mapping st=
ructure
-@@ -41,13 +48,37 @@ static const struct rpc_uuid dummy_uuid =3D { 0 };
- static struct psa_fwu_m_image_mapping img_mapping[IMAGE_MAPPING_ELEMENT=
_COUNT] =3D {
- #if PLATFORM_IS_FVP
- 	{
--		.uuid =3D CORSTONE1000_FVP_FULL_CAPSULE_UUID,
--		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
-+		.uuid =3D FWU_FVP_BL2_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
-+	},
-+	{
-+		.uuid =3D FWU_FVP_TFM_S_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
-+	},
-+	{
-+		.uuid =3D FWU_FVP_FIP_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
-+	},
-+	{
-+		.uuid =3D FWU_FVP_INITRAMFS_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
- 	},
- #else
- 	{
--		.uuid =3D CORSTONE1000_MPS3_FULL_CAPSULE_UUID,
--		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
-+		.uuid =3D FWU_MPS3_BL2_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
-+	},
-+	{
-+		.uuid =3D FWU_MPS3_TFM_S_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
-+	},
-+	{
-+		.uuid =3D FWU_MPS3_FIP_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
-+	},
-+	{
-+		.uuid =3D FWU_MPS3_INITRAMFS_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
- 	},
- #endif
- };
+-	agent =3D psa_fwu_m_update_agent_init(NULL, 0, 4096);
+ 	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
+ 		return NULL;
++	agent =3D psa_fwu_m_update_agent_init(img_mapping, IMAGE_MAPPING_ELEME=
NT_COUNT,
++					    MAX_PAYLOAD_SIZE);
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Add-the-com-buffer-address-and-page-count.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0018-Add-the-com-buffer-address=
-and-page-count.patch
index ffca2adb..2625dc18 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ad=
d-the-com-buffer-address-and-page-count.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ad=
d-the-com-buffer-address-and-page-count.patch
@@ -1,34 +1,35 @@
-From 2eef8097c6411fb54b2d0203159e120d192315c7 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 24 Jul 2025 10:33:41 +0000
-Subject: [PATCH] Plat: Corstone-1000: Add MM communication buffer config=
s to
- CMake
+From 333422fd06ccf69de8052988ec42398cec12ac3f Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Fri, 8 Aug 2025 00:18:16 +0100
+Subject: [PATCH] platform: corstone1000: Add MM communication buffer
+ configs to CMake
=20
 Two variables are added into the Corstone-1000 platform
 CMake file so the MM communication buffer address and
 the page count can be configured.
=20
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/40893]
-Change-Id: I6bbdc90231b0417d4318d6709568113ab1f2c8ce
+Upstream-Status: Backport [d49a99d6ade219a617741001fb23016d791855ee]
 Signed-off-by: Michael Safwat <michael.safwat@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- platform/providers/arm/corstone1000/platform.cmake | 2 ++
- 1 file changed, 2 insertions(+)
+ platform/providers/arm/corstone1000/platform.cmake | 4 ++++
+ 1 file changed, 4 insertions(+)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index db1e9743..88113c9d 100644
+index 3aeb4922..aeeb8fb4 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -18,6 +18,8 @@ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway=
 SP heap size")
- set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
+@@ -12,6 +12,10 @@ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gatewa=
y SP heap size")
+ set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
S_COMMS_PAYLOAD buffer")
  set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
- set(TFM_FWU_MAX_DIGEST_SIZE ${TOTAL_ESRT_SIZE} CACHE STRING "Maximum si=
ze of ESRT entries of all the images in a bank")
+=20
 +set(MM_COMM_BUFFER_ADDRESS "0x00000000 0x81FFF000" CACHE STRING "MM Com=
munication buffer start address")
 +set(MM_COMM_BUFFER_PAGE_COUNT 0x1 CACHE STRING "MM Communication buffer=
 page count")
-=20
++
++
  target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
+ 	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
 --=20
 2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0022-Make-treating-warnings-as-errors-configurable.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/corstone1000/0022-Make-treating-warnings=
-as-errors-configurable.patch
new file mode 100644
index 00000000..d79e9e99
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0022-Ma=
ke-treating-warnings-as-errors-configurable.patch
@@ -0,0 +1,194 @@
+From 44e56b28f6a5ea9caab0bcccce3d02c59bb5d0ce Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Tue, 19 Aug 2025 11:07:39 +0200
+Subject: [PATCH 1/8] Make treating warnings as errors configurable
+
+Introduce the CMAKE_COMPILE_WARNING_AS_ERROR build option to control
+whether the project treats compiler warnings as errors. This option is
+enabled by default (On) and can be overridden via the CMake command line
+using the -D flag or with an environment variable with the same name.
+If both are specified, the command-line option takes precedence over the
+environment variable.
+
+Enforcing warnings as errors helps maintain code quality, which is
+especially important for security-focused projects. However, this can be
+problematic for system integrators using newer compiler versions than
+those used in upstream CI, as new compilers may introduce additional
+warnings that cause builds to fail.
+This option provides a temporary workaround by allowing such builds to
+proceed until the warnings are addressed properly.
+
+Upstream-Status: Backport [44e56b28f6a5ea9caab0bcccce3d02c59bb5d0ce]
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+---
+ .../arm-linux/default_toolchain_file.cmake    | 24 +++++++++++++++++--
+ .../linux-pc/default_toolchain_file.cmake     | 23 ++++++++++++++++--
+ .../opteesp/default_toolchain_file.cmake      | 23 ++++++++++++++++--
+ environments/sp/default_toolchain_file.cmake  | 21 +++++++++++++++-
+ 4 files changed, 84 insertions(+), 7 deletions(-)
+
+diff --git a/environments/arm-linux/default_toolchain_file.cmake b/envir=
onments/arm-linux/default_toolchain_file.cmake
+index 7e565dd2..d5900b05 100644
+--- a/environments/arm-linux/default_toolchain_file.cmake
++++ b/environments/arm-linux/default_toolchain_file.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -19,9 +19,29 @@ set(CMAKE_SYSTEM_PROCESSOR arm)
+=20
+ set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
+ set(TS_MANDATORY_AARCH_FLAGS "-mstrict-align -march=3Darmv8-a+crc -DARM=
64=3D1" CACHE STRING "Compiler flags configuring architecture specific ")
+-set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
++set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
+=20
++# Allow defining the "warning as error behavior" using an environment v=
ariable. But prioritize command line
++# definition if present.
++# If a cache variable is not present
++if(NOT DEFINED CACHE{CMAKE_COMPILE_WARNING_AS_ERROR})
++	# And an environment variable is, copy its value to the cache
++	if (DEFINED ENV{CMAKE_COMPILE_WARNING_AS_ERROR})
++		set(CMAKE_COMPILE_WARNING_AS_ERROR $ENV{CMAKE_COMPILE_WARNING_AS_ERRO=
R} CACHE Bool "If compilation warnings should be treated as errors.")
++	endif()
++endif()
++
++# By default warnings should be treated as errors.
++set(CMAKE_COMPILE_WARNING_AS_ERROR On CACHE BOOL "If compilation warnin=
gs should be treated as errors.")
++
++# Cmake v3.24 + shall set the warning flag automatically, but does not =
when processing our deployments. As a workaround
++# set -Werror manually always as setting it twice shall have no ill eff=
ect.
++if (CMAKE_COMPILE_WARNING_AS_ERROR)
++	string(APPEND TS_WARNING_FLAGS " -Werror")
++endif()
++
++
+ # branch-protection enables bti/pac while compile force-bti tells the l=
inker to
+ # warn if some object files lack the .note.gnu.property section with th=
e BTI
+ # flag, and to turn on the BTI flag in the output anyway.
+diff --git a/environments/linux-pc/default_toolchain_file.cmake b/enviro=
nments/linux-pc/default_toolchain_file.cmake
+index 2215d6b5..010105c2 100644
+--- a/environments/linux-pc/default_toolchain_file.cmake
++++ b/environments/linux-pc/default_toolchain_file.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -11,9 +11,28 @@ include_guard(GLOBAL)
+=20
+ set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
+ set(TS_MANDATORY_AARCH_FLAGS "" CACHE STRING "Compiler flags configurin=
g architecture specific ")
+-set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
++set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
+=20
++# Allow defining the "warning as error behavior" using an environment v=
ariable. But prioritize command line
++# definition if present.
++# If a cache variable is not present
++if(NOT DEFINED CACHE{CMAKE_COMPILE_WARNING_AS_ERROR})
++	# And an environment variable is, copy its value to the cache
++	if (DEFINED ENV{CMAKE_COMPILE_WARNING_AS_ERROR})
++		set(CMAKE_COMPILE_WARNING_AS_ERROR $ENV{CMAKE_COMPILE_WARNING_AS_ERRO=
R} CACHE Bool "If compilation warnings should be treated as errors.")
++	endif()
++endif()
++
++# By default warnings should be treated as errors.
++set(CMAKE_COMPILE_WARNING_AS_ERROR On CACHE BOOL "If compilation warnin=
gs should be treated as errors.")
++
++# Cmake v3.24 + shall set the warning flag automatically, but does not =
when processing our deployments. As a workaround
++# set -Werror manually always as setting it twice shall have no ill eff=
ect.
++if (CMAKE_COMPILE_WARNING_AS_ERROR)
++	string(APPEND TS_WARNING_FLAGS " -Werror")
++endif()
++
+ # Set flags affecting all build types
+ string(APPEND CMAKE_C_FLAGS_INIT " ${TS_MANDATORY_AARCH_FLAGS}")
+ string(APPEND CMAKE_CXX_FLAGS_INIT " ${TS_MANDATORY_AARCH_FLAGS}")
+diff --git a/environments/opteesp/default_toolchain_file.cmake b/environ=
ments/opteesp/default_toolchain_file.cmake
+index b150b852..677e92ff 100644
+--- a/environments/opteesp/default_toolchain_file.cmake
++++ b/environments/opteesp/default_toolchain_file.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -21,10 +21,29 @@ set(CMAKE_POSITION_INDEPENDENT_CODE True)
+=20
+ set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
+ set(TS_MANDATORY_AARCH_FLAGS "-fpic -mstrict-align -march=3Darmv8-a+crc=
" CACHE STRING "Compiler flags configuring architecture specific ")
+-set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
++set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "-pie -Wl,--as-needed -Wl,--sort-section=3D=
alignment -zmax-page-size=3D4096"
+ 	CACHE STRING "Linker flags needed for correct builds.")
+=20
++# Allow defining the "warning as error behavior" using an environment v=
ariable. But prioritize command line
++# definition if present.
++# If a cache variable is not present
++if(NOT DEFINED CACHE{CMAKE_COMPILE_WARNING_AS_ERROR})
++	# And an environment variable is, copy its value to the cache
++	if (DEFINED ENV{CMAKE_COMPILE_WARNING_AS_ERROR})
++		set(CMAKE_COMPILE_WARNING_AS_ERROR $ENV{CMAKE_COMPILE_WARNING_AS_ERRO=
R} CACHE Bool "If compilation warnings should be treated as errors.")
++	endif()
++endif()
++
++# By default warnings should be treated as errors.
++set(CMAKE_COMPILE_WARNING_AS_ERROR On CACHE BOOL "If compilation warnin=
gs should be treated as errors.")
++
++# Cmake v3.24 + shall set the warning flag automatically, but does not =
when processing our deployments. As a workaround
++# set -Werror manually always as setting it twice shall have no ill eff=
ect.
++if (CMAKE_COMPILE_WARNING_AS_ERROR)
++	string(APPEND TS_WARNING_FLAGS " -Werror")
++endif()
++
+ # branch-protection enables bti/pac while compile force-bti tells the l=
inker to
+ # warn if some object files lack the .note.gnu.property section with th=
e BTI
+ # flag, and to turn on the BTI flag in the output anyway.
+diff --git a/environments/sp/default_toolchain_file.cmake b/environments=
/sp/default_toolchain_file.cmake
+index d41ecec5..bbe4fb91 100644
+--- a/environments/sp/default_toolchain_file.cmake
++++ b/environments/sp/default_toolchain_file.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -24,6 +24,25 @@ set(TS_MANDATORY_AARCH_FLAGS "-fpie -mstrict-align -m=
arch=3Darmv8-a+crc" CACHE STR
+ set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "-Wl,-pie -Wl,--no-dynamic-linker -Wl,--s=
ort-section=3Dalignment -zmax-page-size=3D4096" CACHE STRING "Linker flag=
s needed for correct builds.")
+=20
++# Allow defining the "warning as error behavior" using an environment v=
ariable. But prioritize command line
++# definition if present.
++# If a cache variable is not present
++if(NOT DEFINED CACHE{CMAKE_COMPILE_WARNING_AS_ERROR})
++	# And an environment variable is, copy its value to the cache
++	if (DEFINED ENV{CMAKE_COMPILE_WARNING_AS_ERROR})
++		set(CMAKE_COMPILE_WARNING_AS_ERROR $ENV{CMAKE_COMPILE_WARNING_AS_ERRO=
R} CACHE Bool "If compilation warnings should be treated as errors.")
++	endif()
++endif()
++
++# By default warnings should be treated as errors.
++set(CMAKE_COMPILE_WARNING_AS_ERROR On CACHE BOOL "If compilation warnin=
gs should be treated as errors.")
++
++# Cmake v3.24 + shall set the warning flag automatically, but does not =
when processing our deployments. As a workaround
++# set -Werror manually always as setting it twice shall have no ill eff=
ect.
++if (CMAKE_COMPILE_WARNING_AS_ERROR)
++	string(APPEND TS_WARNING_FLAGS " -Werror")
++endif()
++
+ # branch-protection enables bti/pac while compile force-bti tells the l=
inker to
+ # warn if some object files lack the .note.gnu.property section with th=
e BTI
+ # flag, and to turn on the BTI flag in the output anyway.
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0024-psa-crypto-fix-AEAD-block-cypher-support.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0024-psa-crypto-fix-AEAD-block-c=
ypher-support.patch
new file mode 100644
index 00000000..ee016245
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0024-ps=
a-crypto-fix-AEAD-block-cypher-support.patch
@@ -0,0 +1,73 @@
+From 85c8535f448466cdbd773f7072a42203ebc6ae64 Mon Sep 17 00:00:00 2001
+From: Gabor Abonyi <gabor.abonyi@arm.com>
+Date: Fri, 4 Apr 2025 11:43:09 +0000
+Subject: [PATCH 01/25] psa-crypto: fix AEAD block cypher support
+
+This change enables support for block cyphers that require input data
+to be processed in whole block-sized chunks.
+
+psa_aead_encrypt() may send all input data for encryption, but the
+underlying implementation is permitted to return only full blocks.
+Any remaining data is returned later via psa_aead_finish().
+Similarly, in psa_aead_decrypt(), extra decrypted data may be returned
+during psa_aead_verify().
+
+This update ensures compatibility with block-based hardware accelerators
+by deferring partial block processing until finalisation steps.
+
+Upstream-Status: Backport [85c8535f448466cdbd773f7072a42203ebc6ae64]
+Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
+---
+ .../service/crypto/client/psa/psa_aead.c       | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
+index c820d222..5d76f708 100644
+--- a/components/service/crypto/client/psa/psa_aead.c
++++ b/components/service/crypto/client/psa/psa_aead.c
+@@ -7,6 +7,7 @@
+ #include <psa/crypto.h>
+ #include "psa_crypto_client.h"
+ #include "crypto_caller_selector.h"
++#include <string.h>
+=20
+ psa_status_t psa_aead_encrypt_setup(psa_aead_operation_t *operation,
+ 	psa_key_id_t key,
+@@ -244,14 +245,19 @@ psa_status_t psa_aead_encrypt(psa_key_id_t key,
+ 	{
+ 		size_t remaining_aead_len =3D 0;
+ 		size_t tag_len =3D 0;
++		uint8_t tag[PSA_AEAD_TAG_MAX_SIZE];
+=20
+ 		psa_status =3D psa_aead_finish(&operation,
+-			NULL, 0, &remaining_aead_len,
+-			&aeadtext[bytes_output], aeadtext_size - bytes_output, &tag_len);
++			&aeadtext[bytes_output], aeadtext_size - bytes_output, &remaining_ae=
ad_len,
++			tag, PSA_AEAD_TAG_MAX_SIZE, &tag_len);
+=20
+-		if (psa_status =3D=3D PSA_SUCCESS) {
++		if (aeadtext_size < bytes_output + remaining_aead_len + tag_len)
++			psa_status =3D PSA_ERROR_BUFFER_TOO_SMALL;
+=20
+-			*aeadtext_length =3D bytes_output + remaining_aead_len + tag_len;
++		if (psa_status =3D=3D PSA_SUCCESS) {
++			bytes_output +=3D remaining_aead_len;
++			memcpy(&aeadtext[bytes_output], tag, tag_len);
++			*aeadtext_length =3D bytes_output + tag_len;
+ 		}
+ 		else {
+=20
+@@ -301,8 +307,8 @@ psa_status_t psa_aead_decrypt(psa_key_id_t key,
+ 		size_t remaining_plaintext_len =3D 0;
+=20
+ 		psa_status =3D psa_aead_verify(&operation,
+-			NULL, 0, &remaining_plaintext_len,
+-			&aeadtext[bytes_output], aeadtext_length - bytes_output);
++			&plaintext[bytes_output], plaintext_size - bytes_output,
++			&remaining_plaintext_len, &aeadtext[ciphertext_len], tag_len);
+=20
+ 		if (psa_status =3D=3D PSA_SUCCESS) {
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 4d2dfa31..703c07cb 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -2,26 +2,19 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/c=
orstone1000:"
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000  =3D " \
-    file://0001-Fix-in-AEAD-for-psa-arch-test-254.patch \
-    file://0002-Fix-psa-api-crypto-test-no-243.patch \
-    file://0003-Remove-Werror-flag.patch \
-    file://0004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
-    file://0005-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
-    file://0006-Align-PSA-Crypto-with-TF-Mv2.1.patch \
-    file://0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
-    file://0008-se-proxy-protobuf-change.patch \
     file://0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.pat=
ch \
-    file://0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch =
\
-    file://0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch=
 \
-    file://0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patc=
h \
-    file://0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch=
 \
-    file://0014-fwu-Add-EFI-ESRT-v1-support.patch \
-    file://0015-platform-corstone1000-Enable-ESRT-support.patch \
     file://0016-platform-corstone1000-Add-event-provider-proxy.patch \
     file://0017-platform-corstone1000-Define-GUID-for-each-payloads.patc=
h \
+    file://0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch=
 \
     file://0018-Add-the-com-buffer-address-and-page-count.patch \
-    file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
-    "
+    file://0014-fwu-Add-EFI-ESRT-v1-support.patch \
+    file://0022-Make-treating-warnings-as-errors-configurable.patch \
+    file://0003-Remove-Werror-flag.patch \
+    file://0007-fwu-proxy-refactor-image-mapping.patch \
+    file://0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
+    file://0004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
+    file://0024-psa-crypto-fix-AEAD-block-cypher-support.patch \
+"
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"
=20
@@ -30,4 +23,5 @@ TS_PLATFORM:fvp-base =3D "arm/fvp/fvp_base_revc-2xaemv8=
a"
=20
 EXTRA_OECMAKE:append:corstone1000 =3D " \
     -DCORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE} \
+    -DCMAKE_COMPILE_WARNING_AS_ERROR=3DOFF \
 "
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 50e11117..210086fe 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -13,8 +13,7 @@ SRC_URI:append =3D "\
     file://0005-cpputest-fix-cmake-4.0-compatibility.patch \
 "
=20
-# Trusted Services; aka. v1.1.0
-SRCREV_trusted-services =3D "83bd53b6689ebb071bc13fcd4e01618bab2e74ca"
+SRCREV_trusted-services =3D "v1.2.0"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${UNPACKDIR}/trusted-services"

