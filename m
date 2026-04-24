Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1B3FED3EC
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:38:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25307.1777045095566554339
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 08:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cN0xhuyf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACAFD358A;
	Fri, 24 Apr 2026 08:38:09 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.18.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D9143F7B4;
	Fri, 24 Apr 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777045095; bh=TpYclEhVHWoahm7d3HrV5Np4XfYEsbYGC81NCf/3LXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cN0xhuyfw9yduIs1KSfKb9xsIPYK0hC68Va5p6+U3tF6EDKOwEegLZm/bAk2kIE2c
	 GwO9LpxgipvYkRVRfCoBizg4JO62vYWZgBjtPdMAflPkwgFb9YJHb740nPuFYAz01n
	 ft7QLpByMZg7HjDV2uq0fA6ecLVKuBxFeG2yyb28=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-m:cs1k: Add extra GPT library operations
Date: Fri, 24 Apr 2026 16:36:55 +0100
Message-ID: <20260424153656.774555-3-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424153656.774555-1-frazer.carsley@arm.com>
References: <20260424153656.774555-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Apr 2026 15:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7025

These patches add functionality to duplicate GPT partition entries. This
combines a "create-write" into a single step, letting the GPT library
handle it, useful for the Corstone1000 firmware update process.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...ent-of-GUIDs-in-unittests-more-clear.patch | 216 ++++++
 ...Provide-macro-identifying-free-space.patch | 157 ++++
 ...t-Add-operation-to-duplicate-entries.patch | 255 +++++++
 ...ively-erase-blocks-when-moving-parti.patch | 240 ++++++
 .../0055-lib-gpt-Clarify-API-operation.patch  |  38 +
 ...gpt-Add-metadata-only-API-operations.patch | 701 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   6 +
 7 files changed, 1613 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0051-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0052-lib-gpt-Provide-macro-identifying-free-space.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0053-lib-gpt-Add-operation-to-duplicate-entries.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0054-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0055-lib-gpt-Clarify-API-operation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0056-lib-gpt-Add-metadata-only-API-operations.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0051-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0051-lib-gpt-S=
how-intent-of-GUIDs-in-unittests-more-clear.patch
new file mode 100644
index 00000000..1279db9d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0051=
-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch
@@ -0,0 +1,216 @@
+From ca0d50fc1abbfe165941dc0bd674bb117f236f87 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 30 Mar 2026 14:06:20 +0100
+Subject: [PATCH] lib: gpt: Show intent of GUIDs in unittests more clearl=
y
+
+The standard EFI_GUID macros used in the unittests do not convey the
+full meaning of the why that particular GUID is used. The new macros can
+be used to make it clear when a valid GUID is being used or when the
+value is just a dummy and has no meaning.
+
+Change-Id: I1cf041703cbc40e60072e0662baebaef3239d3d1
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50233/1]
+---
+ lib/gpt/unittests/gpt/test_gpt.c | 55 ++++++++++++++++++--------------
+ 1 file changed, 31 insertions(+), 24 deletions(-)
+
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index bd161ec74..32dfb8fb2 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -69,6 +69,13 @@
+         backup.array_lba =3D TEST_GPT_BACKUP_ARRAY_LBA;    \
+     } while (0)
+=20
++/* These macros make it clearer in the tests what is happening */
++#define TEST_GPT_VALID_GUID(...) MAKE_EFI_GUID(__VA_ARGS__)
++#define TEST_GPT_DUMMY_GUID NULL_GUID
++
++#define TEST_GPT_VALID_TYPE(...) MAKE_EFI_GUID(__VA_ARGS__)
++#define TEST_GPT_DUMMY_TYPE NULL_GUID
++
+ /* MBR partition entry */
+ struct mbr_entry_t {
+     /* Indicates if bootable */
+@@ -176,24 +183,24 @@ static struct gpt_header_t test_header;
+ /* Default entry array. This is valid, though fragmented. */
+ static struct gpt_entry_t default_partition_array[TEST_DEFAULT_NUM_PART=
ITIONS] =3D {
+     {
+-        .type =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
+-        .guid =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .type =3D TEST_GPT_VALID_TYPE(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .guid =3D TEST_GPT_VALID_GUID(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11=
),
+         .start =3D TEST_GPT_FIRST_PARTITION_START,
+         .end =3D TEST_GPT_FIRST_PARTITION_END,
+         .attr =3D 0,
+         .name =3D "First partition"
+     },
+     {
+-        .type =3D MAKE_EFI_GUID(2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
+-        .guid =3D MAKE_EFI_GUID(2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .type =3D TEST_GPT_VALID_TYPE(2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .guid =3D TEST_GPT_VALID_GUID(2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11=
),
+         .start =3D TEST_GPT_SECOND_PARTITION_START,
+         .end =3D TEST_GPT_SECOND_PARTITION_END,
+         .attr =3D 0,
+         .name =3D "Second partition"
+     },
+     {
+-        .type =3D MAKE_EFI_GUID(3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11),
+-        .guid =3D MAKE_EFI_GUID(3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .type =3D TEST_GPT_VALID_TYPE(3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .guid =3D TEST_GPT_VALID_GUID(3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11=
),
+         .start =3D TEST_GPT_THIRD_PARTITION_START,
+         .end =3D TEST_GPT_THIRD_PARTITION_END,
+         .attr =3D 0,
+@@ -333,7 +340,7 @@ void test_gpt_init_should_overwriteOldGpt(void)
+     gpt_uninit();
+=20
+     /* Use a different disk GUID */
+-    const struct efi_guid_t new_guid =3D MAKE_EFI_GUID(1, 1, 3, 4, 5, 6=
 ,7 ,8, 9, 10, 11);
++    const struct efi_guid_t new_guid =3D TEST_GPT_VALID_GUID(1, 1, 3, 4=
, 5, 6 ,7 ,8, 9, 10, 11);
+     test_header.disk_guid =3D new_guid;
+=20
+     setup_valid_gpt();
+@@ -744,7 +751,7 @@ void test_gpt_entry_create_should_createNewEntry(voi=
d)
+=20
+     /* Update header. Read each entry for CRC calculation. */
+     struct gpt_entry_t new_entry =3D {
+-        .type =3D NULL_GUID,
++        .type =3D TEST_GPT_DUMMY_TYPE,
+         .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+         .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
+         .attr =3D 0,
+@@ -752,12 +759,12 @@ void test_gpt_entry_create_should_createNewEntry(v=
oid)
+     };
+=20
+     /* Mock out the call to create a new GUID */
+-    struct efi_guid_t expected_guid =3D MAKE_EFI_GUID(5, 5, 5, 5, 5, 6,=
 7, 8, 9, 10, 11);
++    struct efi_guid_t expected_guid =3D TEST_GPT_VALID_GUID(5, 5, 5, 5,=
 5, 6, 7, 8, 9, 10, 11);
+     efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
+     efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
+=20
+     /* Ensure also the that a new GUID is assigned */
+-    struct efi_guid_t new_guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    struct efi_guid_t new_guid =3D TEST_GPT_DUMMY_GUID;
+     TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_create(
+                 &expected_guid,
+                 new_entry.start,
+@@ -782,7 +789,7 @@ void test_gpt_entry_create_should_createNewEntryNext=
ToLastEntry(void)
+=20
+     /* Update header. Read each entry for CRC calculation. */
+     struct gpt_entry_t new_entry =3D {
+-        .type =3D NULL_GUID,
++        .type =3D TEST_GPT_DUMMY_TYPE,
+         .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+         .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
+         .attr =3D 0,
+@@ -790,12 +797,12 @@ void test_gpt_entry_create_should_createNewEntryNe=
xtToLastEntry(void)
+     };
+=20
+     /* Mock out the call to create a new GUID */
+-    struct efi_guid_t expected_guid =3D MAKE_EFI_GUID(5, 5, 5, 5, 5, 6,=
 7, 8, 9, 10, 11);
++    struct efi_guid_t expected_guid =3D TEST_GPT_VALID_GUID(5, 5, 5, 5,=
 5, 6, 7, 8, 9, 10, 11);
+     efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
+     efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
+=20
+     /* Ensure also the that a new GUID is assigned */
+-    struct efi_guid_t new_guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    struct efi_guid_t new_guid =3D TEST_GPT_DUMMY_GUID;
+     char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+     name[0] =3D 'a';
+=20
+@@ -823,7 +830,7 @@ void test_gpt_entry_create_should_failToCreateEntryW=
henLowestFreeLbaDoesNotHaveS
+     register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
+=20
+     /* Ensure also the that a new GUID is assigned */
+-    struct efi_guid_t existing_guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6,=
 7, 8, 9, 10, 11);
++    struct efi_guid_t existing_guid =3D TEST_GPT_VALID_GUID(4, 4, 4, 4,=
 5, 6, 7, 8, 9, 10, 11);
+     struct efi_guid_t new_guid;
+     char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+     name[0] =3D 'a';
+@@ -840,17 +847,17 @@ void test_gpt_entry_create_should_failWhenTableFul=
l(void)
+ {
+     /* Start with a full array of entries */
+     struct gpt_entry_t new_entry =3D {
+-        .type =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11),
++        .type =3D TEST_GPT_VALID_TYPE(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
+         .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+         .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
+         .attr =3D 0,
+-        .guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11),
++        .guid =3D TEST_GPT_VALID_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
+         .name =3D "Fourth partition"
+     };
+     test_partition_array[TEST_MAX_PARTITIONS - 1] =3D new_entry;
+     setup_valid_gpt();
+=20
+-    struct efi_guid_t type =3D MAKE_EFI_GUID(5, 5, 5, 5, 5, 6, 7, 8, 9,=
 10, 11);
++    struct efi_guid_t type =3D TEST_GPT_VALID_TYPE(5, 5, 5, 5, 5, 6, 7,=
 8, 9, 10, 11);
+     struct efi_guid_t guid;
+     char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+     name[0] =3D 'a';
+@@ -868,7 +875,7 @@ void test_gpt_entry_create_should_failWhenLbaOffDisk=
(void)
+     setup_valid_gpt();
+=20
+     /* First start on disk, then go off the disk */
+-    struct efi_guid_t type =3D NULL_GUID;
++    struct efi_guid_t type =3D TEST_GPT_DUMMY_TYPE;
+     struct efi_guid_t guid;
+     char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+     name[0] =3D 'a';
+@@ -917,7 +924,7 @@ void test_gpt_entry_create_should_failWhenOverlappin=
g(void)
+      *   2. start in the middle of a partition and end in free space
+      */
+     register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
+-    struct efi_guid_t type =3D NULL_GUID;
++    struct efi_guid_t type =3D TEST_GPT_DUMMY_TYPE;
+     struct efi_guid_t guid;
+     char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+     name[0] =3D 'a';
+@@ -944,7 +951,7 @@ void test_gpt_entry_create_should_failWhenNameIsEmpt=
y(void)
+     /* Start with a populated GPT */
+     setup_valid_gpt();
+=20
+-    struct efi_guid_t type =3D NULL_GUID;
++    struct efi_guid_t type =3D TEST_GPT_DUMMY_TYPE;
+     struct gpt_entry_t new_entry =3D {
+         .type =3D type,
+         .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+@@ -969,7 +976,7 @@ void test_gpt_entry_create_should_failWhenSizeIsZero=
(void)
+     /* Start with a populated GPT */
+     setup_valid_gpt();
+=20
+-    struct efi_guid_t type =3D NULL_GUID;
++    struct efi_guid_t type =3D TEST_GPT_DUMMY_TYPE;
+=20
+     /* Make the size zero */
+     struct efi_guid_t new_guid;
+@@ -1199,7 +1206,7 @@ void test_gpt_entry_change_type_should_setNewType(=
void)
+     /* Type validation is not a function of the library, as this is OS
+      * dependent, so anything will do here.
+      */
+-    struct efi_guid_t new_type =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    struct efi_guid_t new_type =3D TEST_GPT_VALID_TYPE(1, 2, 3, 4, 5, 6=
, 7, 8, 9, 10, 11);
+     TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_change_type(&test_guid, &n=
ew_type));
+ }
+=20
+@@ -1211,7 +1218,7 @@ void test_gpt_entry_change_type_should_failWhenEnt=
ryNotExisting(void)
+     register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
+=20
+     struct efi_guid_t non_existing =3D NULL_GUID;
+-    struct efi_guid_t new_type =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    struct efi_guid_t new_type =3D TEST_GPT_VALID_TYPE(1, 2, 3, 4, 5, 6=
, 7, 8, 9, 10, 11);
+     TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_change_type(&=
non_existing, &new_type));
+ }
+=20
+@@ -1452,7 +1459,7 @@ void test_gpt_entry_read_by_type_should_failWhenEn=
tryNotExisting(void)
+=20
+     /* Try to read something */
+     struct partition_entry_t entry;
+-    struct efi_guid_t test_type =3D MAKE_EFI_GUID(11, 10, 9, 8, 7, 6, 5=
, 4, 3, 2, 1);
++    struct efi_guid_t test_type =3D TEST_GPT_VALID_TYPE(11, 10, 9, 8, 7=
, 6, 5, 4, 3, 2, 1);
+     TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_type(=
&test_type, 0, &entry));
+=20
+     /* Now, have a non-empty GPT but search for a type that won't exist=
 */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0052-lib-gpt-Provide-macro-identifying-free-space.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0052-lib-gpt-Provide-m=
acro-identifying-free-space.patch
new file mode 100644
index 00000000..3deaf93a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0052=
-lib-gpt-Provide-macro-identifying-free-space.patch
@@ -0,0 +1,157 @@
+From 229313778bae6ca16d6e3b25437c8e87eddf3084 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 30 Mar 2026 14:35:45 +0100
+Subject: [PATCH] lib: gpt: Provide macro identifying free space
+
+In the unit tests, it is often required to know where free space on the
+mocked disk is in order to determine where it is valid to create or move
+a new partition. The macro makes it clearer when this is being done.
+
+Change-Id: I147faf516efa3e5c7fdd49775d0efa878890b771
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50234/1]
+---
+ lib/gpt/unittests/gpt/test_gpt.c | 42 +++++++++++++++++---------------
+ 1 file changed, 23 insertions(+), 19 deletions(-)
+
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 32dfb8fb2..0ae660336 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -58,6 +58,7 @@
+ #define TEST_GPT_SECOND_PARTITION_END (TEST_GPT_SECOND_PARTITION_START =
+ 50)
+ #define TEST_GPT_THIRD_PARTITION_START (TEST_GPT_SECOND_PARTITION_END +=
 1)
+ #define TEST_GPT_THIRD_PARTITION_END (TEST_GPT_THIRD_PARTITION_START + =
1)
++#define TEST_GPT_DISK_FREE_SPACE_START (TEST_GPT_THIRD_PARTITION_END + =
1)
+=20
+ /* Populates a backup header from a primary header and calculates the n=
ew CRC32 */
+ #define MAKE_BACKUP_HEADER(backup, primary)              \
+@@ -752,8 +753,8 @@ void test_gpt_entry_create_should_createNewEntry(voi=
d)
+     /* Update header. Read each entry for CRC calculation. */
+     struct gpt_entry_t new_entry =3D {
+         .type =3D TEST_GPT_DUMMY_TYPE,
+-        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+-        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .start =3D TEST_GPT_DISK_FREE_SPACE_START,
++        .end =3D TEST_GPT_DISK_FREE_SPACE_START,
+         .attr =3D 0,
+         .name =3D "Fourth partition"
+     };
+@@ -790,8 +791,8 @@ void test_gpt_entry_create_should_createNewEntryNext=
ToLastEntry(void)
+     /* Update header. Read each entry for CRC calculation. */
+     struct gpt_entry_t new_entry =3D {
+         .type =3D TEST_GPT_DUMMY_TYPE,
+-        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+-        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .start =3D TEST_GPT_DISK_FREE_SPACE_START,
++        .end =3D TEST_GPT_DISK_FREE_SPACE_START,
+         .attr =3D 0,
+         .name =3D "Fourth partition"
+     };
+@@ -846,10 +847,11 @@ void test_gpt_entry_create_should_failToCreateEntr=
yWhenLowestFreeLbaDoesNotHaveS
+ void test_gpt_entry_create_should_failWhenTableFull(void)
+ {
+     /* Start with a full array of entries */
++    const uint64_t new_entry_end =3D TEST_GPT_DISK_FREE_SPACE_START;
+     struct gpt_entry_t new_entry =3D {
+         .type =3D TEST_GPT_VALID_TYPE(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
+-        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+-        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .start =3D new_entry_end,
++        .end =3D new_entry_end,
+         .attr =3D 0,
+         .guid =3D TEST_GPT_VALID_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
+         .name =3D "Fourth partition"
+@@ -861,9 +863,11 @@ void test_gpt_entry_create_should_failWhenTableFull=
(void)
+     struct efi_guid_t guid;
+     char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+     name[0] =3D 'a';
++    const uint64_t new_free_space =3D new_entry_end + 1;
++
+     TEST_ASSERT_EQUAL(PSA_ERROR_INSUFFICIENT_STORAGE, gpt_entry_create(
+                 &type,
+-                TEST_GPT_THIRD_PARTITION_END + 4,
++                new_free_space,
+                 1,
+                 0,
+                 name,
+@@ -881,7 +885,7 @@ void test_gpt_entry_create_should_failWhenLbaOffDisk=
(void)
+     name[0] =3D 'a';
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
+                 &type,
+-                TEST_GPT_THIRD_PARTITION_END + 1,
++                TEST_GPT_DISK_FREE_SPACE_START,
+                 1000,
+                 0,
+                 name,
+@@ -954,8 +958,8 @@ void test_gpt_entry_create_should_failWhenNameIsEmpt=
y(void)
+     struct efi_guid_t type =3D TEST_GPT_DUMMY_TYPE;
+     struct gpt_entry_t new_entry =3D {
+         .type =3D type,
+-        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
+-        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .start =3D TEST_GPT_DISK_FREE_SPACE_START,
++        .end =3D TEST_GPT_DISK_FREE_SPACE_START,
+         .attr =3D 0,
+     };
+=20
+@@ -984,7 +988,7 @@ void test_gpt_entry_create_should_failWhenSizeIsZero=
(void)
+     name[0] =3D 'a';
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
+                 &type,
+-                TEST_GPT_THIRD_PARTITION_END + 1,
++                TEST_GPT_DISK_FREE_SPACE_START,
+                 0,
+                 0,
+                 name,
+@@ -1016,8 +1020,8 @@ void test_gpt_entry_move_should_moveEntry(void)
+     /* Do a valid move and resize in one */
+     TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_move(
+                 &test_guid,
+-                TEST_GPT_THIRD_PARTITION_END + 1,
+-                TEST_GPT_THIRD_PARTITION_END + 1));
++                TEST_GPT_DISK_FREE_SPACE_START,
++                TEST_GPT_DISK_FREE_SPACE_START));
+ }
+=20
+ void test_gpt_entry_move_should_failWhenEntryNotExisting(void)
+@@ -1030,8 +1034,8 @@ void test_gpt_entry_move_should_failWhenEntryNotEx=
isting(void)
+     struct efi_guid_t non_existing =3D NULL_GUID;
+     TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_move(
+                 &non_existing,
+-                TEST_GPT_THIRD_PARTITION_END + 1,
+-                TEST_GPT_THIRD_PARTITION_END + 1));
++                TEST_GPT_DISK_FREE_SPACE_START,
++                TEST_GPT_DISK_FREE_SPACE_START));
+ }
+=20
+ void test_gpt_entry_move_should_failWhenEndLessThanStart(void)
+@@ -1041,8 +1045,8 @@ void test_gpt_entry_move_should_failWhenEndLessTha=
nStart(void)
+     struct efi_guid_t test_guid =3D test_partition_array[0].guid;
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
+                 &test_guid,
+-                TEST_GPT_THIRD_PARTITION_END + 2,
+-                TEST_GPT_THIRD_PARTITION_END + 1));
++                TEST_GPT_DISK_FREE_SPACE_START + 1,
++                TEST_GPT_DISK_FREE_SPACE_START));
+ }
+=20
+ void test_gpt_entry_move_should_failWhenLbaOverlapping(void)
+@@ -1097,7 +1101,7 @@ void test_gpt_entry_move_should_failWhenLbaOffDisk=
(void)
+     /* First start on disk, then go off the disk */
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
+                 &test_guid,
+-                TEST_GPT_THIRD_PARTITION_END + 1,
++                TEST_GPT_DISK_FREE_SPACE_START,
+                 TEST_DISK_NUM_BLOCKS + 1));
+=20
+     /* Second, start off the disk entirely */
+@@ -1110,7 +1114,7 @@ void test_gpt_entry_move_should_failWhenLbaOffDisk=
(void)
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
+                 &test_guid,
+                 TEST_GPT_PRIMARY_LBA,
+-                TEST_GPT_THIRD_PARTITION_END + 2));
++                TEST_GPT_DISK_FREE_SPACE_START + 1));
+=20
+     /* Fourth, start in the backup header area */
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0053-lib-gpt-Add-operation-to-duplicate-entries.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0053-lib-gpt-Add-operati=
on-to-duplicate-entries.patch
new file mode 100644
index 00000000..09fcb39a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0053=
-lib-gpt-Add-operation-to-duplicate-entries.patch
@@ -0,0 +1,255 @@
+From 38daa61f876a6becb3968f1360d403f496634131 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 16 Mar 2026 16:46:43 +0000
+Subject: [PATCH] lib: gpt: Add operation to duplicate entries
+
+Without this new function, callers of the library would have to first
+read the entry they want to duplicate, then attempt to create a new
+entry, then manually, with their driver, copy the data of the partition
+across. This new function streamlines the latter half of that process
+into a single API call which creates, with the same size size, name and
+attributes, and copies the data across block by block.
+
+Change-Id: Ia30700cf6463f0e07e76d4b56ec015b51770459d
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50235/1]
+---
+ lib/gpt/inc/gpt.h                |  19 ++++
+ lib/gpt/src/gpt.c                |  23 +++++
+ lib/gpt/unittests/gpt/test_gpt.c | 159 +++++++++++++++++++++++++++++++
+ 3 files changed, 201 insertions(+)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index 34ce67580..334a08f41 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -170,6 +170,25 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
+                             const uint64_t           start,
+                             const uint64_t           end);
+=20
++/**
++ * \brief Duplicates an existing partition entry into new space.
++ *
++ * \param[in]  old_guid Entry to duplicate.
++ * \param[in]  start    Starting LBA (0 uses the lowest free LBA possib=
le).
++ * \param[out] new_guid GUID populated on success for subsequent API ca=
lls.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ * \retval PSA_ERROR_INSUFFICIENT_STORAGE Maximum number of partitions =
reached.
++ * \retval PSA_ERROR_INVALID_ARGUMENT New entry would overlap with an e=
xisting partition.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Part of the partition would be of=
f flash.
++ */
++__attribute__((nonnull(1,3)))
++psa_status_t gpt_entry_duplicate(const struct efi_guid_t *old_guid,
++                                 const uint64_t           start,
++                                 struct efi_guid_t       *new_guid);
++
+ /**
+  * \brief Creates a partition entry in the table.
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 0335befa7..920c4ccca 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -516,6 +516,29 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
+     return write_entry(cached_index, &cached_entry, false);
+ }
+=20
++psa_status_t gpt_entry_duplicate(const struct efi_guid_t *old_guid,
++                                 const uint64_t           start,
++                                 struct efi_guid_t       *new_guid)
++{
++    struct partition_entry_t old_entry;
++    psa_status_t ret =3D gpt_entry_read(old_guid, &old_entry);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    ret =3D gpt_entry_create(&(old_entry.type_guid),
++                           start,
++                           old_entry.size,
++                           old_entry.attr,
++                           old_entry.name,
++                           new_guid);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    return move_partition(old_entry.start, start, old_entry.size);
++}
++
+ psa_status_t gpt_entry_create(const struct efi_guid_t *type,
+                               const uint64_t           start,
+                               const uint64_t           size,
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 0ae660336..5d2c4243f 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -738,6 +738,165 @@ void test_gpt_defragment_should_succeedWhenNoIOFai=
lure(void)
+     TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_defragment());
+ }
+=20
++void test_gpt_entry_duplicate_should_DuplicateOldEntry(void)
++{
++    /* Duplicate an entry. It must not overlap with an existing entry a=
nd must also
++     * fit on the storage device. The GUID should be populated with som=
ething.
++     */
++    setup_valid_gpt();
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* The partition data is moved: this means reading each block then =
writing.
++     * It doesn't matter what the data is
++     */
++    char unused_read_data =3D 'X';
++    register_mocked_read(&unused_read_data, sizeof(unused_read_data));
++
++    /* Mock out the call to create a new GUID */
++    struct efi_guid_t expected_guid =3D TEST_GPT_VALID_GUID(5, 5, 5, 5,=
 5, 6, 7, 8, 9, 10, 11);
++    efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
++    efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
++
++    /* Ensure that a new GUID is assigned. To test the duplication was =
successful
++     * would require reading from flash, which would be mocked anyway a=
nd therefore
++     * pointless
++     */
++    struct efi_guid_t new_guid =3D TEST_GPT_DUMMY_GUID;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_duplicate(
++                &old_guid,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                &new_guid));
++    TEST_ASSERT_EQUAL_MEMORY(&expected_guid, &new_guid, sizeof(new_guid=
));
++}
++
++void test_gpt_entry_duplicate_should_createNewEntryNextToLastEntry(void=
)
++{
++    /* Duplicate an entry, allowing the library to choose the start LBA=
. The
++     * GUID should be populated with something
++     */
++    setup_valid_gpt();
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* The partition data is moved: this means reading each block then =
writing.
++     * It doesn't matter what the data is
++     */
++    char unused_read_data =3D 'X';
++    register_mocked_read(&unused_read_data, sizeof(unused_read_data));
++
++    /* Mock out the call to create a new GUID */
++    struct efi_guid_t expected_guid =3D TEST_GPT_VALID_GUID(5, 5, 5, 5,=
 5, 6, 7, 8, 9, 10, 11);
++    efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
++    efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
++
++    /* Ensure that a new GUID is assigned. To test the duplication was =
successful
++     * would require reading from flash, which would be mocked anyway a=
nd therefore
++     * pointless
++     */
++    struct efi_guid_t new_guid =3D TEST_GPT_DUMMY_GUID;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_duplicate(
++                &old_guid,
++                0,
++                &new_guid));
++    TEST_ASSERT_EQUAL_MEMORY(&expected_guid, &new_guid, sizeof(new_guid=
));
++}
++
++void test_gpt_entry_duplicate_should_failToCreateEntryWhenLowestFreeLba=
DoesNotHaveSpace(void)
++{
++    /* Duplicate an entry, allowing the library to choose the start LBA=
. Resize
++     * the last partition to consume over half of the disk, such that d=
uplicating
++     * it won't be possible.
++     */
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[TEST_DEFAU=
LT_NUM_PARTITIONS - 1]);
++    old_entry->end =3D TEST_GPT_THIRD_PARTITION_START + (TEST_DISK_NUM_=
BLOCKS / 2 ) + 1;
++    struct efi_guid_t old_guid =3D old_entry->guid;
++    setup_valid_gpt();
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t new_guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_duplicate(
++                &old_guid,
++                0,
++                &new_guid));
++}
++
++void test_gpt_entry_duplicate_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++    struct efi_guid_t old_guid =3D NULL_GUID;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t new_guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_duplicate(
++                &old_guid,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                &new_guid));
++}
++
++void test_gpt_entry_duplicate_should_failNewEntryOverlapping(void)
++{
++    setup_valid_gpt();
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++    struct efi_guid_t new_guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Since the disk is not fragmented by default, there are two test =
cases:
++     *   1. start in the middle of a partition and end in the middle of=
 a partition
++     *   2. start in the middle of a partition and end in free space
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_duplicate(
++                &old_guid,
++                TEST_GPT_FIRST_PARTITION_START + 1,
++                &new_guid));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_duplicate(
++                &old_guid,
++                TEST_GPT_THIRD_PARTITION_START + 1,
++                &new_guid));
++}
++
++void test_gpt_entry_duplicate_should_failWhenTableFull(void)
++{
++    /* Start with a full array of entries */
++    const uint64_t new_entry_end =3D TEST_GPT_DISK_FREE_SPACE_START;
++    struct gpt_entry_t new_entry =3D {
++        .type =3D TEST_GPT_VALID_TYPE(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .start =3D new_entry_end,
++        .end =3D new_entry_end,
++        .attr =3D 0,
++        .guid =3D TEST_GPT_VALID_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .name =3D "Fourth partition"
++    };
++    test_partition_array[TEST_MAX_PARTITIONS - 1] =3D new_entry;
++    setup_valid_gpt();
++
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++    struct efi_guid_t new_guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INSUFFICIENT_STORAGE, gpt_entry_duplica=
te(
++                &old_guid,
++                new_entry_end + 1,
++                &new_guid));
++}
++
+ void test_gpt_entry_create_should_createNewEntry(void)
+ {
+     /* Add an entry. It must not overlap with an existing entry and mus=
t also
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0054-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0054-lib-gpt-C=
onsecutively-erase-blocks-when-moving-parti.patch
new file mode 100644
index 00000000..53eabd6e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0054=
-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch
@@ -0,0 +1,240 @@
+From 0dcbef3a0800a2a610b32935a54762d4b42203f1 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Tue, 17 Mar 2026 11:44:14 +0000
+Subject: [PATCH] lib: gpt: Consecutively erase blocks when moving partit=
ions
+
+An LBA is typically smaller than a flash sector size, so it becomes
+inefficient to erase block by block and also erases the same sector
+multiple times. Consecutively erasing blocks allows the platform
+implementation of the driver the opportunity to save on erase cycles.
+
+As a result, the write_to_flash function has had an extra parameter
+added to indicate whether an erase is required or not. Under normal
+circumstances, it should be false, however there are some reasons where
+it is not required, such as if it has been erased before already.
+
+Change-Id: I80c6d73565ab9bfcb0b286aaa215798dd09725f2
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50236/1]
+---
+ lib/gpt/src/gpt.c | 102 ++++++++++++++++++++++++++++++++++------------
+ 1 file changed, 75 insertions(+), 27 deletions(-)
+
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 920c4ccca..984c8f821 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -207,7 +207,7 @@ static psa_status_t read_entry_from_flash(const stru=
ct gpt_t *table,
+                                           struct gpt_entry_t *entry);
+ static psa_status_t read_table_from_flash(struct gpt_t *table, bool is_=
primary);
+ static psa_status_t flush_lba_buf(void);
+-static psa_status_t write_to_flash(uint64_t lba);
++static psa_status_t write_to_flash(uint64_t lba, bool skip_erase);
+ static psa_status_t write_entries_to_flash(uint32_t lbas_into_array, bo=
ol no_header_update);
+ static psa_status_t write_entry(uint32_t                  array_index,
+                                 const struct gpt_entry_t *entry,
+@@ -221,7 +221,7 @@ static psa_status_t find_gpt_entry(const struct gpt_=
t      *table,
+                                    const uint32_t           repeat_inde=
x,
+                                    struct gpt_entry_t      *entry,
+                                    uint32_t                *array_index=
);
+-static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba);
++static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba, const bool skip_erase);
+ static psa_status_t move_partition(const uint64_t old_lba,
+                                    const uint64_t new_lba,
+                                    const uint64_t num_blocks);
+@@ -722,12 +722,12 @@ psa_status_t gpt_entry_remove(const struct efi_gui=
d_t *guid)
+=20
+             /* Write to backup first, then primary partition array */
+             if (backup_gpt_array_lba !=3D 0) {
+-                ret =3D write_to_flash(backup_gpt_array_lba + i - 1 - P=
RIMARY_GPT_ARRAY_LBA);
++                ret =3D write_to_flash(backup_gpt_array_lba + i - 1 - P=
RIMARY_GPT_ARRAY_LBA, false);
+                 if (ret !=3D PSA_SUCCESS) {
+                     return ret;
+                 }
+             }
+-            ret =3D write_to_flash(i - 1);
++            ret =3D write_to_flash(i - 1, false);
+             if (ret !=3D PSA_SUCCESS) {
+                 return ret;
+             }
+@@ -750,16 +750,16 @@ psa_status_t gpt_entry_remove(const struct efi_gui=
d_t *guid)
+          */
+         memset(lba_buf, 0, TFM_GPT_BLOCK_SIZE);
+         if (backup_gpt_array_lba !=3D 0) {
+-            int write_ret =3D plat_flash_driver->write(
++            ret =3D write_to_flash(
+                     backup_gpt_array_lba + array_end_lba - PRIMARY_GPT_=
ARRAY_LBA,
+-                    lba_buf);
+-            if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
+-                return PSA_ERROR_STORAGE_FAILURE;
++                    true);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
+             }
+         }
+-        int write_ret =3D plat_flash_driver->write(array_end_lba, lba_b=
uf);
+-        if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
+-            return PSA_ERROR_STORAGE_FAILURE;
++        ret =3D write_to_flash(array_end_lba, true);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
+         }
+     } else {
+         /* Zero what is not needed anymore */
+@@ -768,12 +768,12 @@ psa_status_t gpt_entry_remove(const struct efi_gui=
d_t *guid)
+                 0,
+                 (gpt_entry_per_lba_count() - entries_in_last_lba) * GPT=
_ENTRY_SIZE);
+         if (backup_gpt_array_lba !=3D 0) {
+-            ret =3D write_to_flash(backup_gpt_array_lba + array_end_lba=
 - PRIMARY_GPT_ARRAY_LBA);
++            ret =3D write_to_flash(array_end_lba, false);
+             if (ret !=3D PSA_SUCCESS) {
+                 return ret;
+             }
+         }
+-        ret =3D write_to_flash(array_end_lba);
++        ret =3D write_to_flash(array_end_lba, false);
+         if (ret !=3D PSA_SUCCESS) {
+             return ret;
+         }
+@@ -1121,14 +1121,18 @@ static psa_status_t find_gpt_entry(const struct =
gpt_t        *table,
+ }
+=20
+ /* Move a single LBAs data to somewhere else */
+-static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba)
++static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba, const bool skip_erase)
+ {
++    VERBOSE("Moving from 0x%x%x to 0x%x%x %s erase\n",
++            (uint32_t)(old_lba >> 32), (uint32_t)old_lba,
++            (uint32_t)(new_lba >> 32), (uint32_t)new_lba,
++            skip_erase ? "without" : "with");
+     const psa_status_t ret =3D read_from_flash(old_lba);
+     if (ret !=3D PSA_SUCCESS) {
+         return ret;
+     }
+=20
+-    return write_to_flash(new_lba);
++    return write_to_flash(new_lba, skip_erase);
+ }
+=20
+ /* Moves a partition's data to start from one logical block to another =
*/
+@@ -1140,18 +1144,60 @@ static psa_status_t move_partition(const uint64_=
t old_lba,
+         return PSA_SUCCESS;
+     }
+=20
++    /* If possible, erase all of the LBAs that the data is going to be =
read
++     * to, so that, in the case an LBA is smaller than a flash sector, =
the
++     * number of flash erase cycles is reduced. Ignore any errors when =
erasing,
++     * as the "write" will perform erase anyway. If the areas between w=
here the
++     * partition is now and where it will be does not overlap, then era=
se all
++     * blocks in the new area. If there is overlap, erase only those wh=
ich are
++     * not within the old area
++     */
+     if (old_lba < new_lba) {
++        /* Attempt consecutive erase */
++        uint64_t non_overlap_blocks =3D
++            (old_lba + num_blocks - 1 < new_lba ? num_blocks : new_lba =
- old_lba);
++
++        VERBOSE("Erasing 0x%x%x blocks from LBA 0x%x%x\n",
++                (uint32_t)(non_overlap_blocks >> 32), (uint32_t)non_ove=
rlap_blocks,
++                (uint32_t)(new_lba >> 32), (uint32_t)new_lba);
++
++        const ssize_t erase_ret =3D plat_flash_driver->erase(
++                new_lba + (num_blocks - non_overlap_blocks),
++                (size_t)non_overlap_blocks);
++        if (erase_ret !=3D (ssize_t)non_overlap_blocks) {
++            WARN("Failed to erase all blocks consecutively, only erased=
 %ld. "
++                    "Continuing to erase on a per-block basis\n", erase=
_ret);
++            non_overlap_blocks =3D 0;
++        }
++
+         /* Move block by block backwards */
+         for (uint64_t block =3D num_blocks; block > 0; --block) {
+-            const psa_status_t ret =3D move_lba(old_lba + block - 1, ne=
w_lba + block - 1);
++            const bool skip_erase =3D (block < non_overlap_blocks);
++            const psa_status_t ret =3D move_lba(old_lba + block - 1, ne=
w_lba + block - 1, skip_erase);
+             if (ret !=3D PSA_SUCCESS) {
+                 return ret;
+             }
+         }
+     } else {
++        /* Attempt consecutive erase */
++        uint64_t non_overlap_blocks =3D
++            (new_lba + num_blocks - 1 < old_lba ? num_blocks : old_lba =
- new_lba);
++
++        VERBOSE("Erasing 0x%x%x blocks from LBA 0x%x%x\n",
++                (uint32_t)(non_overlap_blocks >> 32), (uint32_t)non_ove=
rlap_blocks,
++                (uint32_t)(new_lba >> 32), (uint32_t)new_lba);
++
++        const ssize_t erase_ret =3D plat_flash_driver->erase(new_lba, (=
size_t)non_overlap_blocks);
++        if (erase_ret !=3D (ssize_t)non_overlap_blocks) {
++            WARN("Failed to erase all blocks consecutively, only erased=
 %ld. "
++                    "Continuing to erase on a per-block basis\n", erase=
_ret);
++            non_overlap_blocks =3D 0;
++        }
++
+         /* Move block by block forwards */
+         for (uint64_t block =3D 0; block < num_blocks; ++block) {
+-            const psa_status_t ret =3D move_lba(old_lba + block, new_lb=
a + block);
++            const bool skip_erase =3D (block < non_overlap_blocks);
++            const psa_status_t ret =3D move_lba(old_lba + block, new_lb=
a + block, skip_erase);
+             if (ret !=3D PSA_SUCCESS) {
+                 return ret;
+             }
+@@ -1372,7 +1418,7 @@ static psa_status_t flush_lba_buf(void)
+         ret =3D write_entries_to_flash(cached_lba - backup_gpt_array_lb=
a, false);
+     } else {
+         /* Some other LBA is cached, possibly data. Write it anyway */
+-        ret =3D write_to_flash(cached_lba);
++        ret =3D write_to_flash(cached_lba, false);
+     }
+=20
+     in_flush =3D false;
+@@ -1380,13 +1426,15 @@ static psa_status_t flush_lba_buf(void)
+ }
+=20
+ /* Write to the flash at the specified LBA */
+-static psa_status_t write_to_flash(uint64_t lba)
++static psa_status_t write_to_flash(uint64_t lba, bool skip_erase)
+ {
+-    if (plat_flash_driver->erase(lba, 1) !=3D 1) {
+-        ERROR("Unable to erase flash at LBA 0x%08x%08x\n",
+-                (uint32_t)(lba >> 32),
+-                (uint32_t)lba);
+-        return PSA_ERROR_STORAGE_FAILURE;
++    if (!skip_erase) {
++        if (plat_flash_driver->erase(lba, 1) !=3D 1) {
++            ERROR("Unable to erase flash at LBA 0x%08x%08x\n",
++                    (uint32_t)(lba >> 32),
++                    (uint32_t)lba);
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
+     }
+=20
+     if (plat_flash_driver->write(lba, lba_buf) !=3D TFM_GPT_BLOCK_SIZE)=
 {
+@@ -1408,7 +1456,7 @@ static psa_status_t write_entries_to_flash(uint32_=
t lbas_into_array, bool no_hea
+     psa_status_t ret;
+=20
+     if (backup_gpt_array_lba !=3D 0) {
+-        ret =3D write_to_flash(backup_gpt_array_lba + lbas_into_array);
++        ret =3D write_to_flash(backup_gpt_array_lba + lbas_into_array, =
false);
+         if (ret !=3D PSA_SUCCESS) {
+             ERROR("Unable to write entry to backup partition array\n");
+             return ret;
+@@ -1417,7 +1465,7 @@ static psa_status_t write_entries_to_flash(uint32_=
t lbas_into_array, bool no_hea
+         WARN("Backup array LBA unknown!\n");
+     }
+=20
+-    ret =3D write_to_flash(PRIMARY_GPT_ARRAY_LBA + lbas_into_array);
++    ret =3D write_to_flash(PRIMARY_GPT_ARRAY_LBA + lbas_into_array, fal=
se);
+     if (ret !=3D PSA_SUCCESS) {
+         ERROR("Unable to write entry to primary partition array\n");
+         return ret;
+@@ -1486,7 +1534,7 @@ static psa_status_t write_header_to_flash(const st=
ruct gpt_t *table)
+     uint8_t temp_buf[GPT_HEADER_SIZE];
+     memcpy(temp_buf, lba_buf, GPT_HEADER_SIZE);
+     memcpy(lba_buf, &(table->header), GPT_HEADER_SIZE);
+-    const psa_status_t ret =3D write_to_flash(table->header.current_lba=
);
++    const psa_status_t ret =3D write_to_flash(table->header.current_lba=
, false);
+     memcpy(lba_buf, temp_buf, GPT_HEADER_SIZE);
+=20
+     return ret;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0055-lib-gpt-Clarify-API-operation.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-m/files/corstone1000/0055-lib-gpt-Clarify-API-operation.pa=
tch
new file mode 100644
index 00000000..29986c43
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0055=
-lib-gpt-Clarify-API-operation.patch
@@ -0,0 +1,38 @@
+From 7e2ae2fc4f8ae8a16a24b87d0650c6b4b28fc870 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 8 Apr 2026 17:39:13 +0100
+Subject: [PATCH] lib: gpt: Clarify API operation
+
+The move and duplicate operations both also move or copy (respectively)
+the partition data, which is not immediately obvious.
+
+Change-Id: If4a0c4a87d30bfceb2534c9d01ba763688e0cc9e
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50237/1]
+---
+ lib/gpt/inc/gpt.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index 334a08f41..c11ecbff2 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -152,7 +152,7 @@ __attribute__((nonnull(1)))
+ psa_status_t gpt_attr_set(const struct efi_guid_t *guid, const uint64_t=
 attr);
+=20
+ /**
+- * \brief Moves (or resizes) a partition entry.
++ * \brief Moves (or resizes) a partition entry, including the partition=
 data.
+  *
+  * \param[in] guid Entry to move.
+  * \param[in] start New start LBA.
+@@ -171,7 +171,8 @@ psa_status_t gpt_entry_move(const struct efi_guid_t =
*guid,
+                             const uint64_t           end);
+=20
+ /**
+- * \brief Duplicates an existing partition entry into new space.
++ * \brief Duplicates an existing partition entry into new space, includ=
ing the
++ *        partition data.
+  *
+  * \param[in]  old_guid Entry to duplicate.
+  * \param[in]  start    Starting LBA (0 uses the lowest free LBA possib=
le).
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0056-lib-gpt-Add-metadata-only-API-operations.patch b/meta-arm-bsp/rec=
ipes-bsp/trusted-firmware-m/files/corstone1000/0056-lib-gpt-Add-metadata-=
only-API-operations.patch
new file mode 100644
index 00000000..e3320caf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0056=
-lib-gpt-Add-metadata-only-API-operations.patch
@@ -0,0 +1,701 @@
+From f9badce3570bbc89b141c86a6b8a988d90d81f0c Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 8 Apr 2026 17:51:18 +0100
+Subject: [PATCH] lib: gpt: Add metadata-only API operations
+
+Both move and duplicate functions also move or copy (respectively) the
+partition data. This is not always required, for example if the
+new location or partition will simply be erased or overwritten anyway.
+
+Change-Id: I180f8790335444e9925c405616aa5a3c9a4290a8
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50238/1]
+---
+ lib/gpt/inc/gpt.h                |  39 +++++
+ lib/gpt/src/gpt.c                | 285 ++++++++++++++++++-------------
+ lib/gpt/unittests/gpt/test_gpt.c | 269 +++++++++++++++++++++++++++++
+ 3 files changed, 473 insertions(+), 120 deletions(-)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index c11ecbff2..c5bddb470 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -170,6 +170,25 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
+                             const uint64_t           start,
+                             const uint64_t           end);
+=20
++/**
++ * \brief Moves (or resizes) a partition entry, without moving the part=
ition data.
++ *
++ * \param[in] guid Entry to move.
++ * \param[in] start New start LBA.
++ * \param[in] end New end LBA.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Move would overlap with an existi=
ng partition.
++ * \retval PSA_ERROR_INVALID_ARGUMENT \p end is less than \p start.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Part of the partition would move =
off flash.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_entry_move_no_copy(const struct efi_guid_t *guid,
++                                    const uint64_t           start,
++                                    const uint64_t           end);
++
+ /**
+  * \brief Duplicates an existing partition entry into new space, includ=
ing the
+  *        partition data.
+@@ -190,6 +209,26 @@ psa_status_t gpt_entry_duplicate(const struct efi_g=
uid_t *old_guid,
+                                  const uint64_t           start,
+                                  struct efi_guid_t       *new_guid);
+=20
++/**
++ * \brief Duplicates an existing partition entry into new space, withou=
t copying
++ *        the partition data.
++ *
++ * \param[in]  old_guid Entry to duplicate.
++ * \param[in]  start    Starting LBA (0 uses the lowest free LBA possib=
le).
++ * \param[out] new_guid GUID populated on success for subsequent API ca=
lls.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ * \retval PSA_ERROR_INSUFFICIENT_STORAGE Maximum number of partitions =
reached.
++ * \retval PSA_ERROR_INVALID_ARGUMENT New entry would overlap with an e=
xisting partition.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Part of the partition would be of=
f flash.
++ */
++__attribute__((nonnull(1,3)))
++psa_status_t gpt_entry_duplicate_no_copy(const struct efi_guid_t *old_g=
uid,
++                                         const uint64_t           start=
,
++                                         struct efi_guid_t       *new_g=
uid);
++
+ /**
+  * \brief Creates a partition entry in the table.
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 984c8f821..d6528f6a5 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -222,9 +222,17 @@ static psa_status_t find_gpt_entry(const struct gpt=
_t      *table,
+                                    struct gpt_entry_t      *entry,
+                                    uint32_t                *array_index=
);
+ static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba, const bool skip_erase);
+-static psa_status_t move_partition(const uint64_t old_lba,
+-                                   const uint64_t new_lba,
+-                                   const uint64_t num_blocks);
++static psa_status_t move_partition_data(const uint64_t old_lba,
++                                        const uint64_t new_lba,
++                                        const uint64_t num_blocks);
++static psa_status_t move_partition(const struct efi_guid_t *guid,
++                                   const uint64_t           start,
++                                   const uint64_t           end,
++                                   const bool               no_copy);
++static psa_status_t duplicate_partition(const struct efi_guid_t *old_gu=
id,
++                                        const uint64_t           start,
++                                        const bool               no_cop=
y,
++                                        struct efi_guid_t       *new_gu=
id);
+ static psa_status_t mbr_load(struct mbr_t *mbr);
+ static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid);
+ static bool gpt_entry_cmp_name(const struct gpt_entry_t *entry, const v=
oid *name);
+@@ -415,128 +423,28 @@ psa_status_t gpt_entry_move(const struct efi_guid=
_t *guid,
+                             const uint64_t           start,
+                             const uint64_t           end)
+ {
+-    if (end < start) {
+-        return PSA_ERROR_INVALID_ARGUMENT;
+-    }
+-
+-    /* Must fit on flash */
+-    if (start < primary_gpt.header.first_lba ||
+-            end < primary_gpt.header.first_lba ||
+-            start > primary_gpt.header.last_lba ||
+-            end > primary_gpt.header.last_lba)
+-    {
+-        ERROR("Requested move would not be on disk\n");
+-        return PSA_ERROR_INVALID_ARGUMENT;
+-    }
+-
+-    struct gpt_entry_t cached_entry;
+-    uint32_t cached_index;
+-    psa_status_t ret =3D find_gpt_entry(
+-            &primary_gpt,
+-            gpt_entry_cmp_guid,
+-            guid,
+-            0,
+-            &cached_entry,
+-            &cached_index);
+-    if (ret !=3D PSA_SUCCESS) {
+-        return ret;
+-    }
+-
+-     /* Prevent unecessary I/O */
+-    if (start =3D=3D cached_entry.start && end =3D=3D cached_entry.end)=
 {
+-        return PSA_SUCCESS;
+-    }
+-
+-    /* It is not possible to move a partition such that it overlaps wit=
h an
+-     * existing partition (other than itself). Check the currently cach=
ed LBA
+-     * first, then the others to avoid reading this LBA twice
+-     */
+-    struct gpt_entry_t entry;
+-    const uint64_t checked_lba =3D cached_lba;
+-    const uint64_t array_end_lba =3D partition_array_last_lba(&primary_=
gpt);
+-    uint32_t num_entries_in_cached_lba;
+-    if (cached_lba =3D=3D array_end_lba) {
+-        /* If this is 0, then the last LBA is full */
+-        uint32_t num_entries_in_last_lba =3D primary_gpt.num_used_parti=
tions % gpt_entry_per_lba_count();
+-        if (num_entries_in_last_lba =3D=3D 0) {
+-            num_entries_in_cached_lba =3D gpt_entry_per_lba_count();
+-        } else {
+-            num_entries_in_cached_lba =3D num_entries_in_last_lba;
+-        }
+-    } else {
+-        num_entries_in_cached_lba =3D gpt_entry_per_lba_count();
+-    }
+-
+-    /* Cached LBA */
+-    for (uint32_t i =3D 0; i < num_entries_in_cached_lba; ++i) {
+-        memcpy(&entry, lba_buf + (i * GPT_ENTRY_SIZE), GPT_ENTRY_SIZE);
+-
+-        const struct efi_guid_t ent_guid =3D entry.unique_guid;
+-        if (efi_guid_cmp(&ent_guid, guid) =3D=3D 0) {
+-            continue;
+-        }
+-
+-        if ((start >=3D entry.start && start <=3D entry.end) ||
+-                (end >=3D entry.start && end <=3D entry.end) ||
+-                (start <=3D entry.start && end >=3D entry.end))
+-        {
+-            return PSA_ERROR_INVALID_ARGUMENT;
+-        }
+-    }
+-
+-    /* All the rest */
+-    for (uint32_t i =3D 0; i < primary_gpt.num_used_partitions; ++i) {
+-        if (partition_entry_lba(&primary_gpt, i) =3D=3D checked_lba) {
+-            continue;
+-        }
+-
+-        ret =3D read_entry_from_flash(&primary_gpt, i, &entry);
+-        if (ret !=3D PSA_SUCCESS) {
+-            return ret;
+-        }
+-
+-        if ((start >=3D entry.start && start <=3D entry.end) ||
+-                (end >=3D entry.start && end <=3D entry.end) ||
+-                (start <=3D entry.start && end >=3D entry.end))
+-        {
+-            return PSA_ERROR_INVALID_ARGUMENT;
+-        }
+-    }
+-
+-    ret =3D move_partition(
+-            cached_entry.start,
+-            start,
+-            end - start + 1);
+-    if (ret !=3D PSA_SUCCESS) {
+-        return ret;
+-    }
+-    cached_entry.start =3D start;
+-    cached_entry.end =3D end;
++    return move_partition(guid, start, end, false);
++}
+=20
+-    return write_entry(cached_index, &cached_entry, false);
++psa_status_t gpt_entry_move_no_copy(const struct efi_guid_t *guid,
++                                    const uint64_t           start,
++                                    const uint64_t           end)
++{
++    return move_partition(guid, start, end, true);
+ }
+=20
+ psa_status_t gpt_entry_duplicate(const struct efi_guid_t *old_guid,
+                                  const uint64_t           start,
+                                  struct efi_guid_t       *new_guid)
+ {
+-    struct partition_entry_t old_entry;
+-    psa_status_t ret =3D gpt_entry_read(old_guid, &old_entry);
+-    if (ret !=3D PSA_SUCCESS) {
+-        return ret;
+-    }
+-
+-    ret =3D gpt_entry_create(&(old_entry.type_guid),
+-                           start,
+-                           old_entry.size,
+-                           old_entry.attr,
+-                           old_entry.name,
+-                           new_guid);
+-    if (ret !=3D PSA_SUCCESS) {
+-        return ret;
+-    }
++    return duplicate_partition(old_guid, start, false, new_guid);
++}
+=20
+-    return move_partition(old_entry.start, start, old_entry.size);
++psa_status_t gpt_entry_duplicate_no_copy(const struct efi_guid_t *old_g=
uid,
++                                         const uint64_t           start=
,
++                                         struct efi_guid_t       *new_g=
uid)
++{
++    return duplicate_partition(old_guid, start, true, new_guid);
+ }
+=20
+ psa_status_t gpt_entry_create(const struct efi_guid_t *type,
+@@ -885,7 +793,7 @@ psa_status_t gpt_defragment(void)
+         }
+=20
+         const uint64_t num_blocks =3D entry.end - entry.start + 1;
+-        ret =3D move_partition(entry.start, prev_end, num_blocks);
++        ret =3D move_partition_data(entry.start, prev_end, num_blocks);
+         if (ret !=3D PSA_SUCCESS) {
+             return ret;
+         }
+@@ -1120,6 +1028,143 @@ static psa_status_t find_gpt_entry(const struct =
gpt_t        *table,
+     return io_failure ? PSA_ERROR_STORAGE_FAILURE : PSA_ERROR_DOES_NOT_=
EXIST;
+ }
+=20
++/* Duplicate a partition, potentially also copying its data but always =
updating
++ * the header
++ */
++static psa_status_t duplicate_partition(const struct efi_guid_t *old_gu=
id,
++                                        const uint64_t           start,
++                                        const bool               no_cop=
y,
++                                        struct efi_guid_t       *new_gu=
id)
++{
++    struct partition_entry_t old_entry;
++    psa_status_t ret =3D gpt_entry_read(old_guid, &old_entry);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    ret =3D gpt_entry_create(&(old_entry.type_guid),
++                           start,
++                           old_entry.size,
++                           old_entry.attr,
++                           old_entry.name,
++                           new_guid);
++    if (ret !=3D PSA_SUCCESS || no_copy) {
++        return ret;
++    }
++
++    return move_partition_data(old_entry.start, start, old_entry.size);
++}
++
++/* Move a partition, potentially also copying its data but always updat=
ing the header */
++static psa_status_t move_partition(const struct efi_guid_t *guid,
++                                   const uint64_t           start,
++                                   const uint64_t           end,
++                                   const bool               no_copy)
++{
++    if (end < start) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    /* Must fit on flash */
++    if (start < primary_gpt.header.first_lba ||
++            end < primary_gpt.header.first_lba ||
++            start > primary_gpt.header.last_lba ||
++            end > primary_gpt.header.last_lba)
++    {
++        ERROR("Requested move would not be on disk\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++     /* Prevent unecessary I/O */
++    if (start =3D=3D cached_entry.start && end =3D=3D cached_entry.end)=
 {
++        return PSA_SUCCESS;
++    }
++
++    /* It is not possible to move a partition such that it overlaps wit=
h an
++     * existing partition (other than itself). Check the currently cach=
ed LBA
++     * first, then the others to avoid reading this LBA twice
++     */
++    struct gpt_entry_t entry;
++    const uint64_t checked_lba =3D cached_lba;
++    const uint64_t array_end_lba =3D partition_array_last_lba(&primary_=
gpt);
++    uint32_t num_entries_in_cached_lba;
++    if (cached_lba =3D=3D array_end_lba) {
++        /* If this is 0, then the last LBA is full */
++        uint32_t num_entries_in_last_lba =3D primary_gpt.num_used_parti=
tions % gpt_entry_per_lba_count();
++        if (num_entries_in_last_lba =3D=3D 0) {
++            num_entries_in_cached_lba =3D gpt_entry_per_lba_count();
++        } else {
++            num_entries_in_cached_lba =3D num_entries_in_last_lba;
++        }
++    } else {
++        num_entries_in_cached_lba =3D gpt_entry_per_lba_count();
++    }
++
++    /* Cached LBA */
++    for (uint32_t i =3D 0; i < num_entries_in_cached_lba; ++i) {
++        memcpy(&entry, lba_buf + (i * GPT_ENTRY_SIZE), GPT_ENTRY_SIZE);
++
++        const struct efi_guid_t ent_guid =3D entry.unique_guid;
++        if (efi_guid_cmp(&ent_guid, guid) =3D=3D 0) {
++            continue;
++        }
++
++        if ((start >=3D entry.start && start <=3D entry.end) ||
++                (end >=3D entry.start && end <=3D entry.end) ||
++                (start <=3D entry.start && end >=3D entry.end))
++        {
++            return PSA_ERROR_INVALID_ARGUMENT;
++        }
++    }
++
++    /* All the rest */
++    for (uint32_t i =3D 0; i < primary_gpt.num_used_partitions; ++i) {
++        if (partition_entry_lba(&primary_gpt, i) =3D=3D checked_lba) {
++            continue;
++        }
++
++        ret =3D read_entry_from_flash(&primary_gpt, i, &entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        if ((start >=3D entry.start && start <=3D entry.end) ||
++                (end >=3D entry.start && end <=3D entry.end) ||
++                (start <=3D entry.start && end >=3D entry.end))
++        {
++            return PSA_ERROR_INVALID_ARGUMENT;
++        }
++    }
++
++    if (!no_copy) {
++        ret =3D move_partition_data(
++                cached_entry.start,
++                start,
++                end - start + 1);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++    }
++
++    cached_entry.start =3D start;
++    cached_entry.end =3D end;
++
++    return write_entry(cached_index, &cached_entry, false);
++}
++
+ /* Move a single LBAs data to somewhere else */
+ static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba, const bool skip_erase)
+ {
+@@ -1136,7 +1181,7 @@ static psa_status_t move_lba(const uint64_t old_lb=
a, const uint64_t new_lba, con
+ }
+=20
+ /* Moves a partition's data to start from one logical block to another =
*/
+-static psa_status_t move_partition(const uint64_t old_lba,
++static psa_status_t move_partition_data(const uint64_t old_lba,
+                                    const uint64_t new_lba,
+                                    const uint64_t num_blocks)
+ {
+@@ -1780,7 +1825,7 @@ static psa_status_t restore_table(struct gpt_t *re=
store_from, bool is_primary)
+     swap_headers(&(restore_from->header), &(restore_to.header));
+=20
+     /* Copy the partition array as well */
+-    ret =3D move_partition(
++    ret =3D move_partition_data(
+             restore_from->header.array_lba,
+             restore_to.header.array_lba,
+             (restore_from->header.num_partitions +
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 5d2c4243f..bd9eb8ba1 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -897,6 +897,153 @@ void test_gpt_entry_duplicate_should_failWhenTable=
Full(void)
+                 &new_guid));
+ }
+=20
++void test_gpt_entry_duplicate_no_copy_should_DuplicateOldEntry(void)
++{
++    /* Duplicate an entry. It must not overlap with an existing entry a=
nd must also
++     * fit on the storage device. The GUID should be populated with som=
ething.
++     */
++    setup_valid_gpt();
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Mock out the call to create a new GUID */
++    struct efi_guid_t expected_guid =3D TEST_GPT_VALID_GUID(5, 5, 5, 5,=
 5, 6, 7, 8, 9, 10, 11);
++    efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
++    efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
++
++    /* Ensure that a new GUID is assigned. To test the duplication was =
successful
++     * would require reading from flash, which would be mocked anyway a=
nd therefore
++     * pointless
++     */
++    struct efi_guid_t new_guid =3D TEST_GPT_DUMMY_GUID;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_duplicate_no_copy(
++                &old_guid,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                &new_guid));
++    TEST_ASSERT_EQUAL_MEMORY(&expected_guid, &new_guid, sizeof(new_guid=
));
++}
++
++void test_gpt_entry_duplicate_no_copy_should_createNewEntryNextToLastEn=
try(void)
++{
++    /* Duplicate an entry, allowing the library to choose the start LBA=
. The
++     * GUID should be populated with something
++     */
++    setup_valid_gpt();
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Mock out the call to create a new GUID */
++    struct efi_guid_t expected_guid =3D TEST_GPT_VALID_GUID(5, 5, 5, 5,=
 5, 6, 7, 8, 9, 10, 11);
++    efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
++    efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
++
++    /* Ensure that a new GUID is assigned. To test the duplication was =
successful
++     * would require reading from flash, which would be mocked anyway a=
nd therefore
++     * pointless
++     */
++    struct efi_guid_t new_guid =3D TEST_GPT_DUMMY_GUID;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_duplicate_no_copy(
++                &old_guid,
++                0,
++                &new_guid));
++    TEST_ASSERT_EQUAL_MEMORY(&expected_guid, &new_guid, sizeof(new_guid=
));
++}
++
++void test_gpt_entry_duplicate_no_copy_should_failToCreateEntryWhenLowes=
tFreeLbaDoesNotHaveSpace(void)
++{
++    /* Duplicate an entry, allowing the library to choose the start LBA=
. Resize
++     * the last partition to consume over half of the disk, such that d=
uplicating
++     * it won't be possible.
++     */
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[TEST_DEFAU=
LT_NUM_PARTITIONS - 1]);
++    old_entry->end =3D TEST_GPT_THIRD_PARTITION_START + (TEST_DISK_NUM_=
BLOCKS / 2 ) + 1;
++    struct efi_guid_t old_guid =3D old_entry->guid;
++    setup_valid_gpt();
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t new_guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_duplicate_n=
o_copy(
++                &old_guid,
++                0,
++                &new_guid));
++}
++
++void test_gpt_entry_duplicate_no_copy_should_failWhenEntryNotExisting(v=
oid)
++{
++    setup_valid_gpt();
++    struct efi_guid_t old_guid =3D NULL_GUID;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t new_guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_duplicate_no_=
copy(
++                &old_guid,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                &new_guid));
++}
++
++void test_gpt_entry_duplicate_no_copy_should_failNewEntryOverlapping(vo=
id)
++{
++    setup_valid_gpt();
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++    struct efi_guid_t new_guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Since the disk is not fragmented by default, there are two test =
cases:
++     *   1. start in the middle of a partition and end in the middle of=
 a partition
++     *   2. start in the middle of a partition and end in free space
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_duplicate_n=
o_copy(
++                &old_guid,
++                TEST_GPT_FIRST_PARTITION_START + 1,
++                &new_guid));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_duplicate_n=
o_copy(
++                &old_guid,
++                TEST_GPT_THIRD_PARTITION_START + 1,
++                &new_guid));
++}
++
++void test_gpt_entry_duplicate_no_copy_should_failWhenTableFull(void)
++{
++    /* Start with a full array of entries */
++    const uint64_t new_entry_end =3D TEST_GPT_DISK_FREE_SPACE_START;
++    struct gpt_entry_t new_entry =3D {
++        .type =3D TEST_GPT_VALID_TYPE(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .start =3D new_entry_end,
++        .end =3D new_entry_end,
++        .attr =3D 0,
++        .guid =3D TEST_GPT_VALID_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11=
),
++        .name =3D "Fourth partition"
++    };
++    test_partition_array[TEST_MAX_PARTITIONS - 1] =3D new_entry;
++    setup_valid_gpt();
++
++    struct gpt_entry_t *old_entry =3D &(test_partition_array[0]);
++    struct efi_guid_t old_guid =3D old_entry->guid;
++    struct efi_guid_t new_guid;
++
++    /* Each entry will be read to find the entry to be duplicated. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INSUFFICIENT_STORAGE, gpt_entry_duplica=
te_no_copy(
++                &old_guid,
++                new_entry_end + 1,
++                &new_guid));
++}
++
+ void test_gpt_entry_create_should_createNewEntry(void)
+ {
+     /* Add an entry. It must not overlap with an existing entry and mus=
t also
+@@ -1282,6 +1429,128 @@ void test_gpt_entry_move_should_failWhenLbaOffDi=
sk(void)
+                 TEST_GPT_BACKUP_LBA + 1));
+ }
+=20
++void test_gpt_entry_move_no_copy_should_moveEntry(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[TEST_DEFA=
ULT_NUM_PARTITIONS - 1]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++
++    /* First all entries are read to determine for overlap */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Header update - reads partition array to calculate crc32 and als=
o then
++     * reads the header to modify and write back
++     */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    register_mocked_read(&test_header, sizeof(test_header));
++
++    /* Do a valid move and resize in one */
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_move_no_copy(
++                &test_guid,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                TEST_GPT_DISK_FREE_SPACE_START));
++}
++
++void test_gpt_entry_move_no_copy_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_move_no_copy(
++                &non_existing,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                TEST_GPT_DISK_FREE_SPACE_START));
++}
++
++void test_gpt_entry_move_no_copy_should_failWhenEndLessThanStart(void)
++{
++    setup_valid_gpt();
++
++    struct efi_guid_t test_guid =3D test_partition_array[0].guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_DISK_FREE_SPACE_START + 1,
++                TEST_GPT_DISK_FREE_SPACE_START));
++}
++
++void test_gpt_entry_move_no_copy_should_failWhenLbaOverlapping(void)
++{
++    setup_valid_gpt();
++
++    /* Try to move an entry. Each entry is read to determine for overla=
p */
++    size_t test_index =3D 1;
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[test_inde=
x]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Try to move the test entry into the middle of the entry just rea=
d.
++     * Starting at the same LBA
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_FIRST_PARTITION_START,
++                TEST_GPT_SECOND_PARTITION_END));
++
++    /* Try to move the test entry into the middle of the entry just rea=
d.
++     * Starting in the middle
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_FIRST_PARTITION_START + 1,
++                TEST_GPT_SECOND_PARTITION_END));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_SECOND_PARTITION_START,
++                TEST_GPT_THIRD_PARTITION_START));
++
++    /* Try to move the test entry into the middle of the entry just rea=
d.
++     * Starting and ending in the middle.
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_FIRST_PARTITION_START + 1,
++                TEST_GPT_FIRST_PARTITION_START + 1));
++}
++
++void test_gpt_entry_move_no_copy_should_failWhenLbaOffDisk(void)
++{
++    setup_valid_gpt();
++
++    /* Try to move an entry. */
++    size_t test_index =3D 1;
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[test_inde=
x]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++
++    /* First start on disk, then go off the disk */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_DISK_FREE_SPACE_START,
++                TEST_DISK_NUM_BLOCKS + 1));
++
++    /* Second, start off the disk entirely */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_DISK_NUM_BLOCKS + 1,
++                TEST_DISK_NUM_BLOCKS + 2));
++
++    /* Third, do the same but in the header area */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_PRIMARY_LBA,
++                TEST_GPT_DISK_FREE_SPACE_START + 1));
++
++    /* Fourth, start in the backup header area */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move_no_cop=
y(
++                &test_guid,
++                TEST_GPT_BACKUP_LBA,
++                TEST_GPT_BACKUP_LBA + 1));
++}
++
+ void test_gpt_attr_set_should_setAttributes(void)
+ {
+     /* Start with a populated GPT */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 2bfea84b..4a8ec99b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -82,6 +82,12 @@ SRC_URI:append:corstone1000 =3D " \
     file://0048-lib-gpt-Enforce-entry-size-of-128-bytes.patch \
     file://0049-lib-gpt-Ensure-block-size-complies-with-spec.patch \
     file://0050-lib-gpt-Expand-table-validation.patch \
+    file://0051-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.pat=
ch \
+    file://0052-lib-gpt-Provide-macro-identifying-free-space.patch \
+    file://0053-lib-gpt-Add-operation-to-duplicate-entries.patch \
+    file://0054-lib-gpt-Consecutively-erase-blocks-when-moving-parti.pat=
ch \
+    file://0055-lib-gpt-Clarify-API-operation.patch \
+    file://0056-lib-gpt-Add-metadata-only-API-operations.patch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

