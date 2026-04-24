Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296E4FED3E9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:38:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25734.1777045096772931335
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 08:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=F1jSHulL;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD58C358D;
	Fri, 24 Apr 2026 08:38:10 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.18.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939A73F7B4;
	Fri, 24 Apr 2026 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777045096; bh=6fnzVeUgBkxHvUripBXif+wg/0GrDBpvCONjpjH1otE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1jSHulLJ20+mILV5mKPShaqQOVrJmIgqLiDXis6RwIJgb2B1VYk4YwBbwd40ha5o
	 hVFTC9NajPutmmlNekxPGJpX8z1cAkQMRekwSRx90XFLR9kwk0JoLLpVZUXotkYms9
	 8sPPLcx6geC2D3aTqVXhFIOB7Fle6rSrnNNw5Ii0=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-m:cs1k: Use new GPT duplicate functionality
Date: Fri, 24 Apr 2026 16:36:56 +0100
Message-ID: <20260424153656.774555-4-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424153656.774555-1-frazer.carsley@arm.com>
References: <20260424153656.774555-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Apr 2026 15:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7026

Uses the new GPT duplicate operation during a firmware update. This also
adds flash erase protections so that the operation is not too slow and
erasing flash multiple times redundantly.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...plat-cs1k-Add-flash-erase-protection.patch |  98 ++++++++
 ...-unused-FWU-partitions-upon-version-.patch | 153 ++++++++++++
 ...lat-cs1k-Duplicate-old-images-in-FWU.patch | 217 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   3 +
 4 files changed, 471 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0057-plat-cs1k-Add-flash-erase-protection.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0058-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0059-plat-cs1k-Duplicate-old-images-in-FWU.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0057-plat-cs1k-Add-flash-erase-protection.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0057-plat-cs1k-Add-flash-erase=
-protection.patch
new file mode 100644
index 00000000..3bca1d90
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0057=
-plat-cs1k-Add-flash-erase-protection.patch
@@ -0,0 +1,98 @@
+From 60277832aa6d4a205a5b1180f0513de0eb7c84c6 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Tue, 17 Mar 2026 11:05:45 +0000
+Subject: [PATCH] plat: cs1k: Add flash erase protection
+
+The GPT library deals in blocks, whereas flash deals in sectors. On
+cs1k, eight blocks make up a sector. So, when the GPT library requests a
+block erase from the platform driver, it actually erases the entire
+sector, and then rewrites the data that was there for the blocks that
+weren't being erased.
+
+This means that if all eight blocks in a sector were erased in a row,
+then the same sector would be erased eight times, which is both slow and
+also redundant, wearing out the flash device without need. These
+protections prevent flash erasure if the data is already equal to the
+erased value.
+
+Change-Id: Id8efe515647f45ac8e65cc95ef1bf58f9160aca2
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50259/1]
+---
+ .../ext/target/arm/corstone1000/io/io_gpt.c   | 42 +++++++++++++++++--
+ 1 file changed, 39 insertions(+), 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/io/io_gpt.c b/platform=
/ext/target/arm/corstone1000/io/io_gpt.c
+index 513c77016..f7c3d79d2 100644
+--- a/platform/ext/target/arm/corstone1000/io/io_gpt.c
++++ b/platform/ext/target/arm/corstone1000/io/io_gpt.c
+@@ -53,6 +53,32 @@ static uint8_t sector_buf[FLASH_SECTOR_SIZE];
+ /* From io_gpt.h - the driver given to the GPT library */
+ struct gpt_flash_driver_t io_gpt_flash_driver =3D {0};
+=20
++/* Read the bytes that need to be erased. If they are already erased_va=
lue,
++ * report that an erase is not required. This is to reduce the number o=
f flash
++ * erase cyles. If the read fails in any way, report erase required.
++ */
++static bool erase_required(uint32_t erase_addr,
++                           size_t   num_bytes)
++{
++    if (num_bytes > FLASH_SECTOR_SIZE) {
++        return true;
++    }
++
++    int32_t ret =3D flash_driver->ReadData(erase_addr, sector_buf, num_=
bytes);
++    if (ret < 0 || (uint32_t)ret !=3D num_bytes) {
++        return true;
++    }
++
++    uint8_t erased_value =3D flash_driver->GetInfo()->erased_value;
++    for (size_t offset =3D 0; offset < num_bytes; ++offset) {
++        if (sector_buf[offset] !=3D erased_value) {
++            return true;
++        }
++    }
++
++    return false;
++}
++
+ /* Erases TFM_GPT_BLOCK_SIZE bytes from offset within the sector beginn=
ing at
+  * sector_addr. This is done via a read-erase-write pattern whereby dat=
a is read,
+  * the sector is erased, and data written back to the parts of the sect=
or that
+@@ -61,6 +87,10 @@ struct gpt_flash_driver_t io_gpt_flash_driver =3D {0}=
;
+ static gpt_flash_err_t partially_erase_sector(uint32_t sector_addr,
+                                               uint32_t offset)
+ {
++    if (!erase_required(sector_addr + offset, TFM_GPT_BLOCK_SIZE)) {
++        return GPT_FLASH_SUCCESS;
++    }
++
+     if (flash_driver->ReadData(
+                 sector_addr,
+                 sector_buf,
+@@ -139,6 +169,10 @@ static ssize_t flash_erase(uint64_t lba, size_t num=
_blocks)
+=20
+     /* Whole sector erases until last sector */
+     for (size_t i =3D 0; i < num_sectors - 1; ++i) {
++        if (!erase_required(erase_addr + i * FLASH_SECTOR_SIZE, FLASH_S=
ECTOR_SIZE)) {
++            continue;
++        }
++
+         int32_t ret =3D flash_driver->EraseSector(erase_addr + i * FLAS=
H_SECTOR_SIZE);
+         if (ret !=3D ARM_DRIVER_OK) {
+             return i;
+@@ -146,9 +180,11 @@ static ssize_t flash_erase(uint64_t lba, size_t num=
_blocks)
+     }
+=20
+     if (num_blocks % LBAS_PER_SECTOR =3D=3D 0 && lba % LBAS_PER_SECTOR =
=3D=3D 0) {
+-        /* Fully erase final sector */
+-        if (flash_driver->EraseSector(last_erase_addr) !=3D ARM_DRIVER_=
OK) {
+-            return (num_sectors - 1) * LBAS_PER_SECTOR;
++        /* Fully erase final sector if required */
++        if (erase_required(last_erase_addr, FLASH_SECTOR_SIZE)) {
++            if (flash_driver->EraseSector(last_erase_addr) !=3D ARM_DRI=
VER_OK) {
++                return (num_sectors - 1) * LBAS_PER_SECTOR;
++            }
+         }
+     } else {
+         /* Partial erase of final sector */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0058-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0058-plat-cs1k=
-Remove-unused-FWU-partitions-upon-version-.patch
new file mode 100644
index 00000000..69719044
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0058=
-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch
@@ -0,0 +1,153 @@
+From 281f6799d6de19e63cbcf175ad848b8c8f2cc220 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 10 Apr 2026 17:15:36 +0100
+Subject: [PATCH] plat: cs1k: Remove unused FWU partitions upon version
+ rejection
+
+If a firmware update (FWU) is attempted and the version of any image is
+lower or equal to the current version, the entire capsule is rejected
+and the previous bank used to continue booting. The partitions created
+during staging for the to-be images therefore can be removed and the
+space free'd up.
+
+Change-Id: I9b74c2ed5efee938c14dbdd0380d8d094e71c10e
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50260/1]
+---
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 108 ++++++++++++------
+ 1 file changed, 75 insertions(+), 33 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index d85590c71..557e48d07 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -1105,6 +1105,54 @@ static psa_status_t erase_image(uint32_t image_of=
fset, uint32_t image_size)
+     return PSA_SUCCESS;
+ }
+=20
++#ifndef BL1_BUILD
++/* stale index is the index of the partition to remove within the parti=
tion entry
++ * array, which could be representing either bank 0 or bank 1. name_ind=
ex is the
++ * index of partition to remove within the fwu_images image_names index=
, which is
++ * fixed at compile time in the structure
++ */
++static psa_status_t remove_all_stale_partitions(const uint32_t stale_in=
dex,
++                                                const uint32_t name_ind=
ex)
++{
++    psa_status_t ret;
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; ++i) {
++        struct partition_entry_t part;
++        ret =3D gpt_entry_read_by_type(&(fwu_image[i].image_type), stal=
e_index, &part);
++
++        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++            FWU_LOG_MSG("%s: Unable to find partition '%s', skipping re=
moval\r\n",
++                    __func__, fwu_image[i].image_names[name_index]);
++            continue;
++        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
++                    __func__, fwu_image[i].image_names[name_index]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[name_index]);
++            return ret;
++        }
++
++        ret =3D gpt_entry_remove(&(part.partition_guid));
++        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst removing GPT partition =
'%s'\r\n",
++                    __func__, fwu_image[i].image_names[name_index]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[name_index]);
++            return ret;
++        }
++
++        FWU_LOG_MSG("%s: Removed GPT partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[name_index]);
++    }
++
++    return ret;
++}
++#endif
++
+ static psa_status_t fwu_select_previous(
+         struct fwu_metadata *metadata,
+         struct fwu_private_metadata *priv_metadata)
+@@ -1162,40 +1210,12 @@ static psa_status_t fwu_select_previous(
+=20
+ #ifndef BL1_BUILD
+     /* Remove the GPT partitions for the rejected images. It is always =
the newer
+-     * (second) partitions that are rejected, as they are created durin=
g the
+-     * fwu process
++     * (previous active) partitions that are rejected, as they are crea=
ted during
++     * the fwu process
+      */
+-    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; ++i) {
+-        struct partition_entry_t part;
+-        ret =3D gpt_entry_read_by_type(&(fwu_image[i].image_type), 1, &=
part);
+-
+-        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+-            FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
+-                    __func__, fwu_image[i].image_names[index]);
+-            return ret;
+-        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
+-            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
+-                    __func__, fwu_image[i].image_names[index]);
+-            return ret;
+-        } else if (ret < 0) {
+-            FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
+-                    __func__, fwu_image[i].image_names[index]);
+-            return ret;
+-        }
+-
+-        ret =3D gpt_entry_remove(&(part.partition_guid));
+-        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
+-            FWU_LOG_MSG("%s: Flash error whilst removing GPT partition =
'%s'\r\n",
+-                    __func__, fwu_image[i].image_names[index]);
+-            return ret;
+-        } else if (ret < 0) {
+-            FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
+-                    __func__, fwu_image[i].image_names[index]);
+-            return ret;
+-        }
+-
+-        FWU_LOG_MSG("%s: Removed GPT partition '%s'\r\n",
+-                    __func__, fwu_image[i].image_names[index]);
++    ret =3D remove_all_stale_partitions(1, metadata->previous_active_in=
dex);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
+     }
+ #endif /* BL1_BUILD */
+=20
+@@ -1971,6 +1991,28 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_co=
mponent_t component,
+                 priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
+=20
+         FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
++
++#ifndef BL1_BUILD
++        /* The FWU process short circuits at this point, so remove all =
images,
++         * effecitvely treating them all as rejected. Ignore return cod=
e and
++         * in order to return PSA_OPERATION_INCOMPLETE as per PSA FWU A=
PI.
++         */
++        uint32_t previous_active_index;
++        if (active_index =3D=3D BANK_0) {
++            previous_active_index =3D BANK_1;
++        } else if (active_index =3D=3D BANK_1) {
++            previous_active_index =3D BANK_0;
++        } else {
++            FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,activ=
e_index);
++            ret =3D PSA_ERROR_DATA_INVALID;
++            goto out;
++        }
++
++        /* The newer index should be removed as that was just created i=
n the
++         * staging phase.
++         */
++        (void)remove_all_stale_partitions(1, previous_active_index);
++#endif
+         ret =3D PSA_OPERATION_INCOMPLETE;
+         goto out;
+     }
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0059-plat-cs1k-Duplicate-old-images-in-FWU.patch b/meta-arm-bsp/recipe=
s-bsp/trusted-firmware-m/files/corstone1000/0059-plat-cs1k-Duplicate-old-=
images-in-FWU.patch
new file mode 100644
index 00000000..3fcf8560
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0059=
-plat-cs1k-Duplicate-old-images-in-FWU.patch
@@ -0,0 +1,217 @@
+From 3c7cb3432084df3b75b6382e543f3fc2352e32cf Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 13:42:16 +0000
+Subject: [PATCH] plat: cs1k: Duplicate old images in FWU
+
+When copying existing partitions during a partial firmware update, the
+GPT library is now used to duplicate the old partitions and then rename
+them accordingly. This streamlines the steps of
+    1. creating a new partition for the image to be copied into and
+    2. the copying itself
+into a single library call.
+
+Change-Id: Ibd169dcc14ed1c946bbd6c30b6962c89055d0e8e
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50261/1]
+---
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 144 +++++++++---------
+ 1 file changed, 68 insertions(+), 76 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 557e48d07..c48d51b32 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -39,7 +39,6 @@
+  * This is used when bank consistency is maintained during partial caps=
ule update
+  */
+ #define FLASH_CHUNK_SIZE                512
+-static uint8_t flash_data_buf[FLASH_CHUNK_SIZE];
+=20
+ /* Possible states of the bank.
+  * Naming convention here matches the implementation in U-Boot=20
+@@ -2171,94 +2170,24 @@ out:
+     return ret;
+ }
+=20
++#ifdef BL1_BUILD
+ static psa_status_t copy_image_from_other_bank(int image_index,
+                                                uint32_t active_index,
+                                                uint32_t previous_active=
_index)
+ {
+     FWU_LOG_FUNC_ENTER;
+=20
++    /* Use offsets directly */
+     uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
+     psa_status_t ret;
+=20
+-#ifdef BL1_BUILD
+     /* Use offsets directly */
++    uint8_t data[FLASH_CHUNK_SIZE];
+     size_t remaining_size =3D fwu_image[image_index].image_size;
+     size_t data_size;
+     size_t offset_read =3D bank_offset[active_index] + fwu_image[image_=
index].image_offset;
+     size_t offset_write =3D bank_offset[previous_active_index] + fwu_im=
age[image_index].image_offset;
+     int data_transferred_count;
+-#else
+-    /* Use GPT to find the correct image */
+-    struct partition_entry_t active_part;
+-    ret =3D gpt_entry_read_by_type(
+-            &(fwu_image[image_index].image_type),
+-            0,
+-            &active_part);
+-    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+-        FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
+-                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
+-        return ret;
+-    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
+-        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
+-                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
+-        return ret;
+-    } else if (ret < 0) {
+-        FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
+-                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
+-        return ret;
+-    }
+-
+-    struct partition_entry_t prev_active_part;
+-    ret =3D gpt_entry_read_by_type(
+-            &(fwu_image[image_index].image_type),
+-            1,
+-            &prev_active_part);
+-
+-    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+-        /* Create the partition in the expected space */
+-        struct efi_guid_t new_guid =3D {0};
+-        char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
+-        ascii_to_unicode(fwu_image[image_index].image_names[previous_ac=
tive_index], unicode_name);
+-
+-        ret =3D gpt_entry_create(&(fwu_image[image_index].image_type),
+-                               (bank_offset[previous_active_index] + fw=
u_image[image_index].image_offset) / TFM_GPT_BLOCK_SIZE,
+-                               1 + ((fwu_image[image_index].image_size =
- 1) / TFM_GPT_BLOCK_SIZE),
+-                               0,
+-                               unicode_name,
+-                               &new_guid);
+-        if (ret =3D=3D PSA_ERROR_INSUFFICIENT_STORAGE) {
+-            FWU_LOG_MSG("%s: No space left on device!\r\n", __func__);
+-            return ret;
+-        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
+-            FWU_LOG_MSG("%s: Flash error whilst creating GPT partition =
'%s'!\r\n",
+-                    __func__, fwu_image[image_index].image_names[previo=
us_active_index]);
+-            return ret;
+-        } else if (ret < 0) {
+-            return ret;
+-        }
+-
+-        ret =3D gpt_entry_read(&new_guid, &prev_active_part);
+-        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
+-            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
+-                    __func__, fwu_image[image_index].image_names[previo=
us_active_index]);
+-            return ret;
+-        } else if (ret < 0) {
+-            return ret;
+-        }
+-    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
+-        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
+-                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
+-        return ret;
+-    } else if (ret < 0) {
+-        return ret;
+-    }
+-
+-    size_t remaining_size =3D prev_active_part.size * TFM_GPT_BLOCK_SIZ=
E;
+-    size_t data_size;
+-    size_t offset_read =3D active_part.start * TFM_GPT_BLOCK_SIZE;
+-    size_t offset_write =3D prev_active_part.start * TFM_GPT_BLOCK_SIZE=
;
+-    int data_transferred_count;
+-#endif /* BL1_BUILD */
+=20
+     ret =3D erase_image(offset_write, remaining_size);
+     if (ret !=3D PSA_SUCCESS) {
+@@ -2270,7 +2199,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+         data_size =3D (remaining_size > FLASH_CHUNK_SIZE) ? FLASH_CHUNK=
_SIZE : remaining_size;
+=20
+         /* read image data from flash */
+-        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, flash_data_buf, data_size);
++        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, data, data_size);
+         if (data_transferred_count < 0) {
+             FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
+             return PSA_ERROR_STORAGE_FAILURE;
+@@ -2285,7 +2214,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+         offset_read +=3D data_size;
+=20
+         /* write image data to flash */
+-        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, flash_data_buf, data_size);
++        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, data, data_size);
+         if (data_transferred_count < 0) {
+             FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
+             return PSA_ERROR_STORAGE_FAILURE;
+@@ -2304,6 +2233,69 @@ static psa_status_t copy_image_from_other_bank(in=
t image_index,
+     FWU_LOG_MSG("%s: exit \n\r", __func__);
+     return PSA_SUCCESS;
+ }
++#else
++static psa_status_t copy_image_from_other_bank(int image_index,
++                                               uint32_t active_index,
++                                               uint32_t previous_active=
_index)
++{
++    FWU_LOG_FUNC_ENTER;
++
++    /* Use GPT to find and copy the correct image */
++    uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
++    uint64_t new_lba =3D
++        (bank_offset[previous_active_index] + fwu_image[image_index].im=
age_offset) / TFM_GPT_BLOCK_SIZE;
++
++    struct partition_entry_t active_part;
++    psa_status_t ret =3D gpt_entry_read_by_type(
++            &(fwu_image[image_index].image_type),
++            0,
++            &active_part);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
++                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
++        return ret;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
++                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
++        return ret;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
++                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
++        return ret;
++    }
++
++    struct efi_guid_t new_guid;
++    ret =3D gpt_entry_duplicate(&(active_part.partition_guid), new_lba,=
 &new_guid);
++    if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: Flash error whilst creating GPT partition '%s'=
\r\n",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        return ret;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("%s: Unable to create partition '%s'\r\n",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        return ret;
++    }
++
++    char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    ascii_to_unicode(fwu_image[image_index].image_names[previous_active=
_index], unicode_name);
++    ret =3D gpt_entry_rename(&new_guid, unicode_name);
++    if (ret !=3D PSA_SUCCESS) {
++        FWU_LOG_MSG("%s: Unable to rename partition to '%s'\r\n",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++
++        /* Delete the newly created partition as there is code that rel=
ies on the naming */
++        ret =3D gpt_entry_remove(&new_guid);
++        if (ret !=3D PSA_SUCCESS) {
++            FWU_LOG_MSG("%s: Catastrophic failure: unable to remove dup=
licate partition '%s'\r\n",
++                    __func__, fwu_image[image_index].image_names[active=
_index]);
++        }
++        return ret;
++    }
++
++    FWU_LOG_MSG("%s: exit \n\r", __func__);
++    return PSA_SUCCESS;
++}
++#endif /* BL1_BUILD */
+=20
+ static psa_status_t maintain_bank_consistency(void)
+ {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 4a8ec99b..6ee13b30 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -88,6 +88,9 @@ SRC_URI:append:corstone1000 =3D " \
     file://0054-lib-gpt-Consecutively-erase-blocks-when-moving-parti.pat=
ch \
     file://0055-lib-gpt-Clarify-API-operation.patch \
     file://0056-lib-gpt-Add-metadata-only-API-operations.patch \
+    file://0057-plat-cs1k-Add-flash-erase-protection.patch \
+    file://0058-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.pat=
ch \
+    file://0059-plat-cs1k-Duplicate-old-images-in-FWU.patch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

