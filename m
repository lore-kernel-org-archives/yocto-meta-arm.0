Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4A1FED3EA
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:38:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25306.1777045094481639254
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 08:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fdqRD2oP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57653358A;
	Fri, 24 Apr 2026 08:38:08 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.18.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD4D03F7B4;
	Fri, 24 Apr 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777045093; bh=RH7UIUhaEinv7fSL/1CT9MxOXStMGHDRK/j/NbGSFws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdqRD2oPu8HMbBCWjrHjDeooJeTZ9h2Kwj/AN1dKAUFUE8dV0T8AXOWve/+FYZDtH
	 PJPGhmTjurrFBcKUUZmLssGgritW+f9K8GUX6q1fyP5Cu104dsUp/dhrc4wXVytu7y
	 Ar4SOhPVy5Hvj3qjCr7xq3bCCSN1U6BwQhKbwjoc=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-m:cs1k: Add fixes for GPT library
Date: Fri, 24 Apr 2026 16:36:54 +0100
Message-ID: <20260424153656.774555-2-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424153656.774555-1-frazer.carsley@arm.com>
References: <20260424153656.774555-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Apr 2026 15:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7024

These patches backport bug fixes for the GPT library in TF-M.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...pt-Fix-final-entry-not-being-removed.patch | 114 ++++++
 ...lib-gpt-Replace-warnings-with-errors.patch |  37 ++
 ...-gpt-Enforce-entry-size-of-128-bytes.patch | 268 +++++++++++++
 ...Ensure-block-size-complies-with-spec.patch |  38 ++
 ...0050-lib-gpt-Expand-table-validation.patch | 352 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   5 +
 6 files changed, 814 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0046-lib-gpt-Fix-final-entry-not-being-removed.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0047-lib-gpt-Replace-warnings-with-errors.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0048-lib-gpt-Enforce-entry-size-of-128-bytes.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0049-lib-gpt-Ensure-block-size-complies-with-spec.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0050-lib-gpt-Expand-table-validation.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0046-lib-gpt-Fix-final-entry-not-being-removed.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0046-lib-gpt-Fix-final-en=
try-not-being-removed.patch
new file mode 100644
index 00000000..f7e7179d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0046=
-lib-gpt-Fix-final-entry-not-being-removed.patch
@@ -0,0 +1,114 @@
+From 4f11567a0152f1ecd98159ca555d8663ee8e5ce0 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 10 Apr 2026 17:20:39 +0100
+Subject: [PATCH] lib: gpt: Fix final entry not being removed
+
+The final entry would not be removed due to the removals being hidden
+behind a check on whether the removed entry was not the final entry,
+causing it to be a no-op. Removal operation is no longer hidden behind
+that condition.
+
+Change-Id: Ib264d988d57cb39098f2783c4a001fcf3b004270
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [f3cf6bda1534b8893620c7b7c0d9ff647b44603e]
+---
+ lib/gpt/src/gpt.c | 64 +++++++++++++++++++++++------------------------
+ 1 file changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index a9dbb918e..e4e7fde32 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -648,6 +648,7 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid)
+      * to be modified if the last entry in the array was moved or if it=
 is
+      * the only LBA used by the partition array
+      */
++    const uint64_t array_end_lba =3D partition_array_last_lba(&primary_=
gpt);;
+     if (cached_index !=3D primary_gpt.num_used_partitions - 1 ||
+             cached_index < gpt_entry_per_lba_count())
+     {
+@@ -669,7 +670,6 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid)
+          * Use a second buffer to read each consecutive LBA and copy th=
at to
+          * the global LBA buffer to then write afterwards.
+          */
+-        const uint64_t array_end_lba =3D partition_array_last_lba(&prim=
ary_gpt);
+         for (uint64_t i =3D partition_entry_lba(&primary_gpt, cached_in=
dex) + 1;
+                 i <=3D array_end_lba;
+                 ++i)
+@@ -705,45 +705,45 @@ psa_status_t gpt_entry_remove(const struct efi_gui=
d_t *guid)
+                     sizeof(array_buf) - primary_gpt.header.entry_size);
+             memcpy(lba_buf, array_buf, TFM_GPT_BLOCK_SIZE);
+         }
++    }
+=20
+-        /* What was the final LBA is now cached and may be empty or par=
tially-filled */
+-        cached_lba =3D array_end_lba;
+-        write_buffered =3D false;
+-        uint32_t entries_in_last_lba =3D (--primary_gpt.num_used_partit=
ions) % gpt_entry_per_lba_count();
+-        if (entries_in_last_lba =3D=3D 0) {
+-            /* There's nothing left in this LBA, so zero it all and wri=
te it out.
+-             * There is also no need to do an erase just to zero afterw=
ards.
+-             */
+-            memset(lba_buf, 0, TFM_GPT_BLOCK_SIZE);
+-            if (backup_gpt_array_lba !=3D 0) {
+-                int write_ret =3D plat_flash_driver->write(
+-                        backup_gpt_array_lba + array_end_lba - PRIMARY_=
GPT_ARRAY_LBA,
+-                        lba_buf);
+-                if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
+-                    return PSA_ERROR_STORAGE_FAILURE;
+-                }
+-            }
+-            int write_ret =3D plat_flash_driver->write(array_end_lba, l=
ba_buf);
++    /* What was the final LBA is now cached and may be empty or partial=
ly-filled */
++    cached_lba =3D array_end_lba;
++    write_buffered =3D false;
++    uint32_t entries_in_last_lba =3D (--primary_gpt.num_used_partitions=
) % gpt_entry_per_lba_count();
++    if (entries_in_last_lba =3D=3D 0) {
++        /* There's nothing left in this LBA, so zero it all and write i=
t out.
++         * There is also no need to do an erase just to zero afterwards=
.
++         */
++        memset(lba_buf, 0, TFM_GPT_BLOCK_SIZE);
++        if (backup_gpt_array_lba !=3D 0) {
++            int write_ret =3D plat_flash_driver->write(
++                    backup_gpt_array_lba + array_end_lba - PRIMARY_GPT_=
ARRAY_LBA,
++                    lba_buf);
+             if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
+                 return PSA_ERROR_STORAGE_FAILURE;
+             }
+-        } else {
+-            /* Zero what is not needed anymore */
+-            memset(
+-                    lba_buf + primary_gpt.header.entry_size * entries_i=
n_last_lba,
+-                    0,
+-                    (gpt_entry_per_lba_count() - entries_in_last_lba) *=
 primary_gpt.header.entry_size);
+-            if (backup_gpt_array_lba !=3D 0) {
+-                ret =3D write_to_flash(backup_gpt_array_lba + array_end=
_lba - PRIMARY_GPT_ARRAY_LBA);
+-                if (ret !=3D PSA_SUCCESS) {
+-                    return ret;
+-                }
+-            }
+-            ret =3D write_to_flash(array_end_lba);
++        }
++        int write_ret =3D plat_flash_driver->write(array_end_lba, lba_b=
uf);
++        if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
++    } else {
++        /* Zero what is not needed anymore */
++        memset(
++                lba_buf + primary_gpt.header.entry_size * entries_in_la=
st_lba,
++                0,
++                (gpt_entry_per_lba_count() - entries_in_last_lba) * pri=
mary_gpt.header.entry_size);
++        if (backup_gpt_array_lba !=3D 0) {
++            ret =3D write_to_flash(backup_gpt_array_lba + array_end_lba=
 - PRIMARY_GPT_ARRAY_LBA);
+             if (ret !=3D PSA_SUCCESS) {
+                 return ret;
+             }
+         }
++        ret =3D write_to_flash(array_end_lba);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
+     }
+=20
+     /* Update the header after flash changes */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0047-lib-gpt-Replace-warnings-with-errors.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0047-lib-gpt-Replace-warnings-=
with-errors.patch
new file mode 100644
index 00000000..93b1fb3f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0047=
-lib-gpt-Replace-warnings-with-errors.patch
@@ -0,0 +1,37 @@
+From 68874e58811c5d4004492f15b3ac46d2cca186c0 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Thu, 16 Apr 2026 09:54:55 +0100
+Subject: [PATCH] lib: gpt: Replace warnings with errors
+
+These warnings return errors, so it makes more sense to output an error
+message.
+
+Change-Id: I589e24ba8aba2502a3fc86d2aeb648d125c022bd
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [68874e58811c5d4004492f15b3ac46d2cca186c0]
+---
+ lib/gpt/src/gpt.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 16bda8aba..32c7277bd 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -830,7 +830,7 @@ psa_status_t gpt_defragment(void)
+      */
+     psa_status_t ret =3D sort_partition_array(&primary_gpt);
+     if (ret !=3D PSA_SUCCESS) {
+-        WARN("Unable to defragment flash!\n");
++        ERROR("Unable to defragment flash!\n");
+         return ret;
+     }
+=20
+@@ -926,7 +926,7 @@ psa_status_t gpt_init(struct gpt_flash_driver_t *fla=
sh_driver, uint64_t max_part
+     if (mbr.partitions[0].os_type =3D=3D MBR_TYPE_GPT) {
+         ret =3D read_table_from_flash(&primary_gpt, true);
+     } else {
+-        WARN("Unsupported legacy MBR in use\n");
++        ERROR("Unsupported legacy MBR in use\n");
+         ret =3D PSA_ERROR_NOT_SUPPORTED;
+     }
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0048-lib-gpt-Enforce-entry-size-of-128-bytes.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0048-lib-gpt-Enforce-entry-=
size-of-128-bytes.patch
new file mode 100644
index 00000000..4cba9e32
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0048=
-lib-gpt-Enforce-entry-size-of-128-bytes.patch
@@ -0,0 +1,268 @@
+From ff08a9d998c545a6152789f8ce55bd4200a937cf Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 15 Apr 2026 10:59:28 +0100
+Subject: [PATCH] lib: gpt: Enforce entry size of 128 bytes
+
+Previous to this, the entry size could have been set to any number, even
+those deemed illegal by the UEFI spec 2.10 [1], as the library did not
+validate it. 128 bytes is the minimum size for a partition entry and
+most standard tools that create GPTs will use this.
+
+[1] https://uefi.org/specs/UEFI/2.10/05_GUID_Partition_Table_Format.html
+
+Change-Id: Ib6c436353a4b8e00e6c6e63b933a49f11c0a7340
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [ff08a9d998c545a6152789f8ce55bd4200a937cf]
+---
+ lib/gpt/inc/gpt.h                |  2 +
+ lib/gpt/src/gpt.c                | 65 +++++++++++++++++++++-----------
+ lib/gpt/unittests/gpt/test_gpt.c | 40 ++++++++++++++++++++
+ 3 files changed, 85 insertions(+), 22 deletions(-)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index baf4767f9..34ce67580 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -214,6 +214,7 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid);
+  *
+  * \retval PSA_SUCCESS GPT is valid.
+  * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_NOT_SUPPORTED Entry size is not 128 bytes
+  * \retval PSA_ERROR_INVALID_SIGNATURE GPT is invalid.
+  */
+ psa_status_t gpt_validate(bool is_primary);
+@@ -249,6 +250,7 @@ psa_status_t gpt_defragment(void);
+  *                                    functions defined by \p flash_dri=
ver is NULL. The init
+  *                                    and uninit functions may be NULL =
if not required.
+  * \retval PSA_ERROR_NOT_SUPPORTED Legacy MBR is used and not GPT.
++ * \retval PSA_ERROR_NOT_SUPPORTED Entry size is not 128 bytes
+  */
+ __attribute__((nonnull(1)))
+ psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver,
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 32c7277bd..200e21599 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -459,7 +459,7 @@ psa_status_t gpt_entry_move(const struct efi_guid_t =
*guid,
+=20
+     /* Cached LBA */
+     for (uint32_t i =3D 0; i < num_entries_in_cached_lba; ++i) {
+-        memcpy(&entry, lba_buf + (i * primary_gpt.header.entry_size), G=
PT_ENTRY_SIZE);
++        memcpy(&entry, lba_buf + (i * GPT_ENTRY_SIZE), GPT_ENTRY_SIZE);
+=20
+         const struct efi_guid_t ent_guid =3D entry.unique_guid;
+         if (efi_guid_cmp(&ent_guid, guid) =3D=3D 0) {
+@@ -658,9 +658,9 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid)
+         const uint32_t lba_index =3D cached_index % gpt_entry_per_lba_c=
ount();
+         if (lba_index + 1 !=3D gpt_entry_per_lba_count()) {
+             memmove(
+-                    lba_buf + lba_index * primary_gpt.header.entry_size=
,
+-                    lba_buf + (lba_index + 1) * primary_gpt.header.entr=
y_size,
+-                    (gpt_entry_per_lba_count() - lba_index - 1) * prima=
ry_gpt.header.entry_size);
++                    lba_buf + lba_index * GPT_ENTRY_SIZE,
++                    lba_buf + (lba_index + 1) * GPT_ENTRY_SIZE,
++                    (gpt_entry_per_lba_count() - lba_index - 1) * GPT_E=
NTRY_SIZE);
+         }
+=20
+         /* If this is not the last LBA, then read the next LBA into mem=
ory and
+@@ -683,7 +683,7 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid)
+             }
+=20
+             memcpy(
+-                    lba_buf + primary_gpt.header.entry_size * (gpt_entr=
y_per_lba_count() - 1),
++                    lba_buf + GPT_ENTRY_SIZE * (gpt_entry_per_lba_count=
() - 1),
+                     array_buf,
+                     GPT_ENTRY_SIZE);
+=20
+@@ -701,8 +701,8 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid)
+=20
+             memmove(
+                     array_buf,
+-                    array_buf + primary_gpt.header.entry_size,
+-                    sizeof(array_buf) - primary_gpt.header.entry_size);
++                    array_buf + GPT_ENTRY_SIZE,
++                    sizeof(array_buf) - GPT_ENTRY_SIZE);
+             memcpy(lba_buf, array_buf, TFM_GPT_BLOCK_SIZE);
+         }
+     }
+@@ -731,9 +731,9 @@ psa_status_t gpt_entry_remove(const struct efi_guid_=
t *guid)
+     } else {
+         /* Zero what is not needed anymore */
+         memset(
+-                lba_buf + primary_gpt.header.entry_size * entries_in_la=
st_lba,
++                lba_buf + GPT_ENTRY_SIZE * entries_in_last_lba,
+                 0,
+-                (gpt_entry_per_lba_count() - entries_in_last_lba) * pri=
mary_gpt.header.entry_size);
++                (gpt_entry_per_lba_count() - entries_in_last_lba) * GPT=
_ENTRY_SIZE);
+         if (backup_gpt_array_lba !=3D 0) {
+             ret =3D write_to_flash(backup_gpt_array_lba + array_end_lba=
 - PRIMARY_GPT_ARRAY_LBA);
+             if (ret !=3D PSA_SUCCESS) {
+@@ -934,6 +934,14 @@ psa_status_t gpt_init(struct gpt_flash_driver_t *fl=
ash_driver, uint64_t max_part
+         goto fail_load;
+     }
+=20
++    /* Ensure entry size is supported. */
++    if (primary_gpt.header.entry_size !=3D GPT_ENTRY_SIZE) {
++        ERROR("Unsupported entry size 0x%08x, must be 0x%08x\n",
++                primary_gpt.header.entry_size, GPT_ENTRY_SIZE);
++        ret =3D PSA_ERROR_NOT_SUPPORTED;
++        goto fail_load;
++    }
++
+     /* Count the number of used entries, assuming the array is not spar=
ese */
+     ret =3D count_used_partitions(&primary_gpt, &primary_gpt.num_used_p=
artitions);
+     if (ret !=3D PSA_SUCCESS) {
+@@ -948,6 +956,12 @@ psa_status_t gpt_init(struct gpt_flash_driver_t *fl=
ash_driver, uint64_t max_part
+         if (ret !=3D PSA_SUCCESS) {
+             goto fail_load;
+         }
++        if (backup_gpt.header.entry_size !=3D GPT_ENTRY_SIZE) {
++            ERROR("Unsupported entry size 0x%08x, must be 0x%08x\n",
++                    backup_gpt.header.entry_size, GPT_ENTRY_SIZE);
++            ret =3D PSA_ERROR_NOT_SUPPORTED;
++            goto fail_load;
++        }
+         backup_gpt_array_lba =3D backup_gpt.header.array_lba;
+     } else {
+         WARN("Backup GPT location is unknown!\n");
+@@ -999,11 +1013,7 @@ psa_status_t gpt_uninit(void)
+ /* Returns the number of partition entries in each LBA */
+ static inline uint64_t gpt_entry_per_lba_count(void)
+ {
+-    static uint64_t num_entries =3D 0;
+-    if (num_entries =3D=3D 0) {
+-        num_entries =3D TFM_GPT_BLOCK_SIZE / primary_gpt.header.entry_s=
ize;
+-    }
+-    return num_entries;
++    return TFM_GPT_BLOCK_SIZE / GPT_ENTRY_SIZE;
+ }
+=20
+ /* Copies information from the entry to the user visible structure */
+@@ -1129,15 +1139,15 @@ static psa_status_t update_header(uint32_t num_p=
artitions)
+     /* Take the CRC of the partition array */
+     uint32_t crc =3D 0;
+     for (uint32_t i =3D 0; i < header->num_partitions; ++i) {
+-        uint8_t entry_buf[header->entry_size];
+-        memset(entry_buf, 0, header->entry_size);
++        uint8_t entry_buf[GPT_ENTRY_SIZE];
++        memset(entry_buf, 0, GPT_ENTRY_SIZE);
+         struct gpt_entry_t *entry =3D (struct gpt_entry_t *)entry_buf;
+=20
+         psa_status_t ret =3D read_entry_from_flash(&primary_gpt, i, ent=
ry);
+         if (ret !=3D PSA_SUCCESS) {
+             return ret;
+         }
+-        crc =3D efi_soft_crc32_update(crc, entry_buf, header->entry_siz=
e);
++        crc =3D efi_soft_crc32_update(crc, entry_buf, GPT_ENTRY_SIZE);
+     }
+     header->array_crc =3D crc;
+=20
+@@ -1268,7 +1278,7 @@ static psa_status_t read_entry_from_flash(const st=
ruct gpt_t *table,
+=20
+     memcpy(
+             entry,
+-            lba_buf + ((array_index % gpt_entry_per_lba_count()) * tabl=
e->header.entry_size),
++            lba_buf + ((array_index % gpt_entry_per_lba_count()) * GPT_=
ENTRY_SIZE),
+             GPT_ENTRY_SIZE);
+=20
+     return PSA_SUCCESS;
+@@ -1415,7 +1425,7 @@ static psa_status_t write_entry(uint32_t          =
        array_index,
+=20
+     /* Copy into buffer */
+     uint32_t index_in_lba =3D array_index % gpt_entry_per_lba_count();
+-    memcpy(lba_buf + index_in_lba * primary_gpt.header.entry_size, entr=
y, GPT_ENTRY_SIZE);
++    memcpy(lba_buf + index_in_lba * GPT_ENTRY_SIZE, entry, GPT_ENTRY_SI=
ZE);
+=20
+     /* Write on every nth operation. */
+     if (++num_writes =3D=3D gpt_entry_per_lba_count()) {
+@@ -1519,18 +1529,29 @@ static psa_status_t validate_table(struct gpt_t =
*table, bool is_primary)
+         return PSA_ERROR_INVALID_SIGNATURE;
+     }
+=20
++    /* Check the entry size. This is not a part of the spec but ensures=
 the
++     * library only supports entry sizes equal to 128. Otherwise, the b=
ackup
++     * could be used to restore the primary with an entry size that is =
different
++     * and break that assumption, or vise-versa
++     */
++    if (header->entry_size !=3D GPT_ENTRY_SIZE) {
++        ERROR("Unsupported entry size 0x%08x, must be 0x%08x\n",
++                header->entry_size, GPT_ENTRY_SIZE);
++        return PSA_ERROR_NOT_SUPPORTED;
++    }
++
+     /* Check the CRC of the partition array */
+     calc_crc =3D 0;
+     for (uint32_t i =3D 0; i < header->num_partitions; ++i) {
+-        uint8_t entry_buf[header->entry_size];
+-        memset(entry_buf, 0, header->entry_size);
++        uint8_t entry_buf[GPT_ENTRY_SIZE];
++        memset(entry_buf, 0, GPT_ENTRY_SIZE);
+         struct gpt_entry_t *entry =3D (struct gpt_entry_t *)entry_buf;
+=20
+         psa_status_t ret =3D read_entry_from_flash(table, i, entry);
+         if (ret !=3D PSA_SUCCESS) {
+             return ret;
+         }
+-        calc_crc =3D efi_soft_crc32_update(calc_crc, (uint8_t *)entry, =
header->entry_size);
++        calc_crc =3D efi_soft_crc32_update(calc_crc, (uint8_t *)entry, =
GPT_ENTRY_SIZE);
+     }
+=20
+     if (calc_crc !=3D header->array_crc) {
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 2f05a6b4a..db897b967 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -351,6 +351,30 @@ void test_gpt_init_should_failWhenMbrTypeInvalid(vo=
id)
+     TEST_ASSERT_EQUAL(PSA_ERROR_NOT_SUPPORTED, setup_test_gpt());
+ }
+=20
++void test_gpt_init_should_failWhenEntrySizeBad(void)
++{
++    test_header.entry_size--;
++    /* Expect first a valid MBR read */
++    register_mocked_read(&test_mbr, sizeof(test_mbr));
++
++    /* Expect a GPT header read second */
++    register_mocked_read(&test_header, sizeof(test_header));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_NOT_SUPPORTED, gpt_init(&mock_driver, T=
EST_MAX_PARTITIONS));
++    test_header.entry_size =3D default_header.entry_size;
++
++    /* Now do the backup. */
++    register_mocked_read(&test_mbr, sizeof(test_mbr));
++    register_mocked_read(&test_header, sizeof(test_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Expect fourth the backup to be read. Make the entry size bad */
++    test_header.entry_size =3D 0;
++    setup_backup_gpt();
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_NOT_SUPPORTED, gpt_init(&mock_driver, T=
EST_MAX_PARTITIONS));
++}
++
+ void test_gpt_init_should_failWhenFlashDriverNotFullyDefined(void)
+ {
+     gpt_flash_read_t read_fn =3D mock_driver.read;
+@@ -433,6 +457,22 @@ void test_gpt_validate_should_failWhenLbaPointerBad=
(void)
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
+ }
+=20
++void test_gpt_validate_should_failWhenBackupEntrySizeInvalid(void)
++{
++    /* The entry size for the primary GPT is validated on gpt_init and =
kept
++     * in memory. Therefore, the entry size can only be validated on gp=
t_validate
++     * for the backup table, which is read
++     */
++    setup_test_gpt();
++    struct gpt_header_t backup_header;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    backup_header.entry_size--;
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_NOT_SUPPORTED, gpt_validate(false));
++}
++
+ void test_gpt_validate_should_failWhenArrayCrcBad(void)
+ {
+     test_header.array_crc--;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0049-lib-gpt-Ensure-block-size-complies-with-spec.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0049-lib-gpt-Ensure-bl=
ock-size-complies-with-spec.patch
new file mode 100644
index 00000000..d2258fba
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0049=
-lib-gpt-Ensure-block-size-complies-with-spec.patch
@@ -0,0 +1,38 @@
+From c07da31be4551ee9b3ce546a1f6adccb19bc3b59 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 15 Apr 2026 11:17:25 +0100
+Subject: [PATCH] lib: gpt: Ensure block size complies with spec
+
+The UEFI spec 2.10 [1] implicitly requires a block size of at least 512
+in order to fit a legacy Master Boot Record.
+
+[1] https://uefi.org/specs/UEFI/2.10/05_GUID_Partition_Table_Format.html=
#legacy-master-boot-record-mbr
+
+Change-Id: I8218ef3d883b51d8fa14835e0ed884139fdebc7d
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [c07da31be4551ee9b3ce546a1f6adccb19bc3b59]
+---
+ lib/gpt/src/gpt.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 200e21599..cda9fe358 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -20,11 +20,15 @@
+ #include "efi_soft_crc.h"
+=20
+ /* This needs to be defined by the platform and is used by the GPT libr=
ary as
+- * the number of bytes in a Logical Block Address (LBA)
++ * the number of bytes in a Logical Block Address (LBA). It also must b=
e at least
++ * 512.
+  */
+ #ifndef TFM_GPT_BLOCK_SIZE
+ #error "TFM_GPT_BLOCK_SIZE must be defined if using GPT library!"
+ #endif
++#if TFM_GPT_BLOCK_SIZE < 512
++#error "TFM_GPT_BLOCK_SIZE must be at least 512!"
++#endif
+=20
+ /* Where Master Boot Record (MBR) is on flash */
+ #define MBR_LBA 0ULL
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0050-lib-gpt-Expand-table-validation.patch b/meta-arm-bsp/recipes-bsp/=
trusted-firmware-m/files/corstone1000/0050-lib-gpt-Expand-table-validatio=
n.patch
new file mode 100644
index 00000000..aefd898b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0050=
-lib-gpt-Expand-table-validation.patch
@@ -0,0 +1,352 @@
+From bcce0ce881817b36ad52df550bcbf41b4f0d4938 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 15 Apr 2026 15:09:03 +0100
+Subject: [PATCH] lib: gpt: Expand table validation
+
+It is implied by the UEFI spec 2.10 [1] that the backup GPT must be
+located at the end of storage. To this effect, ensure that it is the
+largest known LBA value.
+
+Additionally, it is also implied that the partition entry arrays, both
+primary and backup, must be before or after usable space respectively.
+
+[1] https://uefi.org/specs/UEFI/2.10/05_GUID_Partition_Table_Format.html
+
+Change-Id: I5042836822f990a21fbf48b19422879384a844aa
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [bcce0ce881817b36ad52df550bcbf41b4f0d4938]
+---
+ lib/gpt/src/gpt.c                | 115 ++++++++++++++++++++
+ lib/gpt/unittests/gpt/test_gpt.c | 179 +++++++++++++++++++++++++++++++
+ 2 files changed, 294 insertions(+)
+
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index cda9fe358..0335befa7 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -229,6 +229,12 @@ static psa_status_t mbr_load(struct mbr_t *mbr);
+ static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid);
+ static bool gpt_entry_cmp_name(const struct gpt_entry_t *entry, const v=
oid *name);
+ static bool gpt_entry_cmp_type(const struct gpt_entry_t *entry, const v=
oid *type);
++static psa_status_t validate_backup_gpt_lba(const uint64_t backup_lba,
++                                            const uint64_t primary_lba,
++                                            const uint64_t partition_ar=
ray_end,
++                                            const struct gpt_header_t *=
header);
++static psa_status_t validate_array_lba(const uint64_t partition_array_e=
nd,
++                                       const uint64_t usable_lba_start)=
;
+ static psa_status_t validate_table(struct gpt_t *table, bool is_primary=
);
+ static psa_status_t restore_table(struct gpt_t *restore_from, bool is_p=
rimary);
+ static psa_status_t sort_partition_array(const struct gpt_t *table);
+@@ -1498,6 +1504,73 @@ static inline void swap_headers(const struct gpt_=
header_t *src, struct gpt_heade
+             primary_gpt.header.array_lba);
+ }
+=20
++/* Validate that the backup GPT LBA is greater than all other LBAs in t=
he header
++ */
++static psa_status_t validate_backup_gpt_lba(const uint64_t backup_lba,
++                                            const uint64_t primary_lba,
++                                            const uint64_t partition_ar=
ray_end,
++                                            const struct gpt_header_t *=
header)
++{
++    if (backup_lba <=3D primary_lba) {
++        ERROR("Backup LBA (0x%08x%08x) must be final LBA on flash, "
++              "primary LBA at 0x%08x%08x\n",
++              (uint32_t)(backup_lba >> 32),
++              (uint32_t)(backup_lba),
++              (uint32_t)(primary_lba >> 32),
++              (uint32_t)(primary_lba));
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    if (backup_lba <=3D header->first_lba) {
++        ERROR("Backup LBA (0x%08x%08x) must be final LBA on flash, "
++              "first usable LBA at 0x%08x%08x\n",
++              (uint32_t)(backup_lba >> 32),
++              (uint32_t)(backup_lba),
++              (uint32_t)(header->first_lba >> 32),
++              (uint32_t)(header->first_lba));
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    if (backup_lba <=3D header->last_lba) {
++        ERROR("Backup LBA (0x%08x%08x) must be final LBA on flash, "
++              "last usable LBA at 0x%08x%08x\n",
++              (uint32_t)(backup_lba >> 32),
++              (uint32_t)(backup_lba),
++              (uint32_t)(header->last_lba >> 32),
++              (uint32_t)(header->last_lba));
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    if (backup_lba <=3D partition_array_end) {
++        ERROR("Backup LBA (0x%08x%08x) must be final LBA on flash, "
++              "partition array ends at LBA at 0x%08x%08x\n",
++              (uint32_t)(backup_lba >> 32),
++              (uint32_t)(backup_lba),
++              (uint32_t)(partition_array_end >> 32),
++              (uint32_t)(partition_array_end));
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Validate partition array is outside the area of usable flash */
++static psa_status_t validate_array_lba(const uint64_t partition_array_e=
nd,
++                                       const uint64_t usable_lba_start)
++{
++    if (partition_array_end >=3D usable_lba_start) {
++        ERROR("GPT partition array must not be in usable space: "
++              "0x%08x%08x >=3D 0x%08x%08x\n",
++              (uint32_t)(partition_array_end >> 32),
++              (uint32_t)partition_array_end,
++              (uint32_t)(usable_lba_start >> 32),
++              (uint32_t)usable_lba_start);
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    return PSA_SUCCESS;
++}
++
+ /* Validates a specific GPT. */
+ static psa_status_t validate_table(struct gpt_t *table, bool is_primary=
)
+ {
+@@ -1564,6 +1637,48 @@ static psa_status_t validate_table(struct gpt_t *=
table, bool is_primary)
+         return PSA_ERROR_INVALID_SIGNATURE;
+     }
+=20
++    /* Check the backup LBA is greater than all other LBAs. Check also
++     * the partition array cannot be overritten by data by ensuring
++     * that it is not between the first and last usable LBAs
++     */
++    if (is_primary) {
++        psa_status_t ret =3D validate_backup_gpt_lba(
++                header->backup_lba,
++                header->current_lba,
++                partition_entry_lba(table, header->num_partitions - 1),
++                header);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        /* Go to the final LBA of the partition array, including unused=
 entries */
++        ret =3D validate_array_lba(
++                partition_entry_lba(table, header->num_partitions - 1),
++                header->first_lba);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++    } else {
++        psa_status_t ret =3D validate_backup_gpt_lba(
++                header->current_lba,
++                header->backup_lba,
++                partition_entry_lba(table, header->num_partitions - 1),
++                header);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        /* To flip the condition, negate the parameters passed: it beco=
mes
++         * -array_lba >=3D -last_lba (equivalent to) array_lba < last_l=
ba
++         * (equivalent to) last_lba >=3D array_lba. This is because the=
 backup array is
++         * after the last_lba
++         */
++        ret =3D validate_array_lba(~(header->array_lba), ~(header->last=
_lba));
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++    }
++
+     if (is_primary) {
+         /* Any time the primary table is considered valid, cache the ba=
ckup
+          * LBA field
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index db897b967..bd161ec74 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -493,6 +493,185 @@ void test_gpt_validate_should_failWhenArrayCrcBad(=
void)
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
+ }
+=20
++void test_gpt_validate_should_failWhenBackupLbaNotAtEndOfDisk(void)
++{
++    /* First test when the backup lba is before usable disk */
++    test_header.backup_lba =3D test_header.first_lba - 1;
++    setup_test_gpt();
++
++    /* Each entry will be read in order to check the partition array CR=
C */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Then test when the backup is before in usable disk space */
++    test_header.backup_lba =3D test_header.first_lba;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    test_header.backup_lba =3D test_header.first_lba + 1;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    test_header.backup_lba =3D test_header.last_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    test_header.backup_lba =3D test_header.last_lba;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Finally, test when the backup is before the end of the partition=
 entry array */
++    test_header.backup_lba =3D test_header.array_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* For this scenario, manually setup the backup header so that the =
array LBA
++     * (also the backup header LBA) is valid on init and can then be va=
lidated
++     * with gpt_validate
++     */
++    test_header.backup_lba =3D test_header.array_lba;
++
++    /* Expect first a valid MBR read */
++    register_mocked_read(&test_mbr, sizeof(test_mbr));
++
++    /* Expect a GPT header read second */
++    register_mocked_read(&test_header, sizeof(test_header));
++
++    /* Expect third each partition is read to find the number in use. T=
his is
++     * also the backup header, which will be cached
++     */
++    setup_backup_gpt();
++
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_init(&mock_driver, TEST_MAX_PART=
ITIONS));
++
++    /* Backup partition array read for crc */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Now do the backup gpt header */
++    struct gpt_header_t backup_header;
++    test_header.backup_lba =3D test_header.first_lba - 1;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    test_header.backup_lba =3D backup_header.first_lba;
++    backup_header.current_lba =3D backup_header.first_lba;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    test_header.backup_lba =3D backup_header.first_lba + 1;
++    backup_header.current_lba =3D backup_header.first_lba + 1;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    test_header.backup_lba =3D backup_header.last_lba - 1;
++    backup_header.current_lba =3D backup_header.last_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    test_header.backup_lba =3D backup_header.last_lba;
++    backup_header.current_lba =3D backup_header.last_lba;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    test_header.backup_lba =3D backup_header.array_lba - 1;
++    backup_header.current_lba =3D backup_header.array_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    test_header.backup_lba =3D backup_header.array_lba;
++    backup_header.current_lba =3D backup_header.array_lba;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++}
++
++void test_gpt_validate_should_failWhenPartitionArrayInUsableDiskSpace(v=
oid)
++{
++    /* First test when the primary partition array is in usable disk sp=
ace */
++    test_header.array_lba =3D test_header.first_lba;
++    setup_test_gpt();
++
++    /* Each entry will be read in order to check the partition array CR=
C */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    test_header.array_lba =3D test_header.first_lba + 1;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    test_header.array_lba =3D test_header.last_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    test_header.array_lba =3D test_header.last_lba;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Then test when the primary partition array is after usable disk =
space */
++    test_header.array_lba =3D test_header.last_lba + 1;
++    setup_test_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Now do the backup gpt header, ensuring it is always after usable=
 space */
++    struct gpt_header_t backup_header;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++
++    backup_header.array_lba =3D test_header.first_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    /* Then test that the backup partition array is after usable disk s=
pace */
++    backup_header.array_lba =3D test_header.first_lba;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    backup_header.array_lba =3D test_header.first_lba + 1;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    backup_header.array_lba =3D test_header.last_lba - 1;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++
++    backup_header.array_lba =3D test_header.last_lba;
++    setup_test_gpt();
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++}
++
+ void test_gpt_restore_should_restorePrimaryFromBackup(void)
+ {
+     /* Start with a valid GPT */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 55f48a3c..2bfea84b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -77,6 +77,11 @@ SRC_URI:append:corstone1000 =3D " \
     file://0043-plat-cs1k-Create-and-remove-FWU-image-partitions.patch \
     file://0044-plat-cs1k-Derive-host-base-addresses-from-offsets.patch =
\
     file://0045-plat-cs1k-Drive-NPU-via-external-system-reset-contro.pat=
ch \
+    file://0046-lib-gpt-Fix-final-entry-not-being-removed.patch \
+    file://0047-lib-gpt-Replace-warnings-with-errors.patch \
+    file://0048-lib-gpt-Enforce-entry-size-of-128-bytes.patch \
+    file://0049-lib-gpt-Ensure-block-size-complies-with-spec.patch \
+    file://0050-lib-gpt-Expand-table-validation.patch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

