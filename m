Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C698C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:04:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1201.1716393854713733358
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A484DA7;
	Wed, 22 May 2024 09:04:38 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.84.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 570613F766;
	Wed, 22 May 2024 09:04:13 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/5] arm-bsp/trusted-services: corstone1000: add EFI var handling fixes
Date: Wed, 22 May 2024 18:03:50 +0200
Message-Id: <20240522160354.67342-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240522160354.67342-1-bence.balogh@arm.com>
References: <20240522160354.67342-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 16:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5750

From: Bence Balogh <bence.balogh@arm.com>

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...-Fix-Avoid-redefinition-of-variables.patch |  28 +
 ...x-GetNextVariableName-NameSize-input.patch | 495 ++++++++++++++++++
 ...r-handling-of-variable-index-loading.patch |  82 +++
 .../trusted-services/ts-arm-platforms.inc     |   3 +
 4 files changed, 608 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Fix-Avoid-redefinition-of-variables.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Fix-GetNextVariableName-NameSize-input.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Fix-error-handling-of-variable-index-loading.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Fix-Avoid-redefinition-of-variables.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/corstone1000/0011-Fix-Avoid-redefinition-of-variab=
les.patch
new file mode 100644
index 00000000..d5c43bd5
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Fi=
x-Avoid-redefinition-of-variables.patch
@@ -0,0 +1,28 @@
+From c7f2861e5c5ee209373a8dba15a608f78a97078b Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Wed, 10 Apr 2024 11:17:50 +0200
+Subject: [PATCH 1/3] Fix: Avoid redefinition of variables
+
+Remove variable redefinition which shadows the original one.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27954]
+---
+ .../service/uefi/smm_variable/client/cpp/smm_variable_client.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/components/service/uefi/smm_variable/client/cpp/smm_variabl=
e_client.cpp b/components/service/uefi/smm_variable/client/cpp/smm_variab=
le_client.cpp
+index f71d0c864..d39448900 100644
+--- a/components/service/uefi/smm_variable/client/cpp/smm_variable_clien=
t.cpp
++++ b/components/service/uefi/smm_variable/client/cpp/smm_variable_clien=
t.cpp
+@@ -166,7 +166,6 @@ efi_status_t smm_variable_client::get_variable(const=
 EFI_GUID &guid, const std::
+=20
+ 	if (call_handle) {
+ 		uint8_t *resp_buf;
+-		size_t resp_len;
+ 		service_status_t service_status;
+=20
+ 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *access_var =3D
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Fix-GetNextVariableName-NameSize-input.patch b/meta-arm-bsp/recipes-=
security/trusted-services/corstone1000/0012-Fix-GetNextVariableName-NameS=
ize-input.patch
new file mode 100644
index 00000000..06efbb0e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Fi=
x-GetNextVariableName-NameSize-input.patch
@@ -0,0 +1,495 @@
+From cc4cc9f3f5f02f713cf4da1854f3085bf31e71cf Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Sat, 13 Apr 2024 14:52:23 +0200
+Subject: [PATCH 2/3] Fix GetNextVariableName NameSize input
+
+Based on the specification the NameSize shall be set to the available
+buffer size at the first call instead of the NameSize of the
+provided variable.
+Change smm-gateway and the tests according this. Also remove
+sanitize_get_next_var_name_param utility function, which is not
+compilant with this solution.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/28022]
+---
+ .../backend/test/variable_store_tests.cpp     | 48 +++++++--------
+ .../backend/uefi_variable_store.c             | 60 ++++++++++++-------
+ .../backend/uefi_variable_store.h             |  5 +-
+ .../smm_variable/backend/variable_index.c     |  3 +
+ .../provider/smm_variable_provider.c          | 59 +++++-------------
+ .../service/smm_variable_attack_tests.cpp     | 29 ++++-----
+ .../service/smm_variable_service_tests.cpp    |  7 ++-
+ 7 files changed, 98 insertions(+), 113 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
+index fd48f13fb..72772821c 100644
+--- a/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
++++ b/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
+@@ -501,15 +501,13 @@ TEST(UefiVariableStoreTests, bootServiceAccess)
+ 	std::vector<uint8_t> msg_buffer(VARIABLE_BUFFER_SIZE);
+ 	SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *next_name =3D
+ 		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *) msg_buffer.data()=
;
+-	size_t max_name_len =3D
+-		VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_=
OFFSET;
+=20
+ 	size_t total_len =3D 0;
+-	next_name->NameSize =3D sizeof(int16_t);
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	next_name->Name[0] =3D 0;
+=20
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+=20
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
+ }
+@@ -574,47 +572,48 @@ TEST(UefiVariableStoreTests, enumerateStoreContent=
s)
+ 	std::vector<uint8_t> msg_buffer(VARIABLE_BUFFER_SIZE);
+ 	SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *next_name =3D
+ 		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *) msg_buffer.data()=
;
+-	size_t max_name_len =3D
+-		VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_=
OFFSET;
+=20
+ 	/* First check handling of invalid variable name */
+ 	std::u16string bogus_name =3D to_variable_name(u"bogus_variable");
+ 	size_t bogus_name_size =3D string_get_size_in_bytes(bogus_name);
+ 	next_name->Guid =3D m_common_guid;
+-	next_name->NameSize =3D bogus_name_size;
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	memcpy(next_name->Name, bogus_name.data(), bogus_name_size);
+=20
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, status);
+=20
+ 	/* Enumerate store contents */
+ 	next_name->NameSize =3D sizeof(int16_t);
+ 	next_name->Name[0] =3D 0;
+-	/* Check if the correct NameSize is returned if max_name_len is too sm=
all */
++	/* Check if the correct NameSize is returned if namesize is too small =
*/
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    0, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, status);
+ 	UNSIGNED_LONGLONGS_EQUAL(sizeof(var_name_1), next_name->NameSize);
+=20
+-	/* And then used the previously received next_name->NameSize as max_na=
me_len */
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    next_name->NameSize, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(compare_variable_name(var_name_1, next_name->Name, next_nam=
e->NameSize));
+=20
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(compare_variable_name(var_name_2, next_name->Name, next_nam=
e->NameSize));
+=20
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(compare_variable_name(var_name_3, next_name->Name, next_nam=
e->NameSize));
+=20
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
+=20
+ 	power_cycle();
+@@ -622,21 +621,23 @@ TEST(UefiVariableStoreTests, enumerateStoreContent=
s)
+ 	/* Enumerate again - should be left with just NV variables.
+ 	 * Use a different but equally valid null name.
+ 	 */
+-	next_name->NameSize =3D 10 * sizeof(int16_t);
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	memset(next_name->Name, 0, next_name->NameSize);
+=20
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(compare_variable_name(var_name_1, next_name->Name, next_nam=
e->NameSize));
+=20
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(compare_variable_name(var_name_3, next_name->Name, next_nam=
e->NameSize));
+=20
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
+ }
+=20
+@@ -672,21 +673,20 @@ TEST(UefiVariableStoreTests, failedNvSet)
+ 	std::vector<uint8_t> msg_buffer(VARIABLE_BUFFER_SIZE);
+ 	SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *next_name =3D
+ 		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *) msg_buffer.data()=
;
+-	size_t max_name_len =3D
+-		VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_=
OFFSET;
+=20
+ 	/* Enumerate store contents */
+ 	size_t total_len =3D 0;
+-	next_name->NameSize =3D sizeof(int16_t);
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	next_name->Name[0] =3D 0;
+=20
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 	CHECK_TRUE(compare_variable_name(var_name_1, next_name->Name, next_nam=
e->NameSize));
+=20
++	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
+ 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
+-							    max_name_len, &total_len);
++							    &total_len);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
+ }
+=20
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index 5b46c1371..caf6698aa 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -404,9 +404,27 @@ efi_status_t uefi_variable_store_get_variable(const=
 struct uefi_variable_store *
+ efi_status_t
+ uefi_variable_store_get_next_variable_name(const struct uefi_variable_s=
tore *context,
+ 					   SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *cur,
+-					   size_t max_name_len, size_t *total_length)
++					   size_t *total_length)
+ {
+-	efi_status_t status =3D check_name_terminator(cur->Name, cur->NameSize=
);
++	efi_status_t status =3D EFI_SUCCESS;
++	size_t buffer_size =3D 0;
++
++	if (!cur)
++		return EFI_INVALID_PARAMETER;
++	/*
++	 * NameSize is set to the buffer size to store the names,
++	 * let's calculate the size actually being used.
++	 */
++	buffer_size =3D cur->NameSize;
++	for (int i =3D 0; i < buffer_size / sizeof(int16_t); i++) {
++		if (cur->Name[i] =3D=3D 0) {
++			/* With null terminator */
++			cur->NameSize =3D 2*(i+1);
++			break;
++		}
++	}
++
++	status =3D check_name_terminator(cur->Name, cur->NameSize);
+=20
+ 	if (status !=3D EFI_SUCCESS)
+ 		return status;
+@@ -418,21 +436,11 @@ uefi_variable_store_get_next_variable_name(const s=
truct uefi_variable_store *con
+ 			&context->variable_index, &cur->Guid, cur->NameSize, cur->Name, &sta=
tus);
+=20
+ 		if (info && (status =3D=3D EFI_SUCCESS)) {
+-			/* The NameSize has to be set in every case according to the UEFI sp=
ecs.
+-			 * In case of EFI_BUFFER_TOO_SMALL it has to reflect the size of buf=
fer
+-			 * needed.
+-			 */
+-			cur->NameSize =3D info->metadata.name_size;
+-			*total_length =3D sizeof(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_=
NAME);
+-
+-			if (info->metadata.name_size <=3D max_name_len) {
++			if (info->metadata.name_size <=3D buffer_size) {
+ 				cur->Guid =3D info->metadata.guid;
++				cur->NameSize =3D info->metadata.name_size;
+ 				memcpy(cur->Name, info->metadata.name, info->metadata.name_size);
+=20
+-				*total_length =3D
+-					SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_TOTAL_SIZE(
+-						cur);
+-
+ 				/*
+ 				 * Check if variable is accessible (e.g boot variable is not
+ 				 * accessible at runtime)
+@@ -442,6 +450,10 @@ uefi_variable_store_get_next_variable_name(const st=
ruct uefi_variable_store *con
+ 				if (status =3D=3D EFI_SUCCESS)
+ 					break;
+ 			} else {
++				/* The VariableNameSize is updated to reflect the size of buffer ne=
eded */
++				cur->NameSize =3D info->metadata.name_size;
++				memset(cur->Name, 0, buffer_size);
++				memset(&cur->Guid, 0, sizeof(EFI_GUID));
+ 				status =3D EFI_BUFFER_TOO_SMALL;
+ 				break;
+ 			}
+@@ -450,18 +462,24 @@ uefi_variable_store_get_next_variable_name(const s=
truct uefi_variable_store *con
+ 			/* Do not hide original error if there is any */
+ 			if (status =3D=3D EFI_SUCCESS)
+ 				status =3D EFI_NOT_FOUND;
++
++			memset(cur->Name, 0, buffer_size);
++			memset(&cur->Guid, 0, sizeof(EFI_GUID));
++			cur->NameSize =3D 0;
+ 			break;
+ 		}
+ 	}
+=20
+-	/* If we found no accessible variable clear the fields for security */
+-	if (status !=3D EFI_SUCCESS) {
+-		memset(cur->Name, 0, max_name_len);
+-		memset(&cur->Guid, 0, sizeof(EFI_GUID));
+-		if (status !=3D EFI_BUFFER_TOO_SMALL)
+-			cur->NameSize =3D 0;
++	if (status =3D=3D EFI_SUCCESS) {
++		/* Store everything including the name */
++		*total_length =3D
++			SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_TOTAL_SIZE(
++				cur);
++	} else {
++		/* Do not store the name, only the size */
++		*total_length =3D
++			SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
+ 	}
+-
+ 	return status;
+ }
+=20
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.h b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.h
+index 8be5f36e6..2493ff6b4 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.h
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.h
+@@ -134,8 +134,7 @@ efi_status_t uefi_variable_store_get_variable(const =
struct uefi_variable_store *
+  * Used for enumerating the store contents
+  *
+  * @param[in]  context uefi_variable_store instance
+- * @param[out] cur Current variable name
+- * @param[in]  max_name_len The maximum variable name length
++ * @param[inout] cur The size of the VariableName buffer
+  * @param[out] total_len The total length of the output
+  *
+  * @return     EFI_SUCCESS if successful
+@@ -143,7 +142,7 @@ efi_status_t uefi_variable_store_get_variable(const =
struct uefi_variable_store *
+ efi_status_t
+ uefi_variable_store_get_next_variable_name(const struct uefi_variable_s=
tore *context,
+ 					   SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *cur,
+-					   size_t max_name_len, size_t *total_length);
++					   size_t *total_length);
+=20
+ /**
+  * @brief      Query for variable info
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
+index d850dbe18..e2fe6dd38 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.c
++++ b/components/service/uefi/smm_variable/backend/variable_index.c
+@@ -27,6 +27,9 @@ static uint64_t name_hash(const EFI_GUID *guid, size_t=
 name_size, const int16_t
+=20
+ 	/* Extend to cover name up to but not including null terminator */
+ 	for (size_t i =3D 0; i < (name_size - sizeof(int16_t)) / sizeof(int16_=
t); ++i) {
++		/* Only hash till the first null terminator */
++		if (name[i] =3D=3D 0)
++			break;
+ 		hash =3D ((hash << 5) + hash) + name[i];
+ 	}
+=20
+diff --git a/components/service/uefi/smm_variable/provider/smm_variable_=
provider.c b/components/service/uefi/smm_variable/provider/smm_variable_p=
rovider.c
+index ca3f7e5e5..1a5269338 100644
+--- a/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
++++ b/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
+@@ -81,30 +81,6 @@ static efi_status_t sanitize_access_variable_param(st=
ruct rpc_request *req, size
+ 	return efi_status;
+ }
+=20
+-static efi_status_t sanitize_get_next_var_name_param(struct rpc_request=
 *req, size_t *param_len)
+-{
+-	efi_status_t efi_status =3D EFI_INVALID_PARAMETER;
+-	*param_len =3D 0;
+-	const struct rpc_buffer *req_buf =3D &req->request;
+-
+-	if (req_buf->data_length >=3D SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIAB=
LE_NAME_NAME_OFFSET) {
+-		const SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *param =3D
+-			(const SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)req_buf->da=
ta;
+-
+-		size_t max_space_for_name =3D
+-			req_buf->data_length -
+-			SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
+-
+-		if (param->NameSize <=3D max_space_for_name) {
+-			*param_len =3D
+-				SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_TOTAL_SIZE(param);
+-			efi_status =3D EFI_SUCCESS;
+-		}
+-	}
+-
+-	return efi_status;
+-}
+-
+ static efi_status_t sanitize_var_check_property_param(struct rpc_reques=
t *req, size_t *param_len)
+ {
+ 	efi_status_t efi_status =3D EFI_INVALID_PARAMETER;
+@@ -146,7 +122,7 @@ static rpc_status_t get_variable_handler(void *conte=
xt, struct rpc_request *req)
+ 			struct rpc_buffer *req_buf =3D &req->request;
+ 			size_t max_data_len =3D resp_buf->size - param_len;
+=20
+-			memmove(resp_buf->data, req_buf->data, param_len);
++			memcpy(resp_buf->data, req_buf->data, param_len);
+=20
+ 			efi_status =3D uefi_variable_store_get_variable(
+ 				&this_instance->variable_store,
+@@ -167,28 +143,21 @@ static rpc_status_t get_next_variable_name_handler=
(void *context, struct rpc_req
+ {
+ 	struct smm_variable_provider *this_instance =3D (struct smm_variable_p=
rovider *)context;
+=20
+-	size_t param_len =3D 0;
+-	efi_status_t efi_status =3D sanitize_get_next_var_name_param(req, &par=
am_len);
++	efi_status_t efi_status =3D EFI_SUCCESS;
++	size_t variable_size =3D 0;
+=20
+-	if (efi_status =3D=3D EFI_SUCCESS) {
+-		/* Valid get next variable name header */
+-		struct rpc_buffer *resp_buf =3D &req->response;
++	/* Valid get next variable name header */
++	struct rpc_buffer *resp_buf =3D &req->response;
++	struct rpc_buffer *req_buf =3D &req->request;
+=20
+-		if (resp_buf->size >=3D param_len) {
+-			struct rpc_buffer *req_buf =3D &req->request;
++	memcpy(resp_buf->data, req_buf->data, req_buf->data_length);
+=20
+-			memmove(resp_buf->data, req_buf->data, param_len);
++	efi_status =3D uefi_variable_store_get_next_variable_name(
++		&this_instance->variable_store,
++		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)resp_buf->data,
++		&variable_size);
+=20
+-			efi_status =3D uefi_variable_store_get_next_variable_name(
+-				&this_instance->variable_store,
+-				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)resp_buf->data,
+-				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
+-				&resp_buf->data_length);
+-		} else {
+-			/* Reponse buffer not big enough */
+-			efi_status =3D EFI_BAD_BUFFER_SIZE;
+-		}
+-	}
++	resp_buf->data_length =3D variable_size;
+=20
+ 	req->service_status =3D efi_status;
+=20
+@@ -240,7 +209,7 @@ static rpc_status_t query_variable_info_handler(void=
 *context, struct rpc_reques
+ 		struct rpc_buffer *resp_buf =3D &req->response;
+=20
+ 		if (resp_buf->size >=3D req_buf->data_length) {
+-			memmove(resp_buf->data, req_buf->data, req_buf->data_length);
++			memcpy(resp_buf->data, req_buf->data, req_buf->data_length);
+=20
+ 			efi_status =3D uefi_variable_store_query_variable_info(
+ 				&this_instance->variable_store,
+@@ -308,7 +277,7 @@ static rpc_status_t get_var_check_property_handler(v=
oid *context, struct rpc_req
+=20
+ 		if (resp_buf->size >=3D param_len) {
+ 			struct rpc_buffer *req_buf =3D &req->request;
+-			memmove(resp_buf->data, req_buf->data, param_len);
++			memcpy(resp_buf->data, req_buf->data, param_len);
+ 			resp_buf->data_length =3D param_len;
+=20
+ 			efi_status =3D uefi_variable_store_get_var_check_property(
+diff --git a/components/service/uefi/smm_variable/test/service/smm_varia=
ble_attack_tests.cpp b/components/service/uefi/smm_variable/test/service/=
smm_variable_attack_tests.cpp
+index 76b62fd35..98e61fec0 100644
+--- a/components/service/uefi/smm_variable/test/service/smm_variable_att=
ack_tests.cpp
++++ b/components/service/uefi/smm_variable/test/service/smm_variable_att=
ack_tests.cpp
+@@ -176,19 +176,6 @@ TEST(SmmVariableAttackTests, setAndGetWithSizeMaxNa=
meSize)
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+ }
+=20
+-TEST(SmmVariableAttackTests, enumerateWithOversizeName)
+-{
+-	efi_status_t efi_status =3D EFI_SUCCESS;
+-	std::u16string var_name =3D null_name;
+-	EFI_GUID guid;
+-	memset(&guid, 0, sizeof(guid));
+-
+-	efi_status =3D m_client->get_next_variable_name(guid, var_name,
+-						      (var_name.size() + 1) * sizeof(int16_t) + 1);
+-
+-	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, efi_status);
+-}
+-
+ TEST(SmmVariableAttackTests, enumerateWithSizeMaxNameSize)
+ {
+ 	efi_status_t efi_status =3D EFI_SUCCESS;
+@@ -202,17 +189,23 @@ TEST(SmmVariableAttackTests, enumerateWithSizeMaxN=
ameSize)
+=20
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+=20
+-	/* Initial iteration uses good name length */
+-	efi_status =3D m_client->get_next_variable_name(guid, var_name);
++	/* Initial iteration uses good name length for next variable */
++	efi_status =3D m_client->get_next_variable_name(guid, var_name, std::n=
umeric_limits<size_t>::max());
+=20
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+=20
+-	/* Next iteration uses invalid name length */
+-	efi_status =3D m_client->get_next_variable_name(guid, var_name,
+-						      std::numeric_limits<size_t>::max());
++	/* Next iteration uses invalid name length, so a null terminator can n=
ot fit */
++	var_name =3D null_name;
++	efi_status =3D m_client->get_next_variable_name(guid, var_name, 1);
+=20
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, efi_status);
+=20
++	/* Next iteration uses invalid name length, so a null terminator can n=
ot fit */
++	var_name =3D null_name;
++	efi_status =3D m_client->get_next_variable_name(guid, var_name, 2);
++
++	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, efi_status);
++
+ 	/* Expect to be able to remove the variable */
+ 	efi_status =3D m_client->remove_variable(m_common_guid, var_name_1);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+diff --git a/components/service/uefi/smm_variable/test/service/smm_varia=
ble_service_tests.cpp b/components/service/uefi/smm_variable/test/service=
/smm_variable_service_tests.cpp
+index e82a90c37..8fa4f8077 100644
+--- a/components/service/uefi/smm_variable/test/service/smm_variable_ser=
vice_tests.cpp
++++ b/components/service/uefi/smm_variable/test/service/smm_variable_ser=
vice_tests.cpp
+@@ -9,6 +9,7 @@
+ #include <cstring>
+ #include <locale>
+ #include <sstream>
++#include <limits>
+=20
+ #include "util.h"
+=20
+@@ -154,7 +155,7 @@ TEST_GROUP(SmmVariableServiceTests)
+ #endif
+=20
+ 		do {
+-			status =3D m_client->get_next_variable_name(guid, var_name);
++			status =3D m_client->get_next_variable_name(guid, var_name, max_vari=
able_size);
+=20
+ 			/* There are no more variables in the persistent store */
+ 			if (status =3D=3D EFI_NOT_FOUND) {
+@@ -223,6 +224,8 @@ TEST_GROUP(SmmVariableServiceTests)
+ 	std::u16string m_ro_variable =3D to_variable_name(u"ro_variable");
+ 	std::u16string m_boot_finished_var_name =3D to_variable_name(u"finishe=
d");
+=20
++	uint32_t max_variable_size =3D 4096;
++
+ 	/* Cleanup skips these variables */
+ 	std::vector<std::u16string *> m_non_rm_vars{ &m_ro_variable, &m_boot_f=
inished_var_name };
+=20
+@@ -654,7 +657,7 @@ TEST(SmmVariableServiceTests, enumerateStoreContents=
)
+ 	std::u16string *expected_variables[] =3D { &var_name_1, &var_name_2, &=
var_name_3 };
+=20
+ 	do {
+-		efi_status =3D m_client->get_next_variable_name(guid, var_name);
++		efi_status =3D m_client->get_next_variable_name(guid, var_name, max_v=
ariable_size);
+ 		if (efi_status !=3D EFI_SUCCESS)
+ 			break;
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Fix-error-handling-of-variable-index-loading.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/corstone1000/0013-Fix-error-handling-of-v=
ariable-index-loading.patch
new file mode 100644
index 00000000..978f2e52
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Fi=
x-error-handling-of-variable-index-loading.patch
@@ -0,0 +1,82 @@
+From c62e728bb86981219984c8b39819fb8926a41e10 Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 19 Apr 2024 18:25:23 +0200
+Subject: [PATCH 3/3] Fix error handling of variable index loading
+
+If loading of the variable index from Protected Storage fails, SmmGW
+will silently continue with empty variable store. This is a serious
+fault and a potential security risk.
+Change the code to produce a log output when this happens and stop
+loading the SP.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/28300]
+---
+ .../backend/uefi_variable_store.c             | 28 ++++++++++++++-----
+ 1 file changed, 21 insertions(+), 7 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index caf6698aa..c1691dc8f 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -27,7 +27,7 @@
+ #include "service/crypto/client/psa/crypto_client.h"
+ #endif
+=20
+-static void load_variable_index(struct uefi_variable_store *context);
++static efi_status_t load_variable_index(struct uefi_variable_store *con=
text);
+=20
+ static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context);
+=20
+@@ -165,8 +165,10 @@ efi_status_t uefi_variable_store_init(struct uefi_v=
ariable_store *context, uint3
+=20
+ 		/* Load the variable index with NV variable info from the persistent =
store */
+ 		if (context->index_sync_buffer) {
+-			load_variable_index(context);
+-			purge_orphan_index_entries(context);
++			status =3D load_variable_index(context);
++
++			if (status =3D=3D EFI_SUCCESS)
++				purge_orphan_index_entries(context);
+ 		}
+ 	}
+=20
+@@ -571,7 +573,7 @@ efi_status_t uefi_variable_store_get_var_check_prope=
rty(
+ 	return status;
+ }
+=20
+-static void load_variable_index(struct uefi_variable_store *context)
++static efi_status_t load_variable_index(struct uefi_variable_store *con=
text)
+ {
+ 	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
+=20
+@@ -583,11 +585,23 @@ static void load_variable_index(struct uefi_variab=
le_store *context)
+ 			SMM_VARIABLE_INDEX_STORAGE_UID, 0, context->index_sync_buffer_size,
+ 			context->index_sync_buffer, &data_len);
+=20
+-		if (psa_status =3D=3D PSA_SUCCESS) {
+-			variable_index_restore(&context->variable_index, data_len,
+-					       context->index_sync_buffer);
++		switch(psa_status) {
++			case PSA_SUCCESS:
++				(void) variable_index_restore(&context->variable_index, data_len,
++							      context->index_sync_buffer);
++				break;
++
++			case PSA_ERROR_DOES_NOT_EXIST:
++				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
++				break;
++
++			default:
++				EMSG("Loading variable index failed: %d", psa_status);
++				return EFI_LOAD_ERROR;
+ 		}
+ 	}
++
++	return EFI_SUCCESS;
+ }
+=20
+ static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 2612c411..f8a94750 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -12,6 +12,9 @@ SRC_URI:append:corstone1000  =3D " \
     file://0008-plat-corstone1000-add-client_id-for-FMP-service.patch \
     file://0009-Remove-Werror-flag.patch \
     file://0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
+    file://0011-Fix-Avoid-redefinition-of-variables.patch \
+    file://0012-Fix-GetNextVariableName-NameSize-input.patch \
+    file://0013-Fix-error-handling-of-variable-index-loading.patch \
     "
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
--=20
2.25.1


