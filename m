Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C6D10A62D2
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:29:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47422.1774531757109817897
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 06:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=n22SEM+9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A40841AED;
	Thu, 26 Mar 2026 06:29:10 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.12.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0A3A3F836;
	Thu, 26 Mar 2026 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774531756; bh=H5Ai6I+rRC561Z9uqgp0bky/yR8J7ScD+n3qzsv+LSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n22SEM+9ArApQ6klGuRUXpIOB5iilyB97ZHLl3Rn7FkOZHa5x450vz1etsaMPZchK
	 czUyFY8O/Jh2hwqH6mtOtyN/cAeJz8G0q4Kf5hKm7KT6nojgYGC56TI6FVPznhzwwv
	 gak0LYWrnClAlv5SvfAawJFoKmzg+5J1RdUuGRT0=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/2] arm-bsp/tf-m:cs1k: modified mcuboot to use GPT library
Date: Thu, 26 Mar 2026 13:28:40 +0000
Message-ID: <20260326132857.1590256-3-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326132857.1590256-1-frazer.carsley@arm.com>
References: <20260326132857.1590256-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Mar 2026 13:29:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6975

Corstone1000 used to use its own implementation of a GPT parser for use
in a capsule update. The patches in this commit replace what exists with
the generic GPT library, as well as other minor self-explanatory fixes.
The wic file has undergone two changes as a result of this:

1. The partition type GUID of each of the four partitions that can be
   updated by a capsule update must match the GUID of each capsule. This
   allows for the existing partition to be matched with its updated
   image. Different machines (e.g. MPS3 vs FVP) have different GUIDs for
   these images hence the need for separate files.
2. The second bank has been removed from provisioning. Because the
   library supports dynamic creation of partitions, the second bank no
   longer needs to be provisioned at build time. However, a small
   reserved partition is still created above the 32KiB mark to force
   wic to size the disk as 64KiB and write this into the GPT header
   for the library to read on initialisation.

Finally, the size of bl1_1 is reduced by one of the patches in this
commit, so this is also reflected in the recipe.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |    2 +
 .../conf/machine/corstone1000-mps3.conf       |    2 +
 .../conf/machine/include/corstone1000.inc     |    1 -
 ...34-plat-cs1k-Fixed-formatting-errors.patch |  261 +
 ...5-plat-cs1k-Removed-unused-variables.patch |   43 +
 ...plat-cs1k-Fixed-bad-function-returns.patch |   40 +
 ...at-cs1k-Improved-logging-in-function.patch |   48 +
 ...038-plat-cs1k-Remove-unused-function.patch |   93 +
 ...039-plat-cs1k-Reduce-BL1-binary-size.patch |  464 ++
 ...-plat-cs1k-Update-license-identifier.patch |   35 +
 ...-cs1k-Changed-to-use-new-GPT-library.patch | 4536 +++++++++++++++++
 ...s1k-Move-variable-from-stack-to-data.patch |   55 +
 ...eate-and-remove-FWU-image-partitions.patch |  521 ++
 .../trusted-firmware-m-corstone1000.inc       |   14 +-
 ...=3D> corstone1000-flash-firmware-fvp.wks.in} |   22 +-
 .../corstone1000-flash-firmware-mps3.wks.in   |   34 +
 16 files changed, 6154 insertions(+), 17 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0034-plat-cs1k-Fixed-formatting-errors.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0035-plat-cs1k-Removed-unused-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0036-plat-cs1k-Fixed-bad-function-returns.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0037-plat-cs1k-Improved-logging-in-function.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0038-plat-cs1k-Remove-unused-function.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0039-plat-cs1k-Reduce-BL1-binary-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0040-plat-cs1k-Update-license-identifier.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0041-plat-cs1k-Changed-to-use-new-GPT-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0042-plat-cs1k-Move-variable-from-stack-to-data.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0043-plat-cs1k-Create-and-remove-FWU-image-partitions.patch
 rename meta-arm-bsp/wic/{corstone1000-flash-firmware.wks.in =3D> corston=
e1000-flash-firmware-fvp.wks.in} (65%)
 create mode 100644 meta-arm-bsp/wic/corstone1000-flash-firmware-mps3.wks=
.in

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 07f29960..e447b56e 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -15,6 +15,8 @@ TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
 CORSTONE_1000_TYPE =3D "CORSTONE_1000_TYPE_CORTEX_A35_FVP"
=20
+WKS_FILE:firmware ?=3D "corstone1000-flash-firmware-fvp.wks.in"
+
 # testimage config
 TEST_TARGET =3D "OEFVPTarget"
 TEST_TARGET_IP =3D "127.0.0.1:2222"
diff --git a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf b/meta-arm-=
bsp/conf/machine/corstone1000-mps3.conf
index 2b5aed4e..9327de65 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
@@ -10,3 +10,5 @@ TFA_TARGET_PLATFORM =3D "fpga"
 MACHINE_FEATURES +=3D "coresight"
=20
 CORSTONE_1000_TYPE =3D "CORSTONE_1000_TYPE_CORTEX_A35_MPS3"
+
+WKS_FILE:firmware ?=3D "corstone1000-flash-firmware-mps3.wks.in"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index ebc8f7a6..6f82c597 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -52,7 +52,6 @@ IMAGE_FSTYPES +=3D "wic"
 # Need to clear the suffix so TESTIMAGE_AUTO works
 IMAGE_NAME_SUFFIX =3D ""
 WKS_FILE ?=3D "efi-disk-no-swap.wks.in"
-WKS_FILE:firmware ?=3D "corstone1000-flash-firmware.wks.in"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0034-plat-cs1k-Fixed-formatting-errors.patch b/meta-arm-bsp/recipes-bs=
p/trusted-firmware-m/files/corstone1000/0034-plat-cs1k-Fixed-formatting-e=
rrors.patch
new file mode 100644
index 00000000..28429f70
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0034=
-plat-cs1k-Fixed-formatting-errors.patch
@@ -0,0 +1,261 @@
+From 9402dd67413e74284bc598225b4c5399fbd1a099 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 19 Nov 2025 17:12:13 +0000
+Subject: [PATCH] plat: cs1k: Fixed formatting errors
+
+Many of these were tab characters, however the style guide for this repo
+is clear that spaces shall be used.
+
+Sometimes the wrong number of spaces was used and that is fixed here as
+well.
+
+Change-Id: I4c797d1de9723961eac707476e249062653aece0
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49423]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  6 +-
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 60 +++++++++----------
+ 2 files changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 993c51591..58edae74e 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -242,7 +242,7 @@ target_include_directories(platform_bl1_1_interface
+         ${PLATFORM_DIR}/ext/target/arm/drivers/usart/pl011
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform=
/ext/accelerator/interface>
+         ${PLATFORM_DIR}/ext/accelerator/cc312/
+-	${CMAKE_SOURCE_DIR}/lib/fih/inc/
++        ${CMAKE_SOURCE_DIR}/lib/fih/inc/
+ )
+=20
+ target_link_libraries(platform_bl1_1
+@@ -289,7 +289,7 @@ target_include_directories(platform_bl1_2
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a/
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/
+         ${PLATFORM_DIR}/ext/accelerator/cc312/
+-	${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++        ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform BL2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+@@ -397,7 +397,7 @@ target_include_directories(platform_bl2
+         ${MCUBOOT_PATH}/boot/bootutil/include # for fault_injection_har=
dening.h only
+         ${CMAKE_BINARY_DIR}/bl2/ext/mcuboot # for mcuboot_config.h only
+         $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
+-	${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++        ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D ns_agent_mailbox =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index a458b5478..cff80b755 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -995,7 +995,7 @@ psa_status_t fwu_metadata_provision(void)
+ static uint8_t get_fwu_image_state(
+         struct fwu_metadata *metadata,
+         struct fwu_private_metadata *priv_metadata,
+-	uint32_t fwu_image_index)
++        uint32_t fwu_image_index)
+ {
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+@@ -1305,12 +1305,12 @@ psa_status_t corstone1000_fwu_host_ack(void)
+=20
+         ret =3D PSA_SUCCESS; /* nothing to be done */
+=20
+-	for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-            fmp_set_image_info(&fwu_image[i].image_guid,
+-                    priv_metadata.fmp_version[i],
+-                    priv_metadata.fmp_last_attempt_version[i],
+-                    priv_metadata.fmp_last_attempt_status[i]);
+-	}
++        for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++                fmp_set_image_info(&fwu_image[i].image_guid,
++                        priv_metadata.fmp_version[i],
++                        priv_metadata.fmp_last_attempt_version[i],
++                        priv_metadata.fmp_last_attempt_status[i]);
++        }
+=20
+         goto out;
+=20
+@@ -1322,13 +1322,13 @@ psa_status_t corstone1000_fwu_host_ack(void)
+=20
+         /* firmware update failed, revert back to previous bank */
+=20
+-	for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+             if(get_fwu_image_state(&_metadata, &priv_metadata, i) =3D=3D=
 PSA_FWU_TRIAL) {
+                 priv_metadata.fmp_last_attempt_version[i] =3D
+                  _metadata.fw_desc.img_entry[i].img_props[_metadata.act=
ive_index].version;
+=20
+                 priv_metadata.fmp_last_attempt_status[i] =3D LAST_ATTEM=
PT_STATUS_ERROR_UNSUCCESSFUL;
+-	    }
++            }
+         }
+         ret =3D fwu_select_previous(&_metadata, &priv_metadata);
+=20
+@@ -1455,14 +1455,14 @@ psa_status_t fwu_stage_nv_counter(enum fwu_nv_co=
unter_index_t index,
+=20
+ psa_status_t corstone1000_fwu_flash_image(void)
+ {
+-	return PSA_SUCCESS;
++    return PSA_SUCCESS;
+ }
+=20
+ /* Verify if image index is valid or not */
+ bool is_image_index_valid(uint8_t fwu_image_index) {
+     return (fwu_image_index !=3D FWU_FAKE_IMAGE_INDEX &&
+             fwu_image_index !=3D FWU_IMAGE_INDEX_ESRT &&
+-	    fwu_image_index < FWU_COMPONENT_NUMBER);
++            fwu_image_index < FWU_COMPONENT_NUMBER);
+ }
+=20
+ static psa_status_t get_esrt_data(struct fwu_esrt_data_wrapper *esrt)
+@@ -1585,8 +1585,8 @@ static void fmp_header_image_info_init()
+     for (int i=3D0; i<FWU_COMPONENT_NUMBER; i++)
+     {
+         fmp_header_image_info[i].fmp_hdr_size_recvd =3D 0;
+-	fmp_header_image_info[i].image_size_recvd =3D 0;
+-	memset(&fmp_header_image_info[i].fmp_hdr, 0, sizeof(fmp_header_image_i=
nfo[i].fmp_hdr));
++        fmp_header_image_info[i].image_size_recvd =3D 0;
++        memset(&fmp_header_image_info[i].fmp_hdr, 0, sizeof(fmp_header_=
image_info[i].fmp_hdr));
+     }
+ }
+=20
+@@ -1598,7 +1598,7 @@ static psa_status_t erase_staging_area(struct fwu_=
metadata* metadata, psa_fwu_co
+=20
+     if (!is_image_index_valid(component)) {
+         FWU_LOG_MSG("%s: Invalid Component received \n\r", __func__);
+-	return PSA_ERROR_GENERIC_ERROR;
++        return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+     uint32_t active_index =3D metadata->active_index;
+@@ -1691,7 +1691,7 @@ psa_status_t parse_fmp_header(psa_fwu_component_t =
component, const void *block,
+                 (sizeof(fmp_header_image_info[component].fmp_hdr) - fmp=
_header_image_info[component].fmp_hdr_size_recvd));
+=20
+         fmp_header_image_info[component].fmp_hdr_size_recvd =3D sizeof(=
fmp_header_image_info[component].fmp_hdr);
+-	return PSA_SUCCESS;
++        return PSA_SUCCESS;
+     }
+=20
+ }
+@@ -1738,7 +1738,7 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+         }
+         if (ret =3D=3D PSA_SUCCESS) {
+             block_size -=3D fmp_header_image_info[fwu_image_index].fmp_=
hdr_size_recvd;
+-	    block +=3D fmp_header_image_info[fwu_image_index].fmp_hdr_size_rec=
vd;
++            block +=3D fmp_header_image_info[fwu_image_index].fmp_hdr_s=
ize_recvd;
+         }
+     }
+=20
+@@ -1774,7 +1774,7 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+     if (fw_version <=3D
+                 _metadata.fw_desc.img_entry[fwu_image_index].img_props[=
active_index].version)
+     {
+-	/* Version is extracted from the fmp_payload_header */
++        /* Version is extracted from the fmp_payload_header */
+         priv_metadata.fmp_last_attempt_version[fwu_image_index] =3D fmp=
_header_image_info[fwu_image_index].fmp_hdr.fw_version;
+         priv_metadata.fmp_last_attempt_status[fwu_image_index] =3D LAST=
_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL;
+         private_metadata_write(&priv_metadata);
+@@ -1785,8 +1785,8 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+                 priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
+=20
+         FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
+-	ret =3D PSA_OPERATION_INCOMPLETE;
+-	goto out;
++        ret =3D PSA_OPERATION_INCOMPLETE;
++        goto out;
+     }
+=20
+     if (active_index =3D=3D BANK_0) {
+@@ -1828,7 +1828,7 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+                 priv_metadata.fmp_last_attempt_version[fwu_image_index]=
,
+                 priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
+         ret =3D PSA_OPERATION_INCOMPLETE;
+-	goto out;
++        goto out;
+     }
+     else {
+         ret =3D PSA_SUCCESS;
+@@ -1871,7 +1871,7 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
+     } else {
+         FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+         ret =3D PSA_ERROR_DATA_INVALID;
+-	goto out;
++        goto out;
+     }
+=20
+     _metadata.active_index =3D previous_active_index;
+@@ -1881,7 +1881,7 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
+     /* Change system state to trial bank state */
+     for (int i =3D 0; i < number; i++) {
+         /* Skip image with index 0 and ESRT image */
+-	if(!is_image_index_valid(candidates[i])) {
++        if(!is_image_index_valid(candidates[i])) {
+             FWU_LOG_MSG("%s: Invalid image index received \n\r", __func=
__);
+             continue;
+         }
+@@ -1946,7 +1946,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+         }
+=20
+         offset_read +=3D data_size;
+-=09
++
+         /* write image data to flash */
+         data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, data, data_size);
+         if (data_transferred_count < 0) {
+@@ -1961,7 +1961,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+         }
+=20
+         offset_write +=3D data_size;
+-	remaining_size -=3D data_size;
++        remaining_size -=3D data_size;
+     }
+=20
+     FWU_LOG_MSG("%s: exit \n\r", __func__);
+@@ -2004,8 +2004,8 @@ static psa_status_t maintain_bank_consistency(void=
)
+         ret =3D copy_image_from_other_bank(i, active_index, previous_ac=
tive_index);
+         if(ret) {
+             FWU_LOG_MSG("ERROR: %s: copy_image_from_other_bank failed f=
or Image : %d\n\r",__func__, i);
+-       	    return ret;
+-	}
++            return ret;
++        }
+=20
+         _metadata.fw_desc.img_entry[i].img_props[previous_active_index]=
.version =3D
+          _metadata.fw_desc.img_entry[i].img_props[active_index].version=
;
+@@ -2110,7 +2110,7 @@ psa_status_t fwu_bootloader_mark_image_accepted(co=
nst psa_fwu_component_t *trial
+=20
+     /* firmware update successful */
+     for (int i =3D 0; i < number; i++) {
+-	if(!is_image_index_valid(trials[i])) {
++    if(!is_image_index_valid(trials[i])) {
+             FWU_LOG_MSG("%s: Invalid image index received \n\r", __func=
__);
+             continue;
+         }
+@@ -2201,7 +2201,7 @@ psa_status_t fwu_bootloader_reject_staged_image(ps=
a_fwu_component_t component)
+     } else {
+         FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+         ret =3D PSA_ERROR_GENERIC_ERROR;
+-	goto out;
++        goto out;
+     }
+=20
+     image_offset =3D bank_offset + fwu_image[image_index].image_offset;
+@@ -2308,11 +2308,11 @@ psa_status_t fwu_bootloader_get_image_info(psa_f=
wu_component_t component,
+         ret =3D get_esrt_data(&esrt);
+         if (ret) {
+             FWU_LOG_MSG("%s: ERROR : Unable to populate ESRT \n\r", __f=
unc__);
+-	    goto out;
++            goto out;
+         }
+=20
+         memcpy(&info->impl.candidate_digest, &esrt, esrt_size);
+-	if (query_state) {
++        if (query_state) {
+             info->state =3D PSA_FWU_READY;
+         }
+     }
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0035-plat-cs1k-Removed-unused-variables.patch b/meta-arm-bsp/recipes-b=
sp/trusted-firmware-m/files/corstone1000/0035-plat-cs1k-Removed-unused-va=
riables.patch
new file mode 100644
index 00000000..5c8464b0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0035=
-plat-cs1k-Removed-unused-variables.patch
@@ -0,0 +1,43 @@
+From c579565c25937ae9455efe9cc3fbcace84c3e580 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 29 Dec 2025 11:28:47 +0000
+Subject: [PATCH] plat: cs1k: Removed unused variables
+
+Change-Id: I0dd3ff834c47c58dc833586c74791deca679a3ab
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport
+---
+ .../arm/corstone1000/bootloader/mcuboot/tfm_mcuboot_fwu.c     | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index cff80b755..83b0bd27d 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -1511,7 +1511,6 @@ static psa_status_t fwu_accept_image(struct fwu_me=
tadata *metadata,
+         uint8_t number)
+ {
+     uint8_t current_state;
+-    uint32_t image_bank_offset;
+     uint32_t active_bank_index;
+     uint32_t fwu_image_index;
+     psa_status_t ret;
+@@ -1848,7 +1847,6 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
+ {
+     int ret;
+     uint32_t active_index;
+-    uint32_t bank_offset;
+     uint32_t previous_active_index;
+     uint8_t fwu_image_index;
+=20
+@@ -1864,10 +1862,8 @@ static psa_status_t fwu_update_metadata(const psa=
_fwu_component_t *candidates, u
+=20
+     if (active_index =3D=3D BANK_0) {
+         previous_active_index =3D BANK_1;
+-        bank_offset =3D BANK_1_PARTITION_OFFSET;
+     } else if (active_index =3D=3D BANK_1) {
+         previous_active_index =3D BANK_0;
+-        bank_offset =3D BANK_0_PARTITION_OFFSET;
+     } else {
+         FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+         ret =3D PSA_ERROR_DATA_INVALID;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0036-plat-cs1k-Fixed-bad-function-returns.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0036-plat-cs1k-Fixed-bad-funct=
ion-returns.patch
new file mode 100644
index 00000000..35643451
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0036=
-plat-cs1k-Fixed-bad-function-returns.patch
@@ -0,0 +1,40 @@
+From 50db5724ef37d5c7cec019254d135b3dcfd0d340 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 29 Dec 2025 11:30:32 +0000
+Subject: [PATCH] plat: cs1k: Fixed bad function returns
+
+The rest of the functions would go to a label to perform some cleanup
+before exiting the function, however these particular errors did not. Th=
e
+cleanup would reset the write mode on flash, which is required since the
+errors occur after it being changed.
+
+Change-Id: Ic8277a3295398922b2f05fcaddfb5a188b14e537
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49425]
+---
+ .../arm/corstone1000/bootloader/mcuboot/tfm_mcuboot_fwu.c    | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 52db60bbc..2c17d4b79 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -1798,7 +1798,8 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+         bank_offset =3D BANK_0_PARTITION_OFFSET;
+     } else {
+         FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+-        return PSA_ERROR_DATA_INVALID;
++        ret =3D PSA_ERROR_DATA_INVALID;
++        goto out;
+     }
+=20
+     image_offset =3D bank_offset + fwu_image[fwu_image_index].image_off=
set;
+@@ -2002,7 +2003,7 @@ static psa_status_t maintain_bank_consistency(void=
)
+         ret =3D copy_image_from_other_bank(i, active_index, previous_ac=
tive_index);
+         if(ret) {
+             FWU_LOG_MSG("ERROR: %s: copy_image_from_other_bank failed f=
or Image : %d\n\r",__func__, i);
+-            return ret;
++            goto out;
+         }
+=20
+         _metadata.fw_desc.img_entry[i].img_props[previous_active_index]=
.version =3D
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0037-plat-cs1k-Improved-logging-in-function.patch b/meta-arm-bsp/recip=
es-bsp/trusted-firmware-m/files/corstone1000/0037-plat-cs1k-Improved-logg=
ing-in-function.patch
new file mode 100644
index 00000000..3f302770
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0037=
-plat-cs1k-Improved-logging-in-function.patch
@@ -0,0 +1,48 @@
+From f48a0a6b60309433269c7927dac992eff06f3745 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 29 Dec 2025 11:29:33 +0000
+Subject: [PATCH] plat: cs1k: Improved logging in function
+
+The enter log statement claims to log when the function is entered,
+however it was possible for the function to return before reaching it.
+The error cases have now been given log statements too in order to make
+it easier to track when and why the function exited.
+
+Change-Id: I7fe610ca6a596b6af1e48720a503b76064eed3ff
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49424]
+---
+ .../arm/corstone1000/bootloader/mcuboot/tfm_mcuboot_fwu.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 83b0bd27d..52db60bbc 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -1700,11 +1700,16 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_c=
omponent_t component,
+                                        size_t block_size)
+ {
+=20
++    FWU_LOG_MSG("%s: enter: block_offset =3D %u, block =3D 0x%p, block_=
size =3D %u\n\r"
++                , __func__, block_offset, block, block_size);
++
+     if (block =3D=3D NULL) {
++        FWU_LOG_MSG("%s: exit: block is NULL\n\r", __func__);
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+     if (!is_initialized) {
++        FWU_LOG_MSG("%s: exit: not initialised\n\r", __func__);
+         return PSA_ERROR_BAD_STATE;
+     }
+=20
+@@ -1726,9 +1731,6 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+     uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
;
+     struct fwu_private_metadata priv_metadata;
+=20
+-    FWU_LOG_MSG("%s: enter: block_offset =3D %u, block =3D 0x%p, block_=
size =3D %u\n\r"
+-                , __func__, block_offset, block, block_size);
+-
+     /* Parse the incoming block to make sure complete FMP header is rec=
eived */
+     if (fmp_header_image_info[fwu_image_index].fmp_hdr_size_recvd !=3D =
sizeof(fmp_header_image_info[fwu_image_index].fmp_hdr)) {
+         ret =3D parse_fmp_header(fwu_image_index, block, block_size);
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0038-plat-cs1k-Remove-unused-function.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0038-plat-cs1k-Remove-unused-funct=
ion.patch
new file mode 100644
index 00000000..aae01d8d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0038=
-plat-cs1k-Remove-unused-function.patch
@@ -0,0 +1,93 @@
+From bd6d7dc80556e8c4261343141d675e865d4e960b Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 2 Jan 2026 13:33:25 +0000
+Subject: [PATCH] plat: cs1k: Remove unused function
+
+Change-Id: I6e054213dc1ec94a6dc8304705d4cb6e6da701cc
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49426]
+---
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 70 -------------------
+ 1 file changed, 70 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 2c17d4b79..76ee8a3dc 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -501,76 +501,6 @@ static psa_status_t metadata_validate(struct fwu_me=
tadata *metadata)
+     return PSA_SUCCESS;
+ }
+=20
+-#ifdef BL1_BUILD
+-static psa_status_t metadata_read_without_validation(struct fwu_metadat=
a *metadata)
+-{
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(*metadata));
+-
+-    if (!metadata) {
+-        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+-        return PSA_ERROR_INVALID_ARGUMENT;
+-    }
+-
+-    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_=
OFFSET,
+-                                metadata, sizeof(*metadata));
+-    if (ret < 0) {
+-        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
+-        return PSA_ERROR_STORAGE_FAILURE;
+-    }
+-
+-    if (ret !=3D sizeof(*metadata)) {
+-        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
+-                    __func__, sizeof(*metadata), ret);
+-        return PSA_ERROR_INSUFFICIENT_DATA;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  metadata->active_index, metadata->previous_active_ind=
ex);
+-
+-    return PSA_SUCCESS;
+-}
+-#else
+-static psa_status_t metadata_read_without_validation(struct fwu_metadat=
a *metadata)
+-{
+-    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
+-
+-    if (!metadata) {
+-        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+-        return PSA_ERROR_INVALID_ARGUMENT;
+-    }
+-
+-    part =3D get_partition_entry_by_type(&metadata_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+-        return PSA_ERROR_GENERIC_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(*metadata));
+-
+-
+-    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
+-                                metadata, sizeof(*metadata));
+-    if (ret < 0) {
+-        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
+-        return PSA_ERROR_STORAGE_FAILURE;
+-    }
+-
+-    if (ret !=3D sizeof(*metadata)) {
+-        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
+-                    __func__, sizeof(*metadata), ret);
+-        return PSA_ERROR_INSUFFICIENT_DATA;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  metadata->active_index, metadata->previous_active_ind=
ex);
+-
+-    return PSA_SUCCESS;
+-}
+-#endif
+-
+ #ifdef BL1_BUILD
+ static psa_status_t metadata_read(struct fwu_metadata *metadata, uint8_=
t replica_num)
+ {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0039-plat-cs1k-Reduce-BL1-binary-size.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0039-plat-cs1k-Reduce-BL1-binary-s=
ize.patch
new file mode 100644
index 00000000..9190c04f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0039=
-plat-cs1k-Reduce-BL1-binary-size.patch
@@ -0,0 +1,464 @@
+From 939d18a0d8dcedd2b5c4b6220e1a0f6c6855fcf6 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 2 Jan 2026 14:21:57 +0000
+Subject: [PATCH] plat: cs1k: Reduce BL1 binary size
+
+The size of the BL1 binary is nearly at its maximum allowable size of
+64KiB. By making logging a bit more consistent, string literals can be
+re-used and reduce the size of the binary. This allows more space for
+BL1_2.
+
+Some functions also had two or more "entry" logging statements, and so
+the redundant statements were removed.
+
+The size of BL1_1 has been updated to reflect these changes.
+
+Change-Id: Id52dd0d319fb252d7d05e40b6f8f640d27d45ddb
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49427]
+---
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 101 ++++++++++--------
+ .../arm/corstone1000/partition/region_defs.h  |   2 +-
+ 2 files changed, 56 insertions(+), 47 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 76ee8a3dc..dc7503d41 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -56,6 +56,13 @@
+ #define FWU_FAKE_IMAGES_INDEX_COUNT    1
+ #define FWU_FAKE_IMAGE_INDEX           0
+=20
++/* These macros provide consistent logging for simple function enter an=
d
++ * successful exit. This helps reduce the number of string literals in =
the
++ * final binary, thus reducing its size
++ */
++#define FWU_LOG_FUNC_ENTER FWU_LOG_MSG("%s: enter\n\r", __func__)
++#define FWU_LOG_FUNC_EXIT_SUCCESS FWU_LOG_MSG("%s: success\n\r", __func=
__)
++
+ /*
+  * Metadata version 2 data structures defined by PSA_FW update specific=
ation
+  * at https://developer.arm.com/documentation/den0118/latest/
+@@ -334,7 +341,7 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+ static psa_status_t private_metadata_read(
+         struct fwu_private_metadata* priv_metadata)
+ {
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!priv_metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+@@ -366,7 +373,7 @@ static psa_status_t private_metadata_read(
+     partition_entry_t *part;
+     uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!priv_metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+@@ -430,7 +437,7 @@ static psa_status_t private_metadata_write(
+         return PSA_ERROR_INSUFFICIENT_DATA;
+     }
+=20
+-    FWU_LOG_MSG("%s: success\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+ #else
+@@ -473,14 +480,14 @@ static psa_status_t private_metadata_write(
+         return PSA_ERROR_INSUFFICIENT_DATA;
+     }
+=20
+-    FWU_LOG_MSG("%s: success\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+ #endif
+=20
+ static psa_status_t metadata_validate(struct fwu_metadata *metadata)
+ {
+-    FWU_LOG_MSG("%s: enter:\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+@@ -496,7 +503,7 @@ static psa_status_t metadata_validate(struct fwu_met=
adata *metadata)
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+-    FWU_LOG_MSG("%s: success\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+=20
+     return PSA_SUCCESS;
+ }
+@@ -506,7 +513,7 @@ static psa_status_t metadata_read(struct fwu_metadat=
a *metadata, uint8_t replica
+ {
+     uint32_t replica_offset =3D 0;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+@@ -525,7 +532,6 @@ static psa_status_t metadata_read(struct fwu_metadat=
a *metadata, uint8_t replica
+     FWU_LOG_MSG("%s: flash addr =3D %u, size =3D %d\n\r", __func__,
+                   replica_offset, sizeof(*metadata));
+=20
+-
+     int ret =3D FWU_METADATA_FLASH_DEV.ReadData(replica_offset,
+                                 metadata, sizeof(*metadata));
+     if (ret < 0) {
+@@ -555,7 +561,7 @@ static psa_status_t metadata_read(struct fwu_metadat=
a *metadata, uint8_t replica
+     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+     partition_entry_t *part;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+@@ -611,7 +617,7 @@ static psa_status_t metadata_write(
+ {
+     uint32_t replica_offset =3D 0;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+@@ -627,10 +633,9 @@ static psa_status_t metadata_write(
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++    FWU_LOG_MSG("%s: flash addr =3D %u, size =3D %d\n\r", __func__,
+                   replica_offset, sizeof(*metadata));
+=20
+-
+     int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(replica_offset);
+     if (ret !=3D ARM_DRIVER_OK) {
+         FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
+@@ -661,6 +666,8 @@ static psa_status_t metadata_write(
+     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+     partition_entry_t *part;
+=20
++    FWU_LOG_FUNC_ENTER;
++
+     if (!metadata) {
+         FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
+         return PSA_ERROR_INVALID_ARGUMENT;
+@@ -888,7 +895,7 @@ psa_status_t fwu_metadata_provision(void)
+ {
+     psa_status_t ret;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     ret =3D fwu_metadata_init();
+     if (ret) {
+@@ -918,7 +925,7 @@ psa_status_t fwu_metadata_provision(void)
+         return ret;
+     }
+=20
+-    FWU_LOG_MSG("%s: FWU METADATA PROVISIONED.\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+=20
+@@ -927,7 +934,7 @@ static uint8_t get_fwu_image_state(
+         struct fwu_private_metadata *priv_metadata,
+         uint32_t fwu_image_index)
+ {
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if ((metadata->fw_desc.img_entry[fwu_image_index].img_props[metadat=
a->active_index].accepted)
+             =3D=3D (IMAGE_NOT_ACCEPTED)) {
+@@ -943,7 +950,7 @@ static uint8_t get_fwu_agent_state(
+         struct fwu_metadata *metadata,
+         struct fwu_private_metadata *priv_metadata)
+ {
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (priv_metadata->boot_index !=3D metadata->active_index) {
+         FWU_LOG_MSG("%s: exit: FWU Agent PSA_FWU_TRIAL (index mismatch)=
\n\r", __func__);
+@@ -966,7 +973,7 @@ static psa_status_t erase_image(uint32_t image_offse=
t, uint32_t image_size)
+     int ret;
+     uint32_t sectors;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if ((image_offset % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) {
+         return PSA_ERROR_INVALID_ARGUMENT;
+@@ -989,7 +996,7 @@ static psa_status_t erase_image(uint32_t image_offse=
t, uint32_t image_size)
+         }
+     }
+=20
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+=20
+@@ -1001,7 +1008,7 @@ static psa_status_t fwu_select_previous(
+     uint8_t current_state;
+     uint32_t index;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     /* it is expected to receive this call only when
+        in trial state */
+@@ -1049,8 +1056,8 @@ static psa_status_t fwu_select_previous(
+     FWU_LOG_MSG("%s: in regular state by choosing previous active bank\=
n\r",
+                  __func__);
+=20
+-    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
+-    return ret;
++    FWU_LOG_FUNC_EXIT_SUCCESS;
++    return PSA_SUCCESS;
+=20
+ }
+=20
+@@ -1061,7 +1068,7 @@ void bl1_get_active_bl2_image(uint32_t *offset)
+     uint32_t boot_attempted;
+     uint32_t boot_index;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (fwu_metadata_init()) {
+         FWU_ASSERT(0);
+@@ -1125,7 +1132,7 @@ uint8_t bl2_get_boot_bank(void)
+ {
+     uint8_t boot_index;
+     struct fwu_private_metadata priv_metadata;
+-    FWU_LOG_MSG("%s: enter", __func__);
++    FWU_LOG_FUNC_ENTER;
+     if (fwu_metadata_init()) {
+         FWU_ASSERT(0);
+     }
+@@ -1150,7 +1157,7 @@ static psa_status_t update_nv_counters(
+     uint32_t security_cnt;
+     enum tfm_nv_counter_t tfm_nv_counter_i;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     /* The FWU_BL2_NV_COUNTER (0) is not mirrored in the private metada=
ta. It is
+      * directly updated in the bl1_2_validate_image_at_addr() function,=
 in
+@@ -1194,7 +1201,7 @@ static psa_status_t update_nv_counters(
+=20
+     }
+=20
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+=20
+@@ -1204,7 +1211,7 @@ psa_status_t corstone1000_fwu_host_ack(void)
+     struct fwu_private_metadata priv_metadata;
+     uint8_t current_state;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!is_initialized) {
+         return PSA_ERROR_BAD_STATE;
+@@ -1309,7 +1316,7 @@ void host_acknowledgement_timer_to_reset(void)
+     struct fwu_private_metadata priv_metadata;
+     uint8_t current_state;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     Select_Write_Mode_For_Shared_Flash();
+=20
+@@ -1342,7 +1349,7 @@ void host_acknowledgement_timer_to_reset(void)
+         }
+     }
+=20
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return;
+ }
+=20
+@@ -1379,7 +1386,7 @@ psa_status_t fwu_stage_nv_counter(enum fwu_nv_coun=
ter_index_t index,
+         }
+     }
+=20
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+=20
+@@ -1397,7 +1404,7 @@ bool is_image_index_valid(uint8_t fwu_image_index)=
 {
+=20
+ static psa_status_t get_esrt_data(struct fwu_esrt_data_wrapper *esrt)
+ {
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     if (!esrt)
+     {
+@@ -1445,7 +1452,7 @@ static psa_status_t fwu_accept_image(struct fwu_me=
tadata *metadata,
+     uint32_t fwu_image_index;
+     psa_status_t ret;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+=20
+     /* booted from previous_active_bank, not expected
+@@ -1492,8 +1499,8 @@ static psa_status_t fwu_accept_image(struct fwu_me=
tadata *metadata,
+         return ret;
+     }
+=20
+-    FWU_LOG_MSG("%s: exit: fwu state is changed to regular, ret - %d\n\=
r", __func__, ret);
+-    return ret;
++    FWU_LOG_MSG("%s: success: fwu state is changed to regular\n\r", __f=
unc__);
++    return PSA_SUCCESS;
+ }
+=20
+ static psa_status_t uint_to_image_version(uint32_t ver_in, psa_fwu_imag=
e_version_t *ver_out)
+@@ -1525,6 +1532,8 @@ static psa_status_t erase_staging_area(struct fwu_=
metadata* metadata, psa_fwu_co
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
++    FWU_LOG_FUNC_ENTER;
++
+     if (!is_image_index_valid(component)) {
+         FWU_LOG_MSG("%s: Invalid Component received \n\r", __func__);
+         return PSA_ERROR_GENERIC_ERROR;
+@@ -1535,8 +1544,6 @@ static psa_status_t erase_staging_area(struct fwu_=
metadata* metadata, psa_fwu_co
+     uint32_t image_offset;
+     uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
; /* Decrement to get the correct fwu image index */
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+     if (active_index =3D=3D BANK_0) {
+         bank_offset =3D BANK_1_PARTITION_OFFSET;
+     } else if (active_index =3D=3D BANK_1) {
+@@ -1551,7 +1558,7 @@ static psa_status_t erase_staging_area(struct fwu_=
metadata* metadata, psa_fwu_co
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+-    FWU_LOG_MSG("%s: exit: Staging area erased succesfully \n\r", __fun=
c__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+     return PSA_SUCCESS;
+ }
+=20
+@@ -1559,7 +1566,7 @@ psa_status_t fwu_bootloader_init(void)
+ {
+     psa_status_t ret;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     ret =3D fwu_metadata_init();
+     if (ret) {
+@@ -1569,7 +1576,7 @@ psa_status_t fwu_bootloader_init(void)
+     /* Initialize the fmp_header_image_info object */
+     fmp_header_image_info_init();
+=20
+-    FWU_LOG_MSG("%s: exit: Initialized\n\r", __func__);
++    FWU_LOG_FUNC_EXIT_SUCCESS;
+=20
+     return PSA_SUCCESS;
+ }
+@@ -1588,7 +1595,7 @@ psa_status_t fwu_bootloader_staging_area_init(psa_=
fwu_component_t component,
+=20
+     psa_status_t ret;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     Select_Write_Mode_For_Shared_Flash();
+=20
+@@ -1783,7 +1790,7 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
+     uint32_t previous_active_index;
+     uint8_t fwu_image_index;
+=20
+-    FWU_LOG_MSG("%s: enter function\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     Select_Write_Mode_For_Shared_Flash();
+=20
+@@ -1842,6 +1849,8 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+                                                uint32_t active_index,
+                                                uint32_t previous_active=
_index)
+ {
++    FWU_LOG_FUNC_ENTER;
++
+     uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
+     uint8_t data[FLASH_CHUNK_SIZE];
+     size_t remaining_size =3D fwu_image[image_index].image_size;
+@@ -1904,7 +1913,7 @@ static psa_status_t maintain_bank_consistency(void=
)
+     uint32_t previous_active_index;
+     struct fwu_private_metadata priv_metadata;
+=20
+-    FWU_LOG_MSG("%s: Enter \n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+     Select_Write_Mode_For_Shared_Flash();
+=20
+     if (metadata_read(&_metadata, 1) || private_metadata_read(&priv_met=
adata)) {
+@@ -1979,7 +1988,7 @@ psa_status_t fwu_bootloader_install_image(const ps=
a_fwu_component_t *candidates,
+     }
+=20
+     psa_status_t ret;
+-    FWU_LOG_MSG("%s: enter function\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     /* Copy images from other bank which are not received by FWU client=
 */
+     ret =3D maintain_bank_consistency();
+@@ -2015,7 +2024,7 @@ psa_status_t fwu_bootloader_mark_image_accepted(co=
nst psa_fwu_component_t *trial
+     uint8_t current_state;
+     uint8_t fwu_image_index;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     Select_Write_Mode_For_Shared_Flash();
+=20
+@@ -2114,7 +2123,7 @@ psa_status_t fwu_bootloader_reject_staged_image(ps=
a_fwu_component_t component)
+     uint32_t image_offset;
+     uint8_t image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT;   =
 /* Decrement to get the correct fwu image index */
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+     Select_Write_Mode_For_Shared_Flash();
+=20
+     if (metadata_read(&_metadata, 1)) {
+@@ -2158,7 +2167,7 @@ psa_status_t fwu_bootloader_reject_trial_image(psa=
_fwu_component_t component)
+     int ret;
+     uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
;    /* Decrement to get the correct fwu image index */
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+     /* Disable host ackowledgement timer */
+     disable_host_ack_timer();
+@@ -2213,7 +2222,7 @@ psa_status_t fwu_bootloader_get_image_info(psa_fwu=
_component_t component,
+     uint8_t current_state;
+     psa_status_t ret;
+=20
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    FWU_LOG_FUNC_ENTER;
+=20
+=20
+     Select_Write_Mode_For_Shared_Flash();
+diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+index 92e01c0e3..1feee7841 100644
+--- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
++++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+@@ -94,7 +94,7 @@
+=20
+ /* SE BL1 regions */
+ #define BL1_1_CODE_START    (0)
+-#define BL1_1_CODE_SIZE     (0x0000E800)     /* 58 KiB */
++#define BL1_1_CODE_SIZE     (0x0000E748)     /* 58 KiB */
+ #define BL1_1_CODE_LIMIT    (BL1_1_CODE_START + BL1_1_CODE_SIZE - 1)
+=20
+ #define PROVISIONING_DATA_START (BL1_1_CODE_START + BL1_1_CODE_SIZE)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0040-plat-cs1k-Update-license-identifier.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-m/files/corstone1000/0040-plat-cs1k-Update-license-i=
dentifier.patch
new file mode 100644
index 00000000..0859734f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0040=
-plat-cs1k-Update-license-identifier.patch
@@ -0,0 +1,35 @@
+From b4fd75b96b49756c4815685fc19089793fcc9356 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 14 Jan 2026 14:00:12 +0000
+Subject: [PATCH] plat: cs1k: Update license identifier
+
+Change-Id: I26af0dbf66359e76b7164b3abdbbf3ace3f358c6
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49428]
+---
+ platform/ext/target/arm/corstone1000/platform.c | 2 +-
+ platform/ext/target/arm/corstone1000/platform.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/=
ext/target/arm/corstone1000/platform.c
+index d0f30b72a..32fdc55aa 100644
+--- a/platform/ext/target/arm/corstone1000/platform.c
++++ b/platform/ext/target/arm/corstone1000/platform.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2023, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/=
ext/target/arm/corstone1000/platform.h
+index a88093ed4..906a8f9ae 100644
+--- a/platform/ext/target/arm/corstone1000/platform.h
++++ b/platform/ext/target/arm/corstone1000/platform.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2023, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0041-plat-cs1k-Changed-to-use-new-GPT-library.patch b/meta-arm-bsp/rec=
ipes-bsp/trusted-firmware-m/files/corstone1000/0041-plat-cs1k-Changed-to-=
use-new-GPT-library.patch
new file mode 100644
index 00000000..a508252b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0041=
-plat-cs1k-Changed-to-use-new-GPT-library.patch
@@ -0,0 +1,4536 @@
+From 1b058b6ccc4318f6805d96da5073debf99c764a5 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 2 Mar 2026 14:37:12 +0000
+Subject: [PATCH] plat: cs1k: Changed to use new GPT library
+
+Corstone1000 already had a basic GPT parser implementation however
+lacked full GPT support. Since the addition of the new GPT library, this
+commit removes Corstone1000's parser and uses the library instead for
+parsing/read operations. Because Corstone1000's firmware update
+mechanism uses two banks with fixed offsets in each for the different
+images/partitions, the GPT library is not used to modify any partitions.
+
+The GPT library requires callers to register a pseudo-device driver and
+this is implemented by the io_gpt module. As such, there is no need
+anymore for the abstraction provided by the previous io_* modules, as
+this new module handles the translation between LBAs and
+sectors/addresses of flash.
+
+Change-Id: I1bde0e482a4c5286997ae383f90648e9f8043083
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49429]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  68 ++-
+ .../arm/corstone1000/bl2/boot_hal_bl2.c       |  67 ++-
+ .../arm/corstone1000/bootloader/fwu_agent.h   |  21 +-
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 328 +++++++----
+ .../bootloader/mcuboot/uefi_fmp.c             |  13 +-
+ .../arm/corstone1000/bootloader/uefi_fmp.h    |   3 +-
+ .../ci_regression_tests/CMakeLists.txt        |  12 -
+ .../Driver_Flash_SRAM_Emu.c                   | 327 -----------
+ .../ci_regression_tests/s_io_storage_test.c   | 147 -----
+ .../ci_regression_tests/s_io_storage_test.h   |  15 -
+ .../corstone1000/ci_regression_tests/s_test.c |   3 +-
+ .../ci_regression_tests/s_test_config.cmake   |  13 -
+ .../ci_regression_tests/test_flash.h          |  25 -
+ .../ext/target/arm/corstone1000/config.cmake  |   4 +
+ .../corstone1000/fip_parser/external/uuid.h   |  74 ---
+ .../arm/corstone1000/fip_parser/fip_parser.c  |  12 +-
+ .../arm/corstone1000/fip_parser/fip_parser.h  |  26 +-
+ .../ext/target/arm/corstone1000/io/io_block.c | 528 ------------------
+ .../ext/target/arm/corstone1000/io/io_block.h |  40 --
+ .../ext/target/arm/corstone1000/io/io_defs.h  |  27 -
+ .../target/arm/corstone1000/io/io_driver.h    |  54 --
+ .../ext/target/arm/corstone1000/io/io_flash.c | 183 ------
+ .../ext/target/arm/corstone1000/io/io_flash.h |  37 --
+ .../ext/target/arm/corstone1000/io/io_gpt.c   | 179 ++++++
+ .../ext/target/arm/corstone1000/io/io_gpt.h   |  25 +
+ .../target/arm/corstone1000/io/io_storage.c   | 289 ----------
+ .../target/arm/corstone1000/io/io_storage.h   |  92 ---
+ .../target/arm/corstone1000/partition/efi.h   |  37 --
+ .../target/arm/corstone1000/partition/gpt.c   |  58 --
+ .../target/arm/corstone1000/partition/gpt.h   |  51 --
+ .../target/arm/corstone1000/partition/mbr.h   |  29 -
+ .../arm/corstone1000/partition/partition.c    | 324 -----------
+ .../arm/corstone1000/partition/partition.h    |  48 --
+ .../target/arm/corstone1000/partition/uuid.h  |  76 ---
+ .../ext/target/arm/corstone1000/platform.c    |  71 +--
+ .../ext/target/arm/corstone1000/platform.h    |  32 +-
+ .../arm/corstone1000/soft_crc/soft_crc.c      | 121 ----
+ .../arm/corstone1000/soft_crc/soft_crc.h      |  18 -
+ 38 files changed, 606 insertions(+), 2871 deletions(-)
+ delete mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/Driver_Flash_SRAM_Emu.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/s_io_storage_test.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/s_io_storage_test.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/s_test_config.cmake
+ delete mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/test_flash.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/fip_parser/exte=
rnal/uuid.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_block.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_block.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_defs.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_driver.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_flash.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_flash.h
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_gpt.c
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_gpt.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_storage.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/io/io_storage.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/efi.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/gpt.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/gpt.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/mbr.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/parti=
tion.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/parti=
tion.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/partition/uuid.=
h
+ delete mode 100644 platform/ext/target/arm/corstone1000/soft_crc/soft_c=
rc.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/soft_crc/soft_c=
rc.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 58edae74e..7168c1ca9 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -116,9 +116,11 @@ target_include_directories(platform_s
+     INTERFACE
+         cc312
+         bootloader
+-        soft_crc
+         io
+         partition
++        ${CMAKE_SOURCE_DIR}/lib/ext/efi_soft_crc/inc
++        ${CMAKE_SOURCE_DIR}/lib/efi_guid/inc
++        ${CMAKE_SOURCE_DIR}/lib/gpt/inc
+ )
+=20
+ target_sources(platform_s
+@@ -135,19 +137,23 @@ target_sources(platform_s
+         $<$<BOOL:TFM_PARTITION_PLATFORM>:${CMAKE_CURRENT_SOURCE_DIR}/se=
rvices/src/tfm_platform_system.c>
+         bootloader/mcuboot/tfm_mcuboot_fwu.c
+         bootloader/mcuboot/uefi_fmp.c
+-        soft_crc/soft_crc.c
+-        io/io_block.c
+-        io/io_flash.c
+-        io/io_storage.c
+-        partition/partition.c
+-        partition/gpt.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+         rse_comms_permissions_hal.c
+         mem_check_v6m_v7m_hal.c
+         ${PLATFORM_DIR}/ext/common/mem_check_v6m_v7m.c
++        io/io_gpt.c
+         platform.c
+ )
+=20
++target_link_libraries(platform_s
++    PUBLIC
++        tfm_log
++    PRIVATE
++        tfm_efi_soft_crc
++        tfm_efi_guid
++        tfm_gpt
++)
++
+ if (PLATFORM_IS_FVP)
+ target_sources(platform_s
+     PRIVATE
+@@ -167,6 +173,9 @@ target_compile_definitions(platform_s
+     PUBLIC
+         $<$<BOOL:${EXTERNAL_SYSTEM_SUPPORT}>:EXTERNAL_SYSTEM_SUPPORT>
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
++        TFM_GPT_BLOCK_SIZE=3D${TFM_GPT_BLOCK_SIZE}
++        PLAT_MAX_PARTITION_ENTRIES=3D${PLAT_MAX_PARTITION_ENTRIES}
++        LOG_LEVEL=3D${GPT_LOG_LEVEL}
+     PRIVATE
+         $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+         $<$<BOOL:${ENABLE_FWU_AGENT_DEBUG_LOGS}>:ENABLE_FWU_AGENT_DEBUG=
_LOGS>
+@@ -200,7 +209,6 @@ target_sources(platform_bl1_1
+         ./bl1/provisioning.c
+         ./bootloader/mcuboot/tfm_mcuboot_fwu.c
+         ./bootloader/mcuboot/uefi_fmp.c
+-        ./soft_crc/soft_crc.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:${CMAKE_CURRENT_SOU=
RCE_DIR}/bl1/cc312_rom_crypto.c>
+         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:${CMAKE_CURRENT_SOU=
RCE_DIR}/bl1/cc312_rom_trng.c>
+@@ -231,7 +239,6 @@ target_include_directories(platform_bl1_1_interface
+         ./Native_Driver
+         ./CMSIS_Driver/Config
+         ./bootloader
+-        ./soft_crc
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata
+@@ -243,16 +250,22 @@ target_include_directories(platform_bl1_1_interfac=
e
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform=
/ext/accelerator/interface>
+         ${PLATFORM_DIR}/ext/accelerator/cc312/
+         ${CMAKE_SOURCE_DIR}/lib/fih/inc/
++        ${CMAKE_SOURCE_DIR}/lib/gpt/inc # for GPT_ENTRY_NAME_LENGTH
+ )
+=20
+ target_link_libraries(platform_bl1_1
+     PRIVATE
+         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:cc3xx>
++        tfm_efi_soft_crc
++        tfm_efi_guid
+ )
+=20
+ target_include_directories(platform_bl1_1
+     PRIVATE
+     ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++    ${CMAKE_SOURCE_DIR}/lib/ext/efi_soft_crc/inc
++    ${CMAKE_SOURCE_DIR}/lib/efi_guid/inc
++    ${CMAKE_SOURCE_DIR}/lib/gpt/inc
+ )
+=20
+ target_sources(platform_bl1_2
+@@ -281,7 +294,6 @@ target_include_directories(platform_bl1_2
+         ./Native_Driver
+         ./CMSIS_Driver/Config
+         ./bootloader
+-        ./soft_crc
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata
+@@ -290,6 +302,15 @@ target_include_directories(platform_bl1_2
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/
+         ${PLATFORM_DIR}/ext/accelerator/cc312/
+         ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++        ${CMAKE_SOURCE_DIR}/lib/ext/efi_soft_crc/inc
++        ${CMAKE_SOURCE_DIR}/lib/efi_guid/inc
++        ${CMAKE_SOURCE_DIR}/lib/gpt/inc # for GPT_ENTRY_NAME_LENGTH
++)
++
++target_link_libraries(platform_bl1_2
++    PRIVATE
++        tfm_efi_soft_crc
++        tfm_efi_guid
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform BL2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+@@ -309,12 +330,7 @@ target_sources(platform_bl2
+         bootloader/mcuboot/tfm_mcuboot_fwu.c
+         bl2/security_cnt_bl2.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+-        io/io_block.c
+-        io/io_flash.c
+-        io/io_storage.c
+-        soft_crc/soft_crc.c
+-        partition/partition.c
+-        partition/gpt.c
++        io/io_gpt.c
+         platform.c
+ )
+=20
+@@ -334,6 +350,10 @@ target_sources(platform_bl2
+ endif()
+=20
+ target_compile_definitions(platform_bl2
++    PUBLIC
++        TFM_GPT_BLOCK_SIZE=3D${TFM_GPT_BLOCK_SIZE}
++        PLAT_MAX_PARTITION_ENTRIES=3D${PLAT_MAX_PARTITION_ENTRIES}
++        LOG_LEVEL=3D${GPT_LOG_LEVEL}
+     PRIVATE
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+         $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+@@ -353,6 +373,14 @@ target_sources(bl2
+ target_link_libraries(bl2
+     PRIVATE
+         $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:trusted-firmware-m-=
psa-adac>
++        tfm_log
++)
++
++target_link_libraries(platform_bl2
++    PRIVATE
++        tfm_gpt
++        tfm_efi_soft_crc
++        tfm_efi_guid
+ )
+=20
+ target_compile_definitions(bl2
+@@ -365,6 +393,10 @@ target_compile_definitions(bl2
+ target_include_directories(bl2
+     PRIVATE
+        ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++       ${CMAKE_SOURCE_DIR}/lib/efi_guid/inc # for efi_guid_structs.h
++       ${CMAKE_SOURCE_DIR}/lib/gpt/inc
++       ${CMAKE_SOURCE_DIR}/lib/tfm_log/inc
++       ${CMAKE_SOURCE_DIR}/lib/tfm_vprintf/inc
+ )
+=20
+ target_compile_definitions(bootutil
+@@ -379,7 +411,6 @@ target_include_directories(platform_bl2
+         fip_parser
+         Native_Driver
+         bootloader
+-        soft_crc
+         io
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
+@@ -398,6 +429,9 @@ target_include_directories(platform_bl2
+         ${CMAKE_BINARY_DIR}/bl2/ext/mcuboot # for mcuboot_config.h only
+         $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
+         ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++        ${CMAKE_SOURCE_DIR}/lib/ext/efi_soft_crc/inc
++        ${CMAKE_SOURCE_DIR}/lib/efi_guid/inc
++        ${CMAKE_SOURCE_DIR}/lib/gpt/inc
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D ns_agent_mailbox =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+index bf7b62881..1ed111af6 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+@@ -5,6 +5,7 @@
+  *
+  */
+=20
++#include <errno.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include "tfm_hal_device_header.h"
+@@ -31,8 +32,8 @@
+ #include "crypto_hw.h"
+ #endif
+=20
+-#include "efi.h"
+-#include "partition.h"
++#include "gpt.h"
++#include "io_gpt.h"
+ #include "platform.h"
+=20
+ static const char* const tfm_part_names[] =3D {"tfm_primary", "tfm_seco=
ndary"};
+@@ -49,6 +50,14 @@ REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
+ #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
+ extern struct flash_area flash_map[];
+=20
++static void ascii_to_unicode(const char *ascii, char *unicode)
++{
++    for (int i =3D 0; i < strlen(ascii) + 1; ++i) {
++        unicode[i << 1] =3D ascii[i];
++        unicode[(i << 1) + 1] =3D '\0';
++    }
++}
++
+ static bool fill_flash_map_with_tfm_data(uint8_t boot_index) {
+=20
+     if (boot_index >=3D ARRAY_SIZE(tfm_part_names)) {
+@@ -56,14 +65,28 @@ static bool fill_flash_map_with_tfm_data(uint8_t boo=
t_index) {
+                      boot_index, ARRAY_SIZE(tfm_part_names));
+         return false;
+     }
+-    const partition_entry_t *tfm_entry =3D
+-        get_partition_entry(tfm_part_names[boot_index]);
+-    if (tfm_entry =3D=3D NULL) {
++
++    /* Convert ascii to unicode so GPT library understands */
++    char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    ascii_to_unicode(tfm_part_names[boot_index], unicode_name);
++    struct partition_entry_t tfm_entry;
++    psa_status_t ret =3D gpt_entry_read_by_name(
++            unicode_name,
++            0,
++            &tfm_entry);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        BOOT_LOG_ERR("Could not find partition %s", tfm_part_names[boot=
_index]);
++        return false;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        BOOT_LOG_ERR("%s: I/O error occurred with flash device", __func=
__);
++        return false;
++    } else if (ret < 0) {
+         BOOT_LOG_ERR("Could not find partition %s", tfm_part_names[boot=
_index]);
+         return false;
+     }
+-    flash_map[0].fa_off =3D tfm_entry->start;
+-    flash_map[0].fa_size =3D tfm_entry->length;
++
++    flash_map[0].fa_off =3D tfm_entry.start * TFM_GPT_BLOCK_SIZE;
++    flash_map[0].fa_size =3D tfm_entry.size * TFM_GPT_BLOCK_SIZE;
+     return true;
+ }
+=20
+@@ -80,15 +103,27 @@ static bool fill_flash_map_with_fip_data(uint8_t bo=
ot_index) {
+                      boot_index, ARRAY_SIZE(fip_part_names));
+         return false;
+     }
+-    const partition_entry_t *fip_entry =3D
+-        get_partition_entry(fip_part_names[boot_index]);
+-    if (fip_entry =3D=3D NULL) {
++
++    struct partition_entry_t fip_entry;
++    char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    ascii_to_unicode(fip_part_names[boot_index], unicode_name);
++    psa_status_t ret =3D gpt_entry_read_by_name(
++            unicode_name,
++            0,
++            &fip_entry);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        BOOT_LOG_ERR("Could not find partition %s", fip_part_names[boot=
_index]);
++        return false;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        BOOT_LOG_ERR("%s: I/O error occurred with flash device", __func=
__);
++        return false;
++    } else if (ret < 0) {
+         BOOT_LOG_ERR("Could not find partition %s", fip_part_names[boot=
_index]);
+         return false;
+     }
+=20
+-    fip_offset =3D fip_entry->start;
+-    fip_size =3D fip_entry->length;
++    fip_offset =3D fip_entry.start * TFM_GPT_BLOCK_SIZE;
++    fip_size =3D fip_entry.size * TFM_GPT_BLOCK_SIZE;
+=20
+     /* parse directly from flash using XIP mode */
+     /* FIP is large so its not a good idea to load it in memory */
+@@ -130,20 +165,21 @@ int32_t boot_platform_init(void)
+     }
+=20
+     plat_io_storage_init();
+-    partition_init(PLATFORM_GPT_IMAGE);
++    gpt_init(&io_gpt_flash_driver, PLAT_GPT_MAX_PARTITIONS);
+=20
+     boot_index =3D bl2_get_boot_bank();
+=20
++    result =3D 0;
+     if (!fill_flash_map_with_tfm_data(boot_index)
+ #ifndef TFM_S_REG_TEST
+     || !fill_flash_map_with_fip_data(boot_index)
+ #endif
+     ) {
+         BOOT_LOG_ERR("Filling flash map has failed!");
+-        return 1;
++        result =3D 1;
+     }
+=20
+-    return 0;
++    return result;
+ }
+=20
+ int32_t boot_platform_post_init(void)
+@@ -223,5 +259,6 @@ void boot_platform_start_next_image(struct boot_arm_=
vector_table *vt)
+     __DSB();
+     __ISB();
+=20
++    gpt_uninit();
+     boot_jump_to_next_image(vt_cpy->reset);
+ }
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h=
 b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
+index aa5af15b2..4393f5f7b 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
+@@ -9,7 +9,8 @@
+ #define FWU_AGENT_H
+=20
+ #include "psa/error.h"
+-#include "../fip_parser/external/uuid.h"
++#include "efi_guid_structs.h"
++#include "gpt.h"
+=20
+ #define ENABLE_FWU_AGENT_DEBUG_LOGS
+ #ifdef ENABLE_FWU_AGENT_DEBUG_LOGS
+@@ -29,6 +30,9 @@
+ /* Version used for the very first image of the device. */
+ #define FWU_IMAGE_INITIAL_VERSION 0
+=20
++/* Maximum ascii name length of image */
++#define FWU_IMAGE_NAME_LENGTH (GPT_ENTRY_NAME_LENGTH >> 1)
++
+ #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION  1
+ typedef struct {
+     uint32_t signature;
+@@ -43,21 +47,24 @@ typedef struct {
+     size_t image_size_recvd;
+ } __packed fmp_header_image_info_t;
+=20
+-/* Store image information common for both the banks */
++/* Image information common for both the banks */
+ typedef struct {
+     /* Total size of the image */
+     uint32_t image_size;
+=20
+-    /* Offset of image within a bank */
++    /* Offset of image within a bank. */
+     uint32_t image_offset;
+=20
+-    /* Image GUID */
+-    struct efi_guid image_guid;
+-} __packed fwu_bank_image_info_t;
++    /* Name of the image in ascii */
++    char image_name[FWU_IMAGE_NAME_LENGTH];
++
++    /* Image-type GUID */
++    struct efi_guid_t image_type;
++} fwu_image_info_t;
+=20
+ /* ESRT v1 */
+ struct __attribute__((__packed__)) efi_system_resource_entry {
+-    struct   efi_guid fw_class;
++    struct   efi_guid_t fw_class;
+     uint32_t fw_type;
+     uint32_t fw_version;
+     uint32_t lowest_supported_fw_version;
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index dc7503d41..5e1c4ecc5 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -4,17 +4,19 @@
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+  */
++#include <errno.h>
+ #include <string.h>
+ #include "psa/crypto.h"
+ #include "psa/error.h"
+ #include "tfm_bootloader_fwu_abstraction.h"
++#include "efi_soft_crc.h"
+=20
+ #include <stdint.h>
+ #include <string.h>
+ #include "fwu_agent.h"
+ #include "Driver_Flash.h"
++#include "efi_guid_structs.h"
+ #include "flash_layout.h"
+-#include "fip_parser/external/uuid.h"
+ #include "region_defs.h"
+ #include "flash_common.h"
+ #include "platform_base_address.h"
+@@ -23,10 +25,10 @@
+ #include "tfm_plat_defs.h"
+ #include "uefi_fmp.h"
+ #include "uart_stdout.h"
+-#include "soft_crc.h"
+ #ifndef BL1_BUILD
+-#include "partition.h"
++#include "gpt.h"
+ #include "platform.h"
++#include "io_gpt.h"
+ #endif
+=20
+ #define FWU_METADATA_VERSION		2
+@@ -72,7 +74,7 @@
+ struct fwu_image_properties {
+=20
+         /* The UUID of the image in this bank */
+-        uuid_t img_uuid;
++        struct efi_guid_t img_uuid;
+=20
+         /* [0]: bit describing the image acceptance status =E2=80=93
+          * status - 1 means the image is accepted
+@@ -90,10 +92,10 @@ struct fwu_image_properties {
+ struct fwu_image_entry {
+=20
+         /* The UUID identifying the image type */
+-        uuid_t img_type_uuid;
++        struct efi_guid_t img_type_uuid;
+=20
+         /* The UUID of the storage volume where the image is located */
+-        uuid_t location_uuid;
++        struct efi_guid_t location_uuid;
+=20
+         /* The Properties of images with img_type_uuid in the different=
 FW banks */
+         struct fwu_image_properties img_props[NR_OF_FW_BANKS];
+@@ -206,99 +208,114 @@ struct __attribute__((__packed__)) fwu_esrt_data_=
wrapper {
+  * The GUIDs are generating with the UUIDv5 format.
+  * Namespace used for FVP GUIDs: 989f3a4e-46e0-4cd0-9877-a25c70c01329
+  * Namespace used for MPS3 GUIDs: df1865d1-90fb-4d59-9c38-c9f2c1bba8cc
+- * Names: the image names stated in the fw_name field
+  */
+-fwu_bank_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_BANK] =3D {
++const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_BANK] =3D {
+ #if PLATFORM_IS_FVP
+     // FVP payloads GUIDs
+-    // bl2_signed
+     {
++        .image_name =3D "bl2_secondary",
+         .image_size =3D SE_BL2_PARTITION_SIZE,
+         .image_offset =3D SE_BL2_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0xf1d883f9,
+             .time_mid =3D 0xdfeb,
+             .time_hi_and_version =3D 0x5363,
+-            .clock_seq_and_node =3D {0x98, 0xd8, 0x68, 0x6e, 0xe3, 0xb6=
, 0x9f, 0x4f}
++            .clock_seq_hi_and_reserved =3D 0x98,
++            .clock_seq_low =3D 0xd8,
++            .node =3D {0x68, 0x6e, 0xe3, 0xb6, 0x9f, 0x4f}
+         },
+     },
+-    // tfm_s_signed
+     {
++        .image_name =3D "tfm_secondary",
+         .image_size =3D TFM_PARTITION_SIZE,
+         .image_offset =3D TFM_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0x7fad470e,
+             .time_mid =3D 0x5ec5,
+             .time_hi_and_version =3D 0x5c03,
+-            .clock_seq_and_node =3D {0xa2, 0xc1, 0x47, 0x56, 0xb4, 0x95=
, 0xde, 0x61}
++            .clock_seq_hi_and_reserved =3D 0xa2,
++            .clock_seq_low =3D 0xc1,
++            .node =3D {0x47, 0x56, 0xb4, 0x95, 0xde, 0x61}
+         },
+     },
+-    // signed_fip-corstone1000
+     {
++        .image_name =3D "FIP_B",
+         .image_size =3D FIP_PARTITION_SIZE,
+         .image_offset =3D FIP_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0xf1933675,
+             .time_mid =3D 0x5a8c,
+             .time_hi_and_version =3D 0x5b6d,
+-            .clock_seq_and_node =3D {0x9e, 0xf4, 0x84, 0x67, 0x39, 0xe8=
, 0x9b, 0xc8}
++            .clock_seq_hi_and_reserved =3D 0x9e,
++            .clock_seq_low =3D 0xf4,
++            .node =3D {0x84, 0x67, 0x39, 0xe8, 0x9b, 0xc8}
+         },
+     },
+-    // Image.gz-initramfs-corstone1000-fvp
+     {
++        .image_name =3D "kernel_secondary",
+         .image_size =3D INITRAMFS_PARTITION_SIZE,
+         .image_offset =3D INITRAMFS_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0xf771aff9,
+             .time_mid =3D 0xc7e9,
+             .time_hi_and_version =3D 0x5f99,
+-            .clock_seq_and_node =3D {0x9e, 0xda, 0x23, 0x69, 0xdd, 0x69=
, 0x4f, 0x61}
++            .clock_seq_hi_and_reserved =3D 0x9e,
++            .clock_seq_low =3D 0xda,
++            .node =3D {0x23, 0x69, 0xdd, 0x69, 0x4f, 0x61}
+         },
+     },
+ #else
+     // MPS3 payloads GUIDs
+-    // bl2_signed payload GUID
+     {
++        .image_name =3D "bl2_secondary",
+         .image_size =3D SE_BL2_PARTITION_SIZE,
+         .image_offset =3D SE_BL2_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0xfbfbefaa,
+             .time_mid =3D 0x0a56,
+             .time_hi_and_version =3D 0x50d5,
+-            .clock_seq_and_node =3D {0xb6, 0x51, 0x74, 0x09, 0x1d, 0x3d=
, 0x62, 0xcf}
++            .clock_seq_hi_and_reserved =3D 0xb6,
++            .clock_seq_low =3D 0x51,
++            .node =3D {0x74, 0x09, 0x1d, 0x3d, 0x62, 0xcf}
+         },
+     },
+-    // tfm_s_signed
+     {
++        .image_name =3D "tfm_secondary",
+         .image_size =3D TFM_PARTITION_SIZE,
+         .image_offset =3D TFM_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0xaf4cc7ad,
+             .time_mid =3D 0xee2e,
+             .time_hi_and_version =3D 0x5a39,
+-            .clock_seq_and_node =3D {0xaa, 0xd5, 0xfa, 0xc8, 0xa1, 0xe6=
, 0x17, 0x3c}
+-        },
++            .clock_seq_hi_and_reserved =3D 0xaa,
++            .clock_seq_low =3D 0xd5,
++            .node =3D {0xfa, 0xc8, 0xa1, 0xe6, 0x17, 0x3c}
++        }
+     },
+-    // signed_fip-corstone1000
+     {
++        .image_name =3D "FIP_B",
+         .image_size =3D FIP_PARTITION_SIZE,
+         .image_offset =3D FIP_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0x55302f96,
+             .time_mid =3D 0xc4f0,
+             .time_hi_and_version =3D 0x5cf9,
+-            .clock_seq_and_node =3D {0x86, 0x24, 0xe7, 0xcc, 0x38, 0x8f=
, 0x2b, 0x68}
+-        },
++            .clock_seq_hi_and_reserved =3D 0x86,
++            .clock_seq_low =3D 0x24,
++            .node =3D {0xe7, 0xcc, 0x38, 0x8f, 0x2b, 0x68}
++        }
+     },
+-    // Image.gz-initramfs-corstone1000-mps3
+     {
++        .image_name =3D "kernel_secondary",
+         .image_size =3D INITRAMFS_PARTITION_SIZE,
+         .image_offset =3D INITRAMFS_PARTITION_BANK_OFFSET,
+-        .image_guid =3D {
++        .image_type =3D {
+             .time_low =3D 0x3e8ac972,
+             .time_mid =3D 0xc33c,
+             .time_hi_and_version =3D 0x5cc9,
+-            .clock_seq_and_node =3D {0x90, 0xa0, 0xcd, 0xd3, 0x15, 0x96=
, 0x83, 0xea}
++            .clock_seq_hi_and_reserved =3D 0x90,
++            .clock_seq_low =3D 0xa0,
++            .node =3D {0xcd, 0xd3, 0x15, 0x96, 0x83, 0xea}
+         },
+     },
+ #endif
+@@ -370,8 +387,8 @@ static psa_status_t private_metadata_read(
+ static psa_status_t private_metadata_read(
+         struct fwu_private_metadata* priv_metadata)
+ {
+-    partition_entry_t *part;
+-    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
++    struct partition_entry_t part;
++    struct efi_guid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
+=20
+     FWU_LOG_FUNC_ENTER;
+=20
+@@ -380,13 +397,19 @@ static psa_status_t private_metadata_read(
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+-    part =3D get_partition_entry_by_type(&private_uuid);
+-    if (!part) {
++    psa_status_t ret =3D gpt_entry_read_by_type(&private_uuid, 0, &part=
);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+         FWU_LOG_MSG("Private metadata partition not found\n\r");
+-        return PSA_ERROR_GENERIC_ERROR;
++        return ret;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s : ERROR - flash failure reading private metadat=
a\n\r", __func__);
++        return ret;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("Unable to find private metadata partition, ret: %d=
\n\r", ret);
++        return ret;
+     }
+=20
+-    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start, priv_metad=
ata,
++    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part.start * TFM_GPT_BLOCK_=
SIZE, priv_metadata,
+                                           sizeof(*priv_metadata));
+     if (ret < 0) {
+         FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
+@@ -444,8 +467,8 @@ static psa_status_t private_metadata_write(
+ static psa_status_t private_metadata_write(
+         struct fwu_private_metadata* priv_metadata)
+ {
+-    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
++    struct efi_guid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
++    struct partition_entry_t part;
+=20
+     FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
+                         priv_metadata->boot_index);
+@@ -455,19 +478,25 @@ static psa_status_t private_metadata_write(
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+-    part =3D get_partition_entry_by_type(&private_uuid);
+-    if (!part) {
++    psa_status_t ret =3D gpt_entry_read_by_type(&private_uuid, 0, &part=
);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+         FWU_LOG_MSG("Private metadata partition not found\n\r");
+-        return PSA_ERROR_GENERIC_ERROR;
++        return ret;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: ERROR - flash failure reading private metadata=
\n\r", __func__);
++        return ret;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("Unable to find private metadata partition, ret: %d=
\n\r", ret);
++        return ret;
+     }
+=20
+-    int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
++    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part.start * TFM_GPT_BLO=
CK_SIZE);
+     if (ret !=3D ARM_DRIVER_OK) {
+         FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
+         return PSA_ERROR_STORAGE_FAILURE;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part.start * TFM_GPT_BLO=
CK_SIZE,
+                                 priv_metadata, sizeof(*priv_metadata));
+     if (ret < 0) {
+         FWU_LOG_MSG("%s: ERROR - Flash write failed (ret =3D %d)\n\r", =
__func__, ret);
+@@ -494,8 +523,10 @@ static psa_status_t metadata_validate(struct fwu_me=
tadata *metadata)
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+-    uint32_t calculated_crc32 =3D crc32((uint8_t *)&(metadata->version)=
,
+-                                      sizeof(*metadata) - sizeof(uint32=
_t));
++    uint32_t calculated_crc32 =3D efi_soft_crc32_update(
++            0,
++            (uint8_t *)&(metadata->version),
++            sizeof(*metadata) - sizeof(uint32_t));
+=20
+     if (metadata->crc_32 !=3D calculated_crc32) {
+         FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\=
r", __func__,
+@@ -558,8 +589,8 @@ static psa_status_t metadata_read(struct fwu_metadat=
a *metadata, uint8_t replica
+ #else
+ static psa_status_t metadata_read(struct fwu_metadata *metadata, uint8_=
t replica_num)
+ {
+-    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
++    struct efi_guid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
++    struct partition_entry_t part;
+=20
+     FWU_LOG_FUNC_ENTER;
+=20
+@@ -568,24 +599,32 @@ static psa_status_t metadata_read(struct fwu_metad=
ata *metadata, uint8_t replica
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+-    if (replica_num =3D=3D 1) {
+-        part =3D get_partition_entry_by_type(&metadata_uuid);
+-    } else if (replica_num =3D=3D 2) {
+-        part =3D get_partition_replica_by_type(&metadata_uuid);
+-    } else {
++    psa_status_t ret;
++    switch (replica_num) {
++    case 1:
++    case 2:
++        ret =3D gpt_entry_read_by_type(&metadata_uuid, replica_num - 1,=
 &part);
++        break;
++    default:
+         FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+-    if (!part) {
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+         FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+-        return PSA_ERROR_GENERIC_ERROR;
++        return ret;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: ERROR - flash failure reading private metadata=
\n\r", __func__);
++        return ret;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("%s: Unable to find FWU partition, ret: %d\n\r", __=
func__, ret);
++        return ret;
+     }
+=20
+     FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(*metadata));
++                  part.start * TFM_GPT_BLOCK_SIZE, sizeof(*metadata));
+=20
+-    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
++    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part.start * TFM_GPT_BLOCK_=
SIZE,
+                                 metadata, sizeof(*metadata));
+     if (ret < 0) {
+         FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
+@@ -663,8 +702,8 @@ static psa_status_t metadata_write(
+ static psa_status_t metadata_write(
+                         struct fwu_metadata *metadata, uint8_t replica_=
num)
+ {
+-    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
++    struct efi_guid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
++    struct partition_entry_t part;
+=20
+     FWU_LOG_FUNC_ENTER;
+=20
+@@ -673,30 +712,38 @@ static psa_status_t metadata_write(
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+-    if (replica_num =3D=3D 1) {
+-        part =3D get_partition_entry_by_type(&metadata_uuid);
+-    } else if (replica_num =3D=3D 2) {
+-        part =3D get_partition_replica_by_type(&metadata_uuid);
+-    } else {
++    psa_status_t ret;
++    switch (replica_num) {
++    case 1:
++    case 2:
++        ret =3D gpt_entry_read_by_type(&metadata_uuid, replica_num - 1,=
 &part);
++        break;
++    default:
+         FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+-    if (!part) {
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
+         FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+-        return PSA_ERROR_GENERIC_ERROR;
++        return ret;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: ERROR - flash failure reading private metadata=
\n\r", __func__);
++        return PSA_ERROR_STORAGE_FAILURE;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("%s: Unable to find FWU partition, ret: %d\n\r", __=
func__, ret);
++        return ret;
+     }
+=20
+     FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(*metadata));
++                  part.start * TFM_GPT_BLOCK_SIZE, sizeof(*metadata));
+=20
+-    int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
++    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part.start * TFM_GPT_BLO=
CK_SIZE);
+     if (ret !=3D ARM_DRIVER_OK) {
+         FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
+         return PSA_ERROR_STORAGE_FAILURE;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part.start * TFM_GPT_BLO=
CK_SIZE,
+                                 metadata, sizeof(*metadata));
+     if (ret < 0) {
+         FWU_LOG_MSG("%s: ERROR - Flash write failed (ret =3D %d)\n\r", =
__func__, ret);
+@@ -733,8 +780,41 @@ static psa_status_t metadata_write_both_replica(
+     return PSA_SUCCESS;
+ }
+=20
++#ifndef BL1_BUILD
++/* Ensure both GPT headers are valid */
++psa_status_t ensure_gpt_headers_valid(void)
++{
++    psa_status_t ret =3D gpt_validate(true);
++    if (ret =3D=3D PSA_ERROR_INVALID_SIGNATURE) {
++        ret =3D gpt_restore(true);
++        if (ret =3D=3D PSA_ERROR_INVALID_SIGNATURE) {
++            FWU_LOG_MSG("Invalid primary GPT\r\n");
++            return ret;
++        }
++    }
++
++    ret =3D gpt_validate(false);
++    if (ret =3D=3D PSA_ERROR_INVALID_SIGNATURE) {
++        ret =3D gpt_restore(false);
++        if (ret =3D=3D PSA_ERROR_INVALID_SIGNATURE) {
++            FWU_LOG_MSG("Invalid primary GPT\r\n");
++            return ret;
++        }
++    }
++
++    return PSA_SUCCESS;
++}
++#endif /* BL1_BUILD */
++
+ psa_status_t fwu_metadata_check_and_correct_integrity(void)
+ {
++#ifndef BL1_BUILD
++    psa_status_t ret =3D ensure_gpt_headers_valid();
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++#endif
++
+     psa_status_t ret_replica_1 =3D PSA_ERROR_GENERIC_ERROR;
+     psa_status_t ret_replica_2 =3D PSA_ERROR_GENERIC_ERROR;
+=20
+@@ -760,14 +840,22 @@ psa_status_t fwu_metadata_init(void)
+     psa_status_t ret;
+     ARM_FLASH_INFO* flash_info;
+=20
++    if (is_initialized) {
++        return PSA_SUCCESS;
++    }
++
+ #ifndef BL1_BUILD
+     plat_io_storage_init();
+-    partition_init(PLATFORM_GPT_IMAGE);
+-#endif
++    ret =3D gpt_init(&io_gpt_flash_driver, PLAT_MAX_PARTITION_ENTRIES);
++    if (ret < 0) {
++        return ret;
++    }
+=20
+-    if (is_initialized) {
+-        return PSA_SUCCESS;
++    ret =3D ensure_gpt_headers_valid();
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
+     }
++#endif
+=20
+     /* Code assumes everything fits into a sector */
+     if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
+@@ -830,17 +918,19 @@ static psa_status_t fwu_metadata_configure(void)
+=20
+         _metadata.fw_desc.img_entry[i].img_props[BANK_0].accepted =3D I=
MAGE_ACCEPTED;
+         _metadata.fw_desc.img_entry[i].img_props[BANK_0].version =3D im=
age_version;
+-        memcpy(&(_metadata.fw_desc.img_entry[i].img_props[BANK_0].img_u=
uid), (const void *)&fwu_image[i].image_guid, sizeof(struct efi_guid));
++        memcpy(&(_metadata.fw_desc.img_entry[i].img_props[BANK_0].img_u=
uid), (const void *)&fwu_image[i].image_type, sizeof(struct efi_guid_t));
+=20
+         _metadata.fw_desc.img_entry[i].img_props[BANK_1].accepted =3D I=
NVALID_IMAGE;
+         _metadata.fw_desc.img_entry[i].img_props[BANK_1].version =3D IN=
VALID_VERSION;
+-        memcpy(&(_metadata.fw_desc.img_entry[i].img_props[BANK_1].img_u=
uid), (const void *)&fwu_image[i].image_guid, sizeof(struct efi_guid));
++        memcpy(&(_metadata.fw_desc.img_entry[i].img_props[BANK_1].img_u=
uid), (const void *)&fwu_image[i].image_type, sizeof(struct efi_guid_t));
+     }
+=20
+     /* Calculate CRC32 for fwu metadata. The first filed in the _metada=
ta has to be the crc_32.
+      * This should be omited from the calculation. */
+-    _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
+-                             sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
++    _metadata.crc_32 =3D efi_soft_crc32_update(
++            0,
++            (uint8_t *)&_metadata.version,
++            sizeof(struct fwu_metadata) - sizeof(uint32_t));
+=20
+     ret =3D metadata_write_both_replica(&_metadata);
+     if (ret) {
+@@ -1045,8 +1135,10 @@ static psa_status_t fwu_select_previous(
+     if (ret) {
+         return ret;
+     }
+-    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++    metadata->crc_32 =3D efi_soft_crc32_update(
++            0,
++            (uint8_t *)&metadata->version,
++            sizeof(struct fwu_metadata) - sizeof(uint32_t));
+=20
+     ret =3D metadata_write_both_replica(metadata);
+     if (ret) {
+@@ -1243,7 +1335,7 @@ psa_status_t corstone1000_fwu_host_ack(void)
+         ret =3D PSA_SUCCESS; /* nothing to be done */
+=20
+         for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-                fmp_set_image_info(&fwu_image[i].image_guid,
++                fmp_set_image_info(&fwu_image[i].image_type,
+                         priv_metadata.fmp_version[i],
+                         priv_metadata.fmp_last_attempt_version[i],
+                         priv_metadata.fmp_last_attempt_status[i]);
+@@ -1274,7 +1366,7 @@ psa_status_t corstone1000_fwu_host_ack(void)
+     if (ret =3D=3D PSA_SUCCESS) {
+         disable_host_ack_timer();
+         for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-            fmp_set_image_info(&fwu_image[i].image_guid,
++            fmp_set_image_info(&fwu_image[i].image_type,
+                     priv_metadata.fmp_version[i],
+                     priv_metadata.fmp_last_attempt_version[i],
+                     priv_metadata.fmp_last_attempt_status[i]);
+@@ -1428,7 +1520,7 @@ static psa_status_t get_esrt_data(struct fwu_esrt_=
data_wrapper *esrt)
+=20
+     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++)
+     {
+-        memcpy(&esrt->entries[i].fw_class, &fwu_image[i].image_guid, si=
zeof(struct efi_guid));
++        memcpy(&esrt->entries[i].fw_class, &fwu_image[i].image_type, si=
zeof(struct efi_guid_t));
+         esrt->entries[i].fw_version =3D priv_metadata.fmp_version[i];
+         esrt->entries[i].lowest_supported_fw_version =3D FWU_IMAGE_INIT=
IAL_VERSION;
+         esrt->entries[i].last_attempt_version =3D priv_metadata.fmp_las=
t_attempt_version[i];
+@@ -1491,8 +1583,10 @@ static psa_status_t fwu_accept_image(struct fwu_m=
etadata *metadata,
+     if (ret) {
+         return ret;
+     }
+-    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++    metadata->crc_32 =3D efi_soft_crc32_update(
++            0,
++            (uint8_t *)&metadata->version,
++            sizeof(struct fwu_metadata) - sizeof(uint32_t));
+=20
+     ret =3D metadata_write_both_replica(metadata);
+     if (ret) {
+@@ -1658,9 +1752,7 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+     psa_status_t ret;
+     int drv_ret;
+     int image_index;
+-    uint32_t bank_offset;
+     uint32_t active_index;
+-    uint32_t previous_active_index;
+     uint32_t nr_images;
+     uint32_t current_state;
+     uint32_t image_offset;
+@@ -1717,7 +1809,7 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+         priv_metadata.fmp_last_attempt_status[fwu_image_index] =3D LAST=
_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL;
+         private_metadata_write(&priv_metadata);
+=20
+-        fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++        fmp_set_image_info(&fwu_image[fwu_image_index].image_type,
+                 priv_metadata.fmp_version[fwu_image_index],
+                 priv_metadata.fmp_last_attempt_version[fwu_image_index]=
,
+                 priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
+@@ -1727,11 +1819,11 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_c=
omponent_t component,
+         goto out;
+     }
+=20
++#ifdef BL1_BUILD
++    uint32_t bank_offset;
+     if (active_index =3D=3D BANK_0) {
+-        previous_active_index =3D BANK_1;
+         bank_offset =3D BANK_1_PARTITION_OFFSET;
+     } else if (active_index =3D=3D BANK_1) {
+-        previous_active_index =3D BANK_0;
+         bank_offset =3D BANK_0_PARTITION_OFFSET;
+     } else {
+         FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+@@ -1740,6 +1832,38 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_co=
mponent_t component,
+     }
+=20
+     image_offset =3D bank_offset + fwu_image[fwu_image_index].image_off=
set;
++#else
++    uint32_t previous_active_index;
++    struct partition_entry_t part;
++
++    if (active_index =3D=3D BANK_0) {
++        previous_active_index =3D BANK_1;
++    } else if (active_index =3D=3D BANK_1) {
++        previous_active_index =3D BANK_0;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        ret =3D PSA_ERROR_DATA_INVALID;
++        goto out;
++    }
++
++    ret =3D gpt_entry_read_by_type(&(fwu_image[fwu_image_index].image_t=
ype), 1, &part);
++
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        FWU_LOG_MSG("%s: Partition '%s' not found\n\r",
++                __func__, fwu_image[fwu_image_index].image_names[previo=
us_active_index]);
++        goto out;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s : ERROR - flash failure reading partition '%s'\=
n\r",
++                __func__, fwu_image[fwu_image_index].image_names[previo=
us_active_index]);
++        goto out;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("Unable to find partition '%s', ret: %d\n\r",
++                fwu_image[fwu_image_index].image_names[previous_active_=
index], ret);
++        goto out;
++    }
++
++    image_offset =3D part.start * TFM_GPT_BLOCK_SIZE;
++#endif /* BL1_BUILD */
+=20
+     /* Firmware update process can only start in regular state. */
+     current_state =3D get_fwu_image_state(&_metadata, &priv_metadata, f=
wu_image_index);
+@@ -1762,7 +1886,7 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+=20
+         private_metadata_write(&priv_metadata);
+=20
+-        fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++        fmp_set_image_info(&fwu_image[fwu_image_index].image_type,
+                 priv_metadata.fmp_version[fwu_image_index],
+                 priv_metadata.fmp_last_attempt_version[fwu_image_index]=
,
+                 priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
+@@ -1828,8 +1952,10 @@ static psa_status_t fwu_update_metadata(const psa=
_fwu_component_t *candidates, u
+         _metadata.fw_desc.img_entry[fwu_image_index].img_props[previous=
_active_index].version =3D fmp_header_image_info[fwu_image_index].fmp_hdr=
.fw_version;
+     }
+=20
+-    _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++    _metadata.crc_32 =3D efi_soft_crc32_update(
++            0,
++            (uint8_t *)&_metadata.version,
++            sizeof(struct fwu_metadata) - sizeof(uint32_t));
+=20
+     ret =3D metadata_write_both_replica(&_metadata);
+     if (ret) {
+@@ -1960,8 +2086,10 @@ static psa_status_t maintain_bank_consistency(voi=
d)
+             goto out;
+         }
+=20
+-        _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
+-                                  sizeof(struct fwu_metadata) - sizeof(=
uint32_t));
++        _metadata.crc_32 =3D efi_soft_crc32_update(
++                0,
++                (uint8_t *)&_metadata.version,
++                sizeof(struct fwu_metadata) - sizeof(uint32_t));
+=20
+         ret =3D metadata_write_both_replica(&_metadata);
+         if (ret) {
+@@ -2057,7 +2185,7 @@ psa_status_t fwu_bootloader_mark_image_accepted(co=
nst psa_fwu_component_t *trial
+=20
+         current_state =3D get_fwu_image_state(&_metadata, &priv_metadat=
a, fwu_image_index);
+         if (current_state =3D=3D PSA_FWU_READY) {
+-            fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++            fmp_set_image_info(&fwu_image[fwu_image_index].image_type,
+                     priv_metadata.fmp_version[fwu_image_index],
+                     priv_metadata.fmp_last_attempt_version[fwu_image_in=
dex],
+                     priv_metadata.fmp_last_attempt_status[fwu_image_ind=
ex]);
+@@ -2091,7 +2219,7 @@ psa_status_t fwu_bootloader_mark_image_accepted(co=
nst psa_fwu_component_t *trial
+             }
+=20
+             fwu_image_index =3D trials[i] - FWU_FAKE_IMAGES_INDEX_COUNT=
;
+-            fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++            fmp_set_image_info(&fwu_image[fwu_image_index].image_type,
+                     priv_metadata.fmp_version[fwu_image_index],
+                     priv_metadata.fmp_last_attempt_version[fwu_image_in=
dex],
+                     priv_metadata.fmp_last_attempt_status[fwu_image_ind=
ex]);
+@@ -2107,7 +2235,6 @@ out:
+ /* Reject the staged image. */
+ psa_status_t fwu_bootloader_reject_staged_image(psa_fwu_component_t com=
ponent)
+ {
+-
+     if (!is_image_index_valid(component)) {
+         FWU_LOG_MSG("%s: Invalid image index received \n\r", __func__);
+         return PSA_ERROR_INVALID_ARGUMENT;
+@@ -2224,7 +2351,6 @@ psa_status_t fwu_bootloader_get_image_info(psa_fwu=
_component_t component,
+=20
+     FWU_LOG_FUNC_ENTER;
+=20
+-
+     Select_Write_Mode_For_Shared_Flash();
+     if (private_metadata_read(&priv_metadata)) {
+         ret =3D PSA_ERROR_GENERIC_ERROR;
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uef=
i_fmp.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fm=
p.c
+index 3edd4ebd0..c41b1f9ea 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
+@@ -10,6 +10,7 @@
+ #include "tfm_hal_device_header.h"
+ #include "uefi_fmp.h"
+ #include "flash_layout.h"
++#include "efi_guid_structs.h"
+=20
+ /* The count will increase when partial update is supported.
+  * At present, only full WIC is considered as updatable image.
+@@ -45,7 +46,7 @@ typedef uint8_t DescriptorCount_t;
+=20
+ typedef __PACKED_STRUCT {
+     uint8_t ImageIndex;
+-    struct efi_guid ImageTypeId;
++    struct efi_guid_t ImageTypeId;
+     uint64_t ImageId;
+     uefi_ptr_t PtrImageIdName;
+     uint32_t Version;
+@@ -101,7 +102,7 @@ struct corstone_image_info image_info[NUMBER_OF_FMP_=
IMAGES] =3D {
+ };
+ static EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO fmp_info[NUMBER_OF_F=
MP_IMAGES];
+=20
+-extern fwu_bank_image_info_t fwu_image[];
++extern const fwu_image_info_t fwu_image[];
+=20
+ static bool is_fmp_info_initialized =3D false;
+=20
+@@ -127,8 +128,8 @@ static void init_fmp_info(void)
+=20
+         fmp_info[i].ImageDescriptor.ImageIndex =3D i+1;
+=20
+-        memcpy(&fmp_info[i].ImageDescriptor.ImageTypeId, &fwu_image[i].=
image_guid,
+-                sizeof(struct efi_guid));
++        memcpy(&fmp_info[i].ImageDescriptor.ImageTypeId, &fwu_image[i].=
image_type,
++                sizeof(struct efi_guid_t));
+=20
+         fmp_info[i].ImageDescriptor.ImageId =3D i+1;
+         fmp_info[i].ImageDescriptor.Version =3D FWU_IMAGE_INITIAL_VERSI=
ON;
+@@ -150,7 +151,7 @@ static void init_fmp_info(void)
+     return;
+ }
+=20
+-psa_status_t fmp_set_image_info(struct efi_guid *guid,
++psa_status_t fmp_set_image_info(const struct efi_guid_t *guid,
+                      uint32_t current_version, uint32_t attempt_version=
,
+                      uint32_t last_attempt_status)
+ {
+@@ -164,7 +165,7 @@ psa_status_t fmp_set_image_info(struct efi_guid *gui=
d,
+=20
+     for (int i =3D 0; i < NUMBER_OF_FMP_IMAGES; i++) {
+         if ((memcmp(guid, &fmp_info[i].ImageDescriptor.ImageTypeId,
+-                        sizeof(struct efi_guid))) =3D=3D 0)
++                        sizeof(struct efi_guid_t))) =3D=3D 0)
+         {
+             FWU_LOG_MSG("FMP image update: image id =3D %u\n\r",
+                                     fmp_info[i].ImageDescriptor.ImageId=
);
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h =
b/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
+index 36c604714..e185448ef 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
++++ b/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
+@@ -11,7 +11,6 @@
+=20
+ #include <stdint.h>
+ #include "fwu_agent.h"
+-#include "../fip_parser/external/uuid.h"
+=20
+ /*
+  * Last Attempt Status Value
+@@ -40,7 +39,7 @@
+  * attempt_version: attempted versions for the image
+  *
+  */
+-psa_status_t fmp_set_image_info(struct efi_guid *guid,
++psa_status_t fmp_set_image_info(const struct efi_guid_t *guid,
+                      uint32_t current_version, uint32_t attempt_version=
,
+                      uint32_t last_attempt_status);
+=20
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/CM=
akeLists.txt b/platform/ext/target/arm/corstone1000/ci_regression_tests/C=
MakeLists.txt
+index 3b023c813..e92723026 100644
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeList=
s.txt
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeList=
s.txt
+@@ -9,26 +9,18 @@
+=20
+ cmake_policy(SET CMP0079 NEW)
+=20
+-include(${CMAKE_CURRENT_SOURCE_DIR}/s_test_config.cmake)
+-
+ ####################### Secure ########################################=
#########
+=20
+ target_sources(tfm_test_suite_extra_s
+     PRIVATE
+         ${CMAKE_CURRENT_SOURCE_DIR}/s_test.c
+         ../Native_Driver/firewall.c
+-        ../io/io_storage.c
+-        ../io/io_block.c
+-        ../io/io_flash.c
+-        Driver_Flash_SRAM_Emu.c
+-        s_io_storage_test.c
+ )
+=20
+ target_include_directories(tfm_test_suite_extra_s
+     PRIVATE
+         ../Device/Include
+         ../Native_Driver
+-        ../io
+ )
+=20
+ target_link_libraries(tfm_test_suite_extra_s
+@@ -39,10 +31,6 @@ target_link_libraries(tfm_test_suite_extra_s
+ target_compile_definitions(tfm_test_suite_extra_s
+     PRIVATE
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+-        TEST_FLASH_SIZE_IN_BYTES=3D${TEST_FLASH_SIZE_IN_BYTES}
+-        TEST_FLASH_SECTOR_SIZE_IN_BYTES=3D${TEST_FLASH_SECTOR_SIZE_IN_B=
YTES}
+-        TEST_FLASH_PAGE_SIZE=3D${TEST_FLASH_PAGE_SIZE}
+-        TEST_FLASH_PROGRAM_UNIT=3D${TEST_FLASH_PROGRAM_UNIT}
+ )
+=20
+ target_compile_options(tfm_test_suite_extra_s PRIVATE -Wno-int-conversi=
on)
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/Dr=
iver_Flash_SRAM_Emu.c b/platform/ext/target/arm/corstone1000/ci_regressio=
n_tests/Driver_Flash_SRAM_Emu.c
+deleted file mode 100644
+index 06b6b51c0..000000000
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Fl=
ash_SRAM_Emu.c
++++ /dev/null
+@@ -1,327 +0,0 @@
+-/*
+- * Copyright (c) 2013-2022 ARM Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#include <string.h>
+-#include <stdint.h>
+-#include "Driver_Flash.h"
+-#include "test_flash.h"
+-#include "tfm_sp_log.h"
+-
+-#ifndef ARG_UNUSED
+-#define ARG_UNUSED(arg)  ((void)arg)
+-#endif
+-
+-/* Driver version */
+-#define ARM_FLASH_DRV_VERSION      ARM_DRIVER_VERSION_MAJOR_MINOR(1, 1)
+-#define ARM_FLASH_DRV_ERASE_VALUE  0xFF
+-
+-
+-/**
+- * There is no real flash memory. This driver just emulates a flash
+- * interface and behaviour on top of the SRAM memory.
+- */
+-
+-/**
+- * Data width values for ARM_FLASH_CAPABILITIES::data_width
+- * \ref ARM_FLASH_CAPABILITIES
+- */
+- enum {
+-    DATA_WIDTH_8BIT   =3D 0u,
+-    DATA_WIDTH_16BIT,
+-    DATA_WIDTH_32BIT,
+-    DATA_WIDTH_ENUM_SIZE
+-};
+-
+-static const uint32_t data_width_byte[DATA_WIDTH_ENUM_SIZE] =3D {
+-    sizeof(uint8_t),
+-    sizeof(uint16_t),
+-    sizeof(uint32_t),
+-};
+-
+-
+-/*
+- * ARM FLASH device structure
+- *
+- */
+-struct arm_flash_dev_t {
+-    const uint8_t* memory_base;   /*!< FLASH memory base address */
+-    ARM_FLASH_INFO *data;         /*!< FLASH data */
+-};
+-
+-/* Flash emulated memory */
+-static uint8_t flash_memory[TEST_FLASH_SIZE_IN_BYTES]
+-    __attribute__((aligned(TEST_FLASH_SECTOR_SIZE_IN_BYTES)));
+-
+-/* Flash Status */
+-static ARM_FLASH_STATUS FlashStatus =3D {0, 0, 0};
+-
+-/* Driver Version */
+-static const ARM_DRIVER_VERSION DriverVersion =3D {
+-    ARM_FLASH_API_VERSION,
+-    ARM_FLASH_DRV_VERSION
+-};
+-
+-/* Driver Capabilities */
+-static const ARM_FLASH_CAPABILITIES DriverCapabilities =3D {
+-    0, /* event_ready */
+-    0, /* data_width =3D 0:8-bit, 1:16-bit, 2:32-bit */
+-    1  /* erase_chip */
+-};
+-
+-static int32_t is_range_valid(struct arm_flash_dev_t *flash_dev,
+-                              uint32_t offset)
+-{
+-    uint32_t flash_limit =3D 0;
+-    int32_t rc =3D 0;
+-
+-    flash_limit =3D (flash_dev->data->sector_count * flash_dev->data->s=
ector_size);
+-    if (offset > flash_limit) {
+-        rc =3D -1;
+-    }
+-    return rc;
+-}
+-
+-static int32_t is_write_aligned(struct arm_flash_dev_t *flash_dev,
+-                                uint32_t param)
+-{
+-    int32_t rc =3D 0;
+-
+-    if ((param % flash_dev->data->program_unit) !=3D 0) {
+-        rc =3D -1;
+-    }
+-    return rc;
+-}
+-
+-static int32_t is_sector_aligned(struct arm_flash_dev_t *flash_dev,
+-                                 uint32_t offset)
+-{
+-    int32_t rc =3D 0;
+-
+-    if ((offset % flash_dev->data->sector_size) !=3D 0) {
+-        rc =3D -1;
+-    }
+-    return rc;
+-}
+-
+-static int32_t is_flash_ready_to_write(const uint8_t *start_addr, uint3=
2_t cnt)
+-{
+-    int32_t rc =3D 0;
+-    uint32_t i;
+-
+-    for (i =3D 0; i < cnt; i++) {
+-        if(start_addr[i] !=3D ARM_FLASH_DRV_ERASE_VALUE) {
+-            rc =3D -1;
+-            break;
+-        }
+-    }
+-
+-    return rc;
+-}
+-
+-static ARM_FLASH_INFO ARM_TEST_FLASH_DEV_DATA =3D {
+-    .sector_info  =3D NULL,/* Uniform sector layout */
+-    .sector_count =3D TEST_FLASH_SIZE_IN_BYTES / TEST_FLASH_SECTOR_SIZE=
_IN_BYTES,
+-    .sector_size  =3D TEST_FLASH_SECTOR_SIZE_IN_BYTES,
+-    .page_size    =3D TEST_FLASH_PAGE_SIZE,
+-    .program_unit =3D TEST_FLASH_PROGRAM_UNIT,
+-    .erased_value =3D ARM_FLASH_DRV_ERASE_VALUE};
+-
+-static struct arm_flash_dev_t ARM_TEST_FLASH_DEV =3D {
+-    .memory_base =3D flash_memory,
+-    .data        =3D &(ARM_TEST_FLASH_DEV_DATA)};
+-
+-static struct arm_flash_dev_t *TEST_FLASH_DEV =3D &ARM_TEST_FLASH_DEV;
+-
+-/*
+- * Functions
+- */
+-
+-static ARM_DRIVER_VERSION ARM_Flash_GetVersion(void)
+-{
+-    return DriverVersion;
+-}
+-
+-static ARM_FLASH_CAPABILITIES ARM_Flash_GetCapabilities(void)
+-{
+-    return DriverCapabilities;
+-}
+-
+-static int32_t ARM_Flash_Initialize(ARM_Flash_SignalEvent_t cb_event)
+-{
+-    ARG_UNUSED(cb_event);
+-
+-    if (DriverCapabilities.data_width >=3D DATA_WIDTH_ENUM_SIZE) {
+-        return ARM_DRIVER_ERROR;
+-    }
+-
+-    /* Nothing to be done */
+-    return ARM_DRIVER_OK;
+-}
+-
+-static int32_t ARM_Flash_Uninitialize(void)
+-{
+-    /* Nothing to be done */
+-    return ARM_DRIVER_OK;
+-}
+-
+-static int32_t ARM_Flash_PowerControl(ARM_POWER_STATE state)
+-{
+-    switch (state) {
+-    case ARM_POWER_FULL:
+-        /* Nothing to be done */
+-        return ARM_DRIVER_OK;
+-        break;
+-
+-    case ARM_POWER_OFF:
+-    case ARM_POWER_LOW:
+-    default:
+-        return ARM_DRIVER_ERROR_UNSUPPORTED;
+-    }
+-}
+-
+-static int32_t ARM_Flash_ReadData(uint32_t addr, void *data, uint32_t c=
nt)
+-{
+-    int32_t rc =3D 0;
+-
+-    /* The addr given is a relative address*/
+-    uint32_t offset =3D addr;
+-    addr +=3D (uint32_t)(TEST_FLASH_DEV->memory_base);
+-
+-    /* Conversion between data items and bytes */
+-    cnt *=3D data_width_byte[DriverCapabilities.data_width];
+-
+-    /* Check flash memory boundaries */
+-    rc =3D is_range_valid(TEST_FLASH_DEV, offset + cnt);
+-    if (rc !=3D 0) {
+-        return ARM_DRIVER_ERROR_PARAMETER;
+-    }
+-
+-    /* Flash interface just emulated over SRAM, use memcpy */
+-    memcpy(data, (void *)addr, cnt);
+-
+-    /* Conversion between bytes and data items */
+-    cnt /=3D data_width_byte[DriverCapabilities.data_width];
+-
+-    return cnt;
+-}
+-
+-static int32_t ARM_Flash_ProgramData(uint32_t addr, const void *data,
+-                                     uint32_t cnt)
+-{
+-    int32_t rc =3D 0;
+-
+-    /* The addr given is a relative address*/
+-    uint32_t offset =3D addr;
+-    addr +=3D (uint32_t)(TEST_FLASH_DEV->memory_base);
+-
+-    /* Conversion between data items and bytes */
+-    cnt *=3D data_width_byte[DriverCapabilities.data_width];
+-
+-    /* Check flash memory boundaries and alignment with minimal write s=
ize */
+-    rc  =3D is_range_valid(TEST_FLASH_DEV, offset + cnt);
+-    rc |=3D is_write_aligned(TEST_FLASH_DEV, offset);
+-    rc |=3D is_write_aligned(TEST_FLASH_DEV, cnt);
+-    if (rc !=3D 0) {
+-        return ARM_DRIVER_ERROR_PARAMETER;
+-    }
+-
+-    /* Check if the flash area to write the data was erased previously =
*/
+-    rc =3D is_flash_ready_to_write((const uint8_t*)addr, cnt);
+-    if (rc !=3D 0) {
+-        return ARM_DRIVER_ERROR;
+-    }
+-
+-    /* Flash interface just emulated over SRAM, use memcpy */
+-    memcpy((void *)addr, data, cnt);
+-
+-    /* Conversion between bytes and data items */
+-    cnt /=3D data_width_byte[DriverCapabilities.data_width];
+-
+-    return cnt;
+-}
+-
+-static int32_t ARM_Flash_EraseSector(uint32_t addr)
+-{
+-    uint32_t rc =3D 0;
+-
+-    /* The addr given is a relative address*/
+-    uint32_t offset =3D addr;
+-    addr +=3D (uint32_t)(TEST_FLASH_DEV->memory_base);
+-
+-    rc  =3D is_range_valid(TEST_FLASH_DEV, offset);
+-    rc |=3D is_sector_aligned(TEST_FLASH_DEV, offset);
+-    if (rc !=3D 0) {
+-        return ARM_DRIVER_ERROR_PARAMETER;
+-    }
+-
+-    /* Flash interface just emulated over SRAM, use memset */
+-    memset((void *)addr,
+-           TEST_FLASH_DEV->data->erased_value,
+-           TEST_FLASH_DEV->data->sector_size);
+-    return ARM_DRIVER_OK;
+-}
+-
+-static int32_t ARM_Flash_EraseChip(void)
+-{
+-    uint32_t i;
+-    uint32_t addr =3D TEST_FLASH_DEV->memory_base;
+-    int32_t rc =3D ARM_DRIVER_ERROR_UNSUPPORTED;
+-
+-    /* Check driver capability erase_chip bit */
+-    if (DriverCapabilities.erase_chip =3D=3D 1) {
+-        for (i =3D 0; i < TEST_FLASH_DEV->data->sector_count; i++) {
+-            /* Flash interface just emulated over SRAM, use memset */
+-            memset((void *)addr,
+-                   TEST_FLASH_DEV->data->erased_value,
+-                   TEST_FLASH_DEV->data->sector_size);
+-
+-            addr +=3D TEST_FLASH_DEV->data->sector_size;
+-            rc =3D ARM_DRIVER_OK;
+-        }
+-    }
+-    return rc;
+-}
+-
+-static ARM_FLASH_STATUS ARM_Flash_GetStatus(void)
+-{
+-    return FlashStatus;
+-}
+-
+-static ARM_FLASH_INFO * ARM_Flash_GetInfo(void)
+-{
+-    return TEST_FLASH_DEV->data;
+-}
+-
+-
+-/* Global Variables */
+-
+-ARM_DRIVER_FLASH Driver_TEST_FLASH =3D {
+-    ARM_Flash_GetVersion,
+-    ARM_Flash_GetCapabilities,
+-    ARM_Flash_Initialize,
+-    ARM_Flash_Uninitialize,
+-    ARM_Flash_PowerControl,
+-    ARM_Flash_ReadData,
+-    ARM_Flash_ProgramData,
+-    ARM_Flash_EraseSector,
+-    ARM_Flash_EraseChip,
+-    ARM_Flash_GetStatus,
+-    ARM_Flash_GetInfo
+-};
+-
+-uintptr_t flash_base_address =3D flash_memory;
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
io_storage_test.c b/platform/ext/target/arm/corstone1000/ci_regression_te=
sts/s_io_storage_test.c
+deleted file mode 100644
+index fb589c9d2..000000000
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_stor=
age_test.c
++++ /dev/null
+@@ -1,147 +0,0 @@
+-/*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#include <string.h>
+-#include "s_io_storage_test.h"
+-#include "Driver_Flash.h"
+-#include "flash_layout.h"
+-#include "io_block.h"
+-#include "io_driver.h"
+-#include "io_flash.h"
+-#include "tfm_sp_log.h"
+-
+-#define ARRAY_LENGTH(array) (sizeof(array) / sizeof(*(array)))
+-
+-extern ARM_DRIVER_FLASH Driver_FLASH0;
+-extern ARM_DRIVER_FLASH Driver_TEST_FLASH;
+-extern uintptr_t flash_base_address;
+-
+-void s_test_io_storage_multiple_flash_simultaneous(struct test_result_t=
 *ret) {
+-    /* FLASH0 */
+-    static io_dev_connector_t* flash0_dev_con;
+-    static uint8_t local_block_flash0[FLASH_SECTOR_SIZE];
+-    ARM_FLASH_INFO* flash0_info =3D Driver_FLASH0.GetInfo();
+-    size_t flash0_block_size =3D flash0_info->sector_size;
+-    io_flash_dev_spec_t flash0_dev_spec =3D {
+-        .buffer =3D local_block_flash0,
+-        .bufferlen =3D flash0_block_size,
+-        .base_addr =3D FLASH_BASE_ADDRESS,
+-        .flash_driver =3D &Driver_FLASH0,
+-    };
+-    io_block_spec_t flash0_spec =3D {
+-        .offset =3D FLASH_BASE_ADDRESS,
+-        .length =3D flash0_info->sector_count * flash0_info->sector_siz=
e};
+-    uintptr_t flash0_dev_handle =3D NULL;
+-    uintptr_t flash0_handle =3D NULL;
+-
+-    /* EMU TEST FLASH */
+-    static io_dev_connector_t* flash_emu_dev_con;
+-    static uint8_t local_block_flash_emu[TEST_FLASH_SECTOR_SIZE_IN_BYTE=
S]
+-        __attribute__((aligned(TEST_FLASH_SECTOR_SIZE_IN_BYTES)));
+-    ARM_FLASH_INFO* flash_emu_info =3D Driver_TEST_FLASH.GetInfo();
+-    size_t flash_emu_block_size =3D flash_emu_info->sector_size;
+-    io_flash_dev_spec_t flash_emu_dev_spec =3D {
+-        .buffer =3D local_block_flash_emu,
+-        .bufferlen =3D flash_emu_block_size,
+-        .base_addr =3D flash_base_address,
+-        .flash_driver =3D &Driver_TEST_FLASH,
+-    };
+-    io_block_spec_t flash_emu_spec =3D {
+-        .offset =3D flash_base_address,
+-        .length =3D flash_emu_info->sector_count * flash_emu_info->sect=
or_size};
+-    uintptr_t flash_emu_dev_handle =3D NULL;
+-    uintptr_t flash_emu_handle =3D NULL;
+-
+-    /* Common */
+-    int rc =3D -1;
+-    static uint8_t test_data[] =3D {0xEE, 0xDD, 0xCC, 0xBB, 0xAA,
+-                                  0x10, 0x50, 0xA0, 0xD0, 0x51,
+-                                  0x55, 0x44, 0x33, 0x22, 0x11};
+-    static uint8_t actual_data[15];
+-    size_t bytes_written_count =3D 0;
+-    size_t bytes_read_count =3D 0;
+-
+-    memset(local_block_flash0, -1, sizeof(local_block_flash0));
+-    memset(local_block_flash_emu, -1, sizeof(local_block_flash_emu));
+-
+-    /* Register */
+-    register_io_dev_flash(&flash0_dev_con);
+-    register_io_dev_flash(&flash_emu_dev_con);
+-
+-    io_dev_open(flash0_dev_con, &flash0_dev_spec, &flash0_dev_handle);
+-    io_dev_open(flash_emu_dev_con, &flash_emu_dev_spec, &flash_emu_dev_=
handle);
+-
+-    /* Write Data */
+-    io_open(flash0_dev_handle, &flash0_spec, &flash0_handle);
+-    io_open(flash_emu_dev_handle, &flash_emu_spec, &flash_emu_handle);
+-
+-    io_seek(flash0_handle, IO_SEEK_SET,
+-            BANK_1_PARTITION_OFFSET + flash0_info->sector_size - 7);
+-    io_seek(flash_emu_handle, IO_SEEK_SET, flash_emu_info->sector_size =
- 7);
+-
+-    io_write(flash0_handle, test_data, ARRAY_LENGTH(test_data),
+-             &bytes_written_count);
+-    if (bytes_written_count !=3D ARRAY_LENGTH(test_data)) {
+-        LOG_ERRFMT("io_write failed to write %d bytes for flash0",
+-                   ARRAY_LENGTH(test_data));
+-        LOG_ERRFMT("bytes_written_count %d for flash0", bytes_written_c=
ount);
+-        ret->val =3D TEST_FAILED;
+-    }
+-    io_write(flash_emu_handle, test_data, ARRAY_LENGTH(test_data),
+-             &bytes_written_count);
+-    if (bytes_written_count !=3D ARRAY_LENGTH(test_data)) {
+-        LOG_ERRFMT("io_write failed to write %d bytes for flash emu",
+-                   ARRAY_LENGTH(test_data));
+-        LOG_ERRFMT("bytes_written_count %d for flash emu", bytes_writte=
n_count);
+-        ret->val =3D TEST_FAILED;
+-    }
+-    io_close(flash0_handle);
+-    io_close(flash_emu_handle);
+-
+-    /* Read Data */
+-    io_open(flash0_dev_handle, &flash0_spec, &flash0_handle);
+-    io_open(flash_emu_dev_handle, &flash_emu_spec, &flash_emu_handle);
+-
+-    io_seek(flash0_handle, IO_SEEK_SET,
+-            BANK_1_PARTITION_OFFSET + flash0_info->sector_size - 7);
+-    io_seek(flash_emu_handle, IO_SEEK_SET, flash_emu_info->sector_size =
- 7);
+-
+-    /* Flash0 */
+-    io_read(flash0_handle, actual_data, ARRAY_LENGTH(actual_data),
+-            &bytes_read_count);
+-    if (bytes_read_count !=3D ARRAY_LENGTH(test_data)) {
+-        LOG_ERRFMT("io_read failed to read %d bytes for flash0",
+-                   ARRAY_LENGTH(test_data));
+-        LOG_ERRFMT("bytes_read_count %d for flash0", bytes_read_count);
+-        ret->val =3D TEST_FAILED;
+-    }
+-    if (memcmp((uint8_t*)test_data, actual_data, ARRAY_LENGTH(actual_da=
ta)) !=3D
+-        0) {
+-        LOG_ERRFMT("Data written !=3D Data read\r\n");
+-        ret->val =3D TEST_FAILED;
+-    }
+-
+-    memset(actual_data, -1, sizeof(actual_data));
+-
+-    /* Flash Emu */
+-    io_read(flash_emu_handle, actual_data, ARRAY_LENGTH(actual_data),
+-            &bytes_read_count);
+-    if (bytes_read_count !=3D ARRAY_LENGTH(test_data)) {
+-        LOG_ERRFMT("io_read failed to read %d bytes for flash emu",
+-                   ARRAY_LENGTH(test_data));
+-        LOG_ERRFMT("bytes_read_count %d for flash emu", bytes_read_coun=
t);
+-        ret->val =3D TEST_FAILED;
+-    }
+-    if (memcmp((uint8_t*)test_data, actual_data, ARRAY_LENGTH(actual_da=
ta)) !=3D
+-        0) {
+-        LOG_ERRFMT("Data written !=3D Data read\r\n");
+-        ret->val =3D TEST_FAILED;
+-    }
+-
+-    LOG_INFFMT("PASS: %s\n\r", __func__);
+-    ret->val =3D TEST_PASSED;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
io_storage_test.h b/platform/ext/target/arm/corstone1000/ci_regression_te=
sts/s_io_storage_test.h
+deleted file mode 100644
+index fa9012776..000000000
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_stor=
age_test.h
++++ /dev/null
+@@ -1,15 +0,0 @@
+-/*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#ifndef __S_IO_STORAGE_TEST_H__
+-#define __S_IO_STORAGE_TEST_H__
+-
+-#include "extra_s_tests.h"
+-
+-void s_test_io_storage_multiple_flash_simultaneous(struct test_result_t=
 *ret);
+-
+-#endif /* __S_IO_STORAGE_TEST_H__ */
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
test.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.=
c
+index 9a8453ff5..6bfdf2aeb 100644
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
+@@ -10,8 +10,7 @@
+ #include "extra_s_tests.h"
+ #include "platform_base_address.h"
+ #include "firewall.h"
+-#include "tfm_sp_log.h"
+-#include "s_io_storage_test.h"
++#include "tfm_log_unpriv.h"
+=20
+ /* TODO: if needed each test function can be made as a separate test ca=
se, in
+  * such case EXTRA_TEST_XX definitions can be removed */
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
test_config.cmake b/platform/ext/target/arm/corstone1000/ci_regression_te=
sts/s_test_config.cmake
+deleted file mode 100644
+index 05b7cd785..000000000
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_co=
nfig.cmake
++++ /dev/null
+@@ -1,13 +0,0 @@
+-#----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021-22, Arm Limited. All rights reserved.
+-#
+-# SPDX-License-Identifier: BSD-3-Clause
+-#
+-#----------------------------------------------------------------------=
---------
+-
+-############ Define secure test specific cmake configurations here ####=
#########
+-
+-set (TEST_FLASH_SIZE_IN_BYTES         48U  CACHE STRING   "The size of =
the emulated flash used in io tests")
+-set (TEST_FLASH_SECTOR_SIZE_IN_BYTES  16U  CACHE STRING   "The sector s=
ize of the emulated flash used in io tests")
+-set (TEST_FLASH_PAGE_SIZE              8U  CACHE STRING   "The page siz=
e of the emulated flash used in io tests")
+-set (TEST_FLASH_PROGRAM_UNIT           1U  CACHE STRING   "The program =
unit of the emulated flash used in io tests")
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/te=
st_flash.h b/platform/ext/target/arm/corstone1000/ci_regression_tests/tes=
t_flash.h
+deleted file mode 100644
+index 4d073a1d7..000000000
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flas=
h.h
++++ /dev/null
+@@ -1,25 +0,0 @@
+-/*
+- * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
+- *
+- * Licensed under the Apache License, Version 2.0 (the "License");
+- * you may not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- *     http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an "AS IS" BASIS,
+- * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#ifndef __TEST_FLASH_H__
+-#define __TEST_FLASH_H__
+-
+-#define TEST_FLASH_SIZE_IN_BYTES             (48)    // 48 bytes
+-#define TEST_FLASH_SECTOR_SIZE_IN_BYTES      (16)    // 16 bytes
+-#define TEST_FLASH_PAGE_SIZE                 (8U)    // 8 bytes
+-#define TEST_FLASH_PROGRAM_UNIT              (1U)    /* 1 B */
+-
+-#endif /* __TEST_FLASH_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index 032265cdf..ada6426e3 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -47,6 +47,7 @@ set(DEFAULT_MCUBOOT_SECURITY_COUNTERS       OFF       =
   CACHE BOOL      "Whethe
+ # LOG LEVEL
+ set(TFM_SPM_LOG_LEVEL                   TFM_SPM_LOG_LEVEL_INFO         =
 CACHE STRING    "Set default SPM log level as INFO level")
+ set(TFM_PARTITION_LOG_LEVEL             TFM_PARTITION_LOG_LEVEL_INFO   =
 CACHE STRING    "Set default Secure Partition log level as INFO level")
++set(GPT_LOG_LEVEL                       LOG_LEVEL_INFO                 =
 CACHE STRING    "Set default GPT library log level as INFO level")
+=20
+ # Partition
+ set(TFM_PARTITION_PLATFORM              ON          CACHE BOOL      "En=
able Platform partition")
+@@ -62,6 +63,9 @@ set(TFM_FWU_BOOTLOADER_LIB                "${CMAKE_CUR=
RENT_LIST_DIR}/bootloader/
+ set(TFM_CONFIG_FWU_MAX_MANIFEST_SIZE      0          CACHE STRING    "T=
he maximum permitted size for manifest in psa_fwu_start(), in bytes.")
+ set(TFM_CONFIG_FWU_MAX_WRITE_SIZE         4096       CACHE STRING    "T=
he maximum permitted size for block in psa_fwu_write, in bytes.")
+ set(FWU_SUPPORT_TRIAL_STATE               ON         CACHE BOOL      "D=
evice support TRIAL component state.")
++set(PLATFORM_GPT_LIBRARY                  ON         CACHE BOOL      "B=
uild the GPT library")
++set(TFM_GPT_BLOCK_SIZE                    512        CACHE STRING    "T=
he block size of a device formatted as a GUID Partition Table.")
++set(PLAT_MAX_PARTITION_ENTRIES            16         CACHE STRING    "T=
he maximum number of GPT partition entries.")
+=20
+ if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
+   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
+diff --git a/platform/ext/target/arm/corstone1000/fip_parser/external/uu=
id.h b/platform/ext/target/arm/corstone1000/fip_parser/external/uuid.h
+deleted file mode 100644
+index 2ced3a3fa..000000000
+--- a/platform/ext/target/arm/corstone1000/fip_parser/external/uuid.h
++++ /dev/null
+@@ -1,74 +0,0 @@
+-/*-
+- * Copyright (c) 2002 Marcel Moolenaar
+- * All rights reserved.
+- *
+- * Redistribution and use in source and binary forms, with or without
+- * modification, are permitted provided that the following conditions
+- * are met:
+- *
+- * 1. Redistributions of source code must retain the above copyright
+- *    notice, this list of conditions and the following disclaimer.
+- * 2. Redistributions in binary form must reproduce the above copyright
+- *    notice, this list of conditions and the following disclaimer in t=
he
+- *    documentation and/or other materials provided with the distributi=
on.
+- *
+- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRA=
NTIES
+- * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIM=
ED.
+- * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,=
 BUT
+- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF=
 USE,
+- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
+- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF
+- * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+- *
+- * $FreeBSD$
+- */
+-
+-/*
+- * Portions copyright (c) 2014-2020, ARM Limited and Contributors.
+- * All rights reserved.
+- */
+-
+-#ifndef UUID_H
+-#define UUID_H
+-
+-/* Length of a node address (an IEEE 802 address). */
+-#define	_UUID_NODE_LEN		6
+-
+-/* Length of UUID string including dashes. */
+-#define _UUID_STR_LEN		36
+-
+-/*
+- * See also:
+- *      http://www.opengroup.org/dce/info/draft-leach-uuids-guids-01.tx=
t
+- *      http://www.opengroup.org/onlinepubs/009629399/apdxa.htm
+- *
+- * A DCE 1.1 compatible source representation of UUIDs.
+- */
+-struct uuid {
+-	uint8_t		time_low[4];
+-	uint8_t		time_mid[2];
+-	uint8_t		time_hi_and_version[2];
+-	uint8_t		clock_seq_hi_and_reserved;
+-	uint8_t		clock_seq_low;
+-	uint8_t		node[_UUID_NODE_LEN];
+-};
+-
+-struct efi_guid {
+-	uint32_t time_low;
+-	uint16_t time_mid;
+-	uint16_t time_hi_and_version;
+-	uint8_t clock_seq_and_node[8];
+-};
+-
+-union uuid_helper_t {
+-	struct uuid uuid_struct;
+-	struct efi_guid efi_guid;
+-};
+-
+-/* XXX namespace pollution? */
+-typedef struct uuid uuid_t;
+-
+-#endif /* UUID_H */
+diff --git a/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.=
c b/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.c
+index 5d264b3a6..cce657fbb 100644
+--- a/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.c
++++ b/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.c
+@@ -19,6 +19,8 @@
+ #include "fip_parser.h"
+ #include "bootutil/bootutil_log.h"
+=20
++#include "efi_guid_structs.h"
++
+ #include <region_defs.h>
+ #include <string.h>
+=20
+@@ -27,13 +29,14 @@ int parse_fip_and_extract_tfa_info(uint32_t address,=
 uint32_t fip_size,
+ {
+     FIP_TOC_HEADER *toc_header =3D NULL;
+     FIP_TOC_ENTRY *toc_entry =3D NULL;
+-    uuid_t uuid_null =3D {0};
+-    uuid_t tfa_uuid =3D UUID_TRUSTED_BOOT_FIRMWARE_BL2;
++    struct efi_guid_t uuid_null =3D NULL_GUID;
++    struct efi_guid_t tfa_uuid =3D UUID_TRUSTED_BOOT_FIRMWARE_BL2;
+     char *iter;
+=20
+     toc_header =3D (FIP_TOC_HEADER *) address;
+=20
+     if (toc_header->name !=3D TOC_HEADER_NAME) {
++        BOOT_LOG_ERR("TOC header name does not match");
+         return FIP_PARSER_ERROR;
+     }
+=20
+@@ -43,11 +46,11 @@ int parse_fip_and_extract_tfa_info(uint32_t address,=
 uint32_t fip_size,
+         iter <=3D (char *)toc_header + fip_size;
+         iter =3D iter + sizeof(FIP_TOC_ENTRY), toc_entry++) {
+=20
+-        if (!memcmp(iter, &uuid_null, sizeof(uuid_t))) {
++        if (efi_guid_cmp((struct efi_guid_t *)iter, &uuid_null) =3D=3D =
0) {
+             return FIP_PARSER_ERROR;
+         }
+=20
+-        if (!memcmp(iter, &tfa_uuid, sizeof(uuid_t))) {
++        if (efi_guid_cmp((struct efi_guid_t *)iter, &tfa_uuid) =3D=3D 0=
) {
+             BOOT_LOG_INF("TF-A FIP at : address =3D 0x%x : size =3D 0x%=
x \n\r",
+                                 toc_entry->address,
+                                 toc_entry->size);
+@@ -57,5 +60,6 @@ int parse_fip_and_extract_tfa_info(uint32_t address, u=
int32_t fip_size,
+         }
+     }
+=20
++    BOOT_LOG_ERR("Unable to find TF-A FIP\r\n");
+     return FIP_PARSER_ERROR;
+ }
+diff --git a/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.=
h b/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.h
+index b01000e00..92f35459c 100644
+--- a/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.h
++++ b/platform/ext/target/arm/corstone1000/fip_parser/fip_parser.h
+@@ -24,8 +24,9 @@ extern "C"
+ {
+ #endif
+=20
++#include "efi_guid_structs.h"
++
+ #include <stdint.h>
+-#include "external/uuid.h"
+=20
+ /* Return code of fip parser APIs */
+ #define FIP_PARSER_SUCCESS                     (0)
+@@ -35,10 +36,13 @@ extern "C"
+ #define TOC_HEADER_NAME 0xAA640001
+=20
+ /* ToC Entry UUIDs */
+-#define UUID_TRUSTED_BOOT_FIRMWARE_BL2 \
+-    {{0x5f, 0xf9, 0xec, 0x0b}, {0x4d, 0x22}, \
+-    {0x3e, 0x4d}, 0xa5, 0x44, \
+-    {0xc3, 0x9d, 0x81, 0xc7, 0x3f, 0x0a} }
++#define UUID_TRUSTED_BOOT_FIRMWARE_BL2  \
++    MAKE_EFI_GUID(                      \
++            0x0BECF95F,                 \
++            0x224D,                     \
++            0x4D3E,                     \
++            0xA5, 0x44,                 \
++            0xC3, 0x9D, 0x81, 0xC7, 0x3F, 0x0A)
+=20
+ typedef struct _FIP_TOC_HEADER {
+     uint32_t    name;
+@@ -52,12 +56,12 @@ typedef struct _FIP_TOC_HEADER {
+ */
+=20
+ typedef struct _FIP_TOC_ENTRY {
+-    uuid_t      uuid;
+-    uint32_t    address;
+-    uint32_t    pad1;
+-    uint32_t    size;
+-    uint32_t    pad2;
+-    uint64_t    flags;
++    struct efi_guid_t   uuid;
++    uint32_t            address;
++    uint32_t            pad1;
++    uint32_t            size;
++    uint32_t            pad2;
++    uint64_t            flags;
+ } FIP_TOC_ENTRY;
+=20
+ int parse_fip_and_extract_tfa_info(uint32_t address, uint32_t fip_size,
+diff --git a/platform/ext/target/arm/corstone1000/io/io_block.c b/platfo=
rm/ext/target/arm/corstone1000/io/io_block.c
+deleted file mode 100644
+index a5c021ac5..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_block.c
++++ /dev/null
+@@ -1,528 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#include "io_block.h"
+-
+-#include <assert.h>
+-#include <errno.h>
+-#include <string.h>
+-
+-#include "io_defs.h"
+-#include "io_driver.h"
+-#include "io_storage.h"
+-
+-typedef struct {
+-    io_block_dev_spec_t *dev_spec;
+-    uintptr_t base;
+-    uint32_t file_pos;
+-    uint32_t size;
+-} block_dev_state_t;
+-
+-#define is_power_of_2(x) (((x) !=3D 0U) && (((x) & ((x)-1U)) =3D=3D 0U)=
)
+-
+-io_type_t device_type_block(void);
+-
+-static int block_open(io_dev_info_t *dev_info, const uintptr_t spec,
+-                      io_entity_t *entity);
+-static int block_seek(io_entity_t *entity, int mode, size_t offset);
+-static int block_read(io_entity_t *entity, uintptr_t buffer, size_t len=
gth,
+-                      size_t *length_read);
+-static int block_write(io_entity_t *entity, const uintptr_t buffer,
+-                       size_t length, size_t *length_written);
+-static int block_close(io_entity_t *entity);
+-static int block_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev=
_info);
+-static int block_dev_close(io_dev_info_t *dev_info);
+-
+-static const io_dev_connector_t block_dev_connector =3D {.dev_open =3D
+-                                                           block_dev_op=
en};
+-
+-static const io_dev_funcs_t block_dev_funcs =3D {
+-    .type =3D device_type_block,
+-    .open =3D block_open,
+-    .seek =3D block_seek,
+-    .size =3D NULL,
+-    .read =3D block_read,
+-    .write =3D block_write,
+-    .close =3D block_close,
+-    .dev_init =3D NULL,
+-    .dev_close =3D block_dev_close,
+-};
+-
+-static block_dev_state_t state_pool[MAX_IO_BLOCK_DEVICES];
+-static io_dev_info_t dev_info_pool[MAX_IO_BLOCK_DEVICES];
+-
+-/* Track number of allocated block state */
+-static unsigned int block_dev_count;
+-
+-io_type_t device_type_block(void) { return IO_TYPE_BLOCK; }
+-
+-/* Locate a block state in the pool, specified by address */
+-static int find_first_block_state(const io_block_dev_spec_t *dev_spec,
+-                                  unsigned int *index_out) {
+-    unsigned int index;
+-    int result =3D -ENOENT;
+-
+-    for (index =3D 0U; index < MAX_IO_BLOCK_DEVICES; ++index) {
+-        /* dev_spec is used as identifier since it's unique */
+-        if (state_pool[index].dev_spec =3D=3D dev_spec) {
+-            result =3D 0;
+-            *index_out =3D index;
+-            break;
+-        }
+-    }
+-    return result;
+-}
+-
+-/* Allocate a device info from the pool and return a pointer to it */
+-static int allocate_dev_info(io_dev_info_t **dev_info) {
+-    int result =3D -ENOMEM;
+-    assert(dev_info !=3D NULL);
+-
+-    if (block_dev_count < MAX_IO_BLOCK_DEVICES) {
+-        unsigned int index =3D 0;
+-        result =3D find_first_block_state(NULL, &index);
+-        assert(result =3D=3D 0);
+-        /* initialize dev_info */
+-        dev_info_pool[index].funcs =3D &block_dev_funcs;
+-        dev_info_pool[index].info =3D (uintptr_t)&state_pool[index];
+-        *dev_info =3D &dev_info_pool[index];
+-        ++block_dev_count;
+-    }
+-
+-    return result;
+-}
+-
+-/* Release a device info to the pool */
+-static int free_dev_info(io_dev_info_t *dev_info) {
+-    int result;
+-    unsigned int index =3D 0;
+-    block_dev_state_t *state;
+-    assert(dev_info !=3D NULL);
+-
+-    state =3D (block_dev_state_t *)dev_info->info;
+-    result =3D find_first_block_state(state->dev_spec, &index);
+-    if (result =3D=3D 0) {
+-        /* free if device info is valid */
+-        memset(state, 0, sizeof(block_dev_state_t));
+-        memset(dev_info, 0, sizeof(io_dev_info_t));
+-        --block_dev_count;
+-    }
+-
+-    return result;
+-}
+-
+-static int block_open(io_dev_info_t *dev_info, const uintptr_t spec,
+-                      io_entity_t *entity) {
+-    block_dev_state_t *cur;
+-    io_block_spec_t *region;
+-
+-    assert((dev_info->info !=3D (uintptr_t)NULL) && (spec !=3D (uintptr=
_t)NULL) &&
+-           (entity->info =3D=3D (uintptr_t)NULL));
+-
+-    region =3D (io_block_spec_t *)spec;
+-    cur =3D (block_dev_state_t *)dev_info->info;
+-    assert(((region->offset % cur->dev_spec->block_size) =3D=3D 0) &&
+-           ((region->length % cur->dev_spec->block_size) =3D=3D 0));
+-
+-    cur->base =3D region->offset;
+-    cur->size =3D region->length;
+-    cur->file_pos =3D 0;
+-
+-    entity->info =3D (uintptr_t)cur;
+-    return 0;
+-}
+-
+-/* parameter offset is relative address at here */
+-static int block_seek(io_entity_t *entity, int mode, size_t offset) {
+-    block_dev_state_t *cur;
+-
+-    assert(entity->info !=3D (uintptr_t)NULL);
+-
+-    cur =3D (block_dev_state_t *)entity->info;
+-
+-    assert((offset >=3D 0) && ((uint32_t)offset < cur->size));
+-    switch (mode) {
+-        case IO_SEEK_SET:
+-            cur->file_pos =3D (uint32_t)offset;
+-            break;
+-        case IO_SEEK_CUR:
+-            cur->file_pos +=3D (uint32_t)offset;
+-            break;
+-        default:
+-            return -EINVAL;
+-    }
+-    assert(cur->file_pos < cur->size);
+-    return 0;
+-}
+-
+-/*
+- * This function allows the caller to read any number of bytes
+- * from any position. It hides from the caller that the low level
+- * driver only can read aligned blocks of data. For this reason
+- * we need to handle the use case where the first byte to be read is no=
t
+- * aligned to start of the block, the last byte to be read is also not
+- * aligned to the end of a block, and there are zero or more blocks-wor=
th
+- * of data in between.
+- *
+- * In such a case we need to read more bytes than requested (i.e. full
+- * blocks) and strip-out the leading bytes (aka skip) and the trailing
+- * bytes (aka padding). See diagram below
+- *
+- * cur->file_pos ------------
+- *                          |
+- * cur->base                |
+- *  |                       |
+- *  v                       v<----  length   ---->
+- *  --------------------------------------------------------------
+- * |           |         block#1    |        |   block#n          |
+- * |  block#0  |            +       |   ...  |     +              |
+- * |           | <- skip -> +       |        |     + <- padding ->|
+- *  ------------------------+----------------------+--------------
+- *             ^                                                  ^
+- *             |                                                  |
+- *             v    iteration#1                iteration#n        v
+- *              --------------------------------------------------
+- *             |                    |        |                    |
+- *             |<----  request ---->|  ...   |<----- request ---->|
+- *             |                    |        |                    |
+- *              --------------------------------------------------
+- *            /                   /          |                    |
+- *           /                   /           |                    |
+- *          /                   /            |                    |
+- *         /                   /             |                    |
+- *        /                   /              |                    |
+- *       /                   /               |                    |
+- *      /                   /                |                    |
+- *     /                   /                 |                    |
+- *    /                   /                  |                    |
+- *   /                   /                   |                    |
+- *  <---- request ------>                    <------ request  ----->
+- *  ---------------------                    -----------------------
+- *  |        |          |                    |          |           |
+- *  |<-skip->|<-nbytes->|           -------->|<-nbytes->|<-padding->|
+- *  |        |          |           |        |          |           |
+- *  ---------------------           |        -----------------------
+- *  ^        \           \          |        |          |
+- *  |         \           \         |        |          |
+- *  |          \           \        |        |          |
+- *  buf->offset \           \   buf->offset  |          |
+- *               \           \               |          |
+- *                \           \              |          |
+- *                 \           \             |          |
+- *                  \           \            |          |
+- *                   \           \           |          |
+- *                    \           \          |          |
+- *                     \           \         |          |
+- *                      --------------------------------
+- *                      |           |        |         |
+- * buffer-------------->|           | ...    |         |
+- *                      |           |        |         |
+- *                      --------------------------------
+- *                      <-count#1->|                   |
+- *                      <----------  count#n   -------->
+- *                      <----------  length  ---------->
+- *
+- * Additionally, the IO driver has an underlying buffer that is at leas=
t
+- * one block-size and may be big enough to allow.
+- */
+-static int block_read(io_entity_t *entity, uintptr_t buffer, size_t len=
gth,
+-                      size_t *length_read) {
+-    block_dev_state_t *cur;
+-    io_block_spec_t *buf;
+-    io_block_ops_t *ops;
+-    int lba;
+-    size_t block_size, left;
+-    size_t nbytes;  /* number of bytes read in one iteration */
+-    size_t request; /* number of requested bytes in one iteration */
+-    size_t count;   /* number of bytes already read */
+-    /*
+-     * number of leading bytes from start of the block
+-     * to the first byte to be read
+-     */
+-    size_t skip;
+-
+-    /*
+-     * number of trailing bytes between the last byte
+-     * to be read and the end of the block
+-     */
+-    size_t padding;
+-
+-    assert(entity->info !=3D (uintptr_t)NULL);
+-    cur =3D (block_dev_state_t *)entity->info;
+-    ops =3D &(cur->dev_spec->ops);
+-    buf =3D &(cur->dev_spec->buffer);
+-    block_size =3D cur->dev_spec->block_size;
+-    assert((length <=3D cur->size) && (length > 0U) && (ops->read !=3D =
0));
+-
+-    /*
+-     * We don't know the number of bytes that we are going
+-     * to read in every iteration, because it will depend
+-     * on the low level driver.
+-     */
+-    count =3D 0;
+-    for (left =3D length; left > 0U; left -=3D nbytes) {
+-        /*
+-         * We must only request operations aligned to the block
+-         * size. Therefore if file_pos is not block-aligned,
+-         * we have to request the operation to start at the
+-         * previous block boundary and skip the leading bytes. And
+-         * similarly, the number of bytes requested must be a
+-         * block size multiple
+-         */
+-        skip =3D cur->file_pos & (block_size - 1U);
+-
+-        /*
+-         * Calculate the block number containing file_pos
+-         * - e.g. block 3.
+-         */
+-        lba =3D (cur->file_pos + cur->base) / block_size;
+-
+-        if ((skip + left) > buf->length) {
+-            /*
+-             * The underlying read buffer is too small to
+-             * read all the required data - limit to just
+-             * fill the buffer, and then read again.
+-             */
+-            request =3D buf->length;
+-        } else {
+-            /*
+-             * The underlying read buffer is big enough to
+-             * read all the required data. Calculate the
+-             * number of bytes to read to align with the
+-             * block size.
+-             */
+-            request =3D skip + left;
+-            request =3D (request + (block_size - 1U)) & ~(block_size - =
1U);
+-        }
+-        request =3D ops->read(lba, buf->offset, request);
+-
+-        if (request <=3D skip) {
+-            /*
+-             * We couldn't read enough bytes to jump over
+-             * the skip bytes, so we should have to read
+-             * again the same block, thus generating
+-             * the same error.
+-             */
+-            return -EIO;
+-        }
+-
+-        /*
+-         * Need to remove skip and padding bytes,if any, from
+-         * the read data when copying to the user buffer.
+-         */
+-        nbytes =3D request - skip;
+-        padding =3D (nbytes > left) ? nbytes - left : 0U;
+-        nbytes -=3D padding;
+-
+-        memcpy((void *)(buffer + count), (void *)(buf->offset + skip), =
nbytes);
+-
+-        cur->file_pos +=3D nbytes;
+-        count +=3D nbytes;
+-    }
+-    assert(count =3D=3D length);
+-    *length_read =3D count;
+-
+-    return 0;
+-}
+-
+-/*
+- * This function allows the caller to write any number of bytes
+- * from any position. It hides from the caller that the low level
+- * driver only can write aligned blocks of data.
+- * See comments for block_read for more details.
+- */
+-static int block_write(io_entity_t *entity, const uintptr_t buffer,
+-                       size_t length, size_t *length_written) {
+-    block_dev_state_t *cur;
+-    io_block_spec_t *buf;
+-    io_block_ops_t *ops;
+-    int lba;
+-    size_t block_size, left;
+-    size_t nbytes;  /* number of bytes read in one iteration */
+-    size_t request; /* number of requested bytes in one iteration */
+-    size_t count;   /* number of bytes already read */
+-    /*
+-     * number of leading bytes from start of the block
+-     * to the first byte to be read
+-     */
+-    size_t skip;
+-
+-    /*
+-     * number of trailing bytes between the last byte
+-     * to be read and the end of the block
+-     */
+-    size_t padding;
+-    assert(entity->info !=3D (uintptr_t)NULL);
+-    cur =3D (block_dev_state_t *)entity->info;
+-    ops =3D &(cur->dev_spec->ops);
+-    buf =3D &(cur->dev_spec->buffer);
+-    block_size =3D cur->dev_spec->block_size;
+-    assert((length <=3D cur->size) && (length > 0U) && (ops->read !=3D =
0) &&
+-           (ops->write !=3D 0));
+-
+-    /*
+-     * We don't know the number of bytes that we are going
+-     * to write in every iteration, because it will depend
+-     * on the low level driver.
+-     */
+-    count =3D 0;
+-    for (left =3D length; left > 0U; left -=3D nbytes) {
+-        /*
+-         * We must only request operations aligned to the block
+-         * size. Therefore if file_pos is not block-aligned,
+-         * we have to request the operation to start at the
+-         * previous block boundary and skip the leading bytes. And
+-         * similarly, the number of bytes requested must be a
+-         * block size multiple
+-         */
+-        skip =3D cur->file_pos & (block_size - 1U);
+-
+-        /*
+-         * Calculate the block number containing file_pos
+-         * - e.g. block 3.
+-         */
+-        lba =3D (cur->file_pos + cur->base) / block_size;
+-
+-        if ((skip + left) > buf->length) {
+-            /*
+-             * The underlying read buffer is too small to
+-             * read all the required data - limit to just
+-             * fill the buffer, and then read again.
+-             */
+-            request =3D buf->length;
+-        } else {
+-            /*
+-             * The underlying read buffer is big enough to
+-             * read all the required data. Calculate the
+-             * number of bytes to read to align with the
+-             * block size.
+-             */
+-            request =3D skip + left;
+-            request =3D (request + (block_size - 1U)) & ~(block_size - =
1U);
+-        }
+-
+-        /*
+-         * The number of bytes that we are going to write
+-         * from the user buffer will depend of the size
+-         * of the current request.
+-         */
+-        nbytes =3D request - skip;
+-        padding =3D (nbytes > left) ? nbytes - left : 0U;
+-        nbytes -=3D padding;
+-
+-        /*
+-         * If we have skip or padding bytes then we have to preserve
+-         * some content and it means that we have to read before
+-         * writing
+-         */
+-        if ((skip > 0U) || (padding > 0U)) {
+-            request =3D ops->read(lba, buf->offset, request);
+-            /*
+-             * The read may return size less than
+-             * requested. Round down to the nearest block
+-             * boundary
+-             */
+-            request &=3D ~(block_size - 1U);
+-            if (request <=3D skip) {
+-                /*
+-                 * We couldn't read enough bytes to jump over
+-                 * the skip bytes, so we should have to read
+-                 * again the same block, thus generating
+-                 * the same error.
+-                 */
+-                return -EIO;
+-            }
+-            nbytes =3D request - skip;
+-            padding =3D (nbytes > left) ? nbytes - left : 0U;
+-            nbytes -=3D padding;
+-        }
+-
+-        memcpy((void *)(buf->offset + skip), (void *)(buffer + count), =
nbytes);
+-
+-        request =3D ops->write(lba, buf->offset, request);
+-        if (request <=3D skip) return -EIO;
+-
+-        /*
+-         * And the previous write operation may modify the size
+-         * of the request, so again, we have to calculate the
+-         * number of bytes that we consumed from the user
+-         * buffer
+-         */
+-        nbytes =3D request - skip;
+-        padding =3D (nbytes > left) ? nbytes - left : 0U;
+-        nbytes -=3D padding;
+-
+-        cur->file_pos +=3D nbytes;
+-        count +=3D nbytes;
+-    }
+-    assert(count =3D=3D length);
+-    *length_written =3D count;
+-
+-    return 0;
+-}
+-
+-static int block_close(io_entity_t *entity) {
+-    entity->info =3D (uintptr_t)NULL;
+-    return 0;
+-}
+-
+-static int block_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev=
_info) {
+-    block_dev_state_t *cur;
+-    io_block_spec_t *buffer;
+-    io_dev_info_t *info;
+-    size_t block_size;
+-    int result;
+-    assert(dev_info !=3D NULL);
+-    result =3D allocate_dev_info(&info);
+-    if (result !=3D 0) return -ENOENT;
+-
+-    cur =3D (block_dev_state_t *)info->info;
+-    /* dev_spec is type of io_block_dev_spec_t. */
+-    cur->dev_spec =3D (io_block_dev_spec_t *)dev_spec;
+-    buffer =3D &(cur->dev_spec->buffer);
+-    block_size =3D cur->dev_spec->block_size;
+-
+-    assert((block_size > 0U) && (is_power_of_2(block_size) !=3D 0U) &&
+-           ((buffer->length % block_size) =3D=3D 0U));
+-
+-    *dev_info =3D info; /* cast away const */
+-    (void)block_size;
+-    (void)buffer;
+-    return 0;
+-}
+-
+-static int block_dev_close(io_dev_info_t *dev_info) {
+-    return free_dev_info(dev_info);
+-}
+-
+-/* Exported functions */
+-
+-/* Register the Block driver with the IO abstraction */
+-int register_io_dev_block(const io_dev_connector_t **dev_con) {
+-    int result;
+-
+-    assert(dev_con !=3D NULL);
+-
+-    /*
+-     * Since dev_info isn't really used in io_register_device, always
+-     * use the same device info at here instead.
+-     */
+-    result =3D io_register_device(&dev_info_pool[0]);
+-    if (result =3D=3D 0) *dev_con =3D &block_dev_connector;
+-    return result;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_block.h b/platfo=
rm/ext/target/arm/corstone1000/io/io_block.h
+deleted file mode 100644
+index 1603aa74c..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_block.h
++++ /dev/null
+@@ -1,40 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#ifndef __IO_BLOCK_H__
+-#define __IO_BLOCK_H__
+-
+-#include "io_storage.h"
+-
+-/* block devices ops */
+-typedef struct io_block_ops {
+-    size_t (*read)(int lba, uintptr_t buf, size_t size);
+-    size_t (*write)(int lba, const uintptr_t buf, size_t size);
+-} io_block_ops_t;
+-
+-typedef struct io_block_dev_spec {
+-    io_block_spec_t buffer;
+-    io_block_ops_t ops;
+-    size_t block_size;
+-} io_block_dev_spec_t;
+-
+-struct io_dev_connector;
+-
+-int register_io_dev_block(const struct io_dev_connector **dev_con);
+-
+-#endif /* __IO_BLOCK_H__ */
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/io/io_defs.h b/platfor=
m/ext/target/arm/corstone1000/io/io_defs.h
+deleted file mode 100644
+index acba969ed..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_defs.h
++++ /dev/null
+@@ -1,27 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#ifndef __IO_DEFS_H__
+-#define __IO_DEFS_H__
+-
+-#define MAX_IO_DEVICES          (2)
+-#define MAX_IO_HANDLES          (2)
+-#define MAX_IO_BLOCK_DEVICES    (2)
+-#define MAX_IO_FLASH_DEVICES    (2)
+-
+-#endif /* __IO_DEFS_H__ */
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/io/io_driver.h b/platf=
orm/ext/target/arm/corstone1000/io/io_driver.h
+deleted file mode 100644
+index cf9e21a6d..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_driver.h
++++ /dev/null
+@@ -1,54 +0,0 @@
+-/*
+- * Copyright (c) 2014-2022, ARM Limited and Contributors. All rights re=
served.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#ifndef __IO_DRIVER_H__
+-#define __IO_DRIVER_H__
+-
+-#include <io_storage.h>
+-#include <stdint.h>
+-
+-/* Generic IO entity structure,representing an accessible IO construct =
on the
+- * device, such as a file */
+-typedef struct io_entity {
+-    struct io_dev_info *dev_handle;
+-    uintptr_t info;
+-} io_entity_t;
+-
+-/* Device info structure, providing device-specific functions and a mea=
ns of
+- * adding driver-specific state */
+-typedef struct io_dev_info {
+-    const struct io_dev_funcs *funcs;
+-    uintptr_t info;
+-} io_dev_info_t;
+-
+-/* Structure used to create a connection to a type of device */
+-typedef struct io_dev_connector {
+-    /* dev_open opens a connection to a particular device driver */
+-    int (*dev_open)(const uintptr_t dev_spec, io_dev_info_t **dev_info)=
;
+-} io_dev_connector_t;
+-
+-/* Structure to hold device driver function pointers */
+-typedef struct io_dev_funcs {
+-    io_type_t (*type)(void);
+-    int (*open)(io_dev_info_t *dev_info, const uintptr_t spec,
+-                io_entity_t *entity);
+-    int (*seek)(io_entity_t *entity, int mode, size_t offset);
+-    int (*size)(io_entity_t *entity, size_t *length);
+-    int (*read)(io_entity_t *entity, uintptr_t buffer, size_t length,
+-                size_t *length_read);
+-    int (*write)(io_entity_t *entity, const uintptr_t buffer, size_t le=
ngth,
+-                 size_t *length_written);
+-    int (*close)(io_entity_t *entity);
+-    int (*dev_init)(io_dev_info_t *dev_info, const uintptr_t init_param=
s);
+-    int (*dev_close)(io_dev_info_t *dev_info);
+-} io_dev_funcs_t;
+-
+-/* Operations intended to be performed during platform initialisation *=
/
+-
+-/* Register an IO device */
+-int io_register_device(const io_dev_info_t *dev_info);
+-
+-#endif /* __IO_DRIVER_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.c b/platfo=
rm/ext/target/arm/corstone1000/io/io_flash.c
+deleted file mode 100644
+index b90a81a48..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_flash.c
++++ /dev/null
+@@ -1,183 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#include "io_flash.h"
+-
+-#include <assert.h>
+-#include <errno.h>
+-
+-#include "Driver_Flash.h"
+-#include "io_block.h"
+-#include "io_defs.h"
+-#include "io_driver.h"
+-#include "io_storage.h"
+-
+-#if MAX_IO_FLASH_DEVICES > MAX_IO_BLOCK_DEVICES
+-#error \
+-    "FLASH devices are BLOCK devices .. MAX_IO_FLASH_DEVICES should be =
less or equal to MAX_IO_BLOCK_DEVICES"
+-#endif
+-
+-/* Private Prototypes */
+-
+-static int flash_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev=
_info);
+-static size_t flash_read(int lba, uintptr_t buf, size_t size, size_t fl=
ash_id);
+-static size_t flash_write(int lba, const uintptr_t buf, size_t size,
+-                          size_t flash_id);
+-static size_t flash0_read(int lba, uintptr_t buf, size_t size);
+-static size_t flash0_write(int lba, uintptr_t buf, size_t size);
+-static size_t flash1_read(int lba, uintptr_t buf, size_t size);
+-static size_t flash1_write(int lba, uintptr_t buf, size_t size);
+-
+-/** Private Data **/
+-
+-/* Flash device data */
+-static const io_dev_connector_t flash_dev_connector =3D {.dev_open =3D
+-                                                           flash_dev_op=
en};
+-static size_t flash_dev_count =3D 0;
+-static io_flash_dev_spec_t *flash_dev_specs[MAX_IO_FLASH_DEVICES];
+-
+-/* Block device data */
+-static io_dev_connector_t block_dev_connectors[MAX_IO_FLASH_DEVICES];
+-static io_block_dev_spec_t block_dev_spec[MAX_IO_FLASH_DEVICES];
+-
+-/* Flash devices read/write function pointers */
+-static io_block_ops_t flashs_ops[MAX_IO_FLASH_DEVICES] =3D {
+-    [0] =3D {.read =3D flash0_read, .write =3D flash0_write},
+-    [1] =3D {.read =3D flash1_read, .write =3D flash1_write},
+-};
+-
+-/* Flash ops functions */
+-static size_t flash_read(int lba, uintptr_t buf, size_t size, size_t fl=
ash_id) {
+-    ARM_DRIVER_FLASH *flash_driver =3D
+-        ((ARM_DRIVER_FLASH *)flash_dev_specs[flash_id]->flash_driver);
+-    ARM_FLASH_INFO *info =3D flash_driver->GetInfo();
+-    uint32_t addr =3D info->sector_size * lba;
+-    uint32_t offset =3D addr - flash_dev_specs[flash_id]->base_addr;
+-    size_t rem =3D info->sector_count * info->sector_size - offset;
+-    size_t cnt =3D size < rem ? size : rem;
+-
+-    return flash_driver->ReadData(offset, (void *)buf, cnt);
+-}
+-
+-static size_t flash_write(int lba, const uintptr_t buf, size_t size,
+-                          size_t flash_id) {
+-    ARM_DRIVER_FLASH *flash_driver =3D
+-        ((ARM_DRIVER_FLASH *)flash_dev_specs[flash_id]->flash_driver);
+-    ARM_FLASH_INFO *info =3D flash_driver->GetInfo();
+-    int32_t rc =3D 0;
+-    uint32_t addr =3D info->sector_size * lba;
+-    uint32_t offset =3D addr - flash_dev_specs[flash_id]->base_addr;
+-    size_t rem =3D info->sector_count * info->sector_size - offset;
+-    size_t cnt =3D size < rem ? size : rem;
+-
+-    flash_driver->EraseSector(offset);
+-    rc =3D flash_driver->ProgramData(offset, (const void *)buf, cnt);
+-    return rc;
+-}
+-
+-/* Flash ops functions wrapper for each device */
+-
+-static size_t flash0_read(int lba, uintptr_t buf, size_t size) {
+-    return flash_read(lba, buf, size, 0);
+-}
+-
+-static size_t flash0_write(int lba, uintptr_t buf, size_t size) {
+-    return flash_write(lba, buf, size, 0);
+-}
+-
+-static size_t flash1_read(int lba, uintptr_t buf, size_t size) {
+-    return flash_read(lba, buf, size, 1);
+-}
+-
+-static size_t flash1_write(int lba, uintptr_t buf, size_t size) {
+-    return flash_write(lba, buf, size, 1);
+-}
+-
+-/**
+- *  Helper function to find the index of stored flash_dev_specs or
+- *  return a free slot in case of a new dev_spec
+- */
+-static int find_flash_dev_specs(const uintptr_t dev_spec) {
+-    /* Search in the saved ones */
+-    for (int i =3D 0; i < flash_dev_count; ++i) {
+-        if (flash_dev_specs[i] !=3D NULL &&
+-            flash_dev_specs[i]->flash_driver =3D=3D
+-                ((io_flash_dev_spec_t *)dev_spec)->flash_driver) {
+-            return i;
+-        }
+-    }
+-    /* Find the first empty flash_dev_specs to be used */
+-    for (int i =3D 0; i < flash_dev_count; ++i) {
+-        if (flash_dev_specs[i] =3D=3D NULL) {
+-            return i;
+-        }
+-    }
+-    return -1;
+-}
+-
+-/**
+- * This function should be called
+- */
+-static int flash_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev=
_info) {
+-    ARM_DRIVER_FLASH *flash_driver;
+-    assert(dev_info !=3D NULL);
+-    assert(dev_spec !=3D NULL);
+-
+-    size_t index =3D find_flash_dev_specs(dev_spec);
+-
+-    /* Check if Flash ops functions are defined for this flash */
+-    assert(flashs_ops[index].read && flashs_ops[index].write);
+-
+-    flash_dev_specs[index] =3D (io_flash_dev_spec_t *)dev_spec;
+-    flash_driver =3D (const ARM_DRIVER_FLASH *)flash_dev_specs[index]->=
flash_driver;
+-
+-    block_dev_spec[index].block_size =3D flash_driver->GetInfo()->secto=
r_size;
+-    block_dev_spec[index].buffer.offset =3D flash_dev_specs[index]->buf=
fer;
+-    block_dev_spec[index].buffer.length =3D flash_dev_specs[index]->buf=
ferlen;
+-    block_dev_spec[index].ops =3D flashs_ops[index];
+-
+-    flash_driver->Initialize(NULL);
+-
+-    block_dev_connectors[index].dev_open((uintptr_t)&block_dev_spec[ind=
ex], dev_info);
+-
+-    return 0;
+-}
+-
+-/* Exported functions */
+-
+-/**
+- * Register the flash device.
+- * Internally it register a block device.
+- */
+-int register_io_dev_flash(const io_dev_connector_t **dev_con) {
+-    int result;
+-
+-    if (flash_dev_count >=3D MAX_IO_FLASH_DEVICES) {
+-        return -ENOENT;
+-    }
+-    assert(dev_con !=3D NULL);
+-
+-    result =3D register_io_dev_block(dev_con);
+-    if (result =3D=3D 0) {
+-        /* Store the block dev connector */
+-        block_dev_connectors[flash_dev_count++] =3D **dev_con;
+-        /* Override dev_con with the flash dev connector */
+-        *dev_con =3D &flash_dev_connector;
+-    }
+-    return result;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.h b/platfo=
rm/ext/target/arm/corstone1000/io/io_flash.h
+deleted file mode 100644
+index 8bc38b582..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_flash.h
++++ /dev/null
+@@ -1,37 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#ifndef __IO_FLASH_H__
+-#define __IO_FLASH_H__
+-
+-#include "io_storage.h"
+-
+-typedef struct io_flash_dev_spec {
+-    uintptr_t buffer;
+-    size_t bufferlen;
+-    uint32_t base_addr;
+-    uintptr_t flash_driver;
+-} io_flash_dev_spec_t;
+-
+-struct io_dev_connector;
+-
+-/* Register the flash driver with the IO abstraction internally it regi=
ster a
+- * block device*/
+-int register_io_dev_flash(const struct io_dev_connector **dev_con);
+-
+-#endif /* __IO_FLASH_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/io/io_gpt.c b/platform=
/ext/target/arm/corstone1000/io/io_gpt.c
+new file mode 100644
+index 000000000..513c77016
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_gpt.c
+@@ -0,0 +1,179 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <stdio.h>
++#include <errno.h>
++#include <string.h>
++#include <inttypes.h>
++
++#include "io_gpt.h"
++
++#include "Driver_Flash.h"
++#include "gpt_flash.h"
++#include "flash_layout.h"
++
++/* Check if globals in module have been initialised */
++#define CHECK_INIT                      \
++    do {                                \
++        if (!flash_driver) {            \
++            return GPT_FLASH_NOT_INIT;  \
++        }                               \
++    } while (0)
++
++/* Check the given flash access is valid */
++#define CHECK_BOUNDS(addr, size)                                       =
   \
++    do {                                                               =
   \
++        if (size > FLASH_TOTAL_SIZE || addr > FLASH_TOTAL_SIZE - size) =
{  \
++            return GPT_FLASH_BAD_PARAM;                                =
   \
++        }                                                              =
   \
++    } while (0)
++
++/* Aligns address to flash sector sizes */
++#define ALIGN_TO_SECTOR(addr) (((addr) / FLASH_SECTOR_SIZE) * FLASH_SEC=
TOR_SIZE)
++
++/* Number of LBAs per sector of flash */
++#define LBAS_PER_SECTOR (FLASH_SECTOR_SIZE / TFM_GPT_BLOCK_SIZE)
++
++/* Returns the offset within a sector for the given lba */
++static inline uint64_t sector_offset(uint64_t lba)
++{
++    return (lba % LBAS_PER_SECTOR) * TFM_GPT_BLOCK_SIZE;
++}
++
++/* The actual flash driver under the hood */
++static ARM_DRIVER_FLASH *flash_driver =3D NULL;
++
++/* Buffer used to store sector of flash data */
++static uint8_t sector_buf[FLASH_SECTOR_SIZE];
++
++/* From io_gpt.h - the driver given to the GPT library */
++struct gpt_flash_driver_t io_gpt_flash_driver =3D {0};
++
++/* Erases TFM_GPT_BLOCK_SIZE bytes from offset within the sector beginn=
ing at
++ * sector_addr. This is done via a read-erase-write pattern whereby dat=
a is read,
++ * the sector is erased, and data written back to the parts of the sect=
or that
++ * shouldn't have been erased
++ */
++static gpt_flash_err_t partially_erase_sector(uint32_t sector_addr,
++                                              uint32_t offset)
++{
++    if (flash_driver->ReadData(
++                sector_addr,
++                sector_buf,
++                FLASH_SECTOR_SIZE) !=3D FLASH_SECTOR_SIZE)
++    {
++        return GPT_FLASH_GENERIC_ERROR;
++    }
++
++    if (flash_driver->EraseSector(sector_addr) !=3D ARM_DRIVER_OK) {
++        return GPT_FLASH_GENERIC_ERROR;
++    }
++
++    memset(sector_buf + offset, flash_driver->GetInfo()->erased_value, =
TFM_GPT_BLOCK_SIZE);
++    if (flash_driver->ProgramData(
++                sector_addr,
++                sector_buf,
++                FLASH_SECTOR_SIZE) !=3D FLASH_SECTOR_SIZE)
++    {
++        return GPT_FLASH_GENERIC_ERROR;
++    }
++
++    return GPT_FLASH_SUCCESS;
++}
++
++/* Reads the requested LBA into the given buffer */
++static ssize_t flash_read(uint64_t lba, void *buf)
++{
++    CHECK_INIT;
++
++    uint64_t read_addr =3D lba * TFM_GPT_BLOCK_SIZE;
++    CHECK_BOUNDS(read_addr, TFM_GPT_BLOCK_SIZE);
++
++    if (flash_driver->ReadData(read_addr, buf, TFM_GPT_BLOCK_SIZE) !=3D=
 TFM_GPT_BLOCK_SIZE) {
++        return GPT_FLASH_GENERIC_ERROR;
++    }
++
++    return TFM_GPT_BLOCK_SIZE;
++}
++
++/* Writes the given buffer to the requested LBA */
++static ssize_t flash_write(uint64_t lba, const void *buf)
++{
++    CHECK_INIT;
++
++    uint64_t write_addr =3D lba * TFM_GPT_BLOCK_SIZE;
++    CHECK_BOUNDS(write_addr, TFM_GPT_BLOCK_SIZE);
++
++    if (flash_driver->ProgramData(write_addr, buf, TFM_GPT_BLOCK_SIZE) =
!=3D TFM_GPT_BLOCK_SIZE) {
++        return GPT_FLASH_GENERIC_ERROR;
++    }
++
++    return TFM_GPT_BLOCK_SIZE;
++}
++
++/* Erases a consecutive number of blocks, beginning with the given LBA =
*/
++static ssize_t flash_erase(uint64_t lba, size_t num_blocks)
++{
++    CHECK_INIT;
++
++    if (num_blocks =3D=3D 0) {
++        return GPT_FLASH_BAD_PARAM;
++    }
++
++    /* Convert blocks to sectors. The first and final sectors may be pa=
rtially erased */
++    size_t num_sectors =3D num_blocks / LBAS_PER_SECTOR;
++    if (num_sectors =3D=3D 0) {
++        /* Partially erase first sector and thats it */
++        num_sectors =3D 1;
++    }
++
++    uint64_t erase_addr =3D ALIGN_TO_SECTOR(lba * TFM_GPT_BLOCK_SIZE);
++    CHECK_BOUNDS(erase_addr, FLASH_SECTOR_SIZE);
++
++    uint64_t last_erase_addr =3D erase_addr + ((num_sectors - 1) * FLAS=
H_SECTOR_SIZE);
++    CHECK_BOUNDS(last_erase_addr, FLASH_SECTOR_SIZE);
++
++    /* Whole sector erases until last sector */
++    for (size_t i =3D 0; i < num_sectors - 1; ++i) {
++        int32_t ret =3D flash_driver->EraseSector(erase_addr + i * FLAS=
H_SECTOR_SIZE);
++        if (ret !=3D ARM_DRIVER_OK) {
++            return i;
++        }
++    }
++
++    if (num_blocks % LBAS_PER_SECTOR =3D=3D 0 && lba % LBAS_PER_SECTOR =
=3D=3D 0) {
++        /* Fully erase final sector */
++        if (flash_driver->EraseSector(last_erase_addr) !=3D ARM_DRIVER_=
OK) {
++            return (num_sectors - 1) * LBAS_PER_SECTOR;
++        }
++    } else {
++        /* Partial erase of final sector */
++        if (partially_erase_sector(
++                    last_erase_addr,
++                    sector_offset(lba)) !=3D GPT_FLASH_SUCCESS)
++        {
++            return num_sectors =3D=3D 0 ? GPT_FLASH_GENERIC_ERROR : (nu=
m_sectors - 1) * LBAS_PER_SECTOR;
++        }
++    }
++
++    return num_blocks;
++}
++
++int register_flash_io_gpt(ARM_DRIVER_FLASH *driver)
++{
++    /* Initialise the driver */
++    driver->Initialize(NULL);
++
++    /* Store everything needed */
++    flash_driver =3D driver;
++
++    io_gpt_flash_driver.read =3D flash_read;
++    io_gpt_flash_driver.write =3D flash_write;
++    io_gpt_flash_driver.erase =3D flash_erase;
++
++    return 0;
++}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_gpt.h b/platform=
/ext/target/arm/corstone1000/io/io_gpt.h
+new file mode 100644
+index 000000000..96dcda04e
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_gpt.h
+@@ -0,0 +1,25 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __IO_GPT_H__
++#define __IO_GPT_H__
++
++#include "io_gpt.h"
++
++#include "Driver_Flash.h"
++#include "gpt_flash.h"
++
++/* The pseudo flash driver used by the GPT library. Each LBA maps
++ * FLASH_SECTOR_SIZE:TFM_GPT_BLOCK_SIZE to a sector of flash (so 1024:5=
12 means
++ * two LBAs per sector of flash)
++ */
++extern struct gpt_flash_driver_t io_gpt_flash_driver;
++
++/* Sets up the gpt_flash_driver with the given driver and initialises t=
he latter */
++int register_flash_io_gpt(ARM_DRIVER_FLASH *driver);
++
++#endif /* __IO_GPT_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/io/io_storage.c b/plat=
form/ext/target/arm/corstone1000/io/io_storage.c
+deleted file mode 100644
+index f26f4980f..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_storage.c
++++ /dev/null
+@@ -1,289 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#include <assert.h>
+-#include <errno.h>
+-#include <stdbool.h>
+-
+-#include "io_defs.h"
+-#include "io_driver.h"
+-
+-/* Storage for a fixed maximum number of IO entities, definable by plat=
form */
+-static io_entity_t entity_pool[MAX_IO_HANDLES];
+-
+-/* Simple way of tracking used storage - each entry is NULL or a pointe=
r to an
+- * entity */
+-static io_entity_t *entity_map[MAX_IO_HANDLES];
+-
+-/* Track number of allocated entities */
+-static unsigned int entity_count;
+-
+-/* Array of fixed maximum of registered devices, definable by platform =
*/
+-static const io_dev_info_t *devices[MAX_IO_DEVICES];
+-
+-/* Number of currently registered devices */
+-static unsigned int dev_count;
+-
+-/* Return a boolean value indicating whether a device connector is vali=
d */
+-static bool is_valid_dev_connector(const io_dev_connector_t *dev_con) {
+-    return (dev_con !=3D NULL) && (dev_con->dev_open !=3D NULL);
+-}
+-
+-/* Return a boolean value indicating whether a device handle is valid *=
/
+-static bool is_valid_dev(const uintptr_t dev_handle) {
+-    const io_dev_info_t *dev =3D (io_dev_info_t *)dev_handle;
+-
+-    return (dev !=3D NULL) && (dev->funcs !=3D NULL) &&
+-           (dev->funcs->type !=3D NULL) && (dev->funcs->type() < IO_TYP=
E_MAX);
+-}
+-
+-/* Return a boolean value indicating whether an IO entity is valid */
+-static bool is_valid_entity(const uintptr_t handle) {
+-    const io_entity_t *entity =3D (io_entity_t *)handle;
+-
+-    return (entity !=3D NULL) && (is_valid_dev((uintptr_t)entity->dev_h=
andle));
+-}
+-
+-/* Return a boolean value indicating whether a seek mode is valid */
+-static bool is_valid_seek_mode(io_seek_mode_t mode) {
+-    return ((mode !=3D IO_SEEK_INVALID) && (mode < IO_SEEK_MAX));
+-}
+-
+-/* Open a connection to a specific device */
+-static int io_storage_dev_open(const io_dev_connector_t *dev_con,
+-                               const uintptr_t dev_spec,
+-                               io_dev_info_t **dev_info) {
+-    assert(dev_info !=3D NULL);
+-    assert(is_valid_dev_connector(dev_con));
+-
+-    return dev_con->dev_open(dev_spec, dev_info);
+-}
+-
+-/* Set a handle to track an entity */
+-static void set_handle(uintptr_t *handle, io_entity_t *entity) {
+-    assert(handle !=3D NULL);
+-    *handle =3D (uintptr_t)entity;
+-}
+-
+-/* Locate an entity in the pool, specified by address */
+-static int find_first_entity(const io_entity_t *entity,
+-                             unsigned int *index_out) {
+-    int result =3D -ENOENT;
+-    for (unsigned int index =3D 0; index < MAX_IO_HANDLES; ++index) {
+-        if (entity_map[index] =3D=3D entity) {
+-            result =3D 0;
+-            *index_out =3D index;
+-            break;
+-        }
+-    }
+-    return result;
+-}
+-
+-/* Allocate an entity from the pool and return a pointer to it */
+-static int allocate_entity(io_entity_t **entity) {
+-    int result =3D -ENOMEM;
+-    assert(entity !=3D NULL);
+-
+-    if (entity_count < MAX_IO_HANDLES) {
+-        unsigned int index =3D 0;
+-        result =3D find_first_entity(NULL, &index);
+-        assert(result =3D=3D 0);
+-        *entity =3D &entity_pool[index];
+-        entity_map[index] =3D &entity_pool[index];
+-        ++entity_count;
+-    }
+-
+-    return result;
+-}
+-
+-/* Release an entity back to the pool */
+-static int free_entity(const io_entity_t *entity) {
+-    int result;
+-    unsigned int index =3D 0;
+-    assert(entity !=3D NULL);
+-
+-    result =3D find_first_entity(entity, &index);
+-    if (result =3D=3D 0) {
+-        entity_map[index] =3D NULL;
+-        --entity_count;
+-    }
+-
+-    return result;
+-}
+-
+-/* Exported API */
+-
+-/* Register an io device */
+-int io_register_device(const io_dev_info_t *dev_info) {
+-    int result =3D -ENOMEM;
+-    assert(dev_info !=3D NULL);
+-
+-    if (dev_count < MAX_IO_DEVICES) {
+-        devices[dev_count] =3D dev_info;
+-        dev_count++;
+-        result =3D 0;
+-    }
+-
+-    return result;
+-}
+-
+-/* Open a connection to an IO device */
+-int io_dev_open(const io_dev_connector_t *dev_con, const uintptr_t dev_=
spec,
+-                uintptr_t *handle) {
+-    assert(handle !=3D NULL);
+-    return io_storage_dev_open(dev_con, dev_spec, (io_dev_info_t **)han=
dle);
+-}
+-
+-/* Initialise an IO device explicitly - to permit lazy initialisation o=
r
+- * re-initialisation */
+-int io_dev_init(uintptr_t dev_handle, const uintptr_t init_params) {
+-    int result =3D 0;
+-    assert(dev_handle !=3D (uintptr_t)NULL);
+-    assert(is_valid_dev(dev_handle));
+-
+-    io_dev_info_t *dev =3D (io_dev_info_t *)dev_handle;
+-
+-    /* Absence of registered function implies NOP here */
+-    if (dev->funcs->dev_init !=3D NULL) {
+-        result =3D dev->funcs->dev_init(dev, init_params);
+-    }
+-
+-    return result;
+-}
+-
+-/* Close a connection to a device */
+-int io_dev_close(uintptr_t dev_handle) {
+-    int result =3D 0;
+-    assert(dev_handle !=3D (uintptr_t)NULL);
+-    assert(is_valid_dev(dev_handle));
+-
+-    io_dev_info_t *dev =3D (io_dev_info_t *)dev_handle;
+-
+-    /* Absence of registered function implies NOP here */
+-    if (dev->funcs->dev_close !=3D NULL) {
+-        result =3D dev->funcs->dev_close(dev);
+-    }
+-
+-    return result;
+-}
+-
+-/* Synchronous operations */
+-
+-/* Open an IO entity */
+-int io_open(uintptr_t dev_handle, const uintptr_t spec, uintptr_t *hand=
le) {
+-    int result;
+-    assert((spec !=3D (uintptr_t)NULL) && (handle !=3D NULL));
+-    assert(is_valid_dev(dev_handle));
+-
+-    io_dev_info_t *dev =3D (io_dev_info_t *)dev_handle;
+-    io_entity_t *entity;
+-
+-    result =3D allocate_entity(&entity);
+-
+-    if (result =3D=3D 0) {
+-        assert(dev->funcs->open !=3D NULL);
+-        result =3D dev->funcs->open(dev, spec, entity);
+-
+-        if (result =3D=3D 0) {
+-            entity->dev_handle =3D dev;
+-            set_handle(handle, entity);
+-        } else
+-            free_entity(entity);
+-    }
+-    return result;
+-}
+-
+-/* Seek to a specific position in an IO entity */
+-int io_seek(uintptr_t handle, io_seek_mode_t mode, int32_t offset) {
+-    int result =3D -ENODEV;
+-    assert(is_valid_entity(handle) && is_valid_seek_mode(mode));
+-
+-    io_entity_t *entity =3D (io_entity_t *)handle;
+-
+-    io_dev_info_t *dev =3D entity->dev_handle;
+-
+-    if (dev->funcs->seek !=3D NULL)
+-        result =3D dev->funcs->seek(entity, mode, offset);
+-
+-    return result;
+-}
+-
+-/* Determine the length of an IO entity */
+-int io_size(uintptr_t handle, size_t *length) {
+-    int result =3D -ENODEV;
+-    assert(is_valid_entity(handle) && (length !=3D NULL));
+-
+-    io_entity_t *entity =3D (io_entity_t *)handle;
+-
+-    io_dev_info_t *dev =3D entity->dev_handle;
+-
+-    if (dev->funcs->size !=3D NULL) result =3D dev->funcs->size(entity,=
 length);
+-
+-    return result;
+-}
+-
+-/* Read data from an IO entity */
+-int io_read(uintptr_t handle, uintptr_t buffer, size_t length,
+-            size_t *length_read) {
+-    int result =3D -ENODEV;
+-    assert(is_valid_entity(handle));
+-
+-    io_entity_t *entity =3D (io_entity_t *)handle;
+-
+-    io_dev_info_t *dev =3D entity->dev_handle;
+-
+-    if (dev->funcs->read !=3D NULL)
+-        result =3D dev->funcs->read(entity, buffer, length, length_read=
);
+-
+-    return result;
+-}
+-
+-/* Write data to an IO entity */
+-int io_write(uintptr_t handle, const uintptr_t buffer, size_t length,
+-             size_t *length_written) {
+-    int result =3D -ENODEV;
+-    assert(is_valid_entity(handle));
+-
+-    io_entity_t *entity =3D (io_entity_t *)handle;
+-
+-    io_dev_info_t *dev =3D entity->dev_handle;
+-
+-    if (dev->funcs->write !=3D NULL) {
+-        result =3D dev->funcs->write(entity, buffer, length, length_wri=
tten);
+-    }
+-
+-    return result;
+-}
+-
+-/* Close an IO entity */
+-int io_close(uintptr_t handle) {
+-    int result =3D 0;
+-    assert(is_valid_entity(handle));
+-
+-    io_entity_t *entity =3D (io_entity_t *)handle;
+-
+-    io_dev_info_t *dev =3D entity->dev_handle;
+-
+-    /* Absence of registered function implies NOP here */
+-    if (dev->funcs->close !=3D NULL) result =3D dev->funcs->close(entit=
y);
+-
+-    /* Ignore improbable free_entity failure */
+-    (void)free_entity(entity);
+-
+-    return result;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_storage.h b/plat=
form/ext/target/arm/corstone1000/io/io_storage.h
+deleted file mode 100644
+index 0cdca5b26..000000000
+--- a/platform/ext/target/arm/corstone1000/io/io_storage.h
++++ /dev/null
+@@ -1,92 +0,0 @@
+-/*
+- * Copyright (c) 2022 Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- *
+- * Licensed under the Apache License, Version 2.0 (the License); you ma=
y
+- * not use this file except in compliance with the License.
+- * You may obtain a copy of the License at
+- *
+- * http://www.apache.org/licenses/LICENSE-2.0
+- *
+- * Unless required by applicable law or agreed to in writing, software
+- * distributed under the License is distributed on an AS IS BASIS, WITH=
OUT
+- * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+- * See the License for the specific language governing permissions and
+- * limitations under the License.
+- */
+-
+-#ifndef __IO_STORAGE_H__
+-#define __IO_STORAGE_H__
+-
+-#include <stddef.h>
+-#include <stdint.h>
+-
+-/* Access modes used when accessing data on a device */
+-#define IO_MODE_INVALID (0)
+-#define IO_MODE_RO (1 << 0)
+-#define IO_MODE_RW (1 << 1)
+-
+-/* Device type which can be used to enable policy decisions about which=
 device
+- * to access */
+-typedef enum {
+-    IO_TYPE_INVALID,
+-    IO_TYPE_SEMIHOSTING,
+-    IO_TYPE_MEMMAP,
+-    IO_TYPE_DUMMY,
+-    IO_TYPE_FIRMWARE_IMAGE_PACKAGE,
+-    IO_TYPE_BLOCK,
+-    IO_TYPE_MTD,
+-    IO_TYPE_MMC,
+-    IO_TYPE_STM32IMAGE,
+-    IO_TYPE_ENCRYPTED,
+-    IO_TYPE_MAX
+-} io_type_t;
+-
+-/* Modes used when seeking data on a supported device */
+-typedef enum {
+-    IO_SEEK_INVALID,
+-    IO_SEEK_SET,
+-    IO_SEEK_END,
+-    IO_SEEK_CUR,
+-    IO_SEEK_MAX
+-} io_seek_mode_t;
+-
+-/* Connector type, providing a means of identifying a device to open */
+-struct io_dev_connector;
+-
+-/* Block specification - used to refer to data on a device supporting
+- * block-like entities */
+-typedef struct io_block_spec {
+-    size_t offset;
+-    size_t length;
+-} io_block_spec_t;
+-
+-
+-/* Open a connection to a device */
+-int io_dev_open(const struct io_dev_connector *dev_con,
+-                const uintptr_t dev_spec, uintptr_t *handle);
+-
+-/* Initialise a device explicitly - to permit lazy initialisation or
+- * re-initialisation */
+-int io_dev_init(uintptr_t dev_handle, const uintptr_t init_params);
+-
+-/* Close a connection to a device */
+-int io_dev_close(uintptr_t dev_handle);
+-
+-/* Synchronous operations */
+-int io_open(uintptr_t dev_handle, const uintptr_t spec, uintptr_t *hand=
le);
+-
+-int io_seek(uintptr_t handle, io_seek_mode_t mode, int32_t offset);
+-
+-int io_size(uintptr_t handle, size_t *length);
+-
+-int io_read(uintptr_t handle, uintptr_t buffer, size_t length,
+-            size_t *length_read);
+-
+-int io_write(uintptr_t handle, const uintptr_t buffer, size_t length,
+-             size_t *length_written);
+-
+-int io_close(uintptr_t handle);
+-
+-#endif /* __IO_STORAGE_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/partition/efi.h b/plat=
form/ext/target/arm/corstone1000/partition/efi.h
+deleted file mode 100644
+index 7e6a4bc88..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/efi.h
++++ /dev/null
+@@ -1,37 +0,0 @@
+-/*
+- * Copyright (c) 2021, Linaro Limited
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#ifndef DRIVERS_PARTITION_EFI_H
+-#define DRIVERS_PARTITION_EFI_H
+-
+-#include <stdint.h>
+-#include <string.h>
+-
+-#include "uuid.h"
+-
+-#define EFI_NAMELEN 36
+-
+-static inline int guidcmp(const void *g1, const void *g2) {
+-    return memcmp(g1, g2, sizeof(struct efi_guid));
+-}
+-
+-static inline void *guidcpy(void *dst, const void *src) {
+-    return memcpy(dst, src, sizeof(struct efi_guid));
+-}
+-
+-#define EFI_GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)  \
+-    {                                                      \
+-        (a) & 0xffffffff, (b)&0xffff, (c)&0xffff, {        \
+-            (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) \
+-        }                                                  \
+-    }
+-
+-#define NULL_GUID                                                      =
      \
+-    EFI_GUID(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, \
+-             0x00, 0x00)
+-
+-#endif /* DRIVERS_PARTITION_EFI_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/gpt.c b/plat=
form/ext/target/arm/corstone1000/partition/gpt.c
+deleted file mode 100644
+index 8549785e3..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/gpt.c
++++ /dev/null
+@@ -1,58 +0,0 @@
+-/*
+- * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights re=
served.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#include "gpt.h"
+-
+-#include <assert.h>
+-#include <errno.h>
+-#include <string.h>
+-
+-#include "efi.h"
+-
+-static int unicode_to_ascii(unsigned short *str_in, unsigned char *str_=
out) {
+-    uint8_t *name;
+-    int i;
+-
+-    assert((str_in !=3D NULL) && (str_out !=3D NULL));
+-
+-    name =3D (uint8_t *)str_in;
+-
+-    assert(name[0] !=3D '\0');
+-
+-    /* check whether the unicode string is valid */
+-    for (i =3D 1; i < (EFI_NAMELEN << 1); i +=3D 2) {
+-        if (name[i] !=3D '\0') return -EINVAL;
+-    }
+-    /* convert the unicode string to ascii string */
+-    for (i =3D 0; i < (EFI_NAMELEN << 1); i +=3D 2) {
+-        str_out[i >> 1] =3D name[i];
+-        if (name[i] =3D=3D '\0') break;
+-    }
+-    return 0;
+-}
+-
+-int parse_gpt_entry(gpt_entry_t *gpt_entry, partition_entry_t *entry) {
+-    int result;
+-
+-    assert((gpt_entry !=3D NULL) && (entry !=3D NULL));
+-
+-    if ((gpt_entry->first_lba =3D=3D 0) && (gpt_entry->last_lba =3D=3D =
0)) {
+-        return -EINVAL;
+-    }
+-
+-    memset(entry, 0, sizeof(partition_entry_t));
+-    result =3D unicode_to_ascii(gpt_entry->name, (uint8_t *)entry->name=
);
+-    if (result !=3D 0) {
+-        return result;
+-    }
+-    entry->start =3D (uint64_t)gpt_entry->first_lba * PLAT_PARTITION_BL=
OCK_SIZE;
+-    entry->length =3D (uint64_t)(gpt_entry->last_lba - gpt_entry->first=
_lba + 1) *
+-                    PLAT_PARTITION_BLOCK_SIZE;
+-    guidcpy(&entry->part_guid, &gpt_entry->unique_uuid);
+-    guidcpy(&entry->type_guid, &gpt_entry->type_uuid);
+-
+-    return 0;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/partition/gpt.h b/plat=
form/ext/target/arm/corstone1000/partition/gpt.h
+deleted file mode 100644
+index b528fc05c..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/gpt.h
++++ /dev/null
+@@ -1,51 +0,0 @@
+-/*
+- * Copyright (c) 2016, ARM Limited and Contributors. All rights reserve=
d.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#ifndef GPT_H
+-#define GPT_H
+-
+-#include "efi.h"
+-#include "partition.h"
+-#include "uuid.h"
+-
+-#define PARTITION_TYPE_GPT 0xee
+-#define GPT_HEADER_OFFSET PLAT_PARTITION_BLOCK_SIZE
+-#define GPT_ENTRY_OFFSET (GPT_HEADER_OFFSET + PLAT_PARTITION_BLOCK_SIZE=
)
+-
+-#define GPT_SIGNATURE "EFI PART"
+-
+-typedef struct gpt_entry {
+-    struct efi_guid type_uuid;
+-    struct efi_guid unique_uuid;
+-    unsigned long long first_lba;
+-    unsigned long long last_lba;
+-    unsigned long long attr;
+-    unsigned short name[EFI_NAMELEN];
+-} gpt_entry_t;
+-
+-typedef struct gpt_header {
+-    unsigned char signature[8];
+-    unsigned int revision;
+-    unsigned int size;
+-    unsigned int header_crc;
+-    unsigned int reserved;
+-    unsigned long long current_lba;
+-    unsigned long long backup_lba;
+-    unsigned long long first_lba;
+-    unsigned long long last_lba;
+-    struct efi_guid disk_uuid;
+-    /* starting LBA of array of partition entries */
+-    unsigned long long part_lba;
+-    /* number of partition entries in array */
+-    unsigned int list_num;
+-    /* size of a single partition entry (usually 128) */
+-    unsigned int part_size;
+-    unsigned int part_crc;
+-} gpt_header_t;
+-
+-int parse_gpt_entry(gpt_entry_t *gpt_entry, partition_entry_t *entry);
+-
+-#endif /* GPT_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/mbr.h b/plat=
form/ext/target/arm/corstone1000/partition/mbr.h
+deleted file mode 100644
+index e77f36701..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/mbr.h
++++ /dev/null
+@@ -1,29 +0,0 @@
+-/*
+- * Copyright (c) 2016, ARM Limited and Contributors. All rights reserve=
d.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#ifndef MBR_H
+-#define MBR_H
+-
+-#define MBR_OFFSET 0
+-
+-#define MBR_PRIMARY_ENTRY_OFFSET 0x1be
+-#define MBR_PRIMARY_ENTRY_SIZE 0x10
+-#define MBR_PRIMARY_ENTRY_NUMBER 4
+-#define MBR_CHS_ADDRESS_LEN 3
+-
+-#define MBR_SIGNATURE_FIRST 0x55
+-#define MBR_SIGNATURE_SECOND 0xAA
+-
+-typedef struct mbr_entry {
+-    unsigned char status;
+-    unsigned char first_sector[MBR_CHS_ADDRESS_LEN];
+-    unsigned char type;
+-    unsigned char last_sector[MBR_CHS_ADDRESS_LEN];
+-    unsigned int first_lba;
+-    unsigned int sector_nums;
+-} mbr_entry_t;
+-
+-#endif /* MBR_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/partition.c =
b/platform/ext/target/arm/corstone1000/partition/partition.c
+deleted file mode 100644
+index d76e123d7..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/partition.c
++++ /dev/null
+@@ -1,324 +0,0 @@
+-/*
+- * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights re=
served.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#include "partition.h"
+-
+-#include <assert.h>
+-#include <errno.h>
+-#include <inttypes.h>
+-#include <stdio.h>
+-#include <string.h>
+-
+-#include "efi.h"
+-#include "gpt.h"
+-#include "mbr.h"
+-
+-#include "io_storage.h"
+-#include "platform.h"
+-#include "soft_crc.h"
+-
+-#define PLAT_LOG_MODULE_NAME "partition"
+-#include "platform_log.h"
+-
+-static uint8_t mbr_sector[PLAT_PARTITION_BLOCK_SIZE];
+-static partition_entry_list_t list;
+-
+-#if LOG_LEVEL >=3D LOG_LEVEL_DEBUG
+-static void dump_entries(int num) {
+-    char name[EFI_NAMELEN];
+-    int i, j, len;
+-
+-    VERBOSE("Partition table with %d entries:", num);
+-    for (i =3D 0; i < num; i++) {
+-        len =3D snprintf(name, EFI_NAMELEN, "%s", list.list[i].name);
+-        for (j =3D 0; j < EFI_NAMELEN - len - 1; j++) {
+-            name[len + j] =3D ' ';
+-        }
+-        name[EFI_NAMELEN - 1] =3D '\0';
+-        VERBOSE("%d: %s %x%x %d", i + 1, name,
+-                (uint32_t)(list.list[i].start >> 32),
+-                (uint32_t)list.list[i].start,
+-                (uint32_t)(list.list[i].start + list.list[i].length - 4=
));
+-    }
+-}
+-#else
+-#define dump_entries(num) ((void)num)
+-#endif
+-
+-/*
+- * Load the first sector that carries MBR header.
+- * The MBR boot signature should be always valid whether it's MBR or GP=
T.
+- */
+-static int load_mbr_header(uintptr_t image_handle, mbr_entry_t *mbr_ent=
ry) {
+-    size_t bytes_read;
+-    uintptr_t offset;
+-    int result;
+-
+-    assert(mbr_entry !=3D NULL);
+-    /* MBR partition table is in LBA0. */
+-    result =3D io_seek(image_handle, IO_SEEK_SET, MBR_OFFSET);
+-    if (result !=3D 0) {
+-        WARN("Failed to seek (%i)\n", result);
+-        return result;
+-    }
+-    result =3D io_read(image_handle, (uintptr_t)&mbr_sector,
+-                     PLAT_PARTITION_BLOCK_SIZE, &bytes_read);
+-    if (result !=3D 0) {
+-        WARN("Failed to read data (%i)\n", result);
+-        return result;
+-    }
+-
+-    /* Check MBR boot signature. */
+-    if ((mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 2] !=3D MBR_SIGNATURE=
_FIRST) ||
+-        (mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 1] !=3D MBR_SIGNATURE=
_SECOND)) {
+-        ERROR("MBR signature isn't correct");
+-        return -ENOENT;
+-    }
+-    offset =3D (uintptr_t)&mbr_sector + MBR_PRIMARY_ENTRY_OFFSET;
+-    memcpy(mbr_entry, (void *)offset, sizeof(mbr_entry_t));
+-    return 0;
+-}
+-
+-/*
+- * Load GPT header and check the GPT signature and header CRC.
+- * If partition numbers could be found, check & update it.
+- */
+-static int load_gpt_header(uintptr_t image_handle) {
+-    gpt_header_t header;
+-    size_t bytes_read;
+-    int result;
+-    uint32_t header_crc, calc_crc;
+-
+-    result =3D io_seek(image_handle, IO_SEEK_SET, GPT_HEADER_OFFSET);
+-    if (result !=3D 0) {
+-        return result;
+-    }
+-    result =3D io_read(image_handle, (uintptr_t)&header, sizeof(gpt_hea=
der_t),
+-                     &bytes_read);
+-    if ((result !=3D 0) || (sizeof(gpt_header_t) !=3D bytes_read)) {
+-        return result;
+-    }
+-    if (memcmp(header.signature, GPT_SIGNATURE, sizeof(header.signature=
)) !=3D
+-        0) {
+-        return -EINVAL;
+-    }
+-
+-    /*
+-     * UEFI Spec 2.8 March 2019 Page 119: HeaderCRC32 value is
+-     * computed by setting this field to 0, and computing the
+-     * 32-bit CRC for HeaderSize bytes.
+-     */
+-    header_crc =3D header.header_crc;
+-    header.header_crc =3D 0U;
+-
+-    calc_crc =3D crc32((uint8_t *)&header, DEFAULT_GPT_HEADER_SIZE);
+-    if (header_crc !=3D calc_crc) {
+-        ERROR("Invalid GPT Header CRC: Expected 0x%x but got 0x%x.\n",
+-              header_crc, calc_crc);
+-        return -EINVAL;
+-    }
+-
+-    header.header_crc =3D header_crc;
+-
+-    /* partition numbers can't exceed PLAT_PARTITION_MAX_ENTRIES */
+-    list.entry_count =3D header.list_num;
+-    if (list.entry_count > PLAT_PARTITION_MAX_ENTRIES) {
+-        list.entry_count =3D PLAT_PARTITION_MAX_ENTRIES;
+-    }
+-    return 0;
+-}
+-
+-static int load_mbr_entry(uintptr_t image_handle, mbr_entry_t *mbr_entr=
y,
+-                          int part_number) {
+-    size_t bytes_read;
+-    uintptr_t offset;
+-    int result;
+-
+-    assert(mbr_entry !=3D NULL);
+-    /* MBR partition table is in LBA0. */
+-    result =3D io_seek(image_handle, IO_SEEK_SET, MBR_OFFSET);
+-    if (result !=3D 0) {
+-        WARN("Failed to seek (%i)\n", result);
+-        return result;
+-    }
+-    result =3D io_read(image_handle, (uintptr_t)&mbr_sector,
+-                     PLAT_PARTITION_BLOCK_SIZE, &bytes_read);
+-    if (result !=3D 0) {
+-        WARN("Failed to read data (%i)\n", result);
+-        return result;
+-    }
+-
+-    /* Check MBR boot signature. */
+-    if ((mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 2] !=3D MBR_SIGNATURE=
_FIRST) ||
+-        (mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 1] !=3D MBR_SIGNATURE=
_SECOND)) {
+-        return -ENOENT;
+-    }
+-    offset =3D (uintptr_t)&mbr_sector + MBR_PRIMARY_ENTRY_OFFSET +
+-             MBR_PRIMARY_ENTRY_SIZE * part_number;
+-    memcpy(mbr_entry, (void *)offset, sizeof(mbr_entry_t));
+-
+-    return 0;
+-}
+-
+-static int load_mbr_entries(uintptr_t image_handle) {
+-    mbr_entry_t mbr_entry;
+-    int i;
+-
+-    list.entry_count =3D MBR_PRIMARY_ENTRY_NUMBER;
+-
+-    for (i =3D 0; i < list.entry_count; i++) {
+-        load_mbr_entry(image_handle, &mbr_entry, i);
+-        list.list[i].start =3D mbr_entry.first_lba * 512;
+-        list.list[i].length =3D mbr_entry.sector_nums * 512;
+-        list.list[i].name[0] =3D mbr_entry.type;
+-    }
+-
+-    return 0;
+-}
+-
+-static int load_gpt_entry(uintptr_t image_handle, gpt_entry_t *entry) {
+-    size_t bytes_read;
+-    int result;
+-
+-    assert(entry !=3D NULL);
+-    result =3D io_read(image_handle, (uintptr_t)entry, sizeof(gpt_entry=
_t),
+-                     &bytes_read);
+-    if (sizeof(gpt_entry_t) !=3D bytes_read) return -EINVAL;
+-    return result;
+-}
+-
+-static int verify_partition_gpt(uintptr_t image_handle) {
+-    gpt_entry_t entry;
+-    int result, i;
+-
+-    for (i =3D 0; i < list.entry_count; i++) {
+-        result =3D load_gpt_entry(image_handle, &entry);
+-        assert(result =3D=3D 0);
+-        if (result !=3D 0) {
+-            break;
+-        }
+-        result =3D parse_gpt_entry(&entry, &list.list[i]);
+-        if (result !=3D 0) {
+-            break;
+-        }
+-    }
+-    if (i =3D=3D 0) {
+-        return -EINVAL;
+-    }
+-    /*
+-     * Only records the valid partition number that is loaded from
+-     * partition table.
+-     */
+-    list.entry_count =3D i;
+-    dump_entries(list.entry_count);
+-
+-    return 0;
+-}
+-
+-int load_partition_table(unsigned int image_id) {
+-    uintptr_t dev_handle, image_handle, image_spec =3D 0;
+-    mbr_entry_t mbr_entry;
+-    int result;
+-
+-    result =3D plat_get_image_source(image_id, &dev_handle, &image_spec=
);
+-    if (result !=3D 0) {
+-        WARN("Failed to obtain reference to image id=3D%u (%i)\n", imag=
e_id,
+-             result);
+-        return result;
+-    }
+-
+-    result =3D io_open(dev_handle, image_spec, &image_handle);
+-    if (result !=3D 0) {
+-        WARN("Failed to open image id=3D%u (%i)\n", image_id, result);
+-        return result;
+-    }
+-
+-    result =3D load_mbr_header(image_handle, &mbr_entry);
+-    if (result !=3D 0) {
+-        ERROR("Loading mbr header failed with image id=3D%u (%i)\n", im=
age_id,
+-              result);
+-        return result;
+-    }
+-    if (mbr_entry.type =3D=3D PARTITION_TYPE_GPT) {
+-        INFO("Loading gpt header");
+-        result =3D load_gpt_header(image_handle);
+-        assert(result =3D=3D 0);
+-        if (result !=3D 0) {
+-            ERROR("Failed load gpt header! %i", result);
+-            goto load_partition_table_exit;
+-        }
+-        result =3D io_seek(image_handle, IO_SEEK_SET, GPT_ENTRY_OFFSET)=
;
+-        assert(result =3D=3D 0);
+-        if (result !=3D 0) {
+-            ERROR("Failed seek gpt header! %i", result);
+-            goto load_partition_table_exit;
+-        }
+-        result =3D verify_partition_gpt(image_handle);
+-        if (result !=3D 0) {
+-            ERROR("Failed verify gpt partition %i", result);
+-            goto load_partition_table_exit;
+-        }
+-    } else {
+-        result =3D load_mbr_entries(image_handle);
+-    }
+-
+-load_partition_table_exit:
+-    io_close(image_handle);
+-    return result;
+-}
+-
+-const partition_entry_t *get_partition_entry(const char *name) {
+-    int i;
+-
+-    for (i =3D 0; i < list.entry_count; i++) {
+-        if (strcmp(name, list.list[i].name) =3D=3D 0) {
+-            return &list.list[i];
+-        }
+-    }
+-    return NULL;
+-}
+-
+-const partition_entry_t *get_partition_entry_by_type(const uuid_t *type=
_uuid) {
+-    int i;
+-
+-    for (i =3D 0; i < list.entry_count; i++) {
+-        if (guidcmp(type_uuid, &list.list[i].type_guid) =3D=3D 0) {
+-            return &list.list[i];
+-        }
+-    }
+-
+-    return NULL;
+-}
+-
+-const partition_entry_t *get_partition_replica_by_type(const uuid_t *ty=
pe_uuid) {
+-    int count =3D 0;
+-    int i;
+-
+-    for (i =3D 0; i < list.entry_count; i++) {
+-        if (guidcmp(type_uuid, &list.list[i].type_guid) =3D=3D 0) {
+-            if (++count =3D=3D 2)
+-                 return &list.list[i];
+-        }
+-    }
+-
+-    return NULL;
+-}
+-
+-const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part=
_uuid) {
+-    int i;
+-
+-    for (i =3D 0; i < list.entry_count; i++) {
+-        if (guidcmp(part_uuid, &list.list[i].part_guid) =3D=3D 0) {
+-            return &list.list[i];
+-        }
+-    }
+-
+-    return NULL;
+-}
+-
+-const partition_entry_list_t *get_partition_entry_list(void) { return &=
list; }
+-
+-void partition_init(unsigned int image_id) { load_partition_table(image=
_id); }
+diff --git a/platform/ext/target/arm/corstone1000/partition/partition.h =
b/platform/ext/target/arm/corstone1000/partition/partition.h
+deleted file mode 100644
+index 450cf20a0..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/partition.h
++++ /dev/null
+@@ -1,48 +0,0 @@
+-/*
+- * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights re=
served.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#ifndef PARTITION_H
+-#define PARTITION_H
+-
+-#include <stdint.h>
+-
+-#include "efi.h"
+-#include "uuid.h"
+-
+-#if !PLAT_PARTITION_MAX_ENTRIES
+-#define PLAT_PARTITION_MAX_ENTRIES 16
+-#endif /* PLAT_PARTITION_MAX_ENTRIES */
+-
+-#if !PLAT_PARTITION_BLOCK_SIZE
+-#define PLAT_PARTITION_BLOCK_SIZE 512
+-#endif /* PLAT_PARTITION_BLOCK_SIZE */
+-
+-#define LEGACY_PARTITION_BLOCK_SIZE 512
+-
+-#define DEFAULT_GPT_HEADER_SIZE 92
+-
+-typedef struct partition_entry {
+-    uint64_t start;
+-    uint64_t length;
+-    char name[EFI_NAMELEN];
+-    struct efi_guid part_guid;
+-    struct efi_guid type_guid;
+-} partition_entry_t;
+-
+-typedef struct partition_entry_list {
+-    partition_entry_t list[PLAT_PARTITION_MAX_ENTRIES];
+-    int entry_count;
+-} partition_entry_list_t;
+-
+-int load_partition_table(unsigned int image_id);
+-const partition_entry_t *get_partition_entry(const char *name);
+-const partition_entry_t *get_partition_entry_by_type(const uuid_t *type=
_guid);
+-const partition_entry_t *get_partition_replica_by_type(const uuid_t *ty=
pe_uuid);
+-const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part=
_uuid);
+-const partition_entry_list_t *get_partition_entry_list(void);
+-void partition_init(unsigned int image_id);
+-
+-#endif /* PARTITION_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/uuid.h b/pla=
tform/ext/target/arm/corstone1000/partition/uuid.h
+deleted file mode 100644
+index 06fec5a3c..000000000
+--- a/platform/ext/target/arm/corstone1000/partition/uuid.h
++++ /dev/null
+@@ -1,76 +0,0 @@
+-/*-
+- * Copyright (c) 2002 Marcel Moolenaar
+- * All rights reserved.
+- *
+- * Redistribution and use in source and binary forms, with or without
+- * modification, are permitted provided that the following conditions
+- * are met:
+- *
+- * 1. Redistributions of source code must retain the above copyright
+- *    notice, this list of conditions and the following disclaimer.
+- * 2. Redistributions in binary form must reproduce the above copyright
+- *    notice, this list of conditions and the following disclaimer in t=
he
+- *    documentation and/or other materials provided with the distributi=
on.
+- *
+- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRA=
NTIES
+- * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIM=
ED.
+- * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,=
 BUT
+- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF=
 USE,
+- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
+- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF
+- * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+- *
+- * $FreeBSD$
+- */
+-
+-/*
+- * Portions copyright (c) 2014-2020, ARM Limited and Contributors.
+- * All rights reserved.
+- */
+-
+-#ifndef UUID_H
+-#define UUID_H
+-
+-#include <stdint.h>
+-
+-/* Length of a node address (an IEEE 802 address). */
+-#define _UUID_NODE_LEN 6
+-
+-/* Length of UUID string including dashes. */
+-#define _UUID_STR_LEN 36
+-
+-/*
+- * See also:
+- *      http://www.opengroup.org/dce/info/draft-leach-uuids-guids-01.tx=
t
+- *      http://www.opengroup.org/onlinepubs/009629399/apdxa.htm
+- *
+- * A DCE 1.1 compatible source representation of UUIDs.
+- */
+-struct uuid {
+-    uint8_t time_low[4];
+-    uint8_t time_mid[2];
+-    uint8_t time_hi_and_version[2];
+-    uint8_t clock_seq_hi_and_reserved;
+-    uint8_t clock_seq_low;
+-    uint8_t node[_UUID_NODE_LEN];
+-};
+-
+-struct efi_guid {
+-    uint32_t time_low;
+-    uint16_t time_mid;
+-    uint16_t time_hi_and_version;
+-    uint8_t clock_seq_and_node[8];
+-};
+-
+-union uuid_helper_t {
+-    struct uuid uuid_struct;
+-    struct efi_guid efi_guid;
+-};
+-
+-/* XXX namespace pollution? */
+-typedef struct uuid uuid_t;
+-
+-#endif /* UUID_H */
+diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/=
ext/target/arm/corstone1000/platform.c
+index 32fdc55aa..c8157752a 100644
+--- a/platform/ext/target/arm/corstone1000/platform.c
++++ b/platform/ext/target/arm/corstone1000/platform.c
+@@ -10,90 +10,25 @@
+ #include "Driver_Flash.h"
+ #include "flash_layout.h"
+=20
+-#include "io_driver.h"
+-#include "io_flash.h"
+-#include "io_storage.h"
++#include "io_gpt.h"
+=20
+ #include "platform.h"
+=20
+ #define PLAT_LOG_MODULE_NAME    "platform"
+ #include "platform_log.h"
+=20
+-typedef struct {
+-    uintptr_t dev_handle;
+-    uintptr_t image_spec;
+-} platform_image_source_t;
+-
+ extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
+=20
+-static io_dev_connector_t *flash_dev_con;
+-static uint8_t local_block_flash[FLASH_SECTOR_SIZE];
+-static io_flash_dev_spec_t flash_dev_spec =3D {
+-    .buffer =3D (uintptr_t)local_block_flash,
+-    .bufferlen =3D FLASH_SECTOR_SIZE,
+-    .base_addr =3D FLASH_BASE_ADDRESS,
+-    .flash_driver =3D (uintptr_t)&FLASH_DEV_NAME,
+-};
+-static io_block_spec_t flash_spec =3D {
+-    .offset =3D FLASH_BASE_ADDRESS,
+-    .length =3D FLASH_TOTAL_SIZE
+-};
+-
+-static platform_image_source_t platform_image_source[] =3D {
+-    [PLATFORM_GPT_IMAGE] =3D {
+-        .dev_handle =3D (uintptr_t)NULL,
+-        .image_spec =3D (uintptr_t)&flash_spec,
+-    }
+-};
+=20
+ /* Initialize io storage of the platform */
+ int32_t plat_io_storage_init(void)
+ {
+-    int rc =3D -1;
+-    uintptr_t flash_dev_handle =3D (uintptr_t)NULL;
+-    uintptr_t flash_handle =3D (uintptr_t)NULL;
+=20
+-    rc =3D register_io_dev_flash((const io_dev_connector_t **) &flash_d=
ev_con);
++    /* The GPT library requires a flash driver in order to do I/O */
++    int rc =3D register_flash_io_gpt(&FLASH_DEV_NAME);
+     if (rc !=3D 0) {
+         ERROR("Failed to register io flash rc: %d", rc);
+-        return rc;
+     }
+=20
+-    rc =3D io_dev_open(flash_dev_con, (const uintptr_t)&flash_dev_spec,=
 &flash_dev_handle);
+-    if (rc !=3D 0) {
+-        ERROR("Failed to open io flash dev rc: %d", rc);
+-        return rc;
+-    }
+-
+-    VERBOSE("Flash_dev_handle =3D %p",flash_dev_handle);
+-
+-    rc =3D io_open(flash_dev_handle, (const uintptr_t)&flash_spec, &fla=
sh_handle);
+-    if (rc !=3D 0) {
+-        ERROR("Failed to open io flash rc: %d", rc);
+-        return rc;
+-    }
+-
+-    VERBOSE("Flash_handle =3D %p",flash_handle);
+-
+-    rc =3D io_close(flash_handle);
+-    if (rc !=3D 0) {
+-        ERROR("Failed to close io flash rc: %d", rc);
+-        return rc;
+-    }
+-    /* Update the platform image source that uses the flash with dev ha=
ndles */
+-    platform_image_source[PLATFORM_GPT_IMAGE].dev_handle =3D flash_dev_=
handle;
+-
+     return rc;
+ }
+-
+-/* Return an IO device handle and specification which can be used to ac=
cess
+- * an image. This has to be implemented for the GPT parser. */
+-int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_han=
dle,
+-                              uintptr_t *image_spec) {
+-    if (image_id >=3D PLATFORM_IMAGE_COUNT) {
+-        return -1;
+-    }
+-    *dev_handle =3D platform_image_source[image_id].dev_handle;
+-    *image_spec =3D platform_image_source[image_id].image_spec;
+-    return 0;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/=
ext/target/arm/corstone1000/platform.h
+index 906a8f9ae..96bee50dc 100644
+--- a/platform/ext/target/arm/corstone1000/platform.h
++++ b/platform/ext/target/arm/corstone1000/platform.h
+@@ -8,22 +8,28 @@
+ #ifndef __PLATFORM_H__
+ #define __PLATFORM_H__
+=20
+-typedef enum {
+-    PLATFORM_GPT_IMAGE =3D 0,
+-    PLATFORM_IMAGE_COUNT,
+-}platform_image_id_t;
++#include "efi_guid_structs.h"
+=20
+-#define FWU_METADATA_TYPE_UUID \
+-     ((uuid_t){{0xa0, 0x84, 0x7a, 0x8a}, {0x87, 0x83}, {0xf6, 0x40}, 0x=
ab,  0x41, {0xa8, 0xb9, 0xa5, 0xa6, 0x0d, 0x23}})
+-#define PRIVATE_METADATA_TYPE_UUID \
+-     ((uuid_t){{0xc3, 0x5d, 0xb5, 0xec}, {0xb7, 0x8a}, {0x84, 0x4a}, 0x=
ab,  0x56, {0xeb, 0x0a, 0x99, 0x74, 0xdb, 0x42}})
++#if !PLAT_GPT_MAX_PARTITIONS
++#define PLAT_GPT_MAX_PARTITIONS 16
++#endif /* PLAT_GPT_MAX_PARTITIONS */
++
++#define FWU_METADATA_TYPE_UUID  \
++    MAKE_EFI_GUID(              \
++            0x8A7A84A0,         \
++            0x8387,             \
++            0x40F6,             \
++            0xAB, 0x41,         \
++            0xA8, 0xB9, 0xA5, 0xA6, 0x0D, 0x23)
++#define PRIVATE_METADATA_TYPE_UUID  \
++    MAKE_EFI_GUID(                  \
++            0xECB55DC3,             \
++            0x8AB7,                 \
++            0x4A84,                 \
++            0xAB, 0x56,             \
++            0xEB, 0x0A, 0x99, 0x74, 0xDB, 0x42)
+=20
+ /* Initialize io storage of the platform */
+ int32_t plat_io_storage_init(void);
+=20
+-/* Return an IO device handle and specification which can be used to ac=
cess
+- * an image. This has to be implemented for the GPT parser. */
+-int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_han=
dle,
+-                              uintptr_t *image_spec);
+-
+ #endif /*__PLATFORM_H__*/
+diff --git a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c b/=
platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
+deleted file mode 100644
+index 85f1e30d9..000000000
+--- a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
++++ /dev/null
+@@ -1,121 +0,0 @@
+-/* Copyright (C) 1986 Gary S. Brown.  You may use this program, or
+-   code or tables extracted from it, as desired without restriction.*/
+-
+-/* First, the polynomial itself and its table of feedback terms.  The  =
*/
+-/* polynomial is                                                       =
*/
+-/* X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0 =
*/
+-/* Note that we take it "backwards" and put the highest-order term in  =
*/
+-/* the lowest-order bit.  The X^32 term is "implied"; the LSB is the   =
*/
+-/* X^31 term, etc.  The X^0 term (usually shown as "+1") results in    =
*/
+-/* the MSB being 1.                                                    =
*/
+-
+-/* Note that the usual hardware shift register implementation, which   =
*/
+-/* is what we're using (we're merely optimizing it by doing eight-bit  =
*/
+-/* chunks at a time) shifts bits into the lowest-order term.  In our   =
*/
+-/* implementation, that means shifting towards the right.  Why do we   =
*/
+-/* do it this way?  Because the calculated CRC must be transmitted in  =
*/
+-/* order from highest-order term to lowest-order term.  UARTs transmit =
*/
+-/* characters in order from LSB to MSB.  By storing the CRC this way,  =
*/
+-/* we hand it to the UART in the order low-byte to high-byte; the UART =
*/
+-/* sends each low-bit to hight-bit; and the result is transmission bit =
*/
+-/* by bit from highest- to lowest-order term without requiring any bit =
*/
+-/* shuffling on our part.  Reception works similarly.                  =
*/
+-
+-/* The feedback terms table consists of 256, 32-bit entries.  Notes:   =
*/
+-/*                                                                     =
*/
+-/*  1. The table can be generated at runtime if desired; code to do so =
*/
+-/*     is shown later.  It might not be obvious, but the feedback      =
*/
+-/*     terms simply represent the results of eight shift/xor opera-    =
*/
+-/*     tions for all combinations of data and CRC register values.     =
*/
+-/*                                                                     =
*/
+-/*  2. The CRC accumulation logic is the same for all CRC polynomials, =
*/
+-/*     be they sixteen or thirty-two bits wide.  You simply choose the =
*/
+-/*     appropriate table.  Alternatively, because the table can be     =
*/
+-/*     generated at runtime, you can start by generating the table for =
*/
+-/*     the polynomial in question and use exactly the same "updcrc",   =
*/
+-/*     if your application needn't simultaneously handle two CRC       =
*/
+-/*     polynomials.  (Note, however, that XMODEM is strange.)          =
*/
+-/*                                                                     =
*/
+-/*  3. For 16-bit CRCs, the table entries need be only 16 bits wide;   =
*/
+-/*     of course, 32-bit entries work OK if the high 16 bits are zero. =
*/
+-/*                                                                     =
*/
+-/*  4. The values must be right-shifted by eight bits by the "updcrc"  =
*/
+-/*     logic; the shift must be unsigned (bring in zeroes).  On some   =
*/
+-/*     hardware you could probably optimize the shift in assembler by  =
*/
+-/*     using byte-swap instructions.                                   =
*/
+-
+-/**
+- * The code derived from work by Gary S. Brown.
+-*/
+-
+-#include "soft_crc.h"
+-
+-
+-const static uint32_t crc_32_tab[] =3D { /* CRC polynomial 0xedb88320 *=
/
+-0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
+-0xe963a535, 0x9e6495a3, 0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
+-0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91, 0x1db71064, 0x6ab020f2,
+-0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
+-0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9,
+-0xfa0f3d63, 0x8d080df5, 0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
+-0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b, 0x35b5a8fa, 0x42b2986c,
+-0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
+-0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423,
+-0xcfba9599, 0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
+-0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d, 0x76dc4190, 0x01db7106,
+-0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
+-0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d,
+-0x91646c97, 0xe6635c01, 0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
+-0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
+-0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
+-0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7,
+-0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
+-0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa,
+-0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
+-0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81,
+-0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
+-0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683, 0xe3630b12, 0x94643b84,
+-0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
+-0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
+-0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
+-0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5, 0xd6d6a3e8, 0xa1d1937e,
+-0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
+-0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55,
+-0x316e8eef, 0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
+-0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe, 0xb2bd0b28,
+-0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
+-0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f,
+-0x72076785, 0x05005713, 0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
+-0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
+-0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
+-0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69,
+-0x616bffd3, 0x166ccf45, 0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
+-0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc,
+-0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
+-0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693,
+-0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
+-0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
+-};
+-
+-#define UPDC32(octet,crc) (crc_32_tab[((crc)\
+-     ^ ((uint8_t)octet)) & 0xff] ^ ((crc) >> 8))
+-
+-static inline uint32_t crc32buf(char *buf, size_t len)
+-{
+-      register uint32_t oldcrc32;
+-
+-      oldcrc32 =3D 0xFFFFFFFF;
+-
+-      for ( ; len; --len, ++buf)
+-      {
+-            oldcrc32 =3D UPDC32(*buf, oldcrc32);
+-      }
+-
+-      return ~oldcrc32;
+-}
+-
+-/* Calculate crc32 */
+-uint32_t crc32(const void *buf, size_t len) {
+-    return crc32buf(buf, len);
+-}
+-
+diff --git a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h b/=
platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
+deleted file mode 100644
+index e5b06075c..000000000
+--- a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
++++ /dev/null
+@@ -1,18 +0,0 @@
+-/*
+- * Copyright (c) 2023, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#ifndef __SOFT_CRC_H__
+-#define __SOFT_CRC_H__
+-
+-#include <stddef.h>
+-#include <stdint.h>
+-
+-/* Calculate crc32 */
+-uint32_t crc32(const void *buf, size_t len);
+-
+-#endif /* __SOFT_CRC_H__ */
+-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0042-plat-cs1k-Move-variable-from-stack-to-data.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0042-plat-cs1k-Move-vari=
able-from-stack-to-data.patch
new file mode 100644
index 00000000..d5921afa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0042=
-plat-cs1k-Move-variable-from-stack-to-data.patch
@@ -0,0 +1,55 @@
+From 201166be49ca4c0079cf804f208534f201cb4b65 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 16:53:54 +0000
+Subject: [PATCH] plat: cs1k: Move variable from stack to data
+
+The firmware update secure partition stack is only 0x600 bytes in size.
+The variable moved is a buffer of size 0x200, consituting one third of
+the available stack. Moving this to the much larger .data section allows
+much more stack space if required.
+
+Change-Id: I59d68e80acefaeea36c7060442e005998217d923
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49430]
+---
+ .../arm/corstone1000/bootloader/mcuboot/tfm_mcuboot_fwu.c   | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 5e1c4ecc5..a35125b00 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -39,6 +39,7 @@
+  * This is used when bank consistency is maintained during partial caps=
ule update
+  */
+ #define FLASH_CHUNK_SIZE                512
++static uint8_t flash_data_buf[FLASH_CHUNK_SIZE];
+=20
+ /* Possible states of the bank.
+  * Naming convention here matches the implementation in U-Boot=20
+@@ -1978,7 +1979,6 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+     FWU_LOG_FUNC_ENTER;
+=20
+     uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
+-    uint8_t data[FLASH_CHUNK_SIZE];
+     size_t remaining_size =3D fwu_image[image_index].image_size;
+     size_t data_size;
+     size_t offset_read =3D bank_offset[active_index] + fwu_image[image_=
index].image_offset;
+@@ -1997,7 +1997,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+         data_size =3D (remaining_size > FLASH_CHUNK_SIZE) ? FLASH_CHUNK=
_SIZE : remaining_size;
+=20
+         /* read image data from flash */
+-        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, data, data_size);
++        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, flash_data_buf, data_size);
+         if (data_transferred_count < 0) {
+             FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
+             return PSA_ERROR_STORAGE_FAILURE;
+@@ -2012,7 +2012,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
+         offset_read +=3D data_size;
+=20
+         /* write image data to flash */
+-        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, data, data_size);
++        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, flash_data_buf, data_size);
+         if (data_transferred_count < 0) {
+             FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
+             return PSA_ERROR_STORAGE_FAILURE;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0043-plat-cs1k-Create-and-remove-FWU-image-partitions.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0043-plat-cs1k-Cre=
ate-and-remove-FWU-image-partitions.patch
new file mode 100644
index 00000000..513765e9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0043=
-plat-cs1k-Create-and-remove-FWU-image-partitions.patch
@@ -0,0 +1,521 @@
+From 93101e6de045c0c4d633c502616ccf184c07e70a Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 13:42:16 +0000
+Subject: [PATCH] plat: cs1k: Create and remove FWU image partitions
+
+Previous to this commit, the GPT library was used only to read each
+firmware update image partition. However, the library now is used to
+create new partitions, if they don't exist, at the start of an update
+and remove the unused partitions at the end of an update, regardless of
+whether the images were accepted or rejected.
+
+The images are not moved and are still placed in fixed offsets, so the
+idea of a ping-pong between banks still persists.
+
+Change-Id: Ie2a2f0246a500c01019e3b498ac131466a2b3c84
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49431]
+---
+ .../arm/corstone1000/bootloader/fwu_agent.h   |   7 +-
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 313 +++++++++++++++++-
+ 2 files changed, 302 insertions(+), 18 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h=
 b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
+index 4393f5f7b..729e1594c 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
+@@ -8,6 +8,7 @@
+ #ifndef FWU_AGENT_H
+ #define FWU_AGENT_H
+=20
++#include "flash_layout.h"
+ #include "psa/error.h"
+ #include "efi_guid_structs.h"
+ #include "gpt.h"
+@@ -47,7 +48,7 @@ typedef struct {
+     size_t image_size_recvd;
+ } __packed fmp_header_image_info_t;
+=20
+-/* Image information common for both the banks */
++/* Image information for each bank */
+ typedef struct {
+     /* Total size of the image */
+     uint32_t image_size;
+@@ -55,8 +56,8 @@ typedef struct {
+     /* Offset of image within a bank. */
+     uint32_t image_offset;
+=20
+-    /* Name of the image in ascii */
+-    char image_name[FWU_IMAGE_NAME_LENGTH];
++    /* Names of the image in ascii, one for each bank */
++    const char image_names[NR_OF_FW_BANKS][FWU_IMAGE_NAME_LENGTH];
+=20
+     /* Image-type GUID */
+     struct efi_guid_t image_type;
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index a35125b00..71a91ade5 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -214,7 +214,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+ #if PLATFORM_IS_FVP
+     // FVP payloads GUIDs
+     {
+-        .image_name =3D "bl2_secondary",
++        .image_names =3D {"bl2_primary", "bl2_secondary"},
+         .image_size =3D SE_BL2_PARTITION_SIZE,
+         .image_offset =3D SE_BL2_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -227,7 +227,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+         },
+     },
+     {
+-        .image_name =3D "tfm_secondary",
++        .image_names =3D {"tfm_primary", "tfm_secondary"},
+         .image_size =3D TFM_PARTITION_SIZE,
+         .image_offset =3D TFM_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -240,7 +240,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+         },
+     },
+     {
+-        .image_name =3D "FIP_B",
++        .image_names =3D {"FIP_A", "FIP_B"},
+         .image_size =3D FIP_PARTITION_SIZE,
+         .image_offset =3D FIP_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -253,7 +253,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+         },
+     },
+     {
+-        .image_name =3D "kernel_secondary",
++        .image_names =3D {"kernel_primary", "kernel_secondary"},
+         .image_size =3D INITRAMFS_PARTITION_SIZE,
+         .image_offset =3D INITRAMFS_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -268,7 +268,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+ #else
+     // MPS3 payloads GUIDs
+     {
+-        .image_name =3D "bl2_secondary",
++        .image_names =3D {"bl2_primary", "bl2_secondary"},
+         .image_size =3D SE_BL2_PARTITION_SIZE,
+         .image_offset =3D SE_BL2_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -281,7 +281,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+         },
+     },
+     {
+-        .image_name =3D "tfm_secondary",
++        .image_names =3D {"tfm_primary", "tfm_secondary"},
+         .image_size =3D TFM_PARTITION_SIZE,
+         .image_offset =3D TFM_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -294,7 +294,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+         }
+     },
+     {
+-        .image_name =3D "FIP_B",
++        .image_names =3D {"FIP_A", "FIP_B"},
+         .image_size =3D FIP_PARTITION_SIZE,
+         .image_offset =3D FIP_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -307,7 +307,7 @@ const fwu_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_=
BANK] =3D {
+         }
+     },
+     {
+-        .image_name =3D "kernel_secondary",
++        .image_names =3D {"kernel_primary", "kernel_secondary"},
+         .image_size =3D INITRAMFS_PARTITION_SIZE,
+         .image_offset =3D INITRAMFS_PARTITION_BANK_OFFSET,
+         .image_type =3D {
+@@ -354,6 +354,15 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+                                                                        =
           * This is the value decided after monitoring the total time
+                                                                        =
           * taken by the host to boot both on FVP and FPGA.
+                                                                        =
           */
++#ifndef BL1_BUILD
++static void ascii_to_unicode(const char *ascii, char *unicode)
++{
++    for (int i =3D 0; i < strlen(ascii) + 1; ++i) {
++        unicode[i << 1] =3D ascii[i];
++        unicode[(i << 1) + 1] =3D '\0';
++    }
++}
++#endif
+=20
+ #ifdef BL1_BUILD
+ static psa_status_t private_metadata_read(
+@@ -856,6 +865,11 @@ psa_status_t fwu_metadata_init(void)
+     if (ret !=3D PSA_SUCCESS) {
+         return ret;
+     }
++
++    ret =3D psa_crypto_init();
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
+ #endif
+=20
+     /* Code assumes everything fits into a sector */
+@@ -1146,6 +1160,45 @@ static psa_status_t fwu_select_previous(
+         return ret;
+     }
+=20
++#ifndef BL1_BUILD
++    /* Remove the GPT partitions for the rejected images. It is always =
the newer
++     * (second) partitions that are rejected, as they are created durin=
g the
++     * fwu process
++     */
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; ++i) {
++        struct partition_entry_t part;
++        ret =3D gpt_entry_read_by_type(&(fwu_image[i].image_type), 1, &=
part);
++
++        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++            FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[index]);
++            return ret;
++        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
++                    __func__, fwu_image[i].image_names[index]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[index]);
++            return ret;
++        }
++
++        ret =3D gpt_entry_remove(&(part.partition_guid));
++        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst removing GPT partition =
'%s'\r\n",
++                    __func__, fwu_image[i].image_names[index]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[index]);
++            return ret;
++        }
++
++        FWU_LOG_MSG("%s: Removed GPT partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[index]);
++    }
++#endif /* BL1_BUILD */
++
+     FWU_LOG_MSG("%s: in regular state by choosing previous active bank\=
n\r",
+                  __func__);
+=20
+@@ -1594,6 +1647,47 @@ static psa_status_t fwu_accept_image(struct fwu_m=
etadata *metadata,
+         return ret;
+     }
+=20
++#ifndef BL1_BUILD
++    /* Remove the old (first) partitions from the GPT header. It is alw=
ays the
++     * older images to be removed, as they were not created by the upda=
te
++     * process but existed before
++     */
++    uint32_t previous_bank_index =3D metadata->previous_active_index;
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; ++i) {
++        struct partition_entry_t part;
++
++        ret =3D gpt_entry_read_by_type(
++                &(fwu_image[i].image_type),
++                0,
++                &part);
++        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++            FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[previous_bank_in=
dex]);
++            return ret;
++        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
++                    __func__, fwu_image[i].image_names[previous_bank_in=
dex]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[previous_bank_in=
dex]);
++            return ret;
++        }
++
++        ret =3D gpt_entry_remove(&(part.partition_guid));
++        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++            FWU_LOG_MSG("%s: Flash error whilst removing GPT partition =
'%s'\r\n",
++                    __func__, fwu_image[i].image_names[previous_bank_in=
dex]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
++                    __func__, fwu_image[i].image_names[previous_bank_in=
dex]);
++            return ret;
++        }
++    }
++#endif
++
+     FWU_LOG_MSG("%s: success: fwu state is changed to regular\n\r", __f=
unc__);
+     return PSA_SUCCESS;
+ }
+@@ -1635,21 +1729,81 @@ static psa_status_t erase_staging_area(struct fw=
u_metadata* metadata, psa_fwu_co
+     }
+=20
+     uint32_t active_index =3D metadata->active_index;
++    uint32_t previous_active_index;
+     uint32_t bank_offset;
+     uint32_t image_offset;
++    uint32_t image_size;
+     uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
; /* Decrement to get the correct fwu image index */
+=20
+     if (active_index =3D=3D BANK_0) {
+         bank_offset =3D BANK_1_PARTITION_OFFSET;
++        previous_active_index =3D BANK_1;
+     } else if (active_index =3D=3D BANK_1) {
+         bank_offset =3D BANK_0_PARTITION_OFFSET;
++        previous_active_index =3D BANK_0;
+     } else {
+         FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
++#ifdef BL1_BUILD
+     image_offset =3D bank_offset + fwu_image[fwu_image_index].image_off=
set;
+-    if (erase_image(image_offset, fwu_image[fwu_image_index].image_size=
)) {
++    image_size =3D fwu_image[fwu_image_index].image_size;
++#else
++    /* Use GPT to find partition instead */
++    struct partition_entry_t part;
++
++    psa_status_t ret =3D gpt_entry_read_by_type(&(fwu_image[fwu_image_i=
ndex].image_type), 1, &part);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        /* Create the partition in the expected space */
++        struct efi_guid_t new_guid =3D {0};
++        char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++        ascii_to_unicode(fwu_image[fwu_image_index].image_names[previou=
s_active_index], unicode_name);
++
++        ret =3D gpt_entry_create(&(fwu_image[fwu_image_index].image_typ=
e),
++                               (bank_offset + fwu_image[fwu_image_index=
].image_offset) / TFM_GPT_BLOCK_SIZE,
++                               1 + ((fwu_image[fwu_image_index].image_s=
ize - 1) / TFM_GPT_BLOCK_SIZE),
++                               0,
++                               unicode_name,
++                               &new_guid);
++        if (ret =3D=3D PSA_ERROR_INSUFFICIENT_STORAGE) {
++            FWU_LOG_MSG("%s: No space left on device!\r\n", __func__);
++            return ret;
++        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst creating GPT partition =
'%s'!\r\n",
++                    __func__, fwu_image[fwu_image_index].image_names[pr=
evious_active_index]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to create GPT partition '%s': %d\r\=
n", __func__,
++                    fwu_image[fwu_image_index].image_names[previous_act=
ive_index], ret);
++            return ret;
++        }
++
++        ret =3D gpt_entry_read(&new_guid, &part);
++        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
++                    __func__, fwu_image[fwu_image_index].image_names[pr=
evious_active_index]);
++            return ret;
++        } else if (ret < 0) {
++            FWU_LOG_MSG("%s: Unable to read GPT partition '%s': %d\r\n"=
, __func__,
++                    fwu_image[fwu_image_index].image_names[previous_act=
ive_index], ret);
++            return ret;
++        }
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
++                __func__, fwu_image[fwu_image_index].image_names[previo=
us_active_index]);
++        return ret;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("%s: Unable to read GPT partition '%s': %d\r\n", __=
func__,
++                fwu_image[fwu_image_index].image_names[previous_active_=
index], ret);
++        return ret;
++    }
++
++    image_offset =3D part.start * TFM_GPT_BLOCK_SIZE;
++    image_size =3D part.size * TFM_GPT_BLOCK_SIZE;
++#endif /* BL1_BUILD */
++
++    if (erase_image(image_offset, image_size)) {
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
+@@ -1924,7 +2078,6 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
+         goto out;
+     }
+     active_index =3D _metadata.active_index;
+-
+     if (active_index =3D=3D BANK_0) {
+         previous_active_index =3D BANK_1;
+     } else if (active_index =3D=3D BANK_1) {
+@@ -1979,15 +2132,89 @@ static psa_status_t copy_image_from_other_bank(i=
nt image_index,
+     FWU_LOG_FUNC_ENTER;
+=20
+     uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
++    psa_status_t ret;
++
++#ifdef BL1_BUILD
++    /* Use offsets directly */
+     size_t remaining_size =3D fwu_image[image_index].image_size;
+     size_t data_size;
+     size_t offset_read =3D bank_offset[active_index] + fwu_image[image_=
index].image_offset;
+     size_t offset_write =3D bank_offset[previous_active_index] + fwu_im=
age[image_index].image_offset;
+     int data_transferred_count;
++#else
++    /* Use GPT to find the correct image */
++    struct partition_entry_t active_part;
++    ret =3D gpt_entry_read_by_type(
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
+=20
+-    FWU_LOG_MSG("%s: Enter \n\r", __func__);
++    struct partition_entry_t prev_active_part;
++    ret =3D gpt_entry_read_by_type(
++            &(fwu_image[image_index].image_type),
++            1,
++            &prev_active_part);
+=20
+-    psa_status_t ret =3D erase_image(offset_write, fwu_image[image_inde=
x].image_size);
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        /* Create the partition in the expected space */
++        struct efi_guid_t new_guid =3D {0};
++        char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++        ascii_to_unicode(fwu_image[image_index].image_names[previous_ac=
tive_index], unicode_name);
++
++        ret =3D gpt_entry_create(&(fwu_image[image_index].image_type),
++                               (bank_offset[previous_active_index] + fw=
u_image[image_index].image_offset) / TFM_GPT_BLOCK_SIZE,
++                               1 + ((fwu_image[image_index].image_size =
- 1) / TFM_GPT_BLOCK_SIZE),
++                               0,
++                               unicode_name,
++                               &new_guid);
++        if (ret =3D=3D PSA_ERROR_INSUFFICIENT_STORAGE) {
++            FWU_LOG_MSG("%s: No space left on device!\r\n", __func__);
++            return ret;
++        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst creating GPT partition =
'%s'!\r\n",
++                    __func__, fwu_image[image_index].image_names[previo=
us_active_index]);
++            return ret;
++        } else if (ret < 0) {
++            return ret;
++        }
++
++        ret =3D gpt_entry_read(&new_guid, &prev_active_part);
++        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
++                    __func__, fwu_image[image_index].image_names[previo=
us_active_index]);
++            return ret;
++        } else if (ret < 0) {
++            return ret;
++        }
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        return ret;
++    } else if (ret < 0) {
++        return ret;
++    }
++
++    size_t remaining_size =3D prev_active_part.size * TFM_GPT_BLOCK_SIZ=
E;
++    size_t data_size;
++    size_t offset_read =3D active_part.start * TFM_GPT_BLOCK_SIZE;
++    size_t offset_write =3D prev_active_part.start * TFM_GPT_BLOCK_SIZE=
;
++    int data_transferred_count;
++#endif /* BL1_BUILD */
++
++    ret =3D erase_image(offset_write, remaining_size);
+     if (ret !=3D PSA_SUCCESS) {
+         FWU_LOG_MSG("%s: ERROR - Flash erase failed for Image: %d\n\r",=
 __func__, image_index);
+         return ret;
+@@ -2244,10 +2471,10 @@ psa_status_t fwu_bootloader_reject_staged_image(=
psa_fwu_component_t component)
+         return PSA_ERROR_BAD_STATE;
+     }
+=20
+-    int ret;
++    psa_status_t ret;
+     uint32_t active_index;;
+-    uint32_t bank_offset;
+     uint32_t image_offset;
++    uint32_t image_size;
+     uint8_t image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT;   =
 /* Decrement to get the correct fwu image index */
+=20
+     FWU_LOG_FUNC_ENTER;
+@@ -2259,6 +2486,8 @@ psa_status_t fwu_bootloader_reject_staged_image(ps=
a_fwu_component_t component)
+     }
+     active_index =3D _metadata.active_index;
+=20
++#ifdef BL1_BUILD
++    uint32_t bank_offset;
+     if (active_index =3D=3D BANK_0) {
+         bank_offset =3D BANK_1_PARTITION_OFFSET;
+     } else if (active_index =3D=3D BANK_1) {
+@@ -2270,8 +2499,62 @@ psa_status_t fwu_bootloader_reject_staged_image(p=
sa_fwu_component_t component)
+     }
+=20
+     image_offset =3D bank_offset + fwu_image[image_index].image_offset;
++    image_size =3D fwu_image[image_index].image_size;
++#else
++    uint32_t previous_active_index;
++    struct partition_entry_t part;
++
++    if (active_index =3D=3D BANK_0) {
++        previous_active_index =3D BANK_1;
++    } else if (active_index =3D=3D BANK_1) {
++        previous_active_index =3D BANK_0;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    /* The newer entry of the same type is the staged image, as it was =
created
++     * during the fwu process
++     */
++    ret =3D gpt_entry_read_by_type(
++            &(fwu_image[image_index].image_type),
++            1,
++            &part);
++
++    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
++        FWU_LOG_MSG("%s: Partition '%s' not found\n\r",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        goto out;
++    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s : ERROR - flash failure reading partition '%s'\=
n\r",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        goto out;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("Unable to find partition '%s', ret: %d\n\r",
++                fwu_image[image_index].image_names[previous_active_inde=
x], ret);
++        goto out;
++    }
++
++    /* Remove the partition. This only removes the entry from the heade=
r and
++     * does not erase the actual data the partition referred to
++     */
++    ret =3D gpt_entry_remove(&(part.partition_guid));
++    if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
++        FWU_LOG_MSG("%s: Flash error whilst removing GPT partition '%s'=
\r\n",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        goto out;
++    } else if (ret < 0) {
++        FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
++                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
++        goto out;
++    }
++
++    image_offset =3D part.start * TFM_GPT_BLOCK_SIZE;
++    image_size =3D part.size * TFM_GPT_BLOCK_SIZE;
++#endif /* BL1_BUILD */
+=20
+-    if (erase_image(image_offset, fwu_image[image_index].image_size)) {
++    if (erase_image(image_offset, image_size)) {
+         return PSA_ERROR_GENERIC_ERROR;
+     }
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index b55a61ac..ff3a87a9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -65,6 +65,16 @@ SRC_URI:append:corstone1000 =3D " \
     file://0031-lib-gpt-Correct-variable-name-used.patch \
     file://0032-lib-gpt-Correct-include-directory.patch \
     file://0033-lib-gpt-Move-contents-of-CMake-config-file.patch \
+    file://0034-plat-cs1k-Fixed-formatting-errors.patch \
+    file://0035-plat-cs1k-Removed-unused-variables.patch \
+    file://0036-plat-cs1k-Fixed-bad-function-returns.patch \
+    file://0037-plat-cs1k-Improved-logging-in-function.patch \
+    file://0038-plat-cs1k-Remove-unused-function.patch \
+    file://0039-plat-cs1k-Reduce-BL1-binary-size.patch \
+    file://0040-plat-cs1k-Update-license-identifier.patch \
+    file://0041-plat-cs1k-Changed-to-use-new-GPT-library.patch \
+    file://0042-plat-cs1k-Move-variable-from-stack-to-data.patch \
+    file://0043-plat-cs1k-Create-and-remove-FWU-image-partitions.patch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"
@@ -78,7 +88,7 @@ SRC_URI:append:corstone1000-mps3 =3D " \
=20
 create_bl1_image(){
     dd conv=3Dnotrunc bs=3D1 if=3D${D}${FIRMWARE_DIR}/bl1_1.bin of=3D${D=
}${FIRMWARE_DIR}/bl1.bin seek=3D0
-    # Size of bl1_1.bin is 58KB (59392 bytes) =20
-    dd conv=3Dnotrunc bs=3D1 if=3D${D}${FIRMWARE_DIR}/bl1_provisioning_b=
undle.bin of=3D${D}${FIRMWARE_DIR}/bl1.bin seek=3D59392
+    # Size of bl1_1.bin is 58KB (59208 bytes)
+    dd conv=3Dnotrunc bs=3D1 if=3D${D}${FIRMWARE_DIR}/bl1_provisioning_b=
undle.bin of=3D${D}${FIRMWARE_DIR}/bl1.bin seek=3D59208
 }
 do_install[postfuncs] +=3D "create_bl1_image"
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware-fvp.wks.in
similarity index 65%
rename from meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
rename to meta-arm-bsp/wic/corstone1000-flash-firmware-fvp.wks.in
index 78109aff..33699512 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware-fvp.wks.in
@@ -11,30 +11,24 @@ part --source empty --size 3k --offset 17k --part-nam=
e=3D"reserved_1" --uuid B1F2F
=20
 part --source empty --size 4k --align 4 --offset 20k --part-name=3D"FWU-=
Metadata" --uuid 3FDFFEE1-3223-4C6B-80F9-B0E7D780C21D --part-type 8A7A84A=
0-8387-40F6-AB41-A8B9A5A60D23
 part --source empty --size 4k --align 4 --offset 24k --part-name=3D"Bkup=
-FWU-Metadata" --uuid B3068316-5351-4998-823A-3A7B09133EC1 --part-type 8A=
7A84A0-8387-40F6-AB41-A8B9A5A60D23
-
-part --source empty --size 4k --align 4 --offset 28k --part-name=3D"priv=
ate_metadata_replica_2" --uuid 3CC3B456-DEC8-4CE3-BC5C-965483CE4828 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
+part --source empty --size 4k --align 4 --offset 28k --part-name=3D"priv=
ate_metadata_replica_1" --uuid 3CC3B456-DEC8-4CE3-BC5C-965483CE4828 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
 part --source empty --size 4k --align 4 --offset 32k --part-name=3D"priv=
ate_metadata_replica_2" --uuid DCE9C503-8DFD-4DCB-8889-647E49641552 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
=20
+# The partition type of each of these four partitions should match the t=
ype of the images
+# in a fiwmare update capsule
 # The size has to be aligned to TF-M's SE_BL2_PARTITION_SIZE (tfm/platfo=
rm/ext/target/arm/corstone1000/partition/flash_layout.h)
-part --source rawcopy --size 144k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/bl2_signed.bin" --offset 36k --align 4 --part-name=3D"bl2_primary" =
--uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-481=
9-8688-03AB4CAB0ED9
+part --source rawcopy --size 144k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/bl2_signed.bin" --offset 36k --align 4 --part-name=3D"bl2_primary" =
--uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type F1D883F9-DFEB-536=
3-98D8-686EE3B69F4F
=20
 # The size has to be aligned to TF-M's TFM_PARTITION_SIZE (tfm/platform/=
ext/target/arm/corstone1000/partition/flash_layout.h)
-part --source rawcopy --size 320k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/tfm_s_signed.bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9=
616C-1233-439C-ACBA-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060C=
B465CD4E
+part --source rawcopy --size 320k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/tfm_s_signed.bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9=
616C-1233-439C-ACBA-72D75421BF70 --part-type 7FAD470E-5EC5-5C03-A2C1-4756=
B495DE61
=20
 # Rawcopy of the FIP binary
-part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip.bin" =
--align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1=
C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
+part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip.bin" =
--align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1=
C5 --part-type F1933675-5A8C-5B6D-9EF4-846739E89BC8
=20
 # Rawcopy of kernel with initramfs
-part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC=
5745B05
-
-
-# The offset has to be aligned to TF-M's SE_BL2_BANK_1_OFFSET define (tf=
m/platform/ext/target/arm/corstone1000/partition/flash_layout.h)
-part --source empty --size 144k --offset 16392k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
-part --source empty --size 320k --align 4 --part-name=3D"tfm_secondary" =
--uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF=
0-B2F3-060CB465CD4E
-part --source empty --size 2 --align 4 --part-name=3D"FIP_B" --uuid 9424=
E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB=
228FFEA7
-part --source empty --size 12 --align 4 --part-name=3D"kernel_secondary"=
 --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46=
FC-921E-141CC5745B05
-
+part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type F771AFF9-C7E9-5F99-9EDA-2369D=
D694F61
=20
+# This ensures wic sets the size of the flash as 64MiB in the GPT header=
, despite only half being filled
 part --source empty --size 3k --offset 32748k --part-name=3D"reserved_2"=
 --uuid CCB18569-C0BA-42E0-A429-FE1DC862D660
=20
 bootloader --ptable gpt
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware-mps3.wks.in b/m=
eta-arm-bsp/wic/corstone1000-flash-firmware-mps3.wks.in
new file mode 100644
index 00000000..6487b927
--- /dev/null
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware-mps3.wks.in
@@ -0,0 +1,34 @@
+# WIC partitioning for corstone1000 internal flash
+# Layout and maximum sizes (to be defined):
+#
+
+# The entries with --offset parameter should not be relocated
+# because BL1 code is statically configured for the given positions
+# Partition sizes are fixed since corstone1000 does not support partial =
update
+# and has a limit for each partition to grow.
+
+part --source empty --size 3k --offset 17k --part-name=3D"reserved_1" --=
uuid B1F2FC8C-A7A3-4485-87CB-16961B8847D7
+
+part --source empty --size 4k --align 4 --offset 20k --part-name=3D"FWU-=
Metadata" --uuid 3FDFFEE1-3223-4C6B-80F9-B0E7D780C21D --part-type 8A7A84A=
0-8387-40F6-AB41-A8B9A5A60D23
+part --source empty --size 4k --align 4 --offset 24k --part-name=3D"Bkup=
-FWU-Metadata" --uuid B3068316-5351-4998-823A-3A7B09133EC1 --part-type 8A=
7A84A0-8387-40F6-AB41-A8B9A5A60D23
+part --source empty --size 4k --align 4 --offset 28k --part-name=3D"priv=
ate_metadata_replica_1" --uuid 3CC3B456-DEC8-4CE3-BC5C-965483CE4828 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
+part --source empty --size 4k --align 4 --offset 32k --part-name=3D"priv=
ate_metadata_replica_2" --uuid DCE9C503-8DFD-4DCB-8889-647E49641552 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
+
+# The partition type of each of these four partitions should match the t=
ype of the images
+# in a fiwmare update capsule
+# The size has to be aligned to TF-M's SE_BL2_PARTITION_SIZE (tfm/platfo=
rm/ext/target/arm/corstone1000/partition/flash_layout.h)
+part --source rawcopy --size 144k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/bl2_signed.bin" --offset 36k --align 4 --part-name=3D"bl2_primary" =
--uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type FBFBEFAA-0A56-50D=
5-B651-74091D3D62CF
+
+# The size has to be aligned to TF-M's TFM_PARTITION_SIZE (tfm/platform/=
ext/target/arm/corstone1000/partition/flash_layout.h)
+part --source rawcopy --size 320k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/tfm_s_signed.bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9=
616C-1233-439C-ACBA-72D75421BF70 --part-type AF4CC7AD-EE2E-5A39-AAD5-FAC8=
A1E6173C
+
+# Rawcopy of the FIP binary
+part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip.bin" =
--align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1=
C5 --part-type 55302F96-C4F0-5CF9-8624-E7CC388F2B68
+
+# Rawcopy of kernel with initramfs
+part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type 3E8AC972-C33C-5CC9-90A0-CDD31=
59683EA
+
+# This ensures wic sets the size of the flash as 64MiB in the GPT header=
, despite only half being filled
+part --source empty --size 3k --offset 32748k --part-name=3D"reserved_2"=
 --uuid CCB18569-C0BA-42E0-A429-FE1DC862D660
+
+bootloader --ptable gpt

