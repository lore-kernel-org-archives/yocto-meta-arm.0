Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05B5C54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27026.1747762093986550585
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 199EE152B;
	Tue, 20 May 2025 10:28:00 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04E243F5A1;
	Tue, 20 May 2025 10:28:12 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 8/9] arm-bsp/trusted-services: corstone1000: revert features that conflict with capsule update
Date: Tue, 20 May 2025 19:27:46 +0200
Message-ID: <20250520172748.3439803-8-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6515

From: Bence Balogh <bence.balogh@arm.com>

Three commits had to be removed in order to make the inappropriate
capsule update implementation work with the new Trusted Services
version.

The "Make variable index usage robust with redundancy" commit needs to
be reverted because the FMP support only works if the
SMM_VARIABLE_INDEX_STORAGE_UID is 0x787.

The "Load and store UEFI variable index in chunks" commit needs to
be reverted because the optional create() and set_extended() APIs are
not supported for Corstone-1000.

The "Make constraints of NV UEFI variables persistent" commit needs to
be reverted because the FMP support is not compatible with these
changes.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...able-index-usage-robust-with-redunda.patch | 716 ++++++++++++++++++
 ...-store-UEFI-variable-index-in-chunks.patch | 291 +++++++
 ...traints-of-NV-UEFI-variables-persist.patch | 387 ++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   4 +-
 4 files changed, 1397 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Revert-Make-variable-index-usage-robust-with-redunda.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Revert-Make-variable-index-usage-robust-with-redunda.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0012-Revert-Make-var=
iable-index-usage-robust-with-redunda.patch
new file mode 100644
index 00000000..8b5f062f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Re=
vert-Make-variable-index-usage-robust-with-redunda.patch
@@ -0,0 +1,716 @@
+From f0c1c15fc8886349f7aeb04e1328472894b674d7 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 25 Nov 2024 22:11:33 +0100
+Subject: [PATCH 1/3] Revert "Make variable index usage robust with redun=
dancy"
+
+This reverts commit 8e394bbfae1dccf86a6a5428471e1b10fdaa74ec.
+This revert is needed because the FMP support added for Corstone-1000 on=
ly=20
+works if the SMM_VARIABLE_INDEX_STORAGE_UID is 0x787. See the implementa=
tion=20
+in the 0003-FMP-Support-in-Corstone1000.patch file.
+
+The 0003-FMP-Support-in-Corstone1000.patch is also inappropriate and wil=
l be
+redesigned. Instead of fixing that patch, revert this redundancy feature=
 until
+the FMP support is redesigned.
+
+Upstream-Status: Inappropriate [To be removed after new FWU design]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ .../backend/test/variable_index_tests.cpp     |  50 ++---
+ .../backend/test/variable_store_tests.cpp     | 166 ----------------
+ .../backend/uefi_variable_store.c             | 181 +++---------------
+ .../backend/uefi_variable_store.h             |   1 -
+ .../smm_variable/backend/variable_index.c     |  29 +--
+ .../smm_variable/backend/variable_index.h     |   3 +-
+ 6 files changed, 46 insertions(+), 384 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
index_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_index_tests.cpp
+index cf0f6a12e..a52cfbf76 100644
+--- a/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
++++ b/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
+@@ -208,8 +208,7 @@ TEST(UefiVariableIndexTests, enumerateStore)
+=20
+ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
+ {
+-	uint8_t buffer[sizeof(uint32_t) +
+-		       MAX_VARIABLES * (sizeof(struct variable_metadata) + sizeof(boo=
l))];
++	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
+=20
+ 	create_variables();
+=20
+@@ -223,13 +222,7 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
+=20
+ 	CHECK_TRUE(is_dirty);
+ 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	/*
+-	 * Variable index counter is at the beginning, which is followed by me=
tadata and
+-	 * constraint status byte of both NV variables
+-	 */
+-	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) +
+-				     ((sizeof(struct variable_metadata) + sizeof(bool)) * 2),
+-			     dump_len);
++	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
+=20
+ 	/* Expect no records to be dirty when the dump is repeated */
+ 	dump_len =3D 0;
+@@ -238,9 +231,7 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
+=20
+ 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_FALSE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) +
+-				     ((sizeof(struct variable_metadata) + sizeof(bool)) * 2),
+-			     dump_len);
++	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
+=20
+ 	/* Tear down and reinitialize to simulate a reboot */
+ 	variable_index_deinit(&m_variable_index);
+@@ -279,8 +270,7 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
+=20
+ TEST(UefiVariableIndexTests, dumpLoadConstrainedVariable)
+ {
+-	uint8_t buffer[sizeof(uint32_t) +
+-		       MAX_VARIABLES * (sizeof(struct variable_metadata) + sizeof(boo=
l))];
++	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
+=20
+ 	create_variables();
+=20
+@@ -314,13 +304,8 @@ TEST(UefiVariableIndexTests, dumpLoadConstrainedVar=
iable)
+ 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(is_dirty);
+=20
+-	/*
+-	 * Variable index counter is at the beginning, which is followed by me=
tadata and
+-	 * constraint status byte of both NV variables, but only one of them h=
as
+-	 * constraints
+-	 */
+-	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) +
+-				     (sizeof(struct variable_metadata) + sizeof(bool)) * 2 +
++	/* metadata and constraint status byte are stored for both NV variable=
s, but only one of them has constraints */
++	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) + sizeof(bool))=
 * 2 +
+ 				     sizeof(struct variable_constraints),
+ 			     dump_len);
+=20
+@@ -331,11 +316,7 @@ TEST(UefiVariableIndexTests, dumpLoadConstrainedVar=
iable)
+=20
+ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
+ {
+-	/*
+-	 * Enough to fit the variable index counter and the metadata and const=
raint
+-	 * status of a single variable
+-	 */
+-	uint8_t buffer[sizeof(uint32_t) + sizeof(struct variable_metadata) + s=
izeof(bool)];
++	uint8_t buffer[1 * sizeof(struct variable_metadata) + 1];
+=20
+ 	create_variables();
+=20
+@@ -357,8 +338,7 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
+=20
+ TEST(UefiVariableIndexTests, removeVariable)
+ {
+-	uint8_t buffer[sizeof(uint32_t) +
+-		       MAX_VARIABLES * (sizeof(struct variable_metadata) + sizeof(boo=
l))];
++	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
+ 	struct variable_info *info =3D NULL;
+=20
+ 	create_variables();
+@@ -378,12 +358,7 @@ TEST(UefiVariableIndexTests, removeVariable)
+=20
+ 	CHECK_TRUE(is_dirty);
+ 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	/*
+-	 * Dump to now contains the variable index counter and metadata,
+-	 * constraint status data of a variable
+-	 */
+-	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) + sizeof(struct variable_metadat=
a) + sizeof(bool),
+-			     dump_len);
++	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
+=20
+ 	/* Remove the volatile variable */
+ 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_1),
+@@ -398,8 +373,7 @@ TEST(UefiVariableIndexTests, removeVariable)
+=20
+ 	CHECK_FALSE(is_dirty);
+ 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) + sizeof(struct variable_metadat=
a) + sizeof(bool),
+-			     dump_len);
++	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
+=20
+ 	/* Remove the remaining NV variable */
+ 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_3),
+@@ -407,14 +381,14 @@ TEST(UefiVariableIndexTests, removeVariable)
+=20
+ 	variable_index_clear_variable(&m_variable_index, info);
+=20
+-	/* Expect index to be dirty and dump to now contains only the variable=
 index counter */
++	/* Expect index to be dirty and dump to now be empty */
+ 	dump_len =3D 0;
+ 	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+ 				     &is_dirty);
+=20
+ 	CHECK_TRUE(is_dirty);
+ 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t), dump_len);
++	UNSIGNED_LONGS_EQUAL(0, dump_len);
+=20
+ 	/* Enumerate and now expect an empty index */
+ 	info =3D NULL;
+diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
+index 0f962f206..e0f21f77a 100644
+--- a/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
++++ b/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
+@@ -5,7 +5,6 @@
+  */
+=20
+ #include <CppUTest/TestHarness.h>
+-#include <limits>
+ #include <service/secure_storage/backend/mock_store/mock_store.h>
+ #include <service/uefi/smm_variable/backend/uefi_variable_store.h>
+ #include <string.h>
+@@ -270,17 +269,8 @@ TEST_GROUP(UefiVariableStoreTests)
+ 	static const size_t MAX_VARIABLES =3D 5;
+ 	static const size_t MAX_VARIABLE_SIZE =3D 3000;
+ 	static const size_t STORE_CAPACITY =3D MAX_VARIABLES * MAX_VARIABLE_SI=
ZE;
+-	static const size_t VARIABLE_INDEX_MAX_SIZE =3D
+-		sizeof(uint32_t) +
+-		MAX_VARIABLES * (sizeof(struct variable_metadata) +
+-				 sizeof(struct variable_constraints) + sizeof(bool));
+=20
+ 	static const uint32_t OWNER_ID =3D 100;
+-
+-	/* Synchronize these with the variables with the store */
+-	uint64_t DEFAULT_VARIABLE_INDEX_STORAGE_A_UID =3D 0x8000000000000001;
+-	uint64_t DEFAULT_VARIABLE_INDEX_STORAGE_B_UID =3D 0x8000000000000002;
+-
+ 	/*
+ 	 * Make sure the variable buffer in the test is way above the limit
+ 	 * so the buffer problems will be handled by the component
+@@ -873,159 +863,3 @@ TEST(UefiVariableStoreTests, fillIndex)
+ 		LONGS_EQUAL(0, input_data.compare(output_data));
+ 	}
+ }
+-
+-TEST(UefiVariableStoreTests, variableIndexCounterOverflow)
+-{
+-	efi_status_t efi_status =3D EFI_SUCCESS;
+-	psa_status_t psa_status =3D PSA_SUCCESS;
+-	std::u16string var_name =3D u"var";
+-	std::string input_data =3D "a";
+-	uint32_t attributes =3D EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTS=
ERVICE_ACCESS |
+-			      EFI_VARIABLE_RUNTIME_ACCESS;
+-	/* There are no variables set in the index, only the counter is there =
*/
+-	uint8_t buffer[sizeof(uint32_t)] =3D { 0 };
+-
+-	mock_store_reset(&m_persistent_store);
+-
+-	/* Counter of index A is 0 */
+-	psa_status =3D m_persistent_store.backend.interface->set(
+-		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_A_UID,
+-		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
+-
+-	/* Set max counter value */
+-	buffer[0] =3D 0xFF;
+-	buffer[1] =3D 0xFF;
+-	buffer[2] =3D 0xFF;
+-	buffer[3] =3D 0xFF;
+-
+-	/* Counter of index B is max value */
+-	psa_status =3D m_persistent_store.backend.interface->set(
+-		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_B_UID,
+-		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
+-
+-	/* At next initialization of the store index A should be the latest in=
dex with counter value 0 */
+-	uefi_variable_store_deinit(&m_uefi_variable_store);
+-
+-	efi_status =3D uefi_variable_store_init(&m_uefi_variable_store, OWNER_=
ID, MAX_VARIABLES,
+-					      m_persistent_backend, m_volatile_backend);
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+-
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
+-				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
+-
+-	/* After setting a variable to trigger sync and rebooting index B shou=
ld be the latest index with counter value 1*/
+-	efi_status =3D set_variable(var_name, input_data, attributes);
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+-
+-	power_cycle();
+-
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
+-				 DEFAULT_VARIABLE_INDEX_STORAGE_B_UID);
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 1);
+-}
+-
+-TEST(UefiVariableStoreTests, oneEmptyVariableIndexExists)
+-{
+-	psa_status_t status =3D PSA_SUCCESS;
+-
+-	/* Only, variable index A exists, but it is empty */
+-	mock_store_reset(&m_persistent_store);
+-
+-	status =3D m_persistent_store.backend.interface->create(m_persistent_s=
tore.backend.context,
+-							      OWNER_ID,
+-							      DEFAULT_VARIABLE_INDEX_STORAGE_A_UID,
+-							      100, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
+-
+-	power_cycle();
+-
+-	/* Empty index is considered non-existing so default index (A) is sele=
cted */
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
+-				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
+-
+-	/* Only, variable index B exists, but it is empty*/
+-	mock_store_reset(&m_persistent_store);
+-
+-	status =3D m_persistent_store.backend.interface->create(m_persistent_s=
tore.backend.context,
+-							      OWNER_ID,
+-							      DEFAULT_VARIABLE_INDEX_STORAGE_B_UID,
+-							      100, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
+-
+-	power_cycle();
+-
+-	/* Empty index is considered non-existing so default index (A) is sele=
cted */
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
+-				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
+-}
+-
+-TEST(UefiVariableStoreTests, oneVariableIndexAlreadySet)
+-{
+-	efi_status_t status =3D EFI_SUCCESS;
+-	/* Empty variable index with zero counter value */
+-	uint8_t buffer[VARIABLE_INDEX_MAX_SIZE] =3D { 0 };
+-
+-	/* Set index A in the store with some data, so it will be found as the=
 currently active index */
+-	mock_store_reset(&m_persistent_store);
+-
+-	status =3D m_persistent_store.backend.interface->set(
+-		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_A_UID,
+-		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
+-
+-	power_cycle();
+-
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
+-				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
+-
+-	/* Set index B in the store with some data, so it will be found as the=
 currently active index */
+-	mock_store_reset(&m_persistent_store);
+-
+-	status =3D m_persistent_store.backend.interface->set(
+-		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_B_UID,
+-		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
+-
+-	power_cycle();
+-
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
+-				 DEFAULT_VARIABLE_INDEX_STORAGE_B_UID);
+-	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
+-}
+-
+-TEST(UefiVariableStoreTests, variableIndexesWithSameData)
+-{
+-	psa_status_t psa_status =3D PSA_SUCCESS;
+-	efi_status_t efi_status =3D EFI_SUCCESS;
+-	/* Empty variable index with zero counter value */
+-	uint8_t buffer[VARIABLE_INDEX_MAX_SIZE] =3D { 0 };
+-
+-	/* Set both indexes to the same data and counter value */
+-	mock_store_reset(&m_persistent_store);
+-
+-	psa_status =3D m_persistent_store.backend.interface->set(
+-		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_A_UID,
+-		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
+-
+-	psa_status =3D m_persistent_store.backend.interface->set(
+-		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_B_UID,
+-		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
+-	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
+-
+-	/*
+-	 * Initializing the store should fail, because if there are two indexe=
s with the same counter it cannot be decided
+-	 * which has the valid data.
+-	 */
+-	uefi_variable_store_deinit(&m_uefi_variable_store);
+-
+-	efi_status =3D uefi_variable_store_init(&m_uefi_variable_store, OWNER_=
ID, MAX_VARIABLES,
+-					      m_persistent_backend, m_volatile_backend);
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_LOAD_ERROR, efi_status);
+-}
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index 48b81ff37..459ca4566 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -28,12 +28,9 @@
+ #include "service/crypto/client/psa/crypto_client.h"
+ #endif
+=20
+-static psa_status_t get_active_variable_uid(struct uefi_variable_store =
*context,
+-					    uint64_t *active_index_uid, uint32_t *counter);
+-
+ static efi_status_t load_variable_index(struct uefi_variable_store *con=
text);
+=20
+-static efi_status_t sync_variable_index(struct uefi_variable_store *con=
text);
++static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context);
+=20
+ static efi_status_t check_capabilities(const SMM_VARIABLE_COMMUNICATE_A=
CCESS_VARIABLE *var);
+=20
+@@ -138,14 +135,6 @@ static bool compare_name_to_key_store_name(const in=
t16_t *name1, size_t size1,
+ 					   const uint16_t *name2, size_t size2);
+ #endif
+=20
+-/* Private UID for storing the variable index */
+-#define SMM_VARIABLE_INDEX_STORAGE_A_UID UINT64_C(0x8000000000000001)
+-#define SMM_VARIABLE_INDEX_STORAGE_B_UID UINT64_C(0x8000000000000002)
+-
+-_Static_assert(SMM_VARIABLE_INDEX_STORAGE_A_UID !=3D SMM_VARIABLE_INDEX=
_STORAGE_B_UID,
+-	       "SMM_VARIABLE_INDEX_STORAGE_A_UID must not be the same value as=
 "
+-	       "SMM_VARIABLE_INDEX_STORAGE_B_UID");
+-
+ /* Default maximum variable size -
+  * may be overridden using uefi_variable_store_set_storage_limits()
+  */
+@@ -398,7 +387,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 		 * index entry.
+ 		 */
+ 		if (should_sync_index)
+-			status =3D sync_variable_index((struct uefi_variable_store *)context=
);
++			status =3D sync_variable_index(context);
+=20
+ 		/* Store any variable data to the storage backend with the updated me=
tadata */
+ 		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
+@@ -620,148 +609,40 @@ efi_status_t uefi_variable_store_get_var_check_pr=
operty(
+ 	return status;
+ }
+=20
+-/* Checks which index contains the latest data, which shall be loaded *=
/
+-static psa_status_t get_active_variable_uid(struct uefi_variable_store =
*context,
+-					    uint64_t *active_index_uid, uint32_t *counter)
+-{
+-	uint32_t counter_A =3D 0;
+-	uint32_t counter_B =3D 0;
+-	size_t data_len =3D 0;
+-	psa_status_t psa_status_A =3D PSA_SUCCESS;
+-	psa_status_t psa_status_B =3D PSA_SUCCESS;
+-	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
+-
+-	/* Set default value for the case when the index does not exist yet */
+-	*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_A_UID;
+-	*counter =3D 0;
+-
+-	if (persistent_store) {
+-		psa_status_A =3D persistent_store->interface->get(persistent_store->c=
ontext,
+-								context->owner_id,
+-								SMM_VARIABLE_INDEX_STORAGE_A_UID, 0,
+-								sizeof(counter_A), &counter_A,
+-								&data_len);
+-
+-		if (psa_status_A =3D=3D PSA_SUCCESS && data_len =3D=3D 0) {
+-			psa_status_A =3D persistent_store->interface->remove(
+-				persistent_store->context, context->owner_id,
+-				SMM_VARIABLE_INDEX_STORAGE_A_UID);
+-
+-			if (psa_status_A =3D=3D PSA_SUCCESS)
+-				psa_status_A =3D PSA_ERROR_DOES_NOT_EXIST;
+-			else {
+-				EMSG("Erronous state of variable index");
+-				return PSA_ERROR_STORAGE_FAILURE;
+-			}
+-		}
+-
+-		psa_status_B =3D persistent_store->interface->get(persistent_store->c=
ontext,
+-								context->owner_id,
+-								SMM_VARIABLE_INDEX_STORAGE_B_UID, 0,
+-								sizeof(counter_B), &counter_B,
+-								&data_len);
+-
+-		if (psa_status_B =3D=3D PSA_SUCCESS && data_len =3D=3D 0) {
+-			psa_status_B =3D persistent_store->interface->remove(
+-				persistent_store->context, context->owner_id,
+-				SMM_VARIABLE_INDEX_STORAGE_B_UID);
+-
+-			if (psa_status_B =3D=3D PSA_SUCCESS)
+-				psa_status_B =3D PSA_ERROR_DOES_NOT_EXIST;
+-			else {
+-				EMSG("Erronous state of variable index");
+-				return PSA_ERROR_STORAGE_FAILURE;
+-			}
+-		}
+-
+-		if ((psa_status_A !=3D PSA_SUCCESS && psa_status_A !=3D PSA_ERROR_DOE=
S_NOT_EXIST) ||
+-		    (psa_status_B !=3D PSA_SUCCESS && psa_status_B !=3D PSA_ERROR_DOE=
S_NOT_EXIST))
+-			return PSA_ERROR_STORAGE_FAILURE;
+-
+-		if (psa_status_A =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+-			if (psa_status_B =3D=3D PSA_ERROR_DOES_NOT_EXIST)
+-				return PSA_ERROR_DOES_NOT_EXIST;
+-
+-			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_B_UID;
+-			*counter =3D counter_B;
+-
+-			return PSA_SUCCESS;
+-		} else if (psa_status_B =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+-			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_A_UID;
+-			*counter =3D counter_A;
+-
+-			return PSA_SUCCESS;
+-		}
+-
+-		if (counter_A + 1 =3D=3D counter_B) {
+-			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_B_UID;
+-			*counter =3D counter_B;
+-			return PSA_SUCCESS;
+-		} else if (counter_B + 1 =3D=3D counter_A) {
+-			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_A_UID;
+-			*counter =3D counter_A;
+-			return PSA_SUCCESS;
+-		} else {
+-			EMSG("UEFI metadata variable index is invalid.");
+-			return PSA_ERROR_STORAGE_FAILURE;
+-		}
+-	} else {
+-		EMSG("Store backend is not accessible");
+-		return PSA_ERROR_STORAGE_FAILURE;
+-	}
+-
+-	return PSA_ERROR_STORAGE_FAILURE;
+-}
+-
+ static efi_status_t load_variable_index(struct uefi_variable_store *con=
text)
+ {
+ 	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
+-	psa_status_t psa_status =3D PSA_SUCCESS;
+=20
+ 	if (persistent_store) {
+ 		size_t data_len =3D 0;
+ 		size_t data_offset =3D 0;
+-		struct psa_storage_info_t variable_index_info =3D { 0 };
+-
+-		psa_status =3D get_active_variable_uid(context, &context->active_vari=
able_index_uid,
+-						     &context->variable_index.counter);
+-		switch (psa_status) {
+-		case PSA_SUCCESS:
+-			break;
+-
+-		case PSA_ERROR_DOES_NOT_EXIST:
+-			IMSG("Variable index does not exist in NV store, continuing with emp=
ty index");
+-			return EFI_SUCCESS;
+-
+-		default:
+-			EMSG("Loading variable index failed: %d", psa_status);
+-			return EFI_LOAD_ERROR;
+-		}
+-
+-		/* Make sure the variable index fits the buffer */
+-		persistent_store->interface->get_info(persistent_store->context, cont=
ext->owner_id,
+-						      context->active_variable_index_uid,
+-						      &variable_index_info);
+-
+-		if (variable_index_info.size > context->index_sync_buffer_size) {
+-			EMSG("Variable index cannot fit the sync buffer");
+-			return EFI_LOAD_ERROR;
+-		}
+=20
+ 		do {
+-			psa_status =3D persistent_store->interface->get(
++			psa_status_t psa_status =3D persistent_store->interface->get(
+ 				persistent_store->context, context->owner_id,
+-				context->active_variable_index_uid, data_offset,
++				SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
+ 				RPC_CALLER_SESSION_SHARED_MEMORY_SIZE,
+ 				context->index_sync_buffer + data_offset, &data_len);
+=20
+-			if (psa_status !=3D PSA_SUCCESS) {
++			switch (psa_status) {
++			case PSA_SUCCESS:
++				data_offset +=3D data_len;
++
++				if (data_offset > context->index_sync_buffer_size) {
++					EMSG("Variable index cannot fit the sync buffer");
++					return EFI_LOAD_ERROR;
++				}
++
++				break;
++
++			case PSA_ERROR_DOES_NOT_EXIST:
++				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
++				return EFI_SUCCESS;
++
++			default:
+ 				EMSG("Loading variable index failed: %d", psa_status);
+ 				return EFI_LOAD_ERROR;
+ 			}
+-
+-			data_offset +=3D data_len;
+-
+ 		} while (data_len =3D=3D RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
+=20
+ 		variable_index_restore(&context->variable_index, data_offset,
+@@ -774,7 +655,7 @@ static efi_status_t load_variable_index(struct uefi_=
variable_store *context)
+ 	return EFI_SUCCESS;
+ }
+=20
+-static efi_status_t sync_variable_index(struct uefi_variable_store *con=
text)
++static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
+ {
+ 	efi_status_t status =3D EFI_SUCCESS;
+ 	psa_status_t psa_status =3D PSA_SUCCESS;
+@@ -794,24 +675,19 @@ static efi_status_t sync_variable_index(struct uef=
i_variable_store *context)
+=20
+ 		if (persistent_store) {
+ 			size_t data_offset =3D 0;
+-			uint64_t next_index_uid =3D 0;
+-
+-			/* Write the older one */
+-			next_index_uid =3D (context->active_variable_index_uid =3D=3D
+-							  SMM_VARIABLE_INDEX_STORAGE_A_UID ?
+-						  SMM_VARIABLE_INDEX_STORAGE_B_UID :
+-						  SMM_VARIABLE_INDEX_STORAGE_A_UID);
+=20
+ 			psa_status =3D persistent_store->interface->remove(
+-				persistent_store->context, context->owner_id, next_index_uid);
++				persistent_store->context, context->owner_id,
++				SMM_VARIABLE_INDEX_STORAGE_UID);
+=20
+ 			if (psa_status !=3D PSA_SUCCESS && psa_status !=3D PSA_ERROR_DOES_NO=
T_EXIST)
+ 				goto end;
+=20
+ 			/* Check if the index exists and create if not yet */
+ 			psa_status =3D persistent_store->interface->create(
+-				persistent_store->context, context->owner_id, next_index_uid,
+-				remaining_data_len, PSA_STORAGE_FLAG_NONE);
++				persistent_store->context, context->owner_id,
++				SMM_VARIABLE_INDEX_STORAGE_UID, remaining_data_len,
++				PSA_STORAGE_FLAG_NONE);
+=20
+ 			if (psa_status !=3D PSA_SUCCESS)
+ 				goto end;
+@@ -822,7 +698,8 @@ static efi_status_t sync_variable_index(struct uefi_=
variable_store *context)
+=20
+ 				psa_status =3D persistent_store->interface->set_extended(
+ 					persistent_store->context, context->owner_id,
+-					next_index_uid, data_offset, data_of_this_iteration,
++					SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
++					data_of_this_iteration,
+ 					context->index_sync_buffer + data_offset);
+=20
+ 				if (psa_status !=3D PSA_SUCCESS)
+@@ -1827,7 +1704,7 @@ static void purge_orphan_index_entries(const struc=
t uefi_variable_store *context
+ 	}
+=20
+ 	if (any_orphans)
+-		sync_variable_index((struct uefi_variable_store *)context);
++		sync_variable_index(context);
+ }
+=20
+ static struct delegate_variable_store *
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.h b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.h
+index 9f2c4a00c..2493ff6b4 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.h
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.h
+@@ -52,7 +52,6 @@ struct uefi_variable_store {
+ 	uint32_t owner_id;
+ 	uint8_t *index_sync_buffer;
+ 	size_t index_sync_buffer_size;
+-	uint64_t active_variable_index_uid;
+ 	struct variable_index variable_index;
+ 	struct delegate_variable_store persistent_store;
+ 	struct delegate_variable_store volatile_store;
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
+index 90230426f..5fb6d08c5 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.c
++++ b/components/service/uefi/smm_variable/backend/variable_index.c
+@@ -91,7 +91,6 @@ static struct variable_entry *containing_entry(const s=
truct variable_info *info)
+ efi_status_t variable_index_init(struct variable_index *context, size_t=
 max_variables)
+ {
+ 	context->max_variables =3D max_variables;
+-	context->counter =3D 0;
+ 	context->entries =3D
+ 		(struct variable_entry *)malloc(sizeof(struct variable_entry) * max_v=
ariables);
+=20
+@@ -109,9 +108,9 @@ void variable_index_deinit(struct variable_index *co=
ntext)
+=20
+ size_t variable_index_max_dump_size(struct variable_index *context)
+ {
+-	return sizeof(context->counter) + (sizeof(struct variable_metadata) + =
sizeof(bool) +
+-					   sizeof(struct variable_constraints)) *
+-						  context->max_variables;
++	return (sizeof(struct variable_metadata) + sizeof(bool) +
++		sizeof(struct variable_constraints)) *
++	       context->max_variables;
+ }
+=20
+ struct variable_info *variable_index_find(const struct variable_index *=
context,
+@@ -288,16 +287,6 @@ efi_status_t variable_index_dump(const struct varia=
ble_index *context, size_t bu
+ 	*data_len =3D 0;
+ 	*any_dirty =3D false;
+=20
+-	/*
+-	 * Intentionally letting the counter overflow.
+-	 * The buffer (index_sync_buffer) is provided by malloc, which allocat=
es memory to a boundary
+-	 * suitable for any default data type of the system (e.g uint32_t)
+-	 */
+-	*((uint32_t *)dump_pos) =3D context->counter + 1;
+-	bytes_dumped +=3D sizeof(context->counter);
+-	dump_pos +=3D sizeof(context->counter);
+-
+-	/* Store variables */
+ 	for (size_t pos =3D 0; pos < context->max_variables; pos++) {
+ 		struct variable_entry *entry =3D &context->entries[pos];
+ 		struct variable_metadata *metadata =3D &entry->info.metadata;
+@@ -344,24 +333,14 @@ efi_status_t variable_index_dump(const struct vari=
able_index *context, size_t bu
+ 	return EFI_SUCCESS;
+ }
+=20
+-void variable_index_confirm_write(struct variable_index *context)
+-{
+-	context->counter++;
+-}
+=20
+-size_t variable_index_restore(struct variable_index *context, size_t da=
ta_len,
++size_t variable_index_restore(const struct variable_index *context, siz=
e_t data_len,
+ 			      const uint8_t *buffer)
+ {
+ 	size_t bytes_loaded =3D 0;
+ 	const uint8_t *load_pos =3D buffer;
+ 	int pos =3D 0;
+=20
+-	if (data_len >=3D sizeof(context->counter)) {
+-		context->counter =3D *((uint32_t *)load_pos);
+-		bytes_loaded +=3D sizeof(context->counter);
+-		load_pos +=3D sizeof(context->counter);
+-	}
+-
+ 	while (bytes_loaded < data_len) {
+ 		struct variable_entry *entry =3D &context->entries[pos];
+=20
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
+index 592dddc83..0151d636a 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.h
++++ b/components/service/uefi/smm_variable/backend/variable_index.h
+@@ -75,7 +75,6 @@ struct variable_entry {
+  */
+ struct variable_index {
+ 	size_t max_variables;
+-	uint32_t counter;
+ 	struct variable_entry *entries;
+ };
+=20
+@@ -229,7 +228,7 @@ void variable_index_confirm_write(struct variable_in=
dex *context);
+  *
+  * @return     Number of bytes loaded
+  */
+-size_t variable_index_restore(struct variable_index *context, size_t da=
ta_len,
++size_t variable_index_restore(const struct variable_index *context, siz=
e_t data_len,
+ 			      const uint8_t *buffer);
+=20
+ #ifdef __cplusplus
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0013-Revert-Load-and-=
store-UEFI-variable-index-in-chunks.patch
new file mode 100644
index 00000000..09fa94fc
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Re=
vert-Load-and-store-UEFI-variable-index-in-chunks.patch
@@ -0,0 +1,291 @@
+From c490956e50e721c8f2db5934ae5af365ba92e55a Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 25 Nov 2024 22:13:15 +0100
+Subject: [PATCH 2/3] Revert "Load and store UEFI variable index in chunk=
s"
+
+This reverts commit a0a08571084238af2a24d4e6e580308f86ab59a2.
+The PSA IPC backend for the Protected Storage doesn't support the option=
al
+create() and set_extended() APIs. This feature has to be reverted becaus=
e=20
+of this.
+Keep this inappropriate patch until the usage of create() and set_extend=
ed()=20
+APIs are not optional in the SMM-Gateway.
+
+Upstream-Status: Inappropriate [To be redesigned]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ .../backend/test/variable_store_tests.cpp     | 100 +-----------------
+ .../backend/uefi_variable_store.c             |  84 +++------------
+ deployments/smm-gateway/common/smm_gateway.c  |   4 +
+ 3 files changed, 22 insertions(+), 166 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
+index e0f21f77a..2a8c8eb94 100644
+--- a/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
++++ b/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
+@@ -56,12 +56,6 @@ TEST_GROUP(UefiVariableStoreTests)
+ 		return var_name;
+ 	}
+=20
+-	std::u16string intToChar16(const int i)
+-	{
+-		auto s =3D std::to_string(i);
+-		return { s.begin(), s.end() };
+-	}
+-
+ 	size_t string_get_size_in_bytes(const std::u16string &string)
+ 	{
+ 		return string.size() * sizeof(uint16_t);
+@@ -266,9 +260,9 @@ TEST_GROUP(UefiVariableStoreTests)
+ 						       MAX_VARIABLE_SIZE);
+ 	}
+=20
+-	static const size_t MAX_VARIABLES =3D 5;
++	static const size_t MAX_VARIABLES =3D 10;
+ 	static const size_t MAX_VARIABLE_SIZE =3D 3000;
+-	static const size_t STORE_CAPACITY =3D MAX_VARIABLES * MAX_VARIABLE_SI=
ZE;
++	static const size_t STORE_CAPACITY =3D 10000;
+=20
+ 	static const uint32_t OWNER_ID =3D 100;
+ 	/*
+@@ -773,93 +767,3 @@ TEST(UefiVariableStoreTests, noRemoveCheck)
+ 			      EFI_VARIABLE_NON_VOLATILE);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, status);
+ }
+-
+-TEST(UefiVariableStoreTests, fillStore)
+-{
+-	efi_status_t status =3D EFI_SUCCESS;
+-
+-	/* Fill the variable store with max size variables */
+-	for (size_t i =3D 0; i < MAX_VARIABLES; i++) {
+-		std::u16string current_var =3D u"var_";
+-		std::string input_data(MAX_VARIABLE_SIZE, 'a');
+-		std::string output_data;
+-		current_var +=3D intToChar16(i);
+-
+-		status =3D set_variable(current_var, input_data,
+-				      EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
+-					      EFI_VARIABLE_RUNTIME_ACCESS);
+-		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+-
+-		/* Verify the write */
+-		status =3D get_variable(current_var, output_data);
+-		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+-
+-		/* Expect got variable data to be the same as the set value */
+-		UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
+-		LONGS_EQUAL(0, input_data.compare(output_data));
+-	}
+-
+-	/* Try adding a small variable to an already full store */
+-	status =3D set_variable(u"var", "a",
+-			      EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
+-				      EFI_VARIABLE_RUNTIME_ACCESS);
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_OUT_OF_RESOURCES, status);
+-}
+-
+-TEST(UefiVariableStoreTests, fillIndex)
+-{
+-	efi_status_t status =3D EFI_SUCCESS;
+-	std::u16string var_name =3D u"var";
+-	std::string input_data =3D "a";
+-	std::string output_data;
+-
+-	/*
+-	 * Fill the variable store with small variables so the index
+-	 * will be filled, but the store does not
+-	 */
+-	for (size_t i =3D 0; i < MAX_VARIABLES; i++) {
+-		std::u16string current_var =3D u"var_";
+-		current_var +=3D intToChar16(i);
+-
+-		status =3D set_variable(current_var, input_data,
+-				      EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
+-					      EFI_VARIABLE_RUNTIME_ACCESS);
+-		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+-
+-		/* Verify the write */
+-		status =3D get_variable(current_var, output_data);
+-		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+-
+-		/* Expect got variable data to be the same as the set value */
+-		UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
+-		LONGS_EQUAL(0, input_data.compare(output_data));
+-	}
+-
+-	/* Try adding a small variable to an already full store */
+-	input_data.resize(1, 'a');
+-
+-	status =3D set_variable(u"var", input_data,
+-			      EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS |
+-				      EFI_VARIABLE_RUNTIME_ACCESS);
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_OUT_OF_RESOURCES, status);
+-
+-	/* Simulate a power-cycle without deleting the NV store content */
+-	uefi_variable_store_deinit(&m_uefi_variable_store);
+-
+-	/* Try loading the non-volatile variables */
+-	status =3D uefi_variable_store_init(&m_uefi_variable_store, OWNER_ID, =
MAX_VARIABLES,
+-					  m_persistent_backend, m_volatile_backend);
+-
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+-
+-	/* Try reading the previously set variables */
+-	for (size_t i =3D 0; i < MAX_VARIABLES; i++) {
+-		std::u16string current_var =3D u"var_";
+-		current_var +=3D intToChar16(i);
+-
+-		status =3D get_variable(current_var, output_data);
+-		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+-		UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
+-		LONGS_EQUAL(0, input_data.compare(output_data));
+-	}
+-}
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index 459ca4566..e5fc32864 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -615,41 +615,26 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
+=20
+ 	if (persistent_store) {
+ 		size_t data_len =3D 0;
+-		size_t data_offset =3D 0;
+=20
+-		do {
+-			psa_status_t psa_status =3D persistent_store->interface->get(
+-				persistent_store->context, context->owner_id,
+-				SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
+-				RPC_CALLER_SESSION_SHARED_MEMORY_SIZE,
+-				context->index_sync_buffer + data_offset, &data_len);
++		psa_status_t psa_status =3D persistent_store->interface->get(
++			persistent_store->context, context->owner_id,
++			SMM_VARIABLE_INDEX_STORAGE_UID, 0, context->index_sync_buffer_size,
++			context->index_sync_buffer, &data_len);
+=20
+-			switch (psa_status) {
++		switch(psa_status) {
+ 			case PSA_SUCCESS:
+-				data_offset +=3D data_len;
+-
+-				if (data_offset > context->index_sync_buffer_size) {
+-					EMSG("Variable index cannot fit the sync buffer");
+-					return EFI_LOAD_ERROR;
+-				}
+-
++				(void) variable_index_restore(&context->variable_index, data_len,
++							      context->index_sync_buffer);
+ 				break;
+=20
+ 			case PSA_ERROR_DOES_NOT_EXIST:
+ 				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
+-				return EFI_SUCCESS;
++				break;
+=20
+ 			default:
+ 				EMSG("Loading variable index failed: %d", psa_status);
+ 				return EFI_LOAD_ERROR;
+-			}
+-		} while (data_len =3D=3D RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
+-
+-		variable_index_restore(&context->variable_index, data_offset,
+-				       context->index_sync_buffer);
+-	} else {
+-		EMSG("Loading variable index failed, store backend is not accessible"=
);
+-		return EFI_LOAD_ERROR;
++		}
+ 	}
+=20
+ 	return EFI_SUCCESS;
+@@ -658,14 +643,13 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
+ static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
+ {
+ 	efi_status_t status =3D EFI_SUCCESS;
+-	psa_status_t psa_status =3D PSA_SUCCESS;
+ 	bool is_dirty =3D false;
+=20
+ 	/* Sync the variable index to storage if anything is dirty */
+-	size_t remaining_data_len =3D 0;
++	size_t data_len =3D 0;
+=20
+ 	status =3D variable_index_dump(&context->variable_index, context->inde=
x_sync_buffer_size,
+-				     context->index_sync_buffer, &remaining_data_len, &is_dirty);
++				     context->index_sync_buffer, &data_len, &is_dirty);
+ 	if (status !=3D EFI_SUCCESS)
+ 		return status;
+=20
+@@ -674,52 +658,16 @@ static efi_status_t sync_variable_index(const stru=
ct uefi_variable_store *contex
+ 			context->persistent_store.storage_backend;
+=20
+ 		if (persistent_store) {
+-			size_t data_offset =3D 0;
+-
+-			psa_status =3D persistent_store->interface->remove(
++			psa_status_t psa_status =3D persistent_store->interface->set(
+ 				persistent_store->context, context->owner_id,
+-				SMM_VARIABLE_INDEX_STORAGE_UID);
+-
+-			if (psa_status !=3D PSA_SUCCESS && psa_status !=3D PSA_ERROR_DOES_NO=
T_EXIST)
+-				goto end;
++				SMM_VARIABLE_INDEX_STORAGE_UID, data_len,
++				context->index_sync_buffer, PSA_STORAGE_FLAG_NONE);
+=20
+-			/* Check if the index exists and create if not yet */
+-			psa_status =3D persistent_store->interface->create(
+-				persistent_store->context, context->owner_id,
+-				SMM_VARIABLE_INDEX_STORAGE_UID, remaining_data_len,
+-				PSA_STORAGE_FLAG_NONE);
+-
+-			if (psa_status !=3D PSA_SUCCESS)
+-				goto end;
+-
+-			do {
+-				size_t data_of_this_iteration =3D MIN(
+-					remaining_data_len, RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
+-
+-				psa_status =3D persistent_store->interface->set_extended(
+-					persistent_store->context, context->owner_id,
+-					SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
+-					data_of_this_iteration,
+-					context->index_sync_buffer + data_offset);
+-
+-				if (psa_status !=3D PSA_SUCCESS)
+-					goto end;
+-
+-				data_offset +=3D RPC_CALLER_SESSION_SHARED_MEMORY_SIZE;
+-				remaining_data_len -=3D data_of_this_iteration;
+-
+-			} while (remaining_data_len);
+-
+-			variable_index_confirm_write(&context->variable_index);
+-			context->active_variable_index_uid =3D next_index_uid;
+-		} else {
+-			EMSG("Syncing variable index failed, store backend is not accessible=
");
+-			return EFI_LOAD_ERROR;
++			status =3D psa_to_efi_storage_status(psa_status);
+ 		}
+ 	}
+=20
+-	end:
+-	return psa_to_efi_storage_status(psa_status);
++	return status;
+ }
+=20
+ /* Check attribute usage rules */
+diff --git a/deployments/smm-gateway/common/smm_gateway.c b/deployments/=
smm-gateway/common/smm_gateway.c
+index 3ab45ccf5..eaa861370 100644
+--- a/deployments/smm-gateway/common/smm_gateway.c
++++ b/deployments/smm-gateway/common/smm_gateway.c
+@@ -40,6 +40,10 @@
+ #define SMM_UEFI_VARIABLE_STORE_INDEX_SIZE \
+ 	UEFI_VARIABLE_STORE_INDEX_SIZE(SMM_GATEWAY_MAX_UEFI_VARIABLES)
+=20
++_Static_assert(SMM_UEFI_VARIABLE_STORE_INDEX_SIZE < RPC_CALLER_SESSION_=
SHARED_MEMORY_SIZE,
++	       "The UEFI variable index does not fit into the RPC shared memor=
y, please increase " \
++	       "RPC_CALLER_SESSION_SHARED_MEMORY_SIZE");
++
+ /**
+  * The SP heap must be large enough for storing the UEFI variable index=
, the RPC shared memory and
+  * ~16kB of miscellaneous data.
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0014-Revert-Make-con=
straints-of-NV-UEFI-variables-persist.patch
new file mode 100644
index 00000000..3f0ae436
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Re=
vert-Make-constraints-of-NV-UEFI-variables-persist.patch
@@ -0,0 +1,387 @@
+From c0ffa57e7628f23747d7ee947358f8a538fa5d4c Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 25 Nov 2024 22:17:51 +0100
+Subject: [PATCH 3/3] Revert "Make constraints of NV UEFI variables persi=
stent"
+
+This reverts commit 64bbde5d9950413cf724ffb792d4d1637892fa8b.
+The FMP support didn't work with this commit. See the implementation in =
the
+0003-FMP-Support-in-Corstone1000.patch file. The=20
+0003-FMP-Support-in-Corstone1000.patch will be redesigned but until that=
, this=20
+commit has to be reverted.
+
+Upstream-Status: Inappropriate [To be removed after new FWU design]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ .../backend/test/variable_index_tests.cpp     | 93 +++----------------
+ .../backend/uefi_variable_store.c             | 12 +--
+ .../smm_variable/backend/variable_index.c     | 90 +++---------------
+ .../smm_variable/backend/variable_index.h     |  7 +-
+ 4 files changed, 36 insertions(+), 166 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
index_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_index_tests.cpp
+index a52cfbf76..1b7a6b879 100644
+--- a/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
++++ b/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
+@@ -214,28 +214,21 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
+=20
+ 	/* Expect the info for two NV variables to have been dumped */
+ 	size_t dump_len =3D 0;
+-	bool is_dirty =3D false;
+-	efi_status_t status =3D EFI_SUCCESS;
+-
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
++	bool is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer=
), buffer, &dump_len);
+=20
+ 	CHECK_TRUE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
++	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 2), dump_len)=
;
+=20
+ 	/* Expect no records to be dirty when the dump is repeated */
+ 	dump_len =3D 0;
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
++	is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer), bu=
ffer, &dump_len);
+=20
+-	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_FALSE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
++	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 2), dump_len)=
;
+=20
+ 	/* Tear down and reinitialize to simulate a reboot */
+ 	variable_index_deinit(&m_variable_index);
+-	status =3D variable_index_init(&m_variable_index, MAX_VARIABLES);
++	efi_status_t status =3D variable_index_init(&m_variable_index, MAX_VAR=
IABLES);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+=20
+ 	/* Load the dumped contents */
+@@ -268,52 +261,6 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
+ }
+=20
+-TEST(UefiVariableIndexTests, dumpLoadConstrainedVariable)
+-{
+-	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
+-
+-	create_variables();
+-
+-	struct variable_constraints constraints;
+-	constraints.revision =3D 10;
+-	constraints.property =3D VAR_CHECK_VARIABLE_PROPERTY_READ_ONLY;
+-	constraints.attributes =3D 0;
+-	constraints.min_size =3D 1;
+-	constraints.max_size =3D 100;
+-
+-	/* Set check constraints on one of the variables */
+-	struct variable_info *info =3D variable_index_find(&m_variable_index, =
&guid_2,
+-							 string_get_size_in_bytes(name_2),
+-							 (const int16_t *)name_2.data());
+-
+-	CHECK_TRUE(info);
+-	CHECK_TRUE(info->is_variable_set);
+-	CHECK_FALSE(info->is_constraints_set);
+-
+-	variable_index_set_constraints(info, &constraints);
+-
+-	CHECK_TRUE(info->is_constraints_set);
+-	CHECK_TRUE(info->is_variable_set);
+-
+-	size_t dump_len =3D 0;
+-	bool is_dirty =3D false;
+-	efi_status_t status =3D EFI_SUCCESS;
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
+-
+-	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	CHECK_TRUE(is_dirty);
+-
+-	/* metadata and constraint status byte are stored for both NV variable=
s, but only one of them has constraints */
+-	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) + sizeof(bool))=
 * 2 +
+-				     sizeof(struct variable_constraints),
+-			     dump_len);
+-
+-	/* Load the dumped contents */
+-	size_t load_len =3D variable_index_restore(&m_variable_index, dump_len=
, buffer);
+-	UNSIGNED_LONGS_EQUAL(dump_len, load_len);
+-}
+-
+ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
+ {
+ 	uint8_t buffer[1 * sizeof(struct variable_metadata) + 1];
+@@ -325,15 +272,10 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
+ 	 * exceed the length of the buffer.
+ 	 */
+ 	size_t dump_len =3D 0;
+-	bool is_dirty =3D false;
+-	efi_status_t status =3D EFI_SUCCESS;
+-
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
++	bool is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer=
), buffer, &dump_len);
+=20
+ 	CHECK_TRUE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(EFI_BUFFER_TOO_SMALL, status);
+-	UNSIGNED_LONGS_EQUAL(0, dump_len);
++	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) * 1, dump_len);
+ }
+=20
+ TEST(UefiVariableIndexTests, removeVariable)
+@@ -351,14 +293,10 @@ TEST(UefiVariableIndexTests, removeVariable)
+=20
+ 	/* Expect index to be dirty and for only one NV variable to be left */
+ 	size_t dump_len =3D 0;
+-	bool is_dirty =3D false;
+-	efi_status_t status =3D EFI_SUCCESS;
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
++	bool is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer=
), buffer, &dump_len);
+=20
+ 	CHECK_TRUE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
++	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 1), dump_len)=
;
+=20
+ 	/* Remove the volatile variable */
+ 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_1),
+@@ -368,12 +306,10 @@ TEST(UefiVariableIndexTests, removeVariable)
+=20
+ 	/* Expect index not to be dirty because there was no change to any NV =
variable */
+ 	dump_len =3D 0;
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
++	is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer), bu=
ffer, &dump_len);
+=20
+ 	CHECK_FALSE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
++	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 1), dump_len)=
;
+=20
+ 	/* Remove the remaining NV variable */
+ 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_3),
+@@ -383,15 +319,14 @@ TEST(UefiVariableIndexTests, removeVariable)
+=20
+ 	/* Expect index to be dirty and dump to now be empty */
+ 	dump_len =3D 0;
+-	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
+-				     &is_dirty);
++	is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer), bu=
ffer, &dump_len);
+=20
+ 	CHECK_TRUE(is_dirty);
+-	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
+-	UNSIGNED_LONGS_EQUAL(0, dump_len);
++	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 0), dump_len)=
;
+=20
+ 	/* Enumerate and now expect an empty index */
+ 	info =3D NULL;
++	efi_status_t status =3D EFI_SUCCESS;
+=20
+ 	info =3D variable_index_find_next(&m_variable_index, &guid_1,
+ 					string_get_size_in_bytes(null_name),  (const int16_t *) null_name.=
data(),
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index e5fc32864..7da2d1e71 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -575,10 +575,8 @@ efi_status_t uefi_variable_store_set_var_check_prop=
erty(
+ 	status =3D variable_checker_set_constraints(&constraints, info->is_con=
straints_set,
+ 						  &property->VariableProperty);
+=20
+-	if (status =3D=3D EFI_SUCCESS) {
++	if (status =3D=3D EFI_SUCCESS)
+ 		variable_index_set_constraints(info, &constraints);
+-		status =3D sync_variable_index(context);
+-	}
+=20
+ 	variable_index_remove_unused_entry(&context->variable_index, info);
+=20
+@@ -643,15 +641,13 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
+ static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
+ {
+ 	efi_status_t status =3D EFI_SUCCESS;
+-	bool is_dirty =3D false;
+=20
+ 	/* Sync the variable index to storage if anything is dirty */
+ 	size_t data_len =3D 0;
+=20
+-	status =3D variable_index_dump(&context->variable_index, context->inde=
x_sync_buffer_size,
+-				     context->index_sync_buffer, &data_len, &is_dirty);
+-	if (status !=3D EFI_SUCCESS)
+-		return status;
++	bool is_dirty =3D variable_index_dump(&context->variable_index,
++					    context->index_sync_buffer_size,
++					    context->index_sync_buffer, &data_len);
+=20
+ 	if (is_dirty) {
+ 		struct storage_backend *persistent_store =3D
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
+index 5fb6d08c5..c39f7394b 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.c
++++ b/components/service/uefi/smm_variable/backend/variable_index.c
+@@ -108,9 +108,7 @@ void variable_index_deinit(struct variable_index *co=
ntext)
+=20
+ size_t variable_index_max_dump_size(struct variable_index *context)
+ {
+-	return (sizeof(struct variable_metadata) + sizeof(bool) +
+-		sizeof(struct variable_constraints)) *
+-	       context->max_variables;
++	return sizeof(struct variable_metadata) * context->max_variables;
+ }
+=20
+ struct variable_info *variable_index_find(const struct variable_index *=
context,
+@@ -269,68 +267,37 @@ void variable_index_set_constraints(struct variabl=
e_info *info,
+ 				    const struct variable_constraints *constraints)
+ {
+ 	if (info) {
+-		struct variable_entry *entry =3D containing_entry(info);
+-
+ 		info->check_constraints =3D *constraints;
+ 		info->is_constraints_set =3D true;
+-
+-		mark_dirty(entry);
+ 	}
+ }
+=20
+-efi_status_t variable_index_dump(const struct variable_index *context, =
size_t buffer_size,
+-				 uint8_t *buffer, size_t *data_len, bool *any_dirty)
++bool variable_index_dump(const struct variable_index *context, size_t b=
uffer_size, uint8_t *buffer,
++			 size_t *data_len)
+ {
++	bool any_dirty =3D false;
+ 	uint8_t *dump_pos =3D buffer;
+ 	size_t bytes_dumped =3D 0;
+=20
+-	*data_len =3D 0;
+-	*any_dirty =3D false;
+-
+ 	for (size_t pos =3D 0; pos < context->max_variables; pos++) {
+ 		struct variable_entry *entry =3D &context->entries[pos];
+ 		struct variable_metadata *metadata =3D &entry->info.metadata;
+-		struct variable_constraints *constraints =3D &entry->info.check_const=
raints;
+=20
+ 		if (entry->in_use && entry->info.is_variable_set &&
+-		    (metadata->attributes & EFI_VARIABLE_NON_VOLATILE)) {
+-			/* Store metadata */
+-			if (bytes_dumped + sizeof(struct variable_metadata) > buffer_size)
+-				return EFI_BUFFER_TOO_SMALL;
+-
++		    (metadata->attributes & EFI_VARIABLE_NON_VOLATILE) &&
++		    ((bytes_dumped + sizeof(struct variable_metadata)) <=3D buffer_si=
ze)) {
+ 			memcpy(dump_pos, metadata, sizeof(struct variable_metadata));
+ 			bytes_dumped +=3D sizeof(struct variable_metadata);
+ 			dump_pos +=3D sizeof(struct variable_metadata);
+-
+-			/* Store constraints' status */
+-			if (bytes_dumped + sizeof(entry->info.is_constraints_set) > buffer_s=
ize)
+-				return EFI_BUFFER_TOO_SMALL;
+-
+-			memcpy(dump_pos, &entry->info.is_constraints_set,
+-			       sizeof(entry->info.is_constraints_set));
+-			bytes_dumped +=3D sizeof(entry->info.is_constraints_set);
+-			dump_pos +=3D sizeof(entry->info.is_constraints_set);
+-
+-			/* Store constraints, if they are set */
+-			if (entry->info.is_constraints_set) {
+-				if (bytes_dumped + sizeof(entry->info.check_constraints) >
+-				    buffer_size)
+-					return EFI_BUFFER_TOO_SMALL;
+-
+-				memcpy(dump_pos, constraints,
+-				       sizeof(entry->info.check_constraints));
+-				bytes_dumped +=3D sizeof(entry->info.check_constraints);
+-				dump_pos +=3D sizeof(entry->info.check_constraints);
+-			}
+ 		}
+=20
+-		*any_dirty |=3D entry->dirty;
++		any_dirty |=3D entry->dirty;
+ 		entry->dirty =3D false;
+ 	}
+=20
+ 	*data_len =3D bytes_dumped;
+=20
+-	return EFI_SUCCESS;
++	return any_dirty;
+ }
+=20
+=20
+@@ -342,50 +309,23 @@ size_t variable_index_restore(const struct variabl=
e_index *context, size_t data_
+ 	int pos =3D 0;
+=20
+ 	while (bytes_loaded < data_len) {
+-		struct variable_entry *entry =3D &context->entries[pos];
+-
+ 		if ((data_len - bytes_loaded) >=3D sizeof(struct variable_metadata)) =
{
++			struct variable_entry *entry =3D &context->entries[pos];
+ 			struct variable_metadata *metadata =3D &entry->info.metadata;
+=20
+-			/* Load metadata */
+ 			memcpy(metadata, load_pos, sizeof(struct variable_metadata));
++
++			entry->info.is_variable_set =3D true;
++			entry->in_use =3D true;
++
+ 			bytes_loaded +=3D sizeof(struct variable_metadata);
+ 			load_pos +=3D sizeof(struct variable_metadata);
+-		} else {
+-			/* Not a whole number of variable_metadata structs! */
+-			break;
+-		}
+=20
+-		if ((data_len - bytes_loaded) >=3D sizeof(entry->info.is_constraints_=
set)) {
+-			/* Load constraints' status */
+-			memcpy(&entry->info.is_constraints_set, load_pos,
+-			       sizeof(entry->info.is_constraints_set));
+-			bytes_loaded +=3D sizeof(entry->info.is_constraints_set);
+-			load_pos +=3D sizeof(entry->info.is_constraints_set);
++			++pos;
+ 		} else {
+-			/* Not enough space for constraints' status! */
++			/* Not a whole number of variable_metadata structs! */
+ 			break;
+ 		}
+-
+-		if (entry->info.is_constraints_set) {
+-			if ((data_len - bytes_loaded) >=3D sizeof(struct variable_constraint=
s)) {
+-				struct variable_constraints *constraints =3D
+-					&entry->info.check_constraints;
+-
+-				/* Load constraints if they are set */
+-				memcpy(constraints, load_pos, sizeof(struct variable_constraints));
+-				bytes_loaded +=3D sizeof(struct variable_constraints);
+-				load_pos +=3D sizeof(struct variable_constraints);
+-			} else {
+-				/* Not a whole number of variable_constraints structs! */
+-				break;
+-			}
+-		}
+-
+-		entry->info.is_variable_set =3D true;
+-		entry->in_use =3D true;
+-
+-		++pos;
+ 	}
+=20
+ 	return bytes_loaded;
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
+index 0151d636a..da6ed2476 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.h
++++ b/components/service/uefi/smm_variable/backend/variable_index.h
+@@ -201,12 +201,11 @@ void variable_index_set_constraints(struct variabl=
e_info *info,
+  * @param[in]  buffer_size Size of destination buffer
+  * @param[in]  buffer Dump to this buffer
+  * @param[out] data_len Length of serialized data
+- * @param[out] any_dirty True if there is unsaved data
+  *
+- * @return     EFI_SUCCESS if all the changes are dumped successfully
++ * @return     True if there is unsaved data
+  */
+-efi_status_t variable_index_dump(const struct variable_index *context, =
size_t buffer_size,
+-				 uint8_t *buffer, size_t *data_len, bool *any_dirty);
++bool variable_index_dump(const struct variable_index *context, size_t b=
uffer_size, uint8_t *buffer,
++			 size_t *data_len);
+=20
+ /**
+  * @brief     Confirms the successful write of the variable index into =
the storage
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 89362ead..d9a73bc7 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -13,9 +13,11 @@ SRC_URI:append:corstone1000  =3D " \
     file://0009-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
     file://0010-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
     file://0011-Align-PSA-Crypto-with-TF-Mv2.1.patch \
+    file://0012-Revert-Make-variable-index-usage-robust-with-redunda.pat=
ch \
+    file://0013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
+    file://0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.pat=
ch \
     file://0015-se-proxy-protobuf-change.patch \
     "
-
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"
=20
--=20
2.43.0


