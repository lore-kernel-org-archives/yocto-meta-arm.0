Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C960ACF9C54
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:23:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21025.1726845804933146468
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 08:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15E981007;
	Fri, 20 Sep 2024 08:23:54 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.85.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825A33F64C;
	Fri, 20 Sep 2024 08:23:23 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-services: corstone1000: Update Trusted-Services patches
Date: Fri, 20 Sep 2024 16:23:14 +0100
Message-Id: <20240920152314.1752155-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920152314.1752155-1-harsimransingh.tungal@arm.com>
References: <20240920152314.1752155-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 15:23:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6096

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Modify the upstream status and commit descriptions of Trusted-Services pa=
tches.
Few patches have been been upstreamed to external Trusted-Services gerrit=
 repository
for review. So, update upstream status of those patches accordingly.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...ub-capsule-update-service-components.patch |  2 +-
 ...2-Fix-in-AEAD-for-psa-arch-test-254.patch} | 42 +++++++++++--------
 .../0005-Fix-psa-api-crypto-test-no-243.patch | 31 ++++++++++++++
 ...0-add-compile-definitions-for-ECP_DP.patch | 28 -------------
 ...sizes-compile-time-definitions-user.patch} | 17 ++++----
 ...0019-Align-PSA-Crypto-with-TF-Mv2.1.patch} |  6 +--
 .../trusted-services/ts-arm-platforms.inc     |  8 ++--
 7 files changed, 74 insertions(+), 60 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0002=
-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch =3D> 0002-Fix-in-AEAD-fo=
r-psa-arch-test-254.patch} (80%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-Fix-psa-api-crypto-test-no-243.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch =3D> 0018-Make-RSS-=
and-MHU-sizes-compile-time-definitions-user.patch} (68%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0019=
-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch =3D> 0019-Align-PSA-Crypto-=
with-TF-Mv2.1.patch} (98%)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0001-Add-stub-capsule-update-s=
ervice-components.patch
index 0f6fab81..fa33f78c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
@@ -8,7 +8,7 @@ stub components are added to provide a starting point for=
 an
 implementation. The capsule update service provider is integrated
 into the se-proxy/common deployment.
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [Trusted-Services Design needs to be foll=
owed]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0002-Fix-in-AEAD-for-psa-arch-t=
est-254.patch
similarity index 80%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
2-Fix-in-AEAD-for-psa-arch-test-254.patch
index 524d6f7a..02c9c668 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
x-in-AEAD-for-psa-arch-test-254.patch
@@ -1,23 +1,29 @@
-From 1923e1f4dbd8f912701c2870822fa4b61eb6082d Mon Sep 17 00:00:00 2001
+From 834d5184902341414eb147204eeda8b0ff01f38c Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 2/8] Fixes in AEAD for psa-arch test 54 and 58.
+Subject: [PATCH 2/8] Fix in AEAD for psa-arch test 254
=20
-Upstream-Status: Pending [Not submitted to upstream yet]
+PSA crypto test 254 fails at checkpoint 6.
+Fix output arguments in various crypto AEAD functions
+to match crypto service implementation in TF-M. AEAD API's
+in TF-M start expecting output size as an argument.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31176]=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- .../crypto/client/caller/packed-c/crypto_caller_aead.h    | 1 +
- components/service/crypto/include/psa/crypto_sizes.h      | 2 +-
- .../crypto/provider/extension/aead/aead_provider.c        | 8 ++++++--
- .../extension/aead/serializer/aead_provider_serializer.h  | 1 +
- .../packed-c/packedc_aead_provider_serializer.c           | 2 ++
- protocols/service/crypto/packed-c/aead.h                  | 1 +
- 6 files changed, 12 insertions(+), 3 deletions(-)
+ .../crypto/client/caller/packed-c/crypto_caller_aead.h |  1 +
+ components/service/crypto/include/psa/crypto_sizes.h   |  2 +-
+ .../crypto/provider/extension/aead/aead_provider.c     | 10 ++++++++--
+ .../aead/serializer/aead_provider_serializer.h         |  1 +
+ .../packed-c/packedc_aead_provider_serializer.c        |  2 ++
+ protocols/service/crypto/packed-c/aead.h               |  1 +
+ 6 files changed, 14 insertions(+), 3 deletions(-)
=20
 diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index bf39762b0..27ffbc66e 100644
+index 417189e..236d3e2 100644
 --- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 +++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 @@ -314,6 +314,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
@@ -29,7 +35,7 @@ index bf39762b0..27ffbc66e 100644
 =20
  	/* Mandatory input data parameter */
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 30aa102da..130d27295 100644
+index 30aa102..130d272 100644
 --- a/components/service/crypto/include/psa/crypto_sizes.h
 +++ b/components/service/crypto/include/psa/crypto_sizes.h
 @@ -351,7 +351,7 @@
@@ -42,7 +48,7 @@ index 30aa102da..130d27295 100644
  /** A sufficient output buffer size for psa_aead_update().
   *
 diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index b73d88d32..6a0f96c3c 100644
+index b73d88d..510cffa 100644
 --- a/components/service/crypto/provider/extension/aead/aead_provider.c
 +++ b/components/service/crypto/provider/extension/aead/aead_provider.c
 @@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct rpc_request *req)
@@ -58,22 +64,24 @@ index b73d88d32..6a0f96c3c 100644
 =20
  	if (rpc_status =3D=3D RPC_SUCCESS) {
 =20
-@@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct rpc_request *req)
+@@ -300,9 +301,14 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct rpc_request *req)
  		if (crypto_context) {
 =20
  			size_t output_len =3D 0;
 -			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(input_len);
 +			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(24);
++			/* Always allocate maximum size to be more robust to implementations=
 of psa_aead_update() */
  			uint8_t *output =3D malloc(output_size);
 =20
 +                        if (recv_output_size < output_size) {
 +                            output_size =3D recv_output_size;
 +                        }
++
  			if (output) {
 =20
  				psa_status =3D psa_aead_update(&crypto_context->op.aead,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
-index be76d2bc6..590973048 100644
+index be76d2b..5909730 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 +++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 @@ -51,6 +51,7 @@ struct aead_provider_serializer {
@@ -85,7 +93,7 @@ index be76d2bc6..590973048 100644
 =20
  	rpc_status_t (*serialize_aead_update_resp)(struct rpc_buffer *resp_buf=
,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
-index 8f8c3c7f2..922a7b651 100644
+index 8f8c3c7..922a7b6 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 +++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 @@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct rpc_buffer *req_
@@ -105,7 +113,7 @@ index 8f8c3c7f2..922a7b651 100644
  		tlv_const_iterator_begin(&req_iter,
  			(uint8_t*)req_buf->data + expected_fixed_len,
 diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
-index 0be266b52..435fd3b52 100644
+index 0be266b..435fd3b 100644
 --- a/protocols/service/crypto/packed-c/aead.h
 +++ b/protocols/service/crypto/packed-c/aead.h
 @@ -98,6 +98,7 @@ enum
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-Fix-psa-api-crypto-test-no-243.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0005-Fix-psa-api-crypto-test-no-243.patch
new file mode 100644
index 00000000..bb30a766
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Fi=
x-psa-api-crypto-test-no-243.patch
@@ -0,0 +1,31 @@
+From 372d6e9e5827486841ffe15a1b050569fff762b6 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 10 Apr 2024 09:17:39 +0200
+Subject: [PATCH 5/8] Fix psa-api-crypto-test no 243
+
+Enable MbedTLS ECP DP SECP521R1 ECC algorithm to pass
+PSA-API tests's `psa-api-crypto-test` number 243 as it is
+required for Corstone-1000.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31177/1]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ platform/providers/arm/corstone1000/platform.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index d944acf..e811c25 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -14,6 +14,7 @@ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+ 	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
+ 	COMMS_MHU_MSG_SIZE=3D0x3500
++	MBEDTLS_ECP_DP_SECP521R1_ENABLED
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone10=
00-add-compile-definitions-for-ECP_DP.patch
deleted file mode 100644
index e1166905..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-add-compile-definitions-for-ECP_DP.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a7818585e1113aabf310a94eea802ff79234b0db Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 10 Apr 2024 09:17:39 +0200
-Subject: [PATCH 5/8] plat: corstone1000: add compile definitions for=20
- ECP_DP_SECP512R1
-
-Corstone1000 runs PSA-API tests which requires this ECC algorithm.
-Without setting this, corstone1000 fails psa-api-crypto-test no 243.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending
----
- platform/providers/arm/corstone1000/platform.cmake | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 663226740..83350f788 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -26,3 +26,5 @@ get_property(_platform_driver_dependencies TARGET ${TG=
T}
- if ("mhu" IN_LIST _platform_driver_dependencies)
- 	include(${TS_ROOT}/platform/drivers/arm/mhu_driver/mhu_v2_x/driver.cma=
ke)
- endif()
-+
-+add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch b/meta-arm-bsp/=
recipes-security/trusted-services/corstone1000/0018-Make-RSS-and-MHU-size=
s-compile-time-definitions-user.patch
similarity index 68%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
8-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
index 76e78fa3..e503efe5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ch=
ange-RSS_COMMS-cmake-variables-to-cahce-vars.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ma=
ke-RSS-and-MHU-sizes-compile-time-definitions-user.patch
@@ -1,19 +1,22 @@
-From e8b577d02d1d4ed2492bb0b6c3a5bb7d2656f13a Mon Sep 17 00:00:00 2001
+From 6e7e3f2f1cb96eb1c895e8573fae8c141e9b64c8 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Fri, 17 May 2024 13:21:07 +0200
-Subject: [PATCH] Change RSS_COMMS cmake variables to cahce vars
+Subject: [PATCH] Make RSS and MHU sizes compile-time definitions
+ user-configurable
=20
-This way they can be set externally as well for the corstone1000
-platform.
+Replace the hardcoded RSS and MHU compile definitions values with CMake
+cache variables that users can configure to change the size of the RSS
+communication payload and the MHU message.
=20
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31178/1]
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
  platform/providers/arm/corstone1000/platform.cmake | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 16139c80e..82ac14f0b 100644
+index e811c25..8997155 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
 @@ -9,11 +9,13 @@
@@ -29,9 +32,9 @@ index 16139c80e..82ac14f0b 100644
 -	COMMS_MHU_MSG_SIZE=3D0x3500
 +	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE}
 +	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
  )
 =20
- get_property(_platform_driver_dependencies TARGET ${TGT}
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch b/meta-arm-bsp/recipes-=
security/trusted-services/corstone1000/0019-Align-PSA-Crypto-with-TF-Mv2.=
1.patch
similarity index 98%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
9-Align-PSA-Crypto-with-TF-Mv2.1.patch
index f02c7ea3..88413dd3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-Al=
ign-PSA-Crypto-with-TF-Mv2.1.patch
@@ -1,9 +1,9 @@
 From 3bb579379bcfe32ae0b81f721b370afcb58e9693 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 10 Jul 2024 11:07:09 +0200
-Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1
+Subject: [PATCH] Align PSA Crypto with TF-Mv2.1
=20
-The files were updated using the TF-Mv2.1 release (0c4c99b) commit.
+Update following files using the TF-Mv2.1 release (0c4c99b) commit.
=20
 * crypto_sid.h
 This is derived from TF-M's tfm_crypto_defs.h file. The crypto function
@@ -21,7 +21,7 @@ The psa_client_key_attributes_s struct had to be aligne=
d with the
 psa_key_attributes_s struct in TF-M. (psa_crypto.c)
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31179/1]
 ---
  .../service/common/include/psa/crypto_sid.h   | 168 +++++-------------
  .../backend/psa_ipc/crypto_ipc_backend.h      |   9 +-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 2c34229e..af313f44 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -3,10 +3,10 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/c=
orstone1000:"
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000  =3D " \
     file://0001-Add-stub-capsule-update-service-components.patch \
-    file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
+    file://0002-Fix-in-AEAD-for-psa-arch-test-254.patch \
     file://0003-FMP-Support-in-Corstone1000.patch \
     file://0004-smm_gateway-GetNextVariableName-Fix.patch     \
-    file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.pat=
ch \
+    file://0005-Fix-psa-api-crypto-test-no-243.patch \
     file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
     file://0008-plat-corstone1000-add-client_id-for-FMP-service.patch \
@@ -19,8 +19,8 @@ SRC_URI:append:corstone1000  =3D " \
     file://0015-Add-timestamp-validation-for-uefi-variables.patch \
     file://0016-Isolate-common-uefi-variable-authentication-steps.patch =
\
     file://0017-Implement-Private-Authenticated-Variable-verificatio.pat=
ch \
-    file://0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch \
-    file://0019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch \
+    file://0018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
+    file://0019-Align-PSA-Crypto-with-TF-Mv2.1.patch \
     "
=20
 # The patches above introduce errors with GCC 14.1, silence them for now
--=20
2.25.1


