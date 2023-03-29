Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ED8C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 16:22:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.932.1680106968002864620
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 09:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z+iFWX5t;
 spf=pass (domain: linaro.org, ip: 209.85.128.50, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f50.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so6398727wms.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680106966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvtmzxyXp3dg/1UGIa9XBLxjBYrmcgitwFxDu1DssA0=;
        b=Z+iFWX5t2/Gea/iWz+ScO91htyM/5lVWIwxnj4sDSBBMhfxn0JqN5TDTrvU8p1OU+E
         yRLnQLZcRgyw/rD8kWhzrkxEyTPfIScRUL5llN2VdyJUS0Ce03EGKKX+3LuESFtbfhHG
         OKFH+OoQ4F0znVCgypBGllm4RoslQLefyDV8rveXz3WG9Lp3gYraj4IRFB5xE+sFxOYL
         CWlUWDtf3UlWFHyfTDTnQC/rCeKXRFoJM0JxsrR9QUpKijRGnrNg1tpyUDsswupyYYAq
         m2QP8YPsLiccUCxaWXuTfLl7g1ZJUvsM07ELgCzit54QR9zYTYxBTCZjt5MGSrWuayjn
         GWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680106966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvtmzxyXp3dg/1UGIa9XBLxjBYrmcgitwFxDu1DssA0=;
        b=17oKNPGMjlW4lZXeCuiyHWRG9Rd4G2xRTjXApMM7xEqFE+TaWwFzhEcpA/KLWt7emF
         O1b0or7C51jHLjR1mED6VNYcsy8TK0TEyUoS/gjq5Ip10O5j4yTO6RMWD2yyLwWnr8SB
         6kq9E7fvrWe96QOwU4YOPSZPGosJOKNFqs2j1Nkua8O2piA+6iMowqhaL2rnWsc1DFFn
         yIuqX8M6tbp0JvsKlseoMURDDujwoMo062kUt87mZa4tIsYVw+XxJX7d4pJuvXI0hJiS
         0yuFM/Xeww2CrNn8qY0xj8i1oOUsiSd+kg4/ef/0Ltt3P0rYGPvpd+/ixKG+Uy3wVlpv
         dP5g==
X-Gm-Message-State: AAQBX9eAV3BmGP//SkzsX7eFWomsG37T3Mnt0XIGAzZ60KMiC2vjL216
	C8TCIGT7QT7IsmKwdH7SGOaDRif2SXeY2wyUY6Q=
X-Google-Smtp-Source: AKy350ZpdXohRW21SpJeNwTMZprUGg7IAc/81gtLPGCnxkBdyhL1EqG1ioOLZg3KnW7+Tr54e6sG7Q==
X-Received: by 2002:a7b:cd93:0:b0:3ed:346d:4534 with SMTP id y19-20020a7bcd93000000b003ed346d4534mr2306586wmj.0.1680106964462;
        Wed, 29 Mar 2023 09:22:44 -0700 (PDT)
Received: from localhost.localdomain (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id n18-20020a1c7212000000b003eafc47eb09sm2674765wmc.43.2023.03.29.09.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 09:22:43 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Satish Kumar <satish.kumar01@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] arm-bsp/corstone1000: new gpt based disk layout and fwu metadata
Date: Wed, 29 Mar 2023 17:22:56 +0100
Message-Id: <20230329162256.818409-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 16:22:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4507

From: Satish Kumar <satish.kumar01@arm.com>

Introduce the use of a gpt partition type layout, and use
the firmware metadata as source of the current boot bank
to boot from in the different boot stages.

This needs to be a large changeset, since it touches a lot
of software components to guarantee that everything works
in an atomic way, to not break the build and/or the boot flow
of the corstone1000 platform.

fdisk -o Start,End,Sectors,Size,Type-UUID,Attrs,Name,UUID -l tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fvp.wic
Disk build/tmp/deploy/images/corstone1000-fvp/corstone1000-image-corstone1000-fvp.wic: 32 MiB, 33554432 bytes, 65536 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 5BFC084A-9B95-4024-B60B-9748F5332524

Start   End Sectors  Size Type-UUID                            Attrs Name                       UUID
   34    39       6    3K EBD0A0A2-B9E5-4433-87C0-68B6B72699C7       reserved_1                 B1F2FC8C-A7A3-4485-87CB-16961B8847D7
   40    47       8    4K 8A7A84A0-8387-40F6-AB41-A8B9A5A60D23       FWU-Metadata               3FDFFEE1-3223-4C6B-80F9-B0E7D780C21D
   48    55       8    4K 8A7A84A0-8387-40F6-AB41-A8B9A5A60D23       Bkup-FWU-Metadata          B3068316-5351-4998-823A-3A7B09133EC1
   56    63       8    4K ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42       private_metadata_replica_2 3CC3B456-DEC8-4CE3-BC5C-965483CE4828
   64    71       8    4K ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42       private_metadata_replica_2 DCE9C503-8DFD-4DCB-8889-647E49641552
   72   271     200  100K 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9       bl2_primary                9A3A8FBF-55EF-439C-80C9-A3F728033929
  272  1023     752  376K D763C27F-07F6-4FF0-B2F3-060CB465CD4E       tfm_primary                07F9616C-1233-439C-ACBA-72D75421BF70
 1024  5119    4096    2M B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7       FIP_A                      B9C7AC9D-40FF-4675-956B-EEF4DE9DF1C5
 5120 15199   10080  4.9M 8197561D-6124-46FC-921E-141CC5745B05       kernel_primary             BF7A6142-0662-47FD-9434-6A8811980816
32784 32983     200  100K 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9       bl2_secondary              3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F
32984 32991       8    4K D763C27F-07F6-4FF0-B2F3-060CB465CD4E       tfm_secondary              009A6A12-64A6-4F0F-9882-57CD79A34A3D
32992 32999       8    4K B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7       FIP_B                      9424E370-7BC9-43BB-8C23-71EE645E1273
33000 33007       8    4K 8197561D-6124-46FC-921E-141CC5745B05       kernel_secondary           A2698A91-F9B1-4629-9188-94E4520808F8
65496 65501       6    3K EBD0A0A2-B9E5-4433-87C0-68B6B72699C7       reserved_2                 CCB18569-C0BA-42E0-A429-FE1DC862D660

Add new nvmxip qspi block storage device to u-boot and
the plumbing to boot using the fwu_metadata and gpt
partition information.

Make sure that fwu and fwu-backup have the correct, as defined
in spec, partition type. That will make SW pieces in the stack
identify it correctly.

Update the fvp config to use the new wic image with the gpt scheme

Depends on metadata to decide boot bank in TFA, TFM and u-boot
Using Reading partitions (GPT scheme)
changes needed:
- Rename FIP partition in wic image as defined in TF-A to FIP_A,FIP_B
- Rename metadata partitions to FWU_Metadata and Bkup-FWU-Metadata
- Enable support for GPT and PSA_FWU in TF-A

arm-bsp/corstone-1000: TF-M patch to calculate fwu metadata crc32

It's necessary to calculate the metadata crc for TF-A and U-boot
verify the metadata.

and at last remove the wic.nopt (wic no partition) as target fstype
since we now use the partitions.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../conf/machine/corstone1000-fvp.conf        |    2 +-
 .../recipes-bsp/images/corstone1000-image.bb  |    6 +-
 ...1000-bl2-loads-fip-based-on-metadata.patch |  167 ++
 .../trusted-firmware-a-corstone1000.inc       |    6 +-
 ...rstone1000-Increase-number-of-assets.patch |   38 -
 ...-corstone1000-Introduce-IO-framework.patch | 1354 +++++++++++++++++
 ...ne1000-Add-IO-test-in-ci_regressions.patch |  646 ++++++++
 ...stone1000-Add-soft-crc32-calculation.patch |  171 +++
 ...orstone1000-calculate-metadata-crc32.patch |   89 ++
 ...e1000-fwu-metadata_read-validate-crc.patch |   99 ++
 ...stone1000-Add-common-platform-logger.patch |  125 ++
 ...rm-corstone1000-Introduce-GPT-parser.patch |  735 +++++++++
 ...e1000-BL1-changes-to-adapt-to-new-fl.patch |  337 ++++
 ...orm-corstone1000-BL2-uses-GPT-layout.patch |  411 +++++
 ...tone1000-flash_layout-simplification.patch |  103 ++
 ...e-sure-to-write-fwu-metadata-to-repl.patch |   43 +
 .../trusted-firmware-m-1.7.0-corstone1000.inc |   17 +-
 ...ntroduce-NVM-XIP-block-storage-emula.patch |  595 ++++++++
 ...64-fix-return-unsigned-long-in-readq.patch |   46 +
 ...andbox64-add-support-for-NVMXIP-QSPI.patch |  113 ++
 ...00-add-NVM-XIP-QSPI-device-tree-node.patch |   35 +
 ...rstone1000-enable-NVM-XIP-QSPI-flash.patch |   29 +
 ...64-add-a-test-case-for-UCLASS_NVMXIP.patch |  174 +++
 ...-provide-a-u-boot-shell-test-command.patch |  135 ++
 ...tone1000-add-fwu-metadata-store-info.patch |   42 +
 ...035-nvmxip-shorter-block-device-name.patch |   44 +
 ...ime-allow-to-reset-a-path-after-boot.patch |   31 +
 ...data-make-sure-structures-are-packed.patch |   50 +
 .../0038-corstone1000-add-boot-index.patch    |   33 +
 ...adjust-boot-bank-and-kernel-location.patch |   36 +
 ...add-nvmxip-fwu-mdata-and-gpt-options.patch |  133 ++
 .../0041-nvmxip-move-header-to-include.patch  |   42 +
 ...00-set-kernel_addr-based-on-boot_idx.patch |  112 ++
 ...-corstone1000-boot-index-from-active.patch |   42 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   17 +
 .../wic/corstone1000-image.corstone1000.wks   |   32 +-
 36 files changed, 6036 insertions(+), 54 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Increase-number-of-assets.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-sandbox64-fix-return-unsigned-long-in-readq.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-add-support-for-NVMXIP-QSPI.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-nvmxip-provide-a-u-boot-shell-test-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-add-fwu-metadata-store-info.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-nvmxip-shorter-block-device-name.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_boottime-allow-to-reset-a-path-after-boot.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu_metadata-make-sure-structures-are-packed.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-add-boot-index.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-adjust-boot-bank-and-kernel-location.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvmxip-move-header-to-include.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-boot-index-from-active.patch

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index 2a72f7ff23ff..ca89c700ead4 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -31,7 +31,7 @@ FVP_CONFIG[disable_visualisation] ?= "true"
 FVP_CONFIG[se.nvm.update_raw_image] ?= "0"
 
 # Boot image
-FVP_DATA ?= "board.flash0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic.nopt@0x68100000"
+FVP_DATA ?= "board.flash0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic@0x68000000"
 
 # External system (cortex-M3)
 FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?= "${DEPLOY_DIR_IMAGE}/es_flashfw.bin"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index 3a1639eaa2b0..714a57cb3a69 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -6,16 +6,16 @@ LICENSE = "MIT"
 COMPATIBLE_MACHINE = "corstone1000"
 
 inherit image
-inherit wic_nopt tfm_sign_image
+inherit tfm_sign_image
 inherit  uefi_capsule
 
 PACKAGE_INSTALL = ""
 
-IMAGE_FSTYPES += "wic wic.nopt uefi_capsule"
+IMAGE_FSTYPES += "wic uefi_capsule"
 
 UEFI_FIRMWARE_BINARY = "${PN}-${MACHINE}.${CAPSULE_IMGTYPE}"
 UEFI_CAPSULE_CONFIG = "${THISDIR}/files/${PN}-capsule-update-image.json"
-CAPSULE_IMGTYPE = "wic.nopt"
+CAPSULE_IMGTYPE = "wic"
 
 do_sign_images() {
     # Sign TF-A BL2
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
new file mode 100644
index 000000000000..3afaa4b03bb9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
@@ -0,0 +1,167 @@
+From 360aa32846a97e775750e06865d462c6258179fa Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Mon, 9 Jan 2023 13:59:06 +0000
+Subject: [PATCH] feat(corstone1000): bl2 loads fip based on metadata
+
+Previously bl2 was reading the boot_index directly with a hard coded
+address and then set the fip image spec with fip offsets base based on
+the boot_index value.
+This commit removes this logic and rely on PSA_FWU_SUPPORT
+which reads the fip partition based on the active firmware bank written in
+metadata.
+
+Note: fip partition contains signature area at the begining. Hence, the fip
+image starts at fip partition + fip signature area size.
+
+Upstream-Status: Pending
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+
+%% original patch: 0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
+---
+ bl2/bl2_main.c                                |  4 +++
+ .../corstone1000/common/corstone1000_plat.c   | 32 ++++++-------------
+ .../common/include/platform_def.h             | 12 +++----
+ tools/cert_create/Makefile                    |  4 +--
+ tools/fiptool/Makefile                        |  4 +--
+ 5 files changed, 24 insertions(+), 32 deletions(-)
+
+diff --git a/bl2/bl2_main.c b/bl2/bl2_main.c
+index 5da803795..f25dc3029 100644
+--- a/bl2/bl2_main.c
++++ b/bl2/bl2_main.c
+@@ -86,6 +86,10 @@ void bl2_main(void)
+ 	/* Perform remaining generic architectural setup in S-EL1 */
+ 	bl2_arch_setup();
+ 
++#if ARM_GPT_SUPPORT
++	partition_init(GPT_IMAGE_ID);
++#endif
++
+ #if PSA_FWU_SUPPORT
+ 	fwu_init();
+ #endif /* PSA_FWU_SUPPORT */
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+index 0235f8b84..7f9708a82 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+@@ -33,36 +33,17 @@ const mmap_region_t plat_arm_mmap[] = {
+ static void set_fip_image_source(void)
+ {
+ 	const struct plat_io_policy *policy;
+-	/*
+-	 * metadata for firmware update is written at 0x0000 offset of the flash.
+-	 * PLAT_ARM_BOOT_BANK_FLAG contains the boot bank that TF-M is booted.
+-	 * As per firmware update spec, at a given point of time, only one bank
+-	 * is active. This means, TF-A should boot from the same bank as TF-M.
+-	 */
+-	volatile uint32_t *boot_bank_flag = (uint32_t *)(PLAT_ARM_BOOT_BANK_FLAG);
+-
+-	if (*boot_bank_flag > 1) {
+-		VERBOSE("Boot_bank is set higher than possible values");
+-	}
+-
+-	VERBOSE("Boot bank flag = %u.\n\r", *boot_bank_flag);
+ 
+ 	policy = FCONF_GET_PROPERTY(arm, io_policies, FIP_IMAGE_ID);
+ 
+ 	assert(policy != NULL);
+ 	assert(policy->image_spec != 0UL);
+ 
++	/* FIP Partition contains Signature area at the begining which TF-A doesn't expect */
+ 	io_block_spec_t *spec = (io_block_spec_t *)policy->image_spec;
++	spec->offset += FIP_SIGNATURE_AREA_SIZE;
++	spec->length -= FIP_SIGNATURE_AREA_SIZE;
+ 
+-	if ((*boot_bank_flag) == 0) {
+-		VERBOSE("Booting from bank 0: fip offset = 0x%lx\n\r",
+-						PLAT_ARM_FIP_BASE_BANK0);
+-		spec->offset = PLAT_ARM_FIP_BASE_BANK0;
+-	} else {
+-		VERBOSE("Booting from bank 1: fip offset = 0x%lx\n\r",
+-						PLAT_ARM_FIP_BASE_BANK1);
+-		spec->offset = PLAT_ARM_FIP_BASE_BANK1;
+-	}
+ }
+ 
+ void bl2_platform_setup(void)
+@@ -75,6 +56,13 @@ void bl2_platform_setup(void)
+ 	set_fip_image_source();
+ }
+ 
++void bl2_early_platform_setup2(u_register_t arg0, u_register_t arg1,
++			       u_register_t arg2, u_register_t arg3)
++{
++	arm_bl2_early_platform_setup((uintptr_t)arg0, (meminfo_t *)arg1);
++	NOTICE("CS1k: early at bl2_platform_setup\n");
++}
++
+ /* corstone1000 only has one always-on power domain and there
+  * is no power control present
+  */
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b/plat/arm/board/corstone1000/common/include/platform_def.h
+index 584d485f3..0bfab05a4 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -173,16 +173,16 @@
+ 
+ /* NOR Flash */
+ 
+-#define PLAT_ARM_BOOT_BANK_FLAG		UL(0x08002000)
+-#define PLAT_ARM_FIP_BASE_BANK0		UL(0x081EF000)
+-#define PLAT_ARM_FIP_BASE_BANK1		UL(0x0916F000)
+-#define PLAT_ARM_FIP_MAX_SIZE		UL(0x1ff000)  /* 1.996 MB */
+-
+ #define PLAT_ARM_NVM_BASE		V2M_FLASH0_BASE
+ #define PLAT_ARM_NVM_SIZE		(SZ_32M)  /* 32 MB */
++#define PLAT_ARM_FIP_MAX_SIZE		UL(0x1ff000)  /* 1.996 MB */
+ 
+-#define PLAT_ARM_FLASH_IMAGE_BASE	PLAT_ARM_FIP_BASE_BANK0
++#define PLAT_ARM_FLASH_IMAGE_BASE	UL(0x08000000)
+ #define PLAT_ARM_FLASH_IMAGE_MAX_SIZE	PLAT_ARM_FIP_MAX_SIZE
++#define PLAT_ARM_FIP_OFFSET_IN_GPT	(0x86000)
++
++/* FIP Information */
++#define FIP_SIGNATURE_AREA_SIZE         (0x1000)      /* 4 KB */
+ 
+ /*
+  * Some data must be aligned on the biggest cache line size in the platform.
+diff --git a/tools/cert_create/Makefile b/tools/cert_create/Makefile
+index ca548b836..32b5486a0 100644
+--- a/tools/cert_create/Makefile
++++ b/tools/cert_create/Makefile
+@@ -69,8 +69,8 @@ INC_DIR += -I ./include -I ${PLAT_INCLUDE} -I ${OPENSSL_DIR}/include
+ # directory. However, for a local build of OpenSSL, the built binaries are
+ # located under the main project directory (i.e.: ${OPENSSL_DIR}, not
+ # ${OPENSSL_DIR}/lib/).
+-LIB_DIR := -L ${OPENSSL_DIR}/lib -L ${OPENSSL_DIR}
+-LIB := -lssl -lcrypto
++LIB_DIR := -L ${OPENSSL_DIR}/lib -L ${OPENSSL_DIR} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS}
++LIB := -lssl -lcrypto ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS}
+ 
+ HOSTCC ?= gcc
+ 
+diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
+index e6aeba95b..7c047479e 100644
+--- a/tools/fiptool/Makefile
++++ b/tools/fiptool/Makefile
+@@ -29,7 +29,7 @@ endif
+ # directory. However, for a local build of OpenSSL, the built binaries are
+ # located under the main project directory (i.e.: ${OPENSSL_DIR}, not
+ # ${OPENSSL_DIR}/lib/).
+-LDLIBS := -L${OPENSSL_DIR}/lib -L${OPENSSL_DIR} -lcrypto
++LDLIBS := -L${OPENSSL_DIR}/lib -L${OPENSSL_DIR} -lcrypto ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS}
+ 
+ ifeq (${V},0)
+   Q := @
+@@ -37,7 +37,7 @@ else
+   Q :=
+ endif
+ 
+-INCLUDE_PATHS := -I../../include/tools_share  -I${OPENSSL_DIR}/include
++INCLUDE_PATHS := -I../../include/tools_share  -I${OPENSSL_DIR}/include ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD_CFLAGS}
+ 
+ HOSTCC ?= gcc
+ 
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 3034680d319f..008103469e22 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -6,7 +6,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
 
 SRC_URI:append = " \ 
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-	"
+    file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch \
+    "
 
 TFA_DEBUG = "1"
 TFA_UBOOT ?= "1"
@@ -31,6 +32,9 @@ EXTRA_OEMAKE:append = " \
                         CREATE_KEYS=1 \
                         GENERATE_COT=1 \
                         TRUSTED_BOARD_BOOT=1 \
+                        ARM_GPT_SUPPORT=1 \
+                        PSA_FWU_SUPPORT=1 \
+                        NR_OF_IMAGES_IN_FW_BANK=4 \
                         COT=tbbr \
                         ARM_ROTPK_LOCATION=devel_rsa  \
                         ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Increase-number-of-assets.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Increase-number-of-assets.patch
deleted file mode 100644
index f0368b84f914..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Increase-number-of-assets.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From decb355247c4ba4b876997f55c27ec3f55dbacd2 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Mon, 23 Jan 2023 13:25:28 +0000
-Subject: [PATCH] Platform: corstone1000: Increase number of assets
-
-As Corstone1000 stores at boot time few efi variables.
-Therefore, number of assets is increased to compansate this early usage.
-
-Note: Adding platform customized configs to config_tfm.h
-      More information see:
-https://tf-m-user-guide.trustedfirmware.org/configuration/header_file_system.html
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted yet]
----
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-index bf8d2f95f7..e968366639 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -16,4 +16,12 @@
- #undef PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE
- #define PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE    256
- 
-+/* The maximum number of assets to be stored in the Internal Trusted Storage. */
-+#undef ITS_NUM_ASSETS
-+#define ITS_NUM_ASSETS       20
-+
-+/* The maximum number of assets to be stored in the Protected Storage area. */
-+#undef PS_NUM_ASSETS
-+#define PS_NUM_ASSETS        20
-+
- #endif /* __CONFIG_TFM_TARGET_H__ */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
new file mode 100644
index 000000000000..900fd5493673
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
@@ -0,0 +1,1354 @@
+From 1db9afdbf70eb9708640debe5d7d24558fe0f63a Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Mon, 7 Nov 2022 12:49:11 +0000
+Subject: [PATCH 01/10] Platform: corstone1000: Introduce IO framework
+
+- Introduce IO storage framework
+- Add IO flash to abstract flash implementation details from upper layer
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Accepted [TF-Mv1.8.0]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   4 +
+ .../ext/target/arm/corstone1000/io/io_block.c | 527 ++++++++++++++++++
+ .../ext/target/arm/corstone1000/io/io_block.h |  40 ++
+ .../ext/target/arm/corstone1000/io/io_defs.h  |  27 +
+ .../target/arm/corstone1000/io/io_driver.h    |  54 ++
+ .../ext/target/arm/corstone1000/io/io_flash.c | 183 ++++++
+ .../ext/target/arm/corstone1000/io/io_flash.h |  37 ++
+ .../target/arm/corstone1000/io/io_storage.c   | 289 ++++++++++
+ .../target/arm/corstone1000/io/io_storage.h   |  92 +++
+ 9 files changed, 1253 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_block.c
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_block.h
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_defs.h
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_driver.h
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_flash.c
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_flash.h
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_storage.c
+ create mode 100644 platform/ext/target/arm/corstone1000/io/io_storage.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index cfbaffc995..7808efae68 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -125,6 +125,9 @@ target_sources(platform_bl2
+         fw_update_agent/fwu_agent.c
+         bl2_security_cnt.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
++        io/io_block.c
++        io/io_flash.c
++        io/io_storage.c
+ )
+ 
+ if (PLATFORM_IS_FVP)
+@@ -182,6 +185,7 @@ target_include_directories(platform_bl2
+         fip_parser
+         Native_Driver
+         fw_update_agent
++        io
+         .
+     INTERFACE
+         cc312
+diff --git a/platform/ext/target/arm/corstone1000/io/io_block.c b/platform/ext/target/arm/corstone1000/io/io_block.c
+new file mode 100644
+index 0000000000..f7eaf7444c
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_block.c
+@@ -0,0 +1,527 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include "io_block.h"
++
++#include <assert.h>
++#include <errno.h>
++
++#include "io_defs.h"
++#include "io_driver.h"
++#include "io_storage.h"
++
++typedef struct {
++    io_block_dev_spec_t *dev_spec;
++    uintptr_t base;
++    uint32_t file_pos;
++    uint32_t size;
++} block_dev_state_t;
++
++#define is_power_of_2(x) (((x) != 0U) && (((x) & ((x)-1U)) == 0U))
++
++io_type_t device_type_block(void);
++
++static int block_open(io_dev_info_t *dev_info, const uintptr_t spec,
++                      io_entity_t *entity);
++static int block_seek(io_entity_t *entity, int mode, size_t offset);
++static int block_read(io_entity_t *entity, uintptr_t buffer, size_t length,
++                      size_t *length_read);
++static int block_write(io_entity_t *entity, const uintptr_t buffer,
++                       size_t length, size_t *length_written);
++static int block_close(io_entity_t *entity);
++static int block_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info);
++static int block_dev_close(io_dev_info_t *dev_info);
++
++static const io_dev_connector_t block_dev_connector = {.dev_open =
++                                                           block_dev_open};
++
++static const io_dev_funcs_t block_dev_funcs = {
++    .type = device_type_block,
++    .open = block_open,
++    .seek = block_seek,
++    .size = NULL,
++    .read = block_read,
++    .write = block_write,
++    .close = block_close,
++    .dev_init = NULL,
++    .dev_close = block_dev_close,
++};
++
++static block_dev_state_t state_pool[MAX_IO_BLOCK_DEVICES];
++static io_dev_info_t dev_info_pool[MAX_IO_BLOCK_DEVICES];
++
++/* Track number of allocated block state */
++static unsigned int block_dev_count;
++
++io_type_t device_type_block(void) { return IO_TYPE_BLOCK; }
++
++/* Locate a block state in the pool, specified by address */
++static int find_first_block_state(const io_block_dev_spec_t *dev_spec,
++                                  unsigned int *index_out) {
++    unsigned int index;
++    int result = -ENOENT;
++
++    for (index = 0U; index < MAX_IO_BLOCK_DEVICES; ++index) {
++        /* dev_spec is used as identifier since it's unique */
++        if (state_pool[index].dev_spec == dev_spec) {
++            result = 0;
++            *index_out = index;
++            break;
++        }
++    }
++    return result;
++}
++
++/* Allocate a device info from the pool and return a pointer to it */
++static int allocate_dev_info(io_dev_info_t **dev_info) {
++    int result = -ENOMEM;
++    assert(dev_info != NULL);
++
++    if (block_dev_count < MAX_IO_BLOCK_DEVICES) {
++        unsigned int index = 0;
++        result = find_first_block_state(NULL, &index);
++        assert(result == 0);
++        /* initialize dev_info */
++        dev_info_pool[index].funcs = &block_dev_funcs;
++        dev_info_pool[index].info = (uintptr_t)&state_pool[index];
++        *dev_info = &dev_info_pool[index];
++        ++block_dev_count;
++    }
++
++    return result;
++}
++
++/* Release a device info to the pool */
++static int free_dev_info(io_dev_info_t *dev_info) {
++    int result;
++    unsigned int index = 0;
++    block_dev_state_t *state;
++    assert(dev_info != NULL);
++
++    state = (block_dev_state_t *)dev_info->info;
++    result = find_first_block_state(state->dev_spec, &index);
++    if (result == 0) {
++        /* free if device info is valid */
++        memset(state, 0, sizeof(block_dev_state_t));
++        memset(dev_info, 0, sizeof(io_dev_info_t));
++        --block_dev_count;
++    }
++
++    return result;
++}
++
++static int block_open(io_dev_info_t *dev_info, const uintptr_t spec,
++                      io_entity_t *entity) {
++    block_dev_state_t *cur;
++    io_block_spec_t *region;
++
++    assert((dev_info->info != (uintptr_t)NULL) && (spec != (uintptr_t)NULL) &&
++           (entity->info == (uintptr_t)NULL));
++
++    region = (io_block_spec_t *)spec;
++    cur = (block_dev_state_t *)dev_info->info;
++    assert(((region->offset % cur->dev_spec->block_size) == 0) &&
++           ((region->length % cur->dev_spec->block_size) == 0));
++
++    cur->base = region->offset;
++    cur->size = region->length;
++    cur->file_pos = 0;
++
++    entity->info = (uintptr_t)cur;
++    return 0;
++}
++
++/* parameter offset is relative address at here */
++static int block_seek(io_entity_t *entity, int mode, size_t offset) {
++    block_dev_state_t *cur;
++
++    assert(entity->info != (uintptr_t)NULL);
++
++    cur = (block_dev_state_t *)entity->info;
++
++    assert((offset >= 0) && ((uint32_t)offset < cur->size));
++    switch (mode) {
++        case IO_SEEK_SET:
++            cur->file_pos = (uint32_t)offset;
++            break;
++        case IO_SEEK_CUR:
++            cur->file_pos += (uint32_t)offset;
++            break;
++        default:
++            return -EINVAL;
++    }
++    assert(cur->file_pos < cur->size);
++    return 0;
++}
++
++/*
++ * This function allows the caller to read any number of bytes
++ * from any position. It hides from the caller that the low level
++ * driver only can read aligned blocks of data. For this reason
++ * we need to handle the use case where the first byte to be read is not
++ * aligned to start of the block, the last byte to be read is also not
++ * aligned to the end of a block, and there are zero or more blocks-worth
++ * of data in between.
++ *
++ * In such a case we need to read more bytes than requested (i.e. full
++ * blocks) and strip-out the leading bytes (aka skip) and the trailing
++ * bytes (aka padding). See diagram below
++ *
++ * cur->file_pos ------------
++ *                          |
++ * cur->base                |
++ *  |                       |
++ *  v                       v<----  length   ---->
++ *  --------------------------------------------------------------
++ * |           |         block#1    |        |   block#n          |
++ * |  block#0  |            +       |   ...  |     +              |
++ * |           | <- skip -> +       |        |     + <- padding ->|
++ *  ------------------------+----------------------+--------------
++ *             ^                                                  ^
++ *             |                                                  |
++ *             v    iteration#1                iteration#n        v
++ *              --------------------------------------------------
++ *             |                    |        |                    |
++ *             |<----  request ---->|  ...   |<----- request ---->|
++ *             |                    |        |                    |
++ *              --------------------------------------------------
++ *            /                   /          |                    |
++ *           /                   /           |                    |
++ *          /                   /            |                    |
++ *         /                   /             |                    |
++ *        /                   /              |                    |
++ *       /                   /               |                    |
++ *      /                   /                |                    |
++ *     /                   /                 |                    |
++ *    /                   /                  |                    |
++ *   /                   /                   |                    |
++ *  <---- request ------>                    <------ request  ----->
++ *  ---------------------                    -----------------------
++ *  |        |          |                    |          |           |
++ *  |<-skip->|<-nbytes->|           -------->|<-nbytes->|<-padding->|
++ *  |        |          |           |        |          |           |
++ *  ---------------------           |        -----------------------
++ *  ^        \           \          |        |          |
++ *  |         \           \         |        |          |
++ *  |          \           \        |        |          |
++ *  buf->offset \           \   buf->offset  |          |
++ *               \           \               |          |
++ *                \           \              |          |
++ *                 \           \             |          |
++ *                  \           \            |          |
++ *                   \           \           |          |
++ *                    \           \          |          |
++ *                     \           \         |          |
++ *                      --------------------------------
++ *                      |           |        |         |
++ * buffer-------------->|           | ...    |         |
++ *                      |           |        |         |
++ *                      --------------------------------
++ *                      <-count#1->|                   |
++ *                      <----------  count#n   -------->
++ *                      <----------  length  ---------->
++ *
++ * Additionally, the IO driver has an underlying buffer that is at least
++ * one block-size and may be big enough to allow.
++ */
++static int block_read(io_entity_t *entity, uintptr_t buffer, size_t length,
++                      size_t *length_read) {
++    block_dev_state_t *cur;
++    io_block_spec_t *buf;
++    io_block_ops_t *ops;
++    int lba;
++    size_t block_size, left;
++    size_t nbytes;  /* number of bytes read in one iteration */
++    size_t request; /* number of requested bytes in one iteration */
++    size_t count;   /* number of bytes already read */
++    /*
++     * number of leading bytes from start of the block
++     * to the first byte to be read
++     */
++    size_t skip;
++
++    /*
++     * number of trailing bytes between the last byte
++     * to be read and the end of the block
++     */
++    size_t padding;
++
++    assert(entity->info != (uintptr_t)NULL);
++    cur = (block_dev_state_t *)entity->info;
++    ops = &(cur->dev_spec->ops);
++    buf = &(cur->dev_spec->buffer);
++    block_size = cur->dev_spec->block_size;
++    assert((length <= cur->size) && (length > 0U) && (ops->read != 0));
++
++    /*
++     * We don't know the number of bytes that we are going
++     * to read in every iteration, because it will depend
++     * on the low level driver.
++     */
++    count = 0;
++    for (left = length; left > 0U; left -= nbytes) {
++        /*
++         * We must only request operations aligned to the block
++         * size. Therefore if file_pos is not block-aligned,
++         * we have to request the operation to start at the
++         * previous block boundary and skip the leading bytes. And
++         * similarly, the number of bytes requested must be a
++         * block size multiple
++         */
++        skip = cur->file_pos & (block_size - 1U);
++
++        /*
++         * Calculate the block number containing file_pos
++         * - e.g. block 3.
++         */
++        lba = (cur->file_pos + cur->base) / block_size;
++
++        if ((skip + left) > buf->length) {
++            /*
++             * The underlying read buffer is too small to
++             * read all the required data - limit to just
++             * fill the buffer, and then read again.
++             */
++            request = buf->length;
++        } else {
++            /*
++             * The underlying read buffer is big enough to
++             * read all the required data. Calculate the
++             * number of bytes to read to align with the
++             * block size.
++             */
++            request = skip + left;
++            request = (request + (block_size - 1U)) & ~(block_size - 1U);
++        }
++        request = ops->read(lba, buf->offset, request);
++
++        if (request <= skip) {
++            /*
++             * We couldn't read enough bytes to jump over
++             * the skip bytes, so we should have to read
++             * again the same block, thus generating
++             * the same error.
++             */
++            return -EIO;
++        }
++
++        /*
++         * Need to remove skip and padding bytes,if any, from
++         * the read data when copying to the user buffer.
++         */
++        nbytes = request - skip;
++        padding = (nbytes > left) ? nbytes - left : 0U;
++        nbytes -= padding;
++
++        memcpy((void *)(buffer + count), (void *)(buf->offset + skip), nbytes);
++
++        cur->file_pos += nbytes;
++        count += nbytes;
++    }
++    assert(count == length);
++    *length_read = count;
++
++    return 0;
++}
++
++/*
++ * This function allows the caller to write any number of bytes
++ * from any position. It hides from the caller that the low level
++ * driver only can write aligned blocks of data.
++ * See comments for block_read for more details.
++ */
++static int block_write(io_entity_t *entity, const uintptr_t buffer,
++                       size_t length, size_t *length_written) {
++    block_dev_state_t *cur;
++    io_block_spec_t *buf;
++    io_block_ops_t *ops;
++    int lba;
++    size_t block_size, left;
++    size_t nbytes;  /* number of bytes read in one iteration */
++    size_t request; /* number of requested bytes in one iteration */
++    size_t count;   /* number of bytes already read */
++    /*
++     * number of leading bytes from start of the block
++     * to the first byte to be read
++     */
++    size_t skip;
++
++    /*
++     * number of trailing bytes between the last byte
++     * to be read and the end of the block
++     */
++    size_t padding;
++    assert(entity->info != (uintptr_t)NULL);
++    cur = (block_dev_state_t *)entity->info;
++    ops = &(cur->dev_spec->ops);
++    buf = &(cur->dev_spec->buffer);
++    block_size = cur->dev_spec->block_size;
++    assert((length <= cur->size) && (length > 0U) && (ops->read != 0) &&
++           (ops->write != 0));
++
++    /*
++     * We don't know the number of bytes that we are going
++     * to write in every iteration, because it will depend
++     * on the low level driver.
++     */
++    count = 0;
++    for (left = length; left > 0U; left -= nbytes) {
++        /*
++         * We must only request operations aligned to the block
++         * size. Therefore if file_pos is not block-aligned,
++         * we have to request the operation to start at the
++         * previous block boundary and skip the leading bytes. And
++         * similarly, the number of bytes requested must be a
++         * block size multiple
++         */
++        skip = cur->file_pos & (block_size - 1U);
++
++        /*
++         * Calculate the block number containing file_pos
++         * - e.g. block 3.
++         */
++        lba = (cur->file_pos + cur->base) / block_size;
++
++        if ((skip + left) > buf->length) {
++            /*
++             * The underlying read buffer is too small to
++             * read all the required data - limit to just
++             * fill the buffer, and then read again.
++             */
++            request = buf->length;
++        } else {
++            /*
++             * The underlying read buffer is big enough to
++             * read all the required data. Calculate the
++             * number of bytes to read to align with the
++             * block size.
++             */
++            request = skip + left;
++            request = (request + (block_size - 1U)) & ~(block_size - 1U);
++        }
++
++        /*
++         * The number of bytes that we are going to write
++         * from the user buffer will depend of the size
++         * of the current request.
++         */
++        nbytes = request - skip;
++        padding = (nbytes > left) ? nbytes - left : 0U;
++        nbytes -= padding;
++
++        /*
++         * If we have skip or padding bytes then we have to preserve
++         * some content and it means that we have to read before
++         * writing
++         */
++        if ((skip > 0U) || (padding > 0U)) {
++            request = ops->read(lba, buf->offset, request);
++            /*
++             * The read may return size less than
++             * requested. Round down to the nearest block
++             * boundary
++             */
++            request &= ~(block_size - 1U);
++            if (request <= skip) {
++                /*
++                 * We couldn't read enough bytes to jump over
++                 * the skip bytes, so we should have to read
++                 * again the same block, thus generating
++                 * the same error.
++                 */
++                return -EIO;
++            }
++            nbytes = request - skip;
++            padding = (nbytes > left) ? nbytes - left : 0U;
++            nbytes -= padding;
++        }
++
++        memcpy((void *)(buf->offset + skip), (void *)(buffer + count), nbytes);
++
++        request = ops->write(lba, buf->offset, request);
++        if (request <= skip) return -EIO;
++
++        /*
++         * And the previous write operation may modify the size
++         * of the request, so again, we have to calculate the
++         * number of bytes that we consumed from the user
++         * buffer
++         */
++        nbytes = request - skip;
++        padding = (nbytes > left) ? nbytes - left : 0U;
++        nbytes -= padding;
++
++        cur->file_pos += nbytes;
++        count += nbytes;
++    }
++    assert(count == length);
++    *length_written = count;
++
++    return 0;
++}
++
++static int block_close(io_entity_t *entity) {
++    entity->info = (uintptr_t)NULL;
++    return 0;
++}
++
++static int block_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info) {
++    block_dev_state_t *cur;
++    io_block_spec_t *buffer;
++    io_dev_info_t *info;
++    size_t block_size;
++    int result;
++    assert(dev_info != NULL);
++    result = allocate_dev_info(&info);
++    if (result != 0) return -ENOENT;
++
++    cur = (block_dev_state_t *)info->info;
++    /* dev_spec is type of io_block_dev_spec_t. */
++    cur->dev_spec = (io_block_dev_spec_t *)dev_spec;
++    buffer = &(cur->dev_spec->buffer);
++    block_size = cur->dev_spec->block_size;
++
++    assert((block_size > 0U) && (is_power_of_2(block_size) != 0U) &&
++           ((buffer->length % block_size) == 0U));
++
++    *dev_info = info; /* cast away const */
++    (void)block_size;
++    (void)buffer;
++    return 0;
++}
++
++static int block_dev_close(io_dev_info_t *dev_info) {
++    return free_dev_info(dev_info);
++}
++
++/* Exported functions */
++
++/* Register the Block driver with the IO abstraction */
++int register_io_dev_block(const io_dev_connector_t **dev_con) {
++    int result;
++
++    assert(dev_con != NULL);
++
++    /*
++     * Since dev_info isn't really used in io_register_device, always
++     * use the same device info at here instead.
++     */
++    result = io_register_device(&dev_info_pool[0]);
++    if (result == 0) *dev_con = &block_dev_connector;
++    return result;
++}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_block.h b/platform/ext/target/arm/corstone1000/io/io_block.h
+new file mode 100644
+index 0000000000..1603aa74c5
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_block.h
+@@ -0,0 +1,40 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#ifndef __IO_BLOCK_H__
++#define __IO_BLOCK_H__
++
++#include "io_storage.h"
++
++/* block devices ops */
++typedef struct io_block_ops {
++    size_t (*read)(int lba, uintptr_t buf, size_t size);
++    size_t (*write)(int lba, const uintptr_t buf, size_t size);
++} io_block_ops_t;
++
++typedef struct io_block_dev_spec {
++    io_block_spec_t buffer;
++    io_block_ops_t ops;
++    size_t block_size;
++} io_block_dev_spec_t;
++
++struct io_dev_connector;
++
++int register_io_dev_block(const struct io_dev_connector **dev_con);
++
++#endif /* __IO_BLOCK_H__ */
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/io/io_defs.h b/platform/ext/target/arm/corstone1000/io/io_defs.h
+new file mode 100644
+index 0000000000..acba969ed6
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_defs.h
+@@ -0,0 +1,27 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#ifndef __IO_DEFS_H__
++#define __IO_DEFS_H__
++
++#define MAX_IO_DEVICES          (2)
++#define MAX_IO_HANDLES          (2)
++#define MAX_IO_BLOCK_DEVICES    (2)
++#define MAX_IO_FLASH_DEVICES    (2)
++
++#endif /* __IO_DEFS_H__ */
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/io/io_driver.h b/platform/ext/target/arm/corstone1000/io/io_driver.h
+new file mode 100644
+index 0000000000..cf9e21a6d4
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_driver.h
+@@ -0,0 +1,54 @@
++/*
++ * Copyright (c) 2014-2022, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef __IO_DRIVER_H__
++#define __IO_DRIVER_H__
++
++#include <io_storage.h>
++#include <stdint.h>
++
++/* Generic IO entity structure,representing an accessible IO construct on the
++ * device, such as a file */
++typedef struct io_entity {
++    struct io_dev_info *dev_handle;
++    uintptr_t info;
++} io_entity_t;
++
++/* Device info structure, providing device-specific functions and a means of
++ * adding driver-specific state */
++typedef struct io_dev_info {
++    const struct io_dev_funcs *funcs;
++    uintptr_t info;
++} io_dev_info_t;
++
++/* Structure used to create a connection to a type of device */
++typedef struct io_dev_connector {
++    /* dev_open opens a connection to a particular device driver */
++    int (*dev_open)(const uintptr_t dev_spec, io_dev_info_t **dev_info);
++} io_dev_connector_t;
++
++/* Structure to hold device driver function pointers */
++typedef struct io_dev_funcs {
++    io_type_t (*type)(void);
++    int (*open)(io_dev_info_t *dev_info, const uintptr_t spec,
++                io_entity_t *entity);
++    int (*seek)(io_entity_t *entity, int mode, size_t offset);
++    int (*size)(io_entity_t *entity, size_t *length);
++    int (*read)(io_entity_t *entity, uintptr_t buffer, size_t length,
++                size_t *length_read);
++    int (*write)(io_entity_t *entity, const uintptr_t buffer, size_t length,
++                 size_t *length_written);
++    int (*close)(io_entity_t *entity);
++    int (*dev_init)(io_dev_info_t *dev_info, const uintptr_t init_params);
++    int (*dev_close)(io_dev_info_t *dev_info);
++} io_dev_funcs_t;
++
++/* Operations intended to be performed during platform initialisation */
++
++/* Register an IO device */
++int io_register_device(const io_dev_info_t *dev_info);
++
++#endif /* __IO_DRIVER_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.c b/platform/ext/target/arm/corstone1000/io/io_flash.c
+new file mode 100644
+index 0000000000..ff4524e9c5
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_flash.c
+@@ -0,0 +1,183 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include "io_flash.h"
++
++#include <assert.h>
++#include <errno.h>
++
++#include "Driver_Flash.h"
++#include "io_block.h"
++#include "io_defs.h"
++#include "io_driver.h"
++#include "io_storage.h"
++
++#if MAX_IO_FLASH_DEVICES > MAX_IO_BLOCK_DEVICES
++#error \
++    "FLASH devices are BLOCK devices .. MAX_IO_FLASH_DEVICES should be less or equal to MAX_IO_BLOCK_DEVICES"
++#endif
++
++/* Private Prototypes */
++
++static int flash_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info);
++static size_t flash_read(int lba, uintptr_t buf, size_t size, size_t flash_id);
++static size_t flash_write(int lba, const uintptr_t buf, size_t size,
++                          size_t flash_id);
++static size_t flash0_read(int lba, uintptr_t buf, size_t size);
++static size_t flash0_write(int lba, uintptr_t buf, size_t size);
++static size_t flash1_read(int lba, uintptr_t buf, size_t size);
++static size_t flash1_write(int lba, uintptr_t buf, size_t size);
++
++/** Private Data **/
++
++/* Flash device data */
++static const io_dev_connector_t flash_dev_connector = {.dev_open =
++                                                           flash_dev_open};
++static size_t flash_dev_count = 0;
++static io_flash_dev_spec_t *flash_dev_specs[MAX_IO_FLASH_DEVICES];
++
++/* Block device data */
++static io_dev_connector_t block_dev_connectors[MAX_IO_FLASH_DEVICES];
++static io_block_dev_spec_t block_dev_spec[MAX_IO_FLASH_DEVICES];
++
++/* Flash devices read/write function pointers */
++static io_block_ops_t flashs_ops[MAX_IO_FLASH_DEVICES] = {
++    [0] = {.read = flash0_read, .write = flash0_write},
++    [1] = {.read = flash1_read, .write = flash1_write},
++};
++
++/* Flash ops functions */
++static size_t flash_read(int lba, uintptr_t buf, size_t size, size_t flash_id) {
++    ARM_DRIVER_FLASH *flash_driver =
++        ((ARM_DRIVER_FLASH *)flash_dev_specs[flash_id]->flash_driver);
++    ARM_FLASH_INFO *info = flash_driver->GetInfo();
++    uint32_t addr = info->sector_size * lba;
++    uint32_t offset = addr - flash_dev_specs[flash_id]->base_addr;
++    size_t rem = info->sector_count * info->sector_size - offset;
++    size_t cnt = size < rem ? size : rem;
++
++    return flash_driver->ReadData(offset, buf, cnt);
++}
++
++static size_t flash_write(int lba, const uintptr_t buf, size_t size,
++                          size_t flash_id) {
++    ARM_DRIVER_FLASH *flash_driver =
++        ((ARM_DRIVER_FLASH *)flash_dev_specs[flash_id]->flash_driver);
++    ARM_FLASH_INFO *info = flash_driver->GetInfo();
++    int32_t rc = 0;
++    uint32_t addr = info->sector_size * lba;
++    uint32_t offset = addr - flash_dev_specs[flash_id]->base_addr;
++    size_t rem = info->sector_count * info->sector_size - offset;
++    size_t cnt = size < rem ? size : rem;
++
++    flash_driver->EraseSector(offset);
++    rc = flash_driver->ProgramData(offset, buf, cnt);
++    return rc;
++}
++
++/* Flash ops functions wrapper for each device */
++
++static size_t flash0_read(int lba, uintptr_t buf, size_t size) {
++    return flash_read(lba, buf, size, 0);
++}
++
++static size_t flash0_write(int lba, uintptr_t buf, size_t size) {
++    return flash_write(lba, buf, size, 0);
++}
++
++static size_t flash1_read(int lba, uintptr_t buf, size_t size) {
++    return flash_read(lba, buf, size, 1);
++}
++
++static size_t flash1_write(int lba, uintptr_t buf, size_t size) {
++    return flash_write(lba, buf, size, 1);
++}
++
++/**
++ *  Helper function to find the index of stored flash_dev_specs or
++ *  return a free slot in case of a new dev_spec
++ */
++static int find_flash_dev_specs(const uintptr_t dev_spec) {
++    /* Search in the saved ones */
++    for (int i = 0; i < flash_dev_count; ++i) {
++        if (flash_dev_specs[i] != NULL &&
++            flash_dev_specs[i]->flash_driver ==
++                ((io_flash_dev_spec_t *)dev_spec)->flash_driver) {
++            return i;
++        }
++    }
++    /* Find the first empty flash_dev_specs to be used */
++    for (int i = 0; i < flash_dev_count; ++i) {
++        if (flash_dev_specs[i] == NULL) {
++            return i;
++        }
++    }
++    return -1;
++}
++
++/**
++ * This function should be called
++ */
++static int flash_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info) {
++    ARM_DRIVER_FLASH *flash_driver;
++    assert(dev_info != NULL);
++    assert(dev_spec != NULL);
++
++    size_t index = find_flash_dev_specs(dev_spec);
++
++    /* Check if Flash ops functions are defined for this flash */
++    assert(flashs_ops[index].read && flashs_ops[index].write);
++
++    flash_dev_specs[index] = dev_spec;
++    flash_driver = flash_dev_specs[index]->flash_driver;
++
++    block_dev_spec[index].block_size = flash_driver->GetInfo()->sector_size;
++    block_dev_spec[index].buffer.offset = flash_dev_specs[index]->buffer;
++    block_dev_spec[index].buffer.length = flash_dev_specs[index]->bufferlen;
++    block_dev_spec[index].ops = flashs_ops[index];
++
++    flash_driver->Initialize(NULL);
++
++    block_dev_connectors[index].dev_open(&block_dev_spec[index], dev_info);
++
++    return 0;
++}
++
++/* Exported functions */
++
++/**
++ * Register the flash device.
++ * Internally it register a block device.
++ */
++int register_io_dev_flash(const io_dev_connector_t **dev_con) {
++    int result;
++
++    if (flash_dev_count >= MAX_IO_FLASH_DEVICES) {
++        return -ENOENT;
++    }
++    assert(dev_con != NULL);
++
++    result = register_io_dev_block(dev_con);
++    if (result == 0) {
++        /* Store the block dev connector */
++        block_dev_connectors[flash_dev_count++] = **dev_con;
++        /* Override dev_con with the flash dev connector */
++        *dev_con = &flash_dev_connector;
++    }
++    return result;
++}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.h b/platform/ext/target/arm/corstone1000/io/io_flash.h
+new file mode 100644
+index 0000000000..8bc38b5824
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_flash.h
+@@ -0,0 +1,37 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#ifndef __IO_FLASH_H__
++#define __IO_FLASH_H__
++
++#include "io_storage.h"
++
++typedef struct io_flash_dev_spec {
++    uintptr_t buffer;
++    size_t bufferlen;
++    uint32_t base_addr;
++    uintptr_t flash_driver;
++} io_flash_dev_spec_t;
++
++struct io_dev_connector;
++
++/* Register the flash driver with the IO abstraction internally it register a
++ * block device*/
++int register_io_dev_flash(const struct io_dev_connector **dev_con);
++
++#endif /* __IO_FLASH_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/io/io_storage.c b/platform/ext/target/arm/corstone1000/io/io_storage.c
+new file mode 100644
+index 0000000000..f26f4980f0
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_storage.c
+@@ -0,0 +1,289 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include <assert.h>
++#include <errno.h>
++#include <stdbool.h>
++
++#include "io_defs.h"
++#include "io_driver.h"
++
++/* Storage for a fixed maximum number of IO entities, definable by platform */
++static io_entity_t entity_pool[MAX_IO_HANDLES];
++
++/* Simple way of tracking used storage - each entry is NULL or a pointer to an
++ * entity */
++static io_entity_t *entity_map[MAX_IO_HANDLES];
++
++/* Track number of allocated entities */
++static unsigned int entity_count;
++
++/* Array of fixed maximum of registered devices, definable by platform */
++static const io_dev_info_t *devices[MAX_IO_DEVICES];
++
++/* Number of currently registered devices */
++static unsigned int dev_count;
++
++/* Return a boolean value indicating whether a device connector is valid */
++static bool is_valid_dev_connector(const io_dev_connector_t *dev_con) {
++    return (dev_con != NULL) && (dev_con->dev_open != NULL);
++}
++
++/* Return a boolean value indicating whether a device handle is valid */
++static bool is_valid_dev(const uintptr_t dev_handle) {
++    const io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
++
++    return (dev != NULL) && (dev->funcs != NULL) &&
++           (dev->funcs->type != NULL) && (dev->funcs->type() < IO_TYPE_MAX);
++}
++
++/* Return a boolean value indicating whether an IO entity is valid */
++static bool is_valid_entity(const uintptr_t handle) {
++    const io_entity_t *entity = (io_entity_t *)handle;
++
++    return (entity != NULL) && (is_valid_dev((uintptr_t)entity->dev_handle));
++}
++
++/* Return a boolean value indicating whether a seek mode is valid */
++static bool is_valid_seek_mode(io_seek_mode_t mode) {
++    return ((mode != IO_SEEK_INVALID) && (mode < IO_SEEK_MAX));
++}
++
++/* Open a connection to a specific device */
++static int io_storage_dev_open(const io_dev_connector_t *dev_con,
++                               const uintptr_t dev_spec,
++                               io_dev_info_t **dev_info) {
++    assert(dev_info != NULL);
++    assert(is_valid_dev_connector(dev_con));
++
++    return dev_con->dev_open(dev_spec, dev_info);
++}
++
++/* Set a handle to track an entity */
++static void set_handle(uintptr_t *handle, io_entity_t *entity) {
++    assert(handle != NULL);
++    *handle = (uintptr_t)entity;
++}
++
++/* Locate an entity in the pool, specified by address */
++static int find_first_entity(const io_entity_t *entity,
++                             unsigned int *index_out) {
++    int result = -ENOENT;
++    for (unsigned int index = 0; index < MAX_IO_HANDLES; ++index) {
++        if (entity_map[index] == entity) {
++            result = 0;
++            *index_out = index;
++            break;
++        }
++    }
++    return result;
++}
++
++/* Allocate an entity from the pool and return a pointer to it */
++static int allocate_entity(io_entity_t **entity) {
++    int result = -ENOMEM;
++    assert(entity != NULL);
++
++    if (entity_count < MAX_IO_HANDLES) {
++        unsigned int index = 0;
++        result = find_first_entity(NULL, &index);
++        assert(result == 0);
++        *entity = &entity_pool[index];
++        entity_map[index] = &entity_pool[index];
++        ++entity_count;
++    }
++
++    return result;
++}
++
++/* Release an entity back to the pool */
++static int free_entity(const io_entity_t *entity) {
++    int result;
++    unsigned int index = 0;
++    assert(entity != NULL);
++
++    result = find_first_entity(entity, &index);
++    if (result == 0) {
++        entity_map[index] = NULL;
++        --entity_count;
++    }
++
++    return result;
++}
++
++/* Exported API */
++
++/* Register an io device */
++int io_register_device(const io_dev_info_t *dev_info) {
++    int result = -ENOMEM;
++    assert(dev_info != NULL);
++
++    if (dev_count < MAX_IO_DEVICES) {
++        devices[dev_count] = dev_info;
++        dev_count++;
++        result = 0;
++    }
++
++    return result;
++}
++
++/* Open a connection to an IO device */
++int io_dev_open(const io_dev_connector_t *dev_con, const uintptr_t dev_spec,
++                uintptr_t *handle) {
++    assert(handle != NULL);
++    return io_storage_dev_open(dev_con, dev_spec, (io_dev_info_t **)handle);
++}
++
++/* Initialise an IO device explicitly - to permit lazy initialisation or
++ * re-initialisation */
++int io_dev_init(uintptr_t dev_handle, const uintptr_t init_params) {
++    int result = 0;
++    assert(dev_handle != (uintptr_t)NULL);
++    assert(is_valid_dev(dev_handle));
++
++    io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
++
++    /* Absence of registered function implies NOP here */
++    if (dev->funcs->dev_init != NULL) {
++        result = dev->funcs->dev_init(dev, init_params);
++    }
++
++    return result;
++}
++
++/* Close a connection to a device */
++int io_dev_close(uintptr_t dev_handle) {
++    int result = 0;
++    assert(dev_handle != (uintptr_t)NULL);
++    assert(is_valid_dev(dev_handle));
++
++    io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
++
++    /* Absence of registered function implies NOP here */
++    if (dev->funcs->dev_close != NULL) {
++        result = dev->funcs->dev_close(dev);
++    }
++
++    return result;
++}
++
++/* Synchronous operations */
++
++/* Open an IO entity */
++int io_open(uintptr_t dev_handle, const uintptr_t spec, uintptr_t *handle) {
++    int result;
++    assert((spec != (uintptr_t)NULL) && (handle != NULL));
++    assert(is_valid_dev(dev_handle));
++
++    io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
++    io_entity_t *entity;
++
++    result = allocate_entity(&entity);
++
++    if (result == 0) {
++        assert(dev->funcs->open != NULL);
++        result = dev->funcs->open(dev, spec, entity);
++
++        if (result == 0) {
++            entity->dev_handle = dev;
++            set_handle(handle, entity);
++        } else
++            free_entity(entity);
++    }
++    return result;
++}
++
++/* Seek to a specific position in an IO entity */
++int io_seek(uintptr_t handle, io_seek_mode_t mode, int32_t offset) {
++    int result = -ENODEV;
++    assert(is_valid_entity(handle) && is_valid_seek_mode(mode));
++
++    io_entity_t *entity = (io_entity_t *)handle;
++
++    io_dev_info_t *dev = entity->dev_handle;
++
++    if (dev->funcs->seek != NULL)
++        result = dev->funcs->seek(entity, mode, offset);
++
++    return result;
++}
++
++/* Determine the length of an IO entity */
++int io_size(uintptr_t handle, size_t *length) {
++    int result = -ENODEV;
++    assert(is_valid_entity(handle) && (length != NULL));
++
++    io_entity_t *entity = (io_entity_t *)handle;
++
++    io_dev_info_t *dev = entity->dev_handle;
++
++    if (dev->funcs->size != NULL) result = dev->funcs->size(entity, length);
++
++    return result;
++}
++
++/* Read data from an IO entity */
++int io_read(uintptr_t handle, uintptr_t buffer, size_t length,
++            size_t *length_read) {
++    int result = -ENODEV;
++    assert(is_valid_entity(handle));
++
++    io_entity_t *entity = (io_entity_t *)handle;
++
++    io_dev_info_t *dev = entity->dev_handle;
++
++    if (dev->funcs->read != NULL)
++        result = dev->funcs->read(entity, buffer, length, length_read);
++
++    return result;
++}
++
++/* Write data to an IO entity */
++int io_write(uintptr_t handle, const uintptr_t buffer, size_t length,
++             size_t *length_written) {
++    int result = -ENODEV;
++    assert(is_valid_entity(handle));
++
++    io_entity_t *entity = (io_entity_t *)handle;
++
++    io_dev_info_t *dev = entity->dev_handle;
++
++    if (dev->funcs->write != NULL) {
++        result = dev->funcs->write(entity, buffer, length, length_written);
++    }
++
++    return result;
++}
++
++/* Close an IO entity */
++int io_close(uintptr_t handle) {
++    int result = 0;
++    assert(is_valid_entity(handle));
++
++    io_entity_t *entity = (io_entity_t *)handle;
++
++    io_dev_info_t *dev = entity->dev_handle;
++
++    /* Absence of registered function implies NOP here */
++    if (dev->funcs->close != NULL) result = dev->funcs->close(entity);
++
++    /* Ignore improbable free_entity failure */
++    (void)free_entity(entity);
++
++    return result;
++}
+diff --git a/platform/ext/target/arm/corstone1000/io/io_storage.h b/platform/ext/target/arm/corstone1000/io/io_storage.h
+new file mode 100644
+index 0000000000..0cdca5b269
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/io/io_storage.h
+@@ -0,0 +1,92 @@
++/*
++ * Copyright (c) 2022 Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#ifndef __IO_STORAGE_H__
++#define __IO_STORAGE_H__
++
++#include <stddef.h>
++#include <stdint.h>
++
++/* Access modes used when accessing data on a device */
++#define IO_MODE_INVALID (0)
++#define IO_MODE_RO (1 << 0)
++#define IO_MODE_RW (1 << 1)
++
++/* Device type which can be used to enable policy decisions about which device
++ * to access */
++typedef enum {
++    IO_TYPE_INVALID,
++    IO_TYPE_SEMIHOSTING,
++    IO_TYPE_MEMMAP,
++    IO_TYPE_DUMMY,
++    IO_TYPE_FIRMWARE_IMAGE_PACKAGE,
++    IO_TYPE_BLOCK,
++    IO_TYPE_MTD,
++    IO_TYPE_MMC,
++    IO_TYPE_STM32IMAGE,
++    IO_TYPE_ENCRYPTED,
++    IO_TYPE_MAX
++} io_type_t;
++
++/* Modes used when seeking data on a supported device */
++typedef enum {
++    IO_SEEK_INVALID,
++    IO_SEEK_SET,
++    IO_SEEK_END,
++    IO_SEEK_CUR,
++    IO_SEEK_MAX
++} io_seek_mode_t;
++
++/* Connector type, providing a means of identifying a device to open */
++struct io_dev_connector;
++
++/* Block specification - used to refer to data on a device supporting
++ * block-like entities */
++typedef struct io_block_spec {
++    size_t offset;
++    size_t length;
++} io_block_spec_t;
++
++
++/* Open a connection to a device */
++int io_dev_open(const struct io_dev_connector *dev_con,
++                const uintptr_t dev_spec, uintptr_t *handle);
++
++/* Initialise a device explicitly - to permit lazy initialisation or
++ * re-initialisation */
++int io_dev_init(uintptr_t dev_handle, const uintptr_t init_params);
++
++/* Close a connection to a device */
++int io_dev_close(uintptr_t dev_handle);
++
++/* Synchronous operations */
++int io_open(uintptr_t dev_handle, const uintptr_t spec, uintptr_t *handle);
++
++int io_seek(uintptr_t handle, io_seek_mode_t mode, int32_t offset);
++
++int io_size(uintptr_t handle, size_t *length);
++
++int io_read(uintptr_t handle, uintptr_t buffer, size_t length,
++            size_t *length_read);
++
++int io_write(uintptr_t handle, const uintptr_t buffer, size_t length,
++             size_t *length_written);
++
++int io_close(uintptr_t handle);
++
++#endif /* __IO_STORAGE_H__ */
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
new file mode 100644
index 000000000000..a4da13ecfcff
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
@@ -0,0 +1,646 @@
+From 3bca7e6bae9a5017fff83b0a7d2d0d78b422a741 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Mon, 7 Nov 2022 12:51:58 +0000
+Subject: [PATCH 02/10] Platform: corstone1000: Add IO test in ci_regressions
+
+The test is simply writing data on the edge of a block
+then reading back again.
+this test is preformed on two flash devices:
+- Nor Flash
+- Flash emu in the SRAM for testing
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I4950086e9e3dcbde29ab5b4ed5fe61fec7ebec86
+Upstream-Status: Accepted [TF-Mv1.8.0]
+---
+ .../ci_regression_tests/CMakeLists.txt        |  10 +
+ .../Driver_Flash_SRAM_Emu.c                   | 327 ++++++++++++++++++
+ .../ci_regression_tests/s_io_storage_test.c   | 147 ++++++++
+ .../ci_regression_tests/s_io_storage_test.h   |  15 +
+ .../corstone1000/ci_regression_tests/s_test.c |   5 +
+ .../ci_regression_tests/s_test_config.cmake   |   5 +
+ .../ci_regression_tests/test_flash.h          |  25 ++
+ 7 files changed, 534 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h
+
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt
+index 9543e29e55..405b2b3702 100644
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt
+@@ -17,12 +17,18 @@ target_sources(tfm_test_suite_extra_s
+     PRIVATE
+         ${CMAKE_CURRENT_SOURCE_DIR}/s_test.c
+         ../Native_Driver/firewall.c
++        ../io/io_storage.c
++        ../io/io_block.c
++        ../io/io_flash.c
++        Driver_Flash_SRAM_Emu.c
++        s_io_storage_test.c
+ )
+ 
+ target_include_directories(tfm_test_suite_extra_s
+     PRIVATE
+         ../Device/Include
+         ../Native_Driver
++        ../io
+ )
+ 
+ target_link_libraries(tfm_test_suite_extra_s
+@@ -33,4 +39,8 @@ target_link_libraries(tfm_test_suite_extra_s
+ target_compile_definitions(tfm_test_suite_extra_s
+     PRIVATE
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
++        TEST_FLASH_SIZE_IN_BYTES=${TEST_FLASH_SIZE_IN_BYTES}
++        TEST_FLASH_SECTOR_SIZE_IN_BYTES=${TEST_FLASH_SECTOR_SIZE_IN_BYTES}
++        TEST_FLASH_PAGE_SIZE=${TEST_FLASH_PAGE_SIZE}
++        TEST_FLASH_PROGRAM_UNIT=${TEST_FLASH_PROGRAM_UNIT}
+ )
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c
+new file mode 100644
+index 0000000000..06b6b51c09
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c
+@@ -0,0 +1,327 @@
++/*
++ * Copyright (c) 2013-2022 ARM Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: Apache-2.0
++ *
++ * Licensed under the Apache License, Version 2.0 (the License); you may
++ * not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ * www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
++ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include <string.h>
++#include <stdint.h>
++#include "Driver_Flash.h"
++#include "test_flash.h"
++#include "tfm_sp_log.h"
++
++#ifndef ARG_UNUSED
++#define ARG_UNUSED(arg)  ((void)arg)
++#endif
++
++/* Driver version */
++#define ARM_FLASH_DRV_VERSION      ARM_DRIVER_VERSION_MAJOR_MINOR(1, 1)
++#define ARM_FLASH_DRV_ERASE_VALUE  0xFF
++
++
++/**
++ * There is no real flash memory. This driver just emulates a flash
++ * interface and behaviour on top of the SRAM memory.
++ */
++
++/**
++ * Data width values for ARM_FLASH_CAPABILITIES::data_width
++ * \ref ARM_FLASH_CAPABILITIES
++ */
++ enum {
++    DATA_WIDTH_8BIT   = 0u,
++    DATA_WIDTH_16BIT,
++    DATA_WIDTH_32BIT,
++    DATA_WIDTH_ENUM_SIZE
++};
++
++static const uint32_t data_width_byte[DATA_WIDTH_ENUM_SIZE] = {
++    sizeof(uint8_t),
++    sizeof(uint16_t),
++    sizeof(uint32_t),
++};
++
++
++/*
++ * ARM FLASH device structure
++ *
++ */
++struct arm_flash_dev_t {
++    const uint8_t* memory_base;   /*!< FLASH memory base address */
++    ARM_FLASH_INFO *data;         /*!< FLASH data */
++};
++
++/* Flash emulated memory */
++static uint8_t flash_memory[TEST_FLASH_SIZE_IN_BYTES]
++    __attribute__((aligned(TEST_FLASH_SECTOR_SIZE_IN_BYTES)));
++
++/* Flash Status */
++static ARM_FLASH_STATUS FlashStatus = {0, 0, 0};
++
++/* Driver Version */
++static const ARM_DRIVER_VERSION DriverVersion = {
++    ARM_FLASH_API_VERSION,
++    ARM_FLASH_DRV_VERSION
++};
++
++/* Driver Capabilities */
++static const ARM_FLASH_CAPABILITIES DriverCapabilities = {
++    0, /* event_ready */
++    0, /* data_width = 0:8-bit, 1:16-bit, 2:32-bit */
++    1  /* erase_chip */
++};
++
++static int32_t is_range_valid(struct arm_flash_dev_t *flash_dev,
++                              uint32_t offset)
++{
++    uint32_t flash_limit = 0;
++    int32_t rc = 0;
++
++    flash_limit = (flash_dev->data->sector_count * flash_dev->data->sector_size);
++    if (offset > flash_limit) {
++        rc = -1;
++    }
++    return rc;
++}
++
++static int32_t is_write_aligned(struct arm_flash_dev_t *flash_dev,
++                                uint32_t param)
++{
++    int32_t rc = 0;
++
++    if ((param % flash_dev->data->program_unit) != 0) {
++        rc = -1;
++    }
++    return rc;
++}
++
++static int32_t is_sector_aligned(struct arm_flash_dev_t *flash_dev,
++                                 uint32_t offset)
++{
++    int32_t rc = 0;
++
++    if ((offset % flash_dev->data->sector_size) != 0) {
++        rc = -1;
++    }
++    return rc;
++}
++
++static int32_t is_flash_ready_to_write(const uint8_t *start_addr, uint32_t cnt)
++{
++    int32_t rc = 0;
++    uint32_t i;
++
++    for (i = 0; i < cnt; i++) {
++        if(start_addr[i] != ARM_FLASH_DRV_ERASE_VALUE) {
++            rc = -1;
++            break;
++        }
++    }
++
++    return rc;
++}
++
++static ARM_FLASH_INFO ARM_TEST_FLASH_DEV_DATA = {
++    .sector_info  = NULL,/* Uniform sector layout */
++    .sector_count = TEST_FLASH_SIZE_IN_BYTES / TEST_FLASH_SECTOR_SIZE_IN_BYTES,
++    .sector_size  = TEST_FLASH_SECTOR_SIZE_IN_BYTES,
++    .page_size    = TEST_FLASH_PAGE_SIZE,
++    .program_unit = TEST_FLASH_PROGRAM_UNIT,
++    .erased_value = ARM_FLASH_DRV_ERASE_VALUE};
++
++static struct arm_flash_dev_t ARM_TEST_FLASH_DEV = {
++    .memory_base = flash_memory,
++    .data        = &(ARM_TEST_FLASH_DEV_DATA)};
++
++static struct arm_flash_dev_t *TEST_FLASH_DEV = &ARM_TEST_FLASH_DEV;
++
++/*
++ * Functions
++ */
++
++static ARM_DRIVER_VERSION ARM_Flash_GetVersion(void)
++{
++    return DriverVersion;
++}
++
++static ARM_FLASH_CAPABILITIES ARM_Flash_GetCapabilities(void)
++{
++    return DriverCapabilities;
++}
++
++static int32_t ARM_Flash_Initialize(ARM_Flash_SignalEvent_t cb_event)
++{
++    ARG_UNUSED(cb_event);
++
++    if (DriverCapabilities.data_width >= DATA_WIDTH_ENUM_SIZE) {
++        return ARM_DRIVER_ERROR;
++    }
++
++    /* Nothing to be done */
++    return ARM_DRIVER_OK;
++}
++
++static int32_t ARM_Flash_Uninitialize(void)
++{
++    /* Nothing to be done */
++    return ARM_DRIVER_OK;
++}
++
++static int32_t ARM_Flash_PowerControl(ARM_POWER_STATE state)
++{
++    switch (state) {
++    case ARM_POWER_FULL:
++        /* Nothing to be done */
++        return ARM_DRIVER_OK;
++        break;
++
++    case ARM_POWER_OFF:
++    case ARM_POWER_LOW:
++    default:
++        return ARM_DRIVER_ERROR_UNSUPPORTED;
++    }
++}
++
++static int32_t ARM_Flash_ReadData(uint32_t addr, void *data, uint32_t cnt)
++{
++    int32_t rc = 0;
++
++    /* The addr given is a relative address*/
++    uint32_t offset = addr;
++    addr += (uint32_t)(TEST_FLASH_DEV->memory_base);
++
++    /* Conversion between data items and bytes */
++    cnt *= data_width_byte[DriverCapabilities.data_width];
++
++    /* Check flash memory boundaries */
++    rc = is_range_valid(TEST_FLASH_DEV, offset + cnt);
++    if (rc != 0) {
++        return ARM_DRIVER_ERROR_PARAMETER;
++    }
++
++    /* Flash interface just emulated over SRAM, use memcpy */
++    memcpy(data, (void *)addr, cnt);
++
++    /* Conversion between bytes and data items */
++    cnt /= data_width_byte[DriverCapabilities.data_width];
++
++    return cnt;
++}
++
++static int32_t ARM_Flash_ProgramData(uint32_t addr, const void *data,
++                                     uint32_t cnt)
++{
++    int32_t rc = 0;
++
++    /* The addr given is a relative address*/
++    uint32_t offset = addr;
++    addr += (uint32_t)(TEST_FLASH_DEV->memory_base);
++
++    /* Conversion between data items and bytes */
++    cnt *= data_width_byte[DriverCapabilities.data_width];
++
++    /* Check flash memory boundaries and alignment with minimal write size */
++    rc  = is_range_valid(TEST_FLASH_DEV, offset + cnt);
++    rc |= is_write_aligned(TEST_FLASH_DEV, offset);
++    rc |= is_write_aligned(TEST_FLASH_DEV, cnt);
++    if (rc != 0) {
++        return ARM_DRIVER_ERROR_PARAMETER;
++    }
++
++    /* Check if the flash area to write the data was erased previously */
++    rc = is_flash_ready_to_write((const uint8_t*)addr, cnt);
++    if (rc != 0) {
++        return ARM_DRIVER_ERROR;
++    }
++
++    /* Flash interface just emulated over SRAM, use memcpy */
++    memcpy((void *)addr, data, cnt);
++
++    /* Conversion between bytes and data items */
++    cnt /= data_width_byte[DriverCapabilities.data_width];
++
++    return cnt;
++}
++
++static int32_t ARM_Flash_EraseSector(uint32_t addr)
++{
++    uint32_t rc = 0;
++
++    /* The addr given is a relative address*/
++    uint32_t offset = addr;
++    addr += (uint32_t)(TEST_FLASH_DEV->memory_base);
++
++    rc  = is_range_valid(TEST_FLASH_DEV, offset);
++    rc |= is_sector_aligned(TEST_FLASH_DEV, offset);
++    if (rc != 0) {
++        return ARM_DRIVER_ERROR_PARAMETER;
++    }
++
++    /* Flash interface just emulated over SRAM, use memset */
++    memset((void *)addr,
++           TEST_FLASH_DEV->data->erased_value,
++           TEST_FLASH_DEV->data->sector_size);
++    return ARM_DRIVER_OK;
++}
++
++static int32_t ARM_Flash_EraseChip(void)
++{
++    uint32_t i;
++    uint32_t addr = TEST_FLASH_DEV->memory_base;
++    int32_t rc = ARM_DRIVER_ERROR_UNSUPPORTED;
++
++    /* Check driver capability erase_chip bit */
++    if (DriverCapabilities.erase_chip == 1) {
++        for (i = 0; i < TEST_FLASH_DEV->data->sector_count; i++) {
++            /* Flash interface just emulated over SRAM, use memset */
++            memset((void *)addr,
++                   TEST_FLASH_DEV->data->erased_value,
++                   TEST_FLASH_DEV->data->sector_size);
++
++            addr += TEST_FLASH_DEV->data->sector_size;
++            rc = ARM_DRIVER_OK;
++        }
++    }
++    return rc;
++}
++
++static ARM_FLASH_STATUS ARM_Flash_GetStatus(void)
++{
++    return FlashStatus;
++}
++
++static ARM_FLASH_INFO * ARM_Flash_GetInfo(void)
++{
++    return TEST_FLASH_DEV->data;
++}
++
++
++/* Global Variables */
++
++ARM_DRIVER_FLASH Driver_TEST_FLASH = {
++    ARM_Flash_GetVersion,
++    ARM_Flash_GetCapabilities,
++    ARM_Flash_Initialize,
++    ARM_Flash_Uninitialize,
++    ARM_Flash_PowerControl,
++    ARM_Flash_ReadData,
++    ARM_Flash_ProgramData,
++    ARM_Flash_EraseSector,
++    ARM_Flash_EraseChip,
++    ARM_Flash_GetStatus,
++    ARM_Flash_GetInfo
++};
++
++uintptr_t flash_base_address = flash_memory;
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c
+new file mode 100644
+index 0000000000..f8be384a74
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c
+@@ -0,0 +1,147 @@
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "s_io_storage_test.h"
++
++#include "Driver_Flash.h"
++#include "flash_layout.h"
++#include "io_block.h"
++#include "io_driver.h"
++#include "io_flash.h"
++#include "tfm_sp_log.h"
++
++#define ARRAY_LENGTH(array) (sizeof(array) / sizeof(*(array)))
++
++extern ARM_DRIVER_FLASH Driver_FLASH0;
++extern ARM_DRIVER_FLASH Driver_TEST_FLASH;
++extern uintptr_t flash_base_address;
++
++void s_test_io_storage_multiple_flash_simultaneous(struct test_result_t *ret) {
++    /* FLASH0 */
++    static io_dev_connector_t* flash0_dev_con;
++    static uint8_t local_block_flash0[FLASH_SECTOR_SIZE];
++    ARM_FLASH_INFO* flash0_info = Driver_FLASH0.GetInfo();
++    size_t flash0_block_size = flash0_info->sector_size;
++    io_flash_dev_spec_t flash0_dev_spec = {
++        .buffer = local_block_flash0,
++        .bufferlen = flash0_block_size,
++        .base_addr = FLASH_BASE_ADDRESS,
++        .flash_driver = &Driver_FLASH0,
++    };
++    io_block_spec_t flash0_spec = {
++        .offset = FLASH_BASE_ADDRESS,
++        .length = flash0_info->sector_count * flash0_info->sector_size};
++    uintptr_t flash0_dev_handle = NULL;
++    uintptr_t flash0_handle = NULL;
++
++    /* EMU TEST FLASH */
++    static io_dev_connector_t* flash_emu_dev_con;
++    static uint8_t local_block_flash_emu[TEST_FLASH_SECTOR_SIZE_IN_BYTES]
++        __attribute__((aligned(TEST_FLASH_SECTOR_SIZE_IN_BYTES)));
++    ARM_FLASH_INFO* flash_emu_info = Driver_TEST_FLASH.GetInfo();
++    size_t flash_emu_block_size = flash_emu_info->sector_size;
++    io_flash_dev_spec_t flash_emu_dev_spec = {
++        .buffer = local_block_flash_emu,
++        .bufferlen = flash_emu_block_size,
++        .base_addr = flash_base_address,
++        .flash_driver = &Driver_TEST_FLASH,
++    };
++    io_block_spec_t flash_emu_spec = {
++        .offset = flash_base_address,
++        .length = flash_emu_info->sector_count * flash_emu_info->sector_size};
++    uintptr_t flash_emu_dev_handle = NULL;
++    uintptr_t flash_emu_handle = NULL;
++
++    /* Common */
++    int rc = -1;
++    static uint8_t test_data[] = {0xEE, 0xDD, 0xCC, 0xBB, 0xAA,
++                                  0x10, 0x50, 0xA0, 0xD0, 0x51,
++                                  0x55, 0x44, 0x33, 0x22, 0x11};
++    static uint8_t actual_data[15];
++    size_t bytes_written_count = 0;
++    size_t bytes_read_count = 0;
++
++    memset(local_block_flash0, -1, sizeof(local_block_flash0));
++    memset(local_block_flash_emu, -1, sizeof(local_block_flash_emu));
++
++    /* Register */
++    register_io_dev_flash(&flash0_dev_con);
++    register_io_dev_flash(&flash_emu_dev_con);
++
++    io_dev_open(flash0_dev_con, &flash0_dev_spec, &flash0_dev_handle);
++    io_dev_open(flash_emu_dev_con, &flash_emu_dev_spec, &flash_emu_dev_handle);
++
++    /* Write Data */
++    io_open(flash0_dev_handle, &flash0_spec, &flash0_handle);
++    io_open(flash_emu_dev_handle, &flash_emu_spec, &flash_emu_handle);
++
++    io_seek(flash0_handle, IO_SEEK_SET,
++            BANK_1_PARTITION_OFFSET + flash0_info->sector_size - 7);
++    io_seek(flash_emu_handle, IO_SEEK_SET, flash_emu_info->sector_size - 7);
++
++    io_write(flash0_handle, test_data, ARRAY_LENGTH(test_data),
++             &bytes_written_count);
++    if (bytes_written_count != ARRAY_LENGTH(test_data)) {
++        LOG_ERRFMT("io_write failed to write %d bytes for flash0",
++                   ARRAY_LENGTH(test_data));
++        LOG_ERRFMT("bytes_written_count %d for flash0", bytes_written_count);
++        ret->val = TEST_FAILED;
++    }
++    io_write(flash_emu_handle, test_data, ARRAY_LENGTH(test_data),
++             &bytes_written_count);
++    if (bytes_written_count != ARRAY_LENGTH(test_data)) {
++        LOG_ERRFMT("io_write failed to write %d bytes for flash emu",
++                   ARRAY_LENGTH(test_data));
++        LOG_ERRFMT("bytes_written_count %d for flash emu", bytes_written_count);
++        ret->val = TEST_FAILED;
++    }
++    io_close(flash0_handle);
++    io_close(flash_emu_handle);
++
++    /* Read Data */
++    io_open(flash0_dev_handle, &flash0_spec, &flash0_handle);
++    io_open(flash_emu_dev_handle, &flash_emu_spec, &flash_emu_handle);
++
++    io_seek(flash0_handle, IO_SEEK_SET,
++            BANK_1_PARTITION_OFFSET + flash0_info->sector_size - 7);
++    io_seek(flash_emu_handle, IO_SEEK_SET, flash_emu_info->sector_size - 7);
++
++    /* Flash0 */
++    io_read(flash0_handle, actual_data, ARRAY_LENGTH(actual_data),
++            &bytes_read_count);
++    if (bytes_read_count != ARRAY_LENGTH(test_data)) {
++        LOG_ERRFMT("io_read failed to read %d bytes for flash0",
++                   ARRAY_LENGTH(test_data));
++        LOG_ERRFMT("bytes_read_count %d for flash0", bytes_read_count);
++        ret->val = TEST_FAILED;
++    }
++    if (memcmp((uint8_t*)test_data, actual_data, ARRAY_LENGTH(actual_data)) !=
++        0) {
++        LOG_ERRFMT("Data written != Data read\r\n");
++        ret->val = TEST_FAILED;
++    }
++
++    memset(actual_data, -1, sizeof(actual_data));
++
++    /* Flash Emu */
++    io_read(flash_emu_handle, actual_data, ARRAY_LENGTH(actual_data),
++            &bytes_read_count);
++    if (bytes_read_count != ARRAY_LENGTH(test_data)) {
++        LOG_ERRFMT("io_read failed to read %d bytes for flash emu",
++                   ARRAY_LENGTH(test_data));
++        LOG_ERRFMT("bytes_read_count %d for flash emu", bytes_read_count);
++        ret->val = TEST_FAILED;
++    }
++    if (memcmp((uint8_t*)test_data, actual_data, ARRAY_LENGTH(actual_data)) !=
++        0) {
++        LOG_ERRFMT("Data written != Data read\r\n");
++        ret->val = TEST_FAILED;
++    }
++
++    LOG_INFFMT("PASS: %s\n\r", __func__);
++    ret->val = TEST_PASSED;
++}
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h
+new file mode 100644
+index 0000000000..fa9012776f
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __S_IO_STORAGE_TEST_H__
++#define __S_IO_STORAGE_TEST_H__
++
++#include "extra_s_tests.h"
++
++void s_test_io_storage_multiple_flash_simultaneous(struct test_result_t *ret);
++
++#endif /* __S_IO_STORAGE_TEST_H__ */
+\ No newline at end of file
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
+index a0bf47a04b..9a8453ff57 100644
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
+@@ -11,6 +11,7 @@
+ #include "platform_base_address.h"
+ #include "firewall.h"
+ #include "tfm_sp_log.h"
++#include "s_io_storage_test.h"
+ 
+ /* TODO: if needed each test function can be made as a separate test case, in
+  * such case EXTRA_TEST_XX definitions can be removed */
+@@ -19,6 +20,8 @@
+ 
+ #define DISABLED_TEST 0
+ 
++int test_io_storage_multiple_flash_simultaneous(void);
++
+ enum host_firewall_host_comp_id_t {
+   HOST_FCTRL = (0x00u),
+   COMP_SYSPERIPH,
+@@ -184,6 +187,8 @@ void s_test(struct test_result_t *ret)
+ static struct test_t plat_s_t[] = {
+     {&s_test, "TFM_S_EXTRA_TEST_1001",
+      "Extra Secure test"},
++    {&s_test_io_storage_multiple_flash_simultaneous, "TFM_S_EXTRA_TEST_1002",
++     "Extra Secure test: io storage access multiple flash simultaneous"},
+ };
+ 
+ void register_testsuite_extra_s_interface(struct test_suite_t *p_test_suite)
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake
+index bb8d26bf1c..05b7cd7852 100644
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake
+@@ -6,3 +6,8 @@
+ #-------------------------------------------------------------------------------
+ 
+ ############ Define secure test specific cmake configurations here #############
++
++set (TEST_FLASH_SIZE_IN_BYTES         48U  CACHE STRING   "The size of the emulated flash used in io tests")
++set (TEST_FLASH_SECTOR_SIZE_IN_BYTES  16U  CACHE STRING   "The sector size of the emulated flash used in io tests")
++set (TEST_FLASH_PAGE_SIZE              8U  CACHE STRING   "The page size of the emulated flash used in io tests")
++set (TEST_FLASH_PROGRAM_UNIT           1U  CACHE STRING   "The program unit of the emulated flash used in io tests")
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h b/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h
+new file mode 100644
+index 0000000000..4d073a1d71
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h
+@@ -0,0 +1,25 @@
++/*
++ * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *     http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#ifndef __TEST_FLASH_H__
++#define __TEST_FLASH_H__
++
++#define TEST_FLASH_SIZE_IN_BYTES             (48)    // 48 bytes
++#define TEST_FLASH_SECTOR_SIZE_IN_BYTES      (16)    // 16 bytes
++#define TEST_FLASH_PAGE_SIZE                 (8U)    // 8 bytes
++#define TEST_FLASH_PROGRAM_UNIT              (1U)    /* 1 B */
++
++#endif /* __TEST_FLASH_H__ */
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
new file mode 100644
index 000000000000..5983a4919990
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
@@ -0,0 +1,171 @@
+From 2de11bf9de6d0471772c100c72712d2a09c7cefc Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Wed, 21 Dec 2022 14:44:31 +0000
+Subject: [PATCH 3/10] Platform: corstone1000: Add soft crc32 calculation
+
+crc32 is required by different components.
+for example: during bl1 provisioning crc32 calculation is required
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../arm/corstone1000/soft_crc/soft_crc.c      | 121 ++++++++++++++++++
+ .../arm/corstone1000/soft_crc/soft_crc.h      |  18 +++
+ 2 files changed, 139 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
+ create mode 100644 platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
+
+diff --git a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
+new file mode 100644
+index 0000000000..85f1e30d9f
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
+@@ -0,0 +1,121 @@
++/* Copyright (C) 1986 Gary S. Brown.  You may use this program, or
++   code or tables extracted from it, as desired without restriction.*/
++
++/* First, the polynomial itself and its table of feedback terms.  The  */
++/* polynomial is                                                       */
++/* X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0 */
++/* Note that we take it "backwards" and put the highest-order term in  */
++/* the lowest-order bit.  The X^32 term is "implied"; the LSB is the   */
++/* X^31 term, etc.  The X^0 term (usually shown as "+1") results in    */
++/* the MSB being 1.                                                    */
++
++/* Note that the usual hardware shift register implementation, which   */
++/* is what we're using (we're merely optimizing it by doing eight-bit  */
++/* chunks at a time) shifts bits into the lowest-order term.  In our   */
++/* implementation, that means shifting towards the right.  Why do we   */
++/* do it this way?  Because the calculated CRC must be transmitted in  */
++/* order from highest-order term to lowest-order term.  UARTs transmit */
++/* characters in order from LSB to MSB.  By storing the CRC this way,  */
++/* we hand it to the UART in the order low-byte to high-byte; the UART */
++/* sends each low-bit to hight-bit; and the result is transmission bit */
++/* by bit from highest- to lowest-order term without requiring any bit */
++/* shuffling on our part.  Reception works similarly.                  */
++
++/* The feedback terms table consists of 256, 32-bit entries.  Notes:   */
++/*                                                                     */
++/*  1. The table can be generated at runtime if desired; code to do so */
++/*     is shown later.  It might not be obvious, but the feedback      */
++/*     terms simply represent the results of eight shift/xor opera-    */
++/*     tions for all combinations of data and CRC register values.     */
++/*                                                                     */
++/*  2. The CRC accumulation logic is the same for all CRC polynomials, */
++/*     be they sixteen or thirty-two bits wide.  You simply choose the */
++/*     appropriate table.  Alternatively, because the table can be     */
++/*     generated at runtime, you can start by generating the table for */
++/*     the polynomial in question and use exactly the same "updcrc",   */
++/*     if your application needn't simultaneously handle two CRC       */
++/*     polynomials.  (Note, however, that XMODEM is strange.)          */
++/*                                                                     */
++/*  3. For 16-bit CRCs, the table entries need be only 16 bits wide;   */
++/*     of course, 32-bit entries work OK if the high 16 bits are zero. */
++/*                                                                     */
++/*  4. The values must be right-shifted by eight bits by the "updcrc"  */
++/*     logic; the shift must be unsigned (bring in zeroes).  On some   */
++/*     hardware you could probably optimize the shift in assembler by  */
++/*     using byte-swap instructions.                                   */
++
++/**
++ * The code derived from work by Gary S. Brown.
++*/
++
++#include "soft_crc.h"
++
++
++const static uint32_t crc_32_tab[] = { /* CRC polynomial 0xedb88320 */
++0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
++0xe963a535, 0x9e6495a3, 0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
++0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91, 0x1db71064, 0x6ab020f2,
++0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
++0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9,
++0xfa0f3d63, 0x8d080df5, 0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
++0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b, 0x35b5a8fa, 0x42b2986c,
++0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
++0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423,
++0xcfba9599, 0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
++0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d, 0x76dc4190, 0x01db7106,
++0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
++0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d,
++0x91646c97, 0xe6635c01, 0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
++0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
++0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
++0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7,
++0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
++0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa,
++0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
++0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81,
++0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
++0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683, 0xe3630b12, 0x94643b84,
++0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
++0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
++0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
++0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5, 0xd6d6a3e8, 0xa1d1937e,
++0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
++0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55,
++0x316e8eef, 0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
++0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe, 0xb2bd0b28,
++0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
++0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f,
++0x72076785, 0x05005713, 0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
++0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
++0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
++0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69,
++0x616bffd3, 0x166ccf45, 0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
++0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc,
++0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
++0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693,
++0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
++0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
++};
++
++#define UPDC32(octet,crc) (crc_32_tab[((crc)\
++     ^ ((uint8_t)octet)) & 0xff] ^ ((crc) >> 8))
++
++static inline uint32_t crc32buf(char *buf, size_t len)
++{
++      register uint32_t oldcrc32;
++
++      oldcrc32 = 0xFFFFFFFF;
++
++      for ( ; len; --len, ++buf)
++      {
++            oldcrc32 = UPDC32(*buf, oldcrc32);
++      }
++
++      return ~oldcrc32;
++}
++
++/* Calculate crc32 */
++uint32_t crc32(const void *buf, size_t len) {
++    return crc32buf(buf, len);
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
+new file mode 100644
+index 0000000000..e5b06075c9
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
+@@ -0,0 +1,18 @@
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __SOFT_CRC_H__
++#define __SOFT_CRC_H__
++
++#include <stddef.h>
++#include <stdint.h>
++
++/* Calculate crc32 */
++uint32_t crc32(const void *buf, size_t len);
++
++#endif /* __SOFT_CRC_H__ */
++
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
new file mode 100644
index 000000000000..4921e3a5ad3f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
@@ -0,0 +1,89 @@
+From 6f8ce3c0f70fecb1e7b990b8b47af16972b90671 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Wed, 21 Dec 2022 15:13:27 +0000
+Subject: [PATCH 4/10] Platform: corstone1000: calculate metadata crc32
+
+Calculate metadata crc32 during provisioning.
+It is requried to enable TF-A, U-Boot to verify fwu_metadata.
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt        | 2 ++
+ platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt    | 2 ++
+ .../target/arm/corstone1000/fw_update_agent/fwu_agent.c    | 7 ++++++-
+ 3 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index 7808efae68..554fc51b21 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -58,6 +58,7 @@ target_include_directories(platform_s
+     INTERFACE
+         cc312
+         fw_update_agent
++        soft_crc
+ )
+ 
+ target_sources(platform_s
+@@ -185,6 +186,7 @@ target_include_directories(platform_bl2
+         fip_parser
+         Native_Driver
+         fw_update_agent
++        soft_crc
+         io
+         .
+     INTERFACE
+diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+index 62fd0f6ddf..426a8df698 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+@@ -229,6 +229,7 @@ target_include_directories(bl1_main
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform/ext/accelerator/cc312>
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/lib/ext/cryptocell-312-runtime/shared/include/mbedtls>
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/lib/ext/cryptocell-312-runtime/shared/include/crypto_api/cc3x>
++        ../soft_crc
+ )
+ 
+ # Configurations based on platform level cmake files
+@@ -241,6 +242,7 @@ target_sources(bl1_main
+         ../Native_Driver/firewall.c
+         ../Native_Driver/uart_pl011_drv.c
+         ../fw_update_agent/fwu_agent.c
++        ../soft_crc/soft_crc.c
+         ../Native_Driver/arm_watchdog_drv.c
+         ../Native_Driver/watchdog.c
+         bl1_boot_hal.c
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index d5491e08db..1a42c72bd5 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -20,6 +20,7 @@
+ #include "tfm_plat_defs.h"
+ #include "uefi_fmp.h"
+ #include "uart_stdout.h"
++#include "soft_crc.h"
+ 
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+@@ -324,6 +325,10 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+         _metadata.img_entry[i].img_props[BANK_1].version = INVALID_VERSION;
+     }
+ 
++    /* Calculate CRC32 for fwu metadata */
++    _metadata.crc_32 = crc32((uint8_t *)&_metadata.version,
++                             sizeof(struct fwu_metadata) - sizeof(uint32_t));
++
+     ret = metadata_write(&_metadata);
+     if (ret) {
+         return ret;
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
new file mode 100644
index 000000000000..49452b8d8564
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
@@ -0,0 +1,99 @@
+From 25924b6c0504faae0b0ed680c09fb8996b6aaba6 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Wed, 21 Dec 2022 15:42:21 +0000
+Subject: [PATCH 5/10] Platform:corstone1000:fwu: metadata_read validate crc
+
+Add validation logic to metadata_read function.
+Also, add metadata_read_without_validation
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  1 +
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 51 +++++++++++++++++++
+ 2 files changed, 52 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index 554fc51b21..9db2864033 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -75,6 +75,7 @@ target_sources(platform_s
+         fw_update_agent/uefi_capsule_parser.c
+         fw_update_agent/fwu_agent.c
+         fw_update_agent/uefi_fmp.c
++        soft_crc/soft_crc.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
+ )
+ 
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 1a42c72bd5..eb17c3a377 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -193,6 +193,53 @@ static enum fwu_agent_error_t private_metadata_write(
+     return FWU_AGENT_SUCCESS;
+ }
+ 
++static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter:\n\r", __func__);
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    uint32_t calculated_crc32 = crc32((uint8_t *)&(p_metadata->version),
++                                      sizeof(struct fwu_metadata) - sizeof(uint32_t));
++
++    if (p_metadata->crc_32 != calculated_crc32) {
++        FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\r", __func__,
++                    calculated_crc32, p_metadata->crc_32);
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success\n\r", __func__);
++
++    return FWU_AGENT_SUCCESS;
++}
++
++static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metadata *p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
++                  p_metadata->active_index, p_metadata->previous_active_index);
++
++    return FWU_AGENT_SUCCESS;
++}
++
+ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
+ {
+     int ret;
+@@ -210,6 +257,10 @@ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
+         return FWU_AGENT_ERROR;
+     }
+ 
++    if (metadata_validate(p_metadata) != FWU_AGENT_SUCCESS) {
++        return FWU_AGENT_ERROR;
++    }
++
+     FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
+                   p_metadata->active_index, p_metadata->previous_active_index);
+ 
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
new file mode 100644
index 000000000000..a7c17abff7cd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
@@ -0,0 +1,125 @@
+From 9545d9bb44f8fb5af438fb40cab7fefc95d5a9a4 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Thu, 22 Dec 2022 09:24:50 +0000
+Subject: [PATCH 6/10] Platform:corstone1000: Add common platform logger
+
+platform_log defines log messages macros to be used by the platform code
+It allows defining the module name to be added at the beginning of the log
+message.
+Based on build type PLAT_LOG_LEVEL is defined.
+In case of Debug/RelWithDebInfo PLAT_LOG_LEVEL is defined to Debug level
+else it is defined to OFF.
+
+usage in source file:
+...
+INFO("msg");
+ERROR("msg");
+WARN("msg");
+VERBOSE("msg");
+DBG("msg");
+...
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  1 +
+ .../ext/target/arm/corstone1000/config.cmake  |  4 +-
+ .../target/arm/corstone1000/platform_log.h    | 60 +++++++++++++++++++
+ 3 files changed, 64 insertions(+), 1 deletion(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/platform_log.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index 9db2864033..a120f39ea4 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -152,6 +152,7 @@ target_compile_definitions(platform_bl2
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+         $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+         $<$<BOOL:${ENABLE_FWU_AGENT_DEBUG_LOGS}>:ENABLE_FWU_AGENT_DEBUG_LOGS>
++        PLAT_LOG_LEVEL=${PLAT_LOG_LEVEL}
+ )
+ 
+ # boot_hal_bl2.c is compiled as part of 'bl2' target and not inside
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platform/ext/target/arm/corstone1000/config.cmake
+index b71ca672f3..de0b4b64c1 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -63,6 +63,8 @@ set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Inte
+ 
+ if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL RelWithDebInfo)
+   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE        CACHE BOOL      "Enable Firmware update agent debug logs.")
+-else()
++  set(PLAT_LOG_LEVEL                    4        CACHE STRING     "Set platform log level.")
++  else()
+   set(ENABLE_FWU_AGENT_DEBUG_LOGS     FALSE        CACHE BOOL     "Enable Firmware update agent debug logs.")
++  set(PLAT_LOG_LEVEL                    0        CACHE STRING     "Set platform log level.")
+ endif()
+diff --git a/platform/ext/target/arm/corstone1000/platform_log.h b/platform/ext/target/arm/corstone1000/platform_log.h
+new file mode 100644
+index 0000000000..b3a6e98026
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/platform_log.h
+@@ -0,0 +1,60 @@
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __PLATFORM_LOG_H__
++#define __PLATFORM_LOG_H__
++
++#define PLAT_LOG_LEVEL_OFF       (0)
++#define PLAT_LOG_LEVEL_ERROR     (1)
++#define PLAT_LOG_LEVEL_WARN      (2)
++#define PLAT_LOG_LEVEL_INFO      (3)
++#define PLAT_LOG_LEVEL_DEBUG     (4)
++
++#ifndef PLAT_LOG_MODULE_NAME
++#define MODULE_NAME_STR " "
++#else
++#define MODULE_NAME_STR "["PLAT_LOG_MODULE_NAME"]: "
++#endif
++
++#ifndef PLAT_LOG_LEVEL
++#warning "Logging level is not defined, default is PLAT_LOG_LEVEL_ERROR."
++#define PLAT_LOG_LEVEL   PLAT_LOG_LEVEL_ERROR
++#endif
++
++
++/* System can override PRINTF with other rich format function*/
++#ifndef PRINTF
++#if PLAT_LOG_LEVEL > PLAT_LOG_LEVEL_OFF
++#include <stdio.h>
++#define PRINTF printf
++#endif
++#endif
++
++#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_ERROR
++    #define ERROR(f_, ...) do { PRINTF("\033[31;4m[ERR]:\033[m%s"f_"\r\n", MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
++#else
++    #define ERROR(f_, ...) do {  } while(0)
++#endif
++#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_WARN
++    #define WARN(f_, ...) do { PRINTF("\033[33;4m[WRN]:\033[m%s"f_"\r\n", MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
++#else
++    #define WARN(f_, ...) do {  } while(0)
++#endif
++#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_INFO
++    #define INFO(f_, ...) do { PRINTF("[INF]:%s"f_"\r\n", MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
++#else
++    #define INFO(f_, ...) do {  } while(0)
++#endif
++#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_DEBUG
++    #define VERBOSE(f_, ...) do { PRINTF("[DBG]:%s" f_"\r\n",MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
++    #define DEBUG(f_, ...) do { PRINTF("[DBG]:%s" f_"\r\n",MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
++#else
++    #define VERBOSE(f_, ...) do {  } while(0)
++    #define DEBUG(f_, ...) do {  } while(0)
++#endif
++
++#endif /* __PLATFORM_LOG_H__ */
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
new file mode 100644
index 000000000000..418c533af0dd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
@@ -0,0 +1,735 @@
+From 1fdc3000f1ab6f9c1bb792cb8baff16a7517c03a Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Thu, 22 Dec 2022 14:27:41 +0000
+Subject: [PATCH 7/10] Platform:corstone1000: Introduce GPT parser
+
+Adding GPT parser
+Side changes required:
+Includes the implementation of the `plat_get_image_source` function
+in the platform.c file.
+
+The GPT parser requires the function. Given the image id, it should
+return handle to the IO device contains the image and image
+specification that allows IO storage access to the image.
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../target/arm/corstone1000/partition/efi.h   |  36 ++
+ .../target/arm/corstone1000/partition/gpt.c   |  58 ++++
+ .../target/arm/corstone1000/partition/gpt.h   |  51 +++
+ .../target/arm/corstone1000/partition/mbr.h   |  29 ++
+ .../arm/corstone1000/partition/partition.c    | 310 ++++++++++++++++++
+ .../arm/corstone1000/partition/partition.h    |  47 +++
+ .../target/arm/corstone1000/partition/uuid.h  |  76 +++++
+ .../ext/target/arm/corstone1000/platform.c    |  20 ++
+ .../ext/target/arm/corstone1000/platform.h    |  14 +
+ 9 files changed, 641 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/efi.h
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/gpt.c
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/gpt.h
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/mbr.h
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/partition.c
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/partition.h
+ create mode 100644 platform/ext/target/arm/corstone1000/partition/uuid.h
+ create mode 100644 platform/ext/target/arm/corstone1000/platform.c
+ create mode 100644 platform/ext/target/arm/corstone1000/platform.h
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/efi.h b/platform/ext/target/arm/corstone1000/partition/efi.h
+new file mode 100644
+index 0000000000..f66daffb32
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/efi.h
+@@ -0,0 +1,36 @@
++/*
++ * Copyright (c) 2021, Linaro Limited
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef DRIVERS_PARTITION_EFI_H
++#define DRIVERS_PARTITION_EFI_H
++
++#include <string.h>
++
++#include "uuid.h"
++
++#define EFI_NAMELEN 36
++
++static inline int guidcmp(const void *g1, const void *g2) {
++    return memcmp(g1, g2, sizeof(struct efi_guid));
++}
++
++static inline void *guidcpy(void *dst, const void *src) {
++    return memcpy(dst, src, sizeof(struct efi_guid));
++}
++
++#define EFI_GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)  \
++    {                                                      \
++        (a) & 0xffffffff, (b)&0xffff, (c)&0xffff, {        \
++            (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) \
++        }                                                  \
++    }
++
++#define NULL_GUID                                                            \
++    EFI_GUID(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
++             0x00, 0x00)
++
++#endif /* DRIVERS_PARTITION_EFI_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/gpt.c b/platform/ext/target/arm/corstone1000/partition/gpt.c
+new file mode 100644
+index 0000000000..8549785e3b
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/gpt.c
+@@ -0,0 +1,58 @@
++/*
++ * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include "gpt.h"
++
++#include <assert.h>
++#include <errno.h>
++#include <string.h>
++
++#include "efi.h"
++
++static int unicode_to_ascii(unsigned short *str_in, unsigned char *str_out) {
++    uint8_t *name;
++    int i;
++
++    assert((str_in != NULL) && (str_out != NULL));
++
++    name = (uint8_t *)str_in;
++
++    assert(name[0] != '\0');
++
++    /* check whether the unicode string is valid */
++    for (i = 1; i < (EFI_NAMELEN << 1); i += 2) {
++        if (name[i] != '\0') return -EINVAL;
++    }
++    /* convert the unicode string to ascii string */
++    for (i = 0; i < (EFI_NAMELEN << 1); i += 2) {
++        str_out[i >> 1] = name[i];
++        if (name[i] == '\0') break;
++    }
++    return 0;
++}
++
++int parse_gpt_entry(gpt_entry_t *gpt_entry, partition_entry_t *entry) {
++    int result;
++
++    assert((gpt_entry != NULL) && (entry != NULL));
++
++    if ((gpt_entry->first_lba == 0) && (gpt_entry->last_lba == 0)) {
++        return -EINVAL;
++    }
++
++    memset(entry, 0, sizeof(partition_entry_t));
++    result = unicode_to_ascii(gpt_entry->name, (uint8_t *)entry->name);
++    if (result != 0) {
++        return result;
++    }
++    entry->start = (uint64_t)gpt_entry->first_lba * PLAT_PARTITION_BLOCK_SIZE;
++    entry->length = (uint64_t)(gpt_entry->last_lba - gpt_entry->first_lba + 1) *
++                    PLAT_PARTITION_BLOCK_SIZE;
++    guidcpy(&entry->part_guid, &gpt_entry->unique_uuid);
++    guidcpy(&entry->type_guid, &gpt_entry->type_uuid);
++
++    return 0;
++}
+diff --git a/platform/ext/target/arm/corstone1000/partition/gpt.h b/platform/ext/target/arm/corstone1000/partition/gpt.h
+new file mode 100644
+index 0000000000..b528fc05c0
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/gpt.h
+@@ -0,0 +1,51 @@
++/*
++ * Copyright (c) 2016, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef GPT_H
++#define GPT_H
++
++#include "efi.h"
++#include "partition.h"
++#include "uuid.h"
++
++#define PARTITION_TYPE_GPT 0xee
++#define GPT_HEADER_OFFSET PLAT_PARTITION_BLOCK_SIZE
++#define GPT_ENTRY_OFFSET (GPT_HEADER_OFFSET + PLAT_PARTITION_BLOCK_SIZE)
++
++#define GPT_SIGNATURE "EFI PART"
++
++typedef struct gpt_entry {
++    struct efi_guid type_uuid;
++    struct efi_guid unique_uuid;
++    unsigned long long first_lba;
++    unsigned long long last_lba;
++    unsigned long long attr;
++    unsigned short name[EFI_NAMELEN];
++} gpt_entry_t;
++
++typedef struct gpt_header {
++    unsigned char signature[8];
++    unsigned int revision;
++    unsigned int size;
++    unsigned int header_crc;
++    unsigned int reserved;
++    unsigned long long current_lba;
++    unsigned long long backup_lba;
++    unsigned long long first_lba;
++    unsigned long long last_lba;
++    struct efi_guid disk_uuid;
++    /* starting LBA of array of partition entries */
++    unsigned long long part_lba;
++    /* number of partition entries in array */
++    unsigned int list_num;
++    /* size of a single partition entry (usually 128) */
++    unsigned int part_size;
++    unsigned int part_crc;
++} gpt_header_t;
++
++int parse_gpt_entry(gpt_entry_t *gpt_entry, partition_entry_t *entry);
++
++#endif /* GPT_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/mbr.h b/platform/ext/target/arm/corstone1000/partition/mbr.h
+new file mode 100644
+index 0000000000..e77f367016
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/mbr.h
+@@ -0,0 +1,29 @@
++/*
++ * Copyright (c) 2016, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef MBR_H
++#define MBR_H
++
++#define MBR_OFFSET 0
++
++#define MBR_PRIMARY_ENTRY_OFFSET 0x1be
++#define MBR_PRIMARY_ENTRY_SIZE 0x10
++#define MBR_PRIMARY_ENTRY_NUMBER 4
++#define MBR_CHS_ADDRESS_LEN 3
++
++#define MBR_SIGNATURE_FIRST 0x55
++#define MBR_SIGNATURE_SECOND 0xAA
++
++typedef struct mbr_entry {
++    unsigned char status;
++    unsigned char first_sector[MBR_CHS_ADDRESS_LEN];
++    unsigned char type;
++    unsigned char last_sector[MBR_CHS_ADDRESS_LEN];
++    unsigned int first_lba;
++    unsigned int sector_nums;
++} mbr_entry_t;
++
++#endif /* MBR_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/partition.c b/platform/ext/target/arm/corstone1000/partition/partition.c
+new file mode 100644
+index 0000000000..afc6aa1c5c
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/partition.c
+@@ -0,0 +1,310 @@
++/*
++ * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include "partition.h"
++
++#include <assert.h>
++#include <errno.h>
++#include <inttypes.h>
++#include <stdio.h>
++#include <string.h>
++
++#include "efi.h"
++#include "gpt.h"
++#include "mbr.h"
++
++#include "io_storage.h"
++#include "platform.h"
++#include "soft_crc.h"
++
++#define PLAT_LOG_MODULE_NAME "partition"
++#include "platform_log.h"
++
++static uint8_t mbr_sector[PLAT_PARTITION_BLOCK_SIZE];
++static partition_entry_list_t list;
++
++#if LOG_LEVEL >= LOG_LEVEL_DEBUG
++static void dump_entries(int num) {
++    char name[EFI_NAMELEN];
++    int i, j, len;
++
++    VERBOSE("Partition table with %d entries:", num);
++    for (i = 0; i < num; i++) {
++        len = snprintf(name, EFI_NAMELEN, "%s", list.list[i].name);
++        for (j = 0; j < EFI_NAMELEN - len - 1; j++) {
++            name[len + j] = ' ';
++        }
++        name[EFI_NAMELEN - 1] = '\0';
++        VERBOSE("%d: %s %x%x %d", i + 1, name,
++                (uint32_t)(list.list[i].start >> 32),
++                (uint32_t)list.list[i].start,
++                (uint32_t)(list.list[i].start + list.list[i].length - 4));
++    }
++}
++#else
++#define dump_entries(num) ((void)num)
++#endif
++
++/*
++ * Load the first sector that carries MBR header.
++ * The MBR boot signature should be always valid whether it's MBR or GPT.
++ */
++static int load_mbr_header(uintptr_t image_handle, mbr_entry_t *mbr_entry) {
++    size_t bytes_read;
++    uintptr_t offset;
++    int result;
++
++    assert(mbr_entry != NULL);
++    /* MBR partition table is in LBA0. */
++    result = io_seek(image_handle, IO_SEEK_SET, MBR_OFFSET);
++    if (result != 0) {
++        WARN("Failed to seek (%i)\n", result);
++        return result;
++    }
++    result = io_read(image_handle, (uintptr_t)&mbr_sector,
++                     PLAT_PARTITION_BLOCK_SIZE, &bytes_read);
++    if (result != 0) {
++        WARN("Failed to read data (%i)\n", result);
++        return result;
++    }
++
++    /* Check MBR boot signature. */
++    if ((mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 2] != MBR_SIGNATURE_FIRST) ||
++        (mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 1] != MBR_SIGNATURE_SECOND)) {
++        ERROR("MBR signature isn't correct");
++        return -ENOENT;
++    }
++    offset = (uintptr_t)&mbr_sector + MBR_PRIMARY_ENTRY_OFFSET;
++    memcpy(mbr_entry, (void *)offset, sizeof(mbr_entry_t));
++    return 0;
++}
++
++/*
++ * Load GPT header and check the GPT signature and header CRC.
++ * If partition numbers could be found, check & update it.
++ */
++static int load_gpt_header(uintptr_t image_handle) {
++    gpt_header_t header;
++    size_t bytes_read;
++    int result;
++    uint32_t header_crc, calc_crc;
++
++    result = io_seek(image_handle, IO_SEEK_SET, GPT_HEADER_OFFSET);
++    if (result != 0) {
++        return result;
++    }
++    result = io_read(image_handle, (uintptr_t)&header, sizeof(gpt_header_t),
++                     &bytes_read);
++    if ((result != 0) || (sizeof(gpt_header_t) != bytes_read)) {
++        return result;
++    }
++    if (memcmp(header.signature, GPT_SIGNATURE, sizeof(header.signature)) !=
++        0) {
++        return -EINVAL;
++    }
++
++    /*
++     * UEFI Spec 2.8 March 2019 Page 119: HeaderCRC32 value is
++     * computed by setting this field to 0, and computing the
++     * 32-bit CRC for HeaderSize bytes.
++     */
++    header_crc = header.header_crc;
++    header.header_crc = 0U;
++
++    calc_crc = crc32((uint8_t *)&header, DEFAULT_GPT_HEADER_SIZE);
++    if (header_crc != calc_crc) {
++        ERROR("Invalid GPT Header CRC: Expected 0x%x but got 0x%x.\n",
++              header_crc, calc_crc);
++        return -EINVAL;
++    }
++
++    header.header_crc = header_crc;
++
++    /* partition numbers can't exceed PLAT_PARTITION_MAX_ENTRIES */
++    list.entry_count = header.list_num;
++    if (list.entry_count > PLAT_PARTITION_MAX_ENTRIES) {
++        list.entry_count = PLAT_PARTITION_MAX_ENTRIES;
++    }
++    return 0;
++}
++
++static int load_mbr_entry(uintptr_t image_handle, mbr_entry_t *mbr_entry,
++                          int part_number) {
++    size_t bytes_read;
++    uintptr_t offset;
++    int result;
++
++    assert(mbr_entry != NULL);
++    /* MBR partition table is in LBA0. */
++    result = io_seek(image_handle, IO_SEEK_SET, MBR_OFFSET);
++    if (result != 0) {
++        WARN("Failed to seek (%i)\n", result);
++        return result;
++    }
++    result = io_read(image_handle, (uintptr_t)&mbr_sector,
++                     PLAT_PARTITION_BLOCK_SIZE, &bytes_read);
++    if (result != 0) {
++        WARN("Failed to read data (%i)\n", result);
++        return result;
++    }
++
++    /* Check MBR boot signature. */
++    if ((mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 2] != MBR_SIGNATURE_FIRST) ||
++        (mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 1] != MBR_SIGNATURE_SECOND)) {
++        return -ENOENT;
++    }
++    offset = (uintptr_t)&mbr_sector + MBR_PRIMARY_ENTRY_OFFSET +
++             MBR_PRIMARY_ENTRY_SIZE * part_number;
++    memcpy(mbr_entry, (void *)offset, sizeof(mbr_entry_t));
++
++    return 0;
++}
++
++static int load_mbr_entries(uintptr_t image_handle) {
++    mbr_entry_t mbr_entry;
++    int i;
++
++    list.entry_count = MBR_PRIMARY_ENTRY_NUMBER;
++
++    for (i = 0; i < list.entry_count; i++) {
++        load_mbr_entry(image_handle, &mbr_entry, i);
++        list.list[i].start = mbr_entry.first_lba * 512;
++        list.list[i].length = mbr_entry.sector_nums * 512;
++        list.list[i].name[0] = mbr_entry.type;
++    }
++
++    return 0;
++}
++
++static int load_gpt_entry(uintptr_t image_handle, gpt_entry_t *entry) {
++    size_t bytes_read;
++    int result;
++
++    assert(entry != NULL);
++    result = io_read(image_handle, (uintptr_t)entry, sizeof(gpt_entry_t),
++                     &bytes_read);
++    if (sizeof(gpt_entry_t) != bytes_read) return -EINVAL;
++    return result;
++}
++
++static int verify_partition_gpt(uintptr_t image_handle) {
++    gpt_entry_t entry;
++    int result, i;
++
++    for (i = 0; i < list.entry_count; i++) {
++        result = load_gpt_entry(image_handle, &entry);
++        assert(result == 0);
++        if (result != 0) {
++            break;
++        }
++        result = parse_gpt_entry(&entry, &list.list[i]);
++        if (result != 0) {
++            break;
++        }
++    }
++    if (i == 0) {
++        return -EINVAL;
++    }
++    /*
++     * Only records the valid partition number that is loaded from
++     * partition table.
++     */
++    list.entry_count = i;
++    dump_entries(list.entry_count);
++
++    return 0;
++}
++
++int load_partition_table(unsigned int image_id) {
++    uintptr_t dev_handle, image_handle, image_spec = 0;
++    mbr_entry_t mbr_entry;
++    int result;
++
++    result = plat_get_image_source(image_id, &dev_handle, &image_spec);
++    if (result != 0) {
++        WARN("Failed to obtain reference to image id=%u (%i)\n", image_id,
++             result);
++        return result;
++    }
++
++    result = io_open(dev_handle, image_spec, &image_handle);
++    if (result != 0) {
++        WARN("Failed to open image id=%u (%i)\n", image_id, result);
++        return result;
++    }
++
++    result = load_mbr_header(image_handle, &mbr_entry);
++    if (result != 0) {
++        ERROR("Loading mbr header failed with image id=%u (%i)\n", image_id,
++              result);
++        return result;
++    }
++    if (mbr_entry.type == PARTITION_TYPE_GPT) {
++        INFO("Loading gpt header");
++        result = load_gpt_header(image_handle);
++        assert(result == 0);
++        if (result != 0) {
++            ERROR("Failed load gpt header! %i", result);
++            goto load_partition_table_exit;
++        }
++        result = io_seek(image_handle, IO_SEEK_SET, GPT_ENTRY_OFFSET);
++        assert(result == 0);
++        if (result != 0) {
++            ERROR("Failed seek gpt header! %i", result);
++            goto load_partition_table_exit;
++        }
++        result = verify_partition_gpt(image_handle);
++        if (result != 0) {
++            ERROR("Failed verify gpt partition %i", result);
++            goto load_partition_table_exit;
++        }
++    } else {
++        result = load_mbr_entries(image_handle);
++    }
++
++load_partition_table_exit:
++    io_close(image_handle);
++    return result;
++}
++
++const partition_entry_t *get_partition_entry(const char *name) {
++    int i;
++
++    for (i = 0; i < list.entry_count; i++) {
++        if (strcmp(name, list.list[i].name) == 0) {
++            return &list.list[i];
++        }
++    }
++    return NULL;
++}
++
++const partition_entry_t *get_partition_entry_by_type(const uuid_t *type_uuid) {
++    int i;
++
++    for (i = 0; i < list.entry_count; i++) {
++        if (guidcmp(type_uuid, &list.list[i].type_guid) == 0) {
++            return &list.list[i];
++        }
++    }
++
++    return NULL;
++}
++
++const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part_uuid) {
++    int i;
++
++    for (i = 0; i < list.entry_count; i++) {
++        if (guidcmp(part_uuid, &list.list[i].part_guid) == 0) {
++            return &list.list[i];
++        }
++    }
++
++    return NULL;
++}
++
++const partition_entry_list_t *get_partition_entry_list(void) { return &list; }
++
++void partition_init(unsigned int image_id) { load_partition_table(image_id); }
+diff --git a/platform/ext/target/arm/corstone1000/partition/partition.h b/platform/ext/target/arm/corstone1000/partition/partition.h
+new file mode 100644
+index 0000000000..54af47aca4
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/partition.h
+@@ -0,0 +1,47 @@
++/*
++ * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PARTITION_H
++#define PARTITION_H
++
++#include <stdint.h>
++
++#include "efi.h"
++#include "uuid.h"
++
++#if !PLAT_PARTITION_MAX_ENTRIES
++#define PLAT_PARTITION_MAX_ENTRIES 16
++#endif /* PLAT_PARTITION_MAX_ENTRIES */
++
++#if !PLAT_PARTITION_BLOCK_SIZE
++#define PLAT_PARTITION_BLOCK_SIZE 512
++#endif /* PLAT_PARTITION_BLOCK_SIZE */
++
++#define LEGACY_PARTITION_BLOCK_SIZE 512
++
++#define DEFAULT_GPT_HEADER_SIZE 92
++
++typedef struct partition_entry {
++    uint64_t start;
++    uint64_t length;
++    char name[EFI_NAMELEN];
++    struct efi_guid part_guid;
++    struct efi_guid type_guid;
++} partition_entry_t;
++
++typedef struct partition_entry_list {
++    partition_entry_t list[PLAT_PARTITION_MAX_ENTRIES];
++    int entry_count;
++} partition_entry_list_t;
++
++int load_partition_table(unsigned int image_id);
++const partition_entry_t *get_partition_entry(const char *name);
++const partition_entry_t *get_partition_entry_by_type(const uuid_t *type_guid);
++const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part_uuid);
++const partition_entry_list_t *get_partition_entry_list(void);
++void partition_init(unsigned int image_id);
++
++#endif /* PARTITION_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/uuid.h b/platform/ext/target/arm/corstone1000/partition/uuid.h
+new file mode 100644
+index 0000000000..06fec5a3c0
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/partition/uuid.h
+@@ -0,0 +1,76 @@
++/*-
++ * Copyright (c) 2002 Marcel Moolenaar
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * $FreeBSD$
++ */
++
++/*
++ * Portions copyright (c) 2014-2020, ARM Limited and Contributors.
++ * All rights reserved.
++ */
++
++#ifndef UUID_H
++#define UUID_H
++
++#include <stdint.h>
++
++/* Length of a node address (an IEEE 802 address). */
++#define _UUID_NODE_LEN 6
++
++/* Length of UUID string including dashes. */
++#define _UUID_STR_LEN 36
++
++/*
++ * See also:
++ *      http://www.opengroup.org/dce/info/draft-leach-uuids-guids-01.txt
++ *      http://www.opengroup.org/onlinepubs/009629399/apdxa.htm
++ *
++ * A DCE 1.1 compatible source representation of UUIDs.
++ */
++struct uuid {
++    uint8_t time_low[4];
++    uint8_t time_mid[2];
++    uint8_t time_hi_and_version[2];
++    uint8_t clock_seq_hi_and_reserved;
++    uint8_t clock_seq_low;
++    uint8_t node[_UUID_NODE_LEN];
++};
++
++struct efi_guid {
++    uint32_t time_low;
++    uint16_t time_mid;
++    uint16_t time_hi_and_version;
++    uint8_t clock_seq_and_node[8];
++};
++
++union uuid_helper_t {
++    struct uuid uuid_struct;
++    struct efi_guid efi_guid;
++};
++
++/* XXX namespace pollution? */
++typedef struct uuid uuid_t;
++
++#endif /* UUID_H */
+diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/ext/target/arm/corstone1000/platform.c
+new file mode 100644
+index 0000000000..908b66b7ac
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/platform.c
+@@ -0,0 +1,20 @@
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "platform.h"
++
++#include <stdint.h>
++
++/* Return an IO device handle and specification which can be used to access
++ * an image. This has to be implemented for the GPT parser. */
++int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
++                              uintptr_t *image_spec) {
++    (void)image_id;
++    *dev_handle = NULL;
++    *image_spec = NULL;
++    return 0;
++}
+diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/ext/target/arm/corstone1000/platform.h
+new file mode 100644
+index 0000000000..250f9cd9f5
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/platform.h
+@@ -0,0 +1,14 @@
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __PLATFORM_H__
++#define __PLATFORM_H__
++
++int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
++                              uintptr_t *image_spec);
++
++#endif /*__PLATFORM_H__*/
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
new file mode 100644
index 000000000000..d9143a0eb6db
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
@@ -0,0 +1,337 @@
+From f70bbd0d8efefcc69916fc0393bc413fb39924af Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Tue, 10 Jan 2023 22:33:26 +0000
+Subject: [PATCH 8/10] Platform: corstone1000: BL1 changes to adapt to new flash
+ layout
+
+The commit prepares BL1 to adapt to new GPT-based flash layout.
+
+BL1 does not incorporate a GPT parser and still uses a static
+configuration to understand the flash.
+
+The flash_layout.h is also modified/marked in a way to start
+the process of its simplification.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../arm/corstone1000/bl1/bl1_boot_hal.c       | 10 +--
+ .../arm/corstone1000/bl1/bl1_flash_map.c      | 17 ++--
+ .../target/arm/corstone1000/bl2_flash_map.c   |  8 +-
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 16 ++--
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  4 +-
+ .../arm/corstone1000/partition/flash_layout.h | 84 +++++++++----------
+ 6 files changed, 66 insertions(+), 73 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+index 9caa26b26c..a5fe0f7da1 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2019-2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -601,12 +601,12 @@ __attribute__((naked)) void boot_clear_bl2_ram_area(void)
+     );
+ }
+ 
+-extern void add_bank_offset_to_image_offset(uint32_t bank_offset);
++extern void set_flash_area_image_offset(uint32_t offset);
+ 
+ int32_t boot_platform_init(void)
+ {
+     int32_t result;
+-    uint32_t bank_offset;
++    uint32_t image_offset;
+ 
+     result = corstone1000_watchdog_init();
+     if (result != ARM_DRIVER_OK) {
+@@ -653,8 +653,8 @@ int32_t boot_platform_init(void)
+         }
+     }
+ 
+-    bl1_get_boot_bank(&bank_offset);
+-    add_bank_offset_to_image_offset(bank_offset);
++    bl1_get_active_bl2_image(&image_offset);
++    set_flash_area_image_offset(image_offset);
+ 
+     return 0;
+ }
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c b/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c
+index c8a1f13319..0e615da254 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2019-2021, 2023 Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -22,23 +22,22 @@ struct flash_area flash_map[] = {
+         .fa_id = FLASH_AREA_8_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+-        .fa_off = FLASH_AREA_8_OFFSET,
++        .fa_off = FLASH_INVALID_OFFSET,
+         .fa_size = FLASH_AREA_8_SIZE,
+     },
++    /* Secondary slot is not supported */
+     {
+-        .fa_id = FLASH_AREA_9_ID,
++        .fa_id = FLASH_INVALID_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+-        .fa_off = FLASH_AREA_9_OFFSET,
+-        .fa_size = FLASH_AREA_9_SIZE,
++        .fa_off = FLASH_INVALID_OFFSET,
++        .fa_size = FLASH_INVALID_SIZE,
+     },
+ };
+ 
+ const int flash_map_entry_num = ARRAY_SIZE(flash_map);
+ 
+-void add_bank_offset_to_image_offset(uint32_t bank_offset)
++void set_flash_area_image_offset(uint32_t offset)
+ {
+-    for (int i = 0; i < flash_map_entry_num; i++) {
+-        flash_map[i].fa_off += bank_offset;
+-    }
++    flash_map[0].fa_off = offset;
+ }
+diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+index 0a6a592d94..f512045a44 100644
+--- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
++++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+@@ -28,15 +28,15 @@ struct flash_area flash_map[] = {
+         .fa_id = FLASH_AREA_0_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+-        .fa_off = FLASH_AREA_0_OFFSET,
+-        .fa_size = FLASH_AREA_0_SIZE,
++        .fa_off = FLASH_INVALID_OFFSET,
++        .fa_size = FLASH_INVALID_SIZE,
+     },
+     {
+         .fa_id = FLASH_AREA_1_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+-        .fa_off = FLASH_AREA_1_OFFSET,
+-        .fa_size = FLASH_AREA_1_SIZE,
++        .fa_off = FLASH_INVALID_OFFSET,
++        .fa_size = FLASH_INVALID_SIZE,
+     },
+ #ifndef TFM_S_REG_TEST
+     {
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index eb17c3a377..e4f9da1ec3 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -154,7 +154,7 @@ static enum fwu_agent_error_t private_metadata_read(
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_AREA_OFFSET, p_metadata,
++    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET, p_metadata,
+                                           sizeof(struct fwu_private_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -178,12 +178,12 @@ static enum fwu_agent_error_t private_metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_AREA_OFFSET);
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET);
+     if (ret != ARM_DRIVER_OK) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_AREA_OFFSET,
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET,
+                                 p_metadata, sizeof(struct fwu_private_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -769,7 +769,7 @@ static enum fwu_agent_error_t fwu_select_previous(
+ 
+ }
+ 
+-void bl1_get_boot_bank(uint32_t *bank_offset)
++void bl1_get_active_bl2_image(uint32_t *offset)
+ {
+     struct fwu_private_metadata priv_metadata;
+     enum fwu_agent_state_t current_state;
+@@ -823,15 +823,15 @@ void bl1_get_boot_bank(uint32_t *bank_offset)
+     }
+ 
+     if (boot_index == BANK_0) {
+-        *bank_offset = BANK_0_PARTITION_OFFSET;
++        *offset = SE_BL2_BANK_0_OFFSET;
+     } else if (boot_index == BANK_1) {
+-        *bank_offset = BANK_1_PARTITION_OFFSET;
++        *offset = SE_BL2_BANK_1_OFFSET;
+     } else {
+         FWU_ASSERT(0);
+     }
+ 
+-    FWU_LOG_MSG("%s: exit: booting from bank = %u, offset = %x\n\r", __func__,
+-                        boot_index, *bank_offset);
++    FWU_LOG_MSG("%s: exit: booting from bank = %u, offset = 0x%x\n\r", __func__,
++                        boot_index, *offset);
+ 
+     return;
+ }
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index 00a08354be..eb8320ed8a 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -44,7 +44,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
+  */
+ enum fwu_agent_error_t corstone1000_fwu_host_ack(void);
+ 
+-void bl1_get_boot_bank(uint32_t *bank_offset);
++void bl1_get_active_bl2_image(uint32_t *bank_offset);
+ void bl2_get_boot_bank(uint32_t *bank_offset);
+ 
+ /* When in trial state, start the timer for host to respond.
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 5970a13c12..347c91acbb 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
++ * Copyright (c) 2017-2023 Arm Limited. All rights reserved.
+  *
+  * Licensed under the Apache License, Version 2.0 (the "License");
+  * you may not use this file except in compliance with the License.
+@@ -98,56 +98,56 @@
+ 
+ #endif
+ 
+-/* Flash layout (32MB) :-
+- *
+- * 1 MB     : FWU_METADATA_PARTITION_SIZE
+- * 15.5 MB  : BANK 1 PARTITION SIZE
+- * 15.5 MB  : BANK 2 PARTITION SIZE
+- *
+- */
+-#define FWU_METADATA_PARTITION_SIZE     (0x100000)   /* 1MB */
+-#define BANK_PARTITION_SIZE             (0xF80000)   /* 15.5 MB */
++/* Static Configurations of the Flash */
++#define SE_BL2_PARTITION_SIZE           (0x18800)    /* 98 KB */
++#define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
++#define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
+ 
+-#define FLASH_BASE_OFFSET               (0x0)
++/* Space in flash to store metadata and uefi variables */
++#define FWU_METADATA_FLASH_DEV          (FLASH_DEV_NAME)
++#define FWU_METADATA_FLASH_SECTOR_SIZE  (FLASH_SECTOR_SIZE)
+ 
+-/* BANK layout (15MB: BANK_PARTITION_SIZE) :-
+- *
+- * 200 KB    : SE_BL2_PARTITION_SIZE + SE_BL2_PARTITION_SIZE
+- * 752 KB    : TFM_PARTITION_SIZE + TFM_PARTITION_SIZE
+- * 2 MB      : FIP_PARTITION_SIZE
+- * 12+ MB    : KERNEL_PARTITION_SIZE
+- *
+- */
+-#define SE_BL2_PARTITION_SIZE           (0x19000)    /* 100 KB */
+-#define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
+-#define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
+-#define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
++#define FWU_METADATA_REPLICA_1_OFFSET   (0x5000)  /* 40th LBA */
++#define FWU_METADATA_REPLICA_2_OFFSET   (FWU_METADATA_REPLICA_1_OFFSET + \
++                                         FWU_METADATA_FLASH_SECTOR_SIZE)
+ 
++#define FWU_PRIVATE_METADATA_REPLICA_1_OFFSET   (FWU_METADATA_REPLICA_2_OFFSET + \
++                                                 FWU_METADATA_FLASH_SECTOR_SIZE)
++#define FWU_PRIVATE_METADATA_REPLICA_2_OFFSET   (FWU_PRIVATE_METADATA_REPLICA_1_OFFSET + \
++                                                 FWU_METADATA_FLASH_SECTOR_SIZE)
+ 
++#define BANK_0_PARTITION_OFFSET         (SE_BL2_BANK_0_OFFSET + \
++                                         SE_BL2_PARTITION_SIZE)
++#define BANK_1_PARTITION_OFFSET         (SE_BL2_BANK_1_OFFSET + \
++                                         SE_BL2_PARTITION_SIZE)
+ 
++/* BL1: mcuboot flashmap configurations */
++#define FLASH_AREA_8_ID                 (1)
++#define FLASH_AREA_8_SIZE               (SE_BL2_PARTITION_SIZE)
+ 
+-/* 1MB: space in flash to store metadata and uefi variables */
+-#define FWU_METADATA_FLASH_DEV          (FLASH_DEV_NAME)
+-#define FWU_METADATA_FLASH_SECTOR_SIZE  (FLASH_SECTOR_SIZE)
++#define FLASH_INVALID_ID                (0xFF)
++#define FLASH_INVALID_OFFSET            (0xFFFFFFFF)
++#define FLASH_INVALID_SIZE              (0xFFFFFFFF)
+ 
+-#define FWU_METADATA_PARTITION_OFFSET   (FLASH_BASE_OFFSET)
+-#define FWU_METADATA_AREA_SIZE          (FWU_METADATA_FLASH_SECTOR_SIZE)
+-#define FWU_METADATA_REPLICA_1_OFFSET   (FLASH_BASE_OFFSET)
+-#define FWU_METADATA_REPLICA_2_OFFSET   (FWU_METADATA_REPLICA_1_OFFSET + \
+-                                         FWU_METADATA_AREA_SIZE)
+-#define FWU_PRIVATE_AREA_SIZE           (FLASH_SECTOR_SIZE)
+-#define FWU_PRIVATE_AREA_OFFSET         (FWU_METADATA_REPLICA_2_OFFSET + \
+-                                         FWU_METADATA_AREA_SIZE)
++#define BL1_FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_8_ID : \
++                                                          255 )
++#define BL1_FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_INVALID_ID : \
++                                                          255 )
++
++#define BL1_FLASH_AREA_IMAGE_SCRATCH        255
+ 
++/* FWU Configurations */
+ #define NR_OF_FW_BANKS                  (2)
+ #define NR_OF_IMAGES_IN_FW_BANK         (4) /* Secure Enclave: BL2 and TF-M \
+                                              * Host: FIP and Kernel image
+                                              */
+ 
+-#define BANK_0_PARTITION_OFFSET         (FWU_METADATA_PARTITION_OFFSET + \
+-                                         FWU_METADATA_PARTITION_SIZE)
+-#define BANK_1_PARTITION_OFFSET         (BANK_0_PARTITION_OFFSET + \
+-                                         BANK_PARTITION_SIZE)
++/****** TODO: START : NEED SIMPLIFICATION BASED ON GPT *******************/
++/* Bank configurations */
++#define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
++#define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
++#define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
++#define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
+ 
+ /************************************************************/
+ /* Bank : Images flash offsets are with respect to the bank */
+@@ -170,13 +170,6 @@
+ #define BL2_IMAGE_OFFSET                (0x0)
+ #define BL2_IMAGE_MAX_SIZE              (SE_BL2_PARTITION_SIZE)
+ 
+-#define BL1_FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_8_ID : \
+-                                                          255 )
+-#define BL1_FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_AREA_9_ID : \
+-                                                          255 )
+-
+-#define BL1_FLASH_AREA_IMAGE_SCRATCH        255
+-
+ /* Image 1: TF-M primary and secondary images */
+ #define FLASH_AREA_0_ID                 (1)
+ #define FLASH_AREA_0_OFFSET             (FLASH_AREA_9_OFFSET + \
+@@ -229,6 +222,7 @@
+ #define FWU_METADATA_IMAGE_3_OFFSET     (KERNEL_PARTITION_OFFSET)
+ #define FWU_METADATA_IMAGE_3_SIZE_LIMIT (KERNEL_PARTITION_SIZE)
+ 
++/****** TODO: END : NEED SIMPLIFICATION BASED ON GPT *******************/
+ 
+ /*******************************/
+ /*** ITS, PS and NV Counters ***/
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
new file mode 100644
index 000000000000..9df98cdaaf8b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
@@ -0,0 +1,411 @@
+From 6f95d99329e178b7dea5cf7affac2c55135bbb85 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Wed, 11 Jan 2023 10:27:04 +0000
+Subject: [PATCH 9/10] Platform:corstone1000: BL2 uses GPT layout
+
+Adabt BL2 to use GPT parser find tfm and fip partitions, and then
+extract info to populate MCUBOOT flashmap.
+
+Side changes required:
+Borrow 2k of BL2 code memory to Data memory (during linking)
+i.e. Increase BL2_DATA_GAP_SIZE and decrease SE_BL2_PARTITION_SIZE
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  5 +-
+ .../target/arm/corstone1000/bl2_flash_map.c   |  7 --
+ .../target/arm/corstone1000/boot_hal_bl2.c    | 86 +++++++++++++-----
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 24 ++---
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  2 +-
+ .../arm/corstone1000/partition/flash_layout.h |  2 +-
+ .../ext/target/arm/corstone1000/platform.c    | 87 ++++++++++++++++++-
+ .../ext/target/arm/corstone1000/platform.h    | 10 +++
+ 8 files changed, 168 insertions(+), 55 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index a120f39ea4..f16c1c40b0 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -130,6 +130,10 @@ target_sources(platform_bl2
+         io/io_block.c
+         io/io_flash.c
+         io/io_storage.c
++        soft_crc/soft_crc.c
++        partition/partition.c
++        partition/gpt.c
++        platform.c
+ )
+ 
+ if (PLATFORM_IS_FVP)
+@@ -174,7 +178,6 @@ target_compile_definitions(bl2
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:CRYPTO_HW_ACCELERATOR>
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING>
+         $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:PLATFORM_PSA_ADAC_SECURE_DEBUG>
+-
+ )
+ target_compile_definitions(bootutil
+     PRIVATE
+diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+index f512045a44..599f80b411 100644
+--- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
++++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+@@ -58,13 +58,6 @@ struct flash_area flash_map[] = {
+ 
+ const int flash_map_entry_num = ARRAY_SIZE(flash_map);
+ 
+-void add_bank_offset_to_image_offset(uint32_t bank_offset)
+-{
+-    for (int i = 0; i < flash_map_entry_num; i++) {
+-        flash_map[i].fa_off += bank_offset;
+-    }
+-}
+-
+ int boot_get_image_exec_ram_info(uint32_t image_id,
+                                  uint32_t *exec_ram_start,
+                                  uint32_t *exec_ram_size)
+diff --git a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c b/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
+index 323d9707fe..52db26beea 100644
+--- a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2019-2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -30,6 +30,14 @@
+ #include "crypto_hw.h"
+ #endif
+ 
++#include "efi.h"
++#include "partition.h"
++#include "platform.h"
++
++static const uint8_t * const tfm_part_names[] = {"tfm_primary", "tfm_secondary"};
++static const uint8_t * const fip_part_names[] = {"FIP_A", "FIP_B"};
++
++
+ /* Flash device name must be specified by target */
+ extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
+ 
+@@ -39,28 +47,62 @@ REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
+ #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
+ extern struct flash_area flash_map[];
+ 
+-int32_t fill_bl2_flash_map_by_parsing_fips(uint32_t bank_offset)
+-{
+-    int result;
++static bool fill_flash_map_with_tfm_data(uint8_t boot_index) {
++
++    if (boot_index >= ARRAY_SIZE(tfm_part_names)) {
++        BOOT_LOG_ERR("%d is an invalid boot_index, 0 <= boot_index < %d",
++                     boot_index, ARRAY_SIZE(tfm_part_names));
++        return false;
++    }
++    partition_entry_t *tfm_entry =
++        get_partition_entry(tfm_part_names[boot_index]);
++    if (tfm_entry == NULL) {
++        BOOT_LOG_ERR("Could not find partition %s", tfm_part_names[boot_index]);
++        return false;
++    }
++    flash_map[0].fa_off = tfm_entry->start;
++    flash_map[0].fa_size = tfm_entry->length;
++    return true;
++}
++
++static bool fill_flash_map_with_fip_data(uint8_t boot_index) {
+     uint32_t tfa_offset = 0;
+-    uint32_t tfa_size = 0;
++    size_t tfa_size = 0;
++    uint32_t fip_offset = 0;
++    size_t fip_size = 0;
++    int result;
++
++    if (boot_index >= ARRAY_SIZE(fip_part_names)) {
++        BOOT_LOG_ERR("%d is an invalid boot_index, 0 <= boot_index < %d",
++                     boot_index, ARRAY_SIZE(fip_part_names));
++        return false;
++    }
++    partition_entry_t *fip_entry =
++        get_partition_entry(fip_part_names[boot_index]);
++    if (fip_entry == NULL) {
++        BOOT_LOG_ERR("Could not find partition %s", fip_part_names[boot_index]);
++        return false;
++    }
++
++    fip_offset = fip_entry->start;
++    fip_size = fip_entry->length;
+ 
+     /* parse directly from flash using XIP mode */
+     /* FIP is large so its not a good idea to load it in memory */
+-    result = parse_fip_and_extract_tfa_info(bank_offset + FLASH_FIP_ADDRESS,
+-                  FLASH_FIP_SIZE,
+-                  &tfa_offset, &tfa_size);
++    result = parse_fip_and_extract_tfa_info(
++        FLASH_BASE_ADDRESS + fip_offset + FIP_SIGNATURE_AREA_SIZE, fip_size,
++        &tfa_offset, &tfa_size);
+     if (result != FIP_PARSER_SUCCESS) {
+         BOOT_LOG_ERR("parse_fip_and_extract_tfa_info failed");
+-        return 1;
++        return false;
+     }
+ 
+-    flash_map[2].fa_off = FLASH_FIP_OFFSET + tfa_offset;
++    flash_map[2].fa_off = fip_offset + FIP_SIGNATURE_AREA_SIZE + tfa_offset;
+     flash_map[2].fa_size = tfa_size;
+     flash_map[3].fa_off = flash_map[2].fa_off + flash_map[2].fa_size;
+     flash_map[3].fa_size = tfa_size;
+ 
+-    return 0;
++    return true;
+ }
+ 
+ #ifdef PLATFORM_PSA_ADAC_SECURE_DEBUG
+@@ -89,26 +131,29 @@ uint8_t secure_debug_rotpk[32];
+ 
+ #endif
+ 
+-extern void add_bank_offset_to_image_offset(uint32_t bank_offset);
+-
+ int32_t boot_platform_init(void)
+ {
+     int32_t result;
++    uint8_t boot_index;
+ 
+     result = corstone1000_watchdog_init();
+     if (result != ARM_DRIVER_OK) {
+         return 1;
+     }
+ 
+-#ifndef TFM_S_REG_TEST
+-    result = fill_bl2_flash_map_by_parsing_fips(BANK_0_PARTITION_OFFSET);
+-    if (result) {
++    result = FLASH_DEV_NAME.Initialize(NULL);
++    if (result != ARM_DRIVER_OK) {
+         return 1;
+     }
+-#endif
+ 
+-    result = FLASH_DEV_NAME.Initialize(NULL);
+-    if (result != ARM_DRIVER_OK) {
++    plat_io_storage_init();
++    partition_init(PLATFORM_GPT_IMAGE);
++
++    boot_index = bl2_get_boot_bank();
++
++    if (!fill_flash_map_with_tfm_data(boot_index)
++    || !fill_flash_map_with_fip_data(boot_index)) {
++        BOOT_LOG_ERR("Filling flash map has failed!");
+         return 1;
+     }
+ 
+@@ -149,9 +194,6 @@ int32_t boot_platform_post_init(void)
+     }
+ #endif
+ 
+-    bl2_get_boot_bank(&bank_offset);
+-    add_bank_offset_to_image_offset(bank_offset);
+-
+     return 0;
+ }
+ 
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index e4f9da1ec3..1052bf9f00 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -836,34 +836,20 @@ void bl1_get_active_bl2_image(uint32_t *offset)
+     return;
+ }
+ 
+-void bl2_get_boot_bank(uint32_t *bank_offset)
++uint8_t bl2_get_boot_bank(void)
+ {
+-    uint32_t boot_index;
++    uint8_t boot_index;
+     struct fwu_private_metadata priv_metadata;
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
++    FWU_LOG_MSG("%s: enter", __func__);
+     if (fwu_metadata_init()) {
+         FWU_ASSERT(0);
+     }
+-
+     if (private_metadata_read(&priv_metadata)) {
+         FWU_ASSERT(0);
+     }
+-
+     boot_index = priv_metadata.boot_index;
+-
+-    if (boot_index == BANK_0) {
+-        *bank_offset = BANK_0_PARTITION_OFFSET;
+-    } else if (boot_index == BANK_1) {
+-        *bank_offset = BANK_1_PARTITION_OFFSET;
+-    } else {
+-        FWU_ASSERT(0);
+-    }
+-
+-    FWU_LOG_MSG("%s: exit: booting from bank = %u, offset = %x\n\r", __func__,
+-                        boot_index, *bank_offset);
+-
+-    return;
++    FWU_LOG_MSG("%s: exit: booting from bank = %u", __func__, boot_index);
++    return boot_index;
+ }
+ 
+ static void disable_host_ack_timer(void)
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index eb8320ed8a..701f205583 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -45,7 +45,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
+ enum fwu_agent_error_t corstone1000_fwu_host_ack(void);
+ 
+ void bl1_get_active_bl2_image(uint32_t *bank_offset);
+-void bl2_get_boot_bank(uint32_t *bank_offset);
++uint8_t bl2_get_boot_bank(void);
+ 
+ /* When in trial state, start the timer for host to respond.
+  * Diable timer when host responds back either by calling
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 347c91acbb..c5cf94a52c 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -32,7 +32,7 @@
+ #define SRAM_BASE                       (0x30000000)
+ #define SRAM_SIZE                       (0x80000)     /* 512 KB */
+ 
+-#define BL2_DATA_GAP_SIZE               (0x09000)     /* 36 KB */
++#define BL2_DATA_GAP_SIZE               (0x09800)  /* 38 KB */
+ 
+ #define BL1_DATA_START                  (SRAM_BASE)
+ #define BL1_DATA_SIZE                   (0x10000)     /* 64 KiB*/
+diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/ext/target/arm/corstone1000/platform.c
+index 908b66b7ac..6add0d7e1b 100644
+--- a/platform/ext/target/arm/corstone1000/platform.c
++++ b/platform/ext/target/arm/corstone1000/platform.c
+@@ -5,16 +5,95 @@
+  *
+  */
+ 
++#include "stdint.h"
++
++#include "Driver_Flash.h"
++#include "flash_layout.h"
++
++#include "io_driver.h"
++#include "io_flash.h"
++#include "io_storage.h"
++
+ #include "platform.h"
+ 
+-#include <stdint.h>
++#define PLAT_LOG_MODULE_NAME    "platform"
++#include "platform_log.h"
++
++typedef struct {
++    uintptr_t dev_handle;
++    uintptr_t image_spec;
++} platform_image_source_t;
++
++extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
++
++static io_dev_connector_t *flash_dev_con;
++static uint8_t local_block_flash[FLASH_SECTOR_SIZE];
++static io_flash_dev_spec_t flash_dev_spec = {
++    .buffer = local_block_flash,
++    .bufferlen = FLASH_SECTOR_SIZE,
++    .base_addr = FLASH_BASE_ADDRESS,
++    .flash_driver = &FLASH_DEV_NAME,
++};
++static io_block_spec_t flash_spec = {
++    .offset = FLASH_BASE_ADDRESS,
++    .length = FLASH_TOTAL_SIZE
++};
++
++static platform_image_source_t platform_image_source[] = {
++    [PLATFORM_GPT_IMAGE] = {
++        .dev_handle = NULL,
++        .image_spec = &flash_spec,
++    }
++};
++
++/* Initialize io storage of the platform */
++int32_t plat_io_storage_init(void)
++{
++    int rc = -1;
++    uintptr_t flash_dev_handle = NULL;
++    uintptr_t flash_handle = NULL;
++
++    rc = register_io_dev_flash((const io_dev_connector_t **) &flash_dev_con);
++    if (rc != 0) {
++        ERROR("Failed to register io flash rc: %d", rc);
++        return rc;
++    }
++
++    rc = io_dev_open(flash_dev_con, (const uintptr_t)&flash_dev_spec, &flash_dev_handle);
++    if (rc != 0) {
++        ERROR("Failed to open io flash dev rc: %d", rc);
++        return rc;
++    }
++
++    VERBOSE("Flash_dev_handle = %p",flash_dev_handle);
++
++    rc = io_open(flash_dev_handle, (const uintptr_t)&flash_spec, &flash_handle);
++    if (rc != 0) {
++        ERROR("Failed to open io flash rc: %d", rc);
++        return rc;
++    }
++
++    VERBOSE("Flash_handle = %p",flash_handle);
++
++    rc = io_close(flash_handle);
++    if (rc != 0) {
++        ERROR("Failed to close io flash rc: %d", rc);
++        return rc;
++    }
++    /* Update the platform image source that uses the flash with dev handles */
++    platform_image_source[PLATFORM_GPT_IMAGE].dev_handle = flash_dev_handle;
++
++    return rc;
++}
+ 
+ /* Return an IO device handle and specification which can be used to access
+  * an image. This has to be implemented for the GPT parser. */
+ int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
+                               uintptr_t *image_spec) {
+-    (void)image_id;
+-    *dev_handle = NULL;
+-    *image_spec = NULL;
++    if (image_id >= PLATFORM_IMAGE_COUNT) {
++        return -1;
++    }
++    *dev_handle = platform_image_source[image_id].dev_handle;
++    *image_spec = platform_image_source[image_id].image_spec;
+     return 0;
+ }
+diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/ext/target/arm/corstone1000/platform.h
+index 250f9cd9f5..894f5e3090 100644
+--- a/platform/ext/target/arm/corstone1000/platform.h
++++ b/platform/ext/target/arm/corstone1000/platform.h
+@@ -8,6 +8,16 @@
+ #ifndef __PLATFORM_H__
+ #define __PLATFORM_H__
+ 
++typedef enum {
++    PLATFORM_GPT_IMAGE = 0,
++    PLATFORM_IMAGE_COUNT,
++}platform_image_id_t;
++
++/* Initialize io storage of the platform */
++int32_t plat_io_storage_init(void);
++
++/* Return an IO device handle and specification which can be used to access
++ * an image. This has to be implemented for the GPT parser. */
+ int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
+                               uintptr_t *image_spec);
+ 
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
new file mode 100644
index 000000000000..c3376e1621aa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
@@ -0,0 +1,103 @@
+From c385b628aa3588aeb6f86f8b98fd3bdb304a296c Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Wed, 11 Jan 2023 12:47:45 +0000
+Subject: [PATCH 10/10] Platform: corstone1000:flash_layout simplification
+
+Complete the simplification of the flash layout.
+The flash layout contains only the static definitions
+that describe the static layout and the boundries of the dynamic
+regions.
+
+The dynamic regions addresses are known by the GPT parser.
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../arm/corstone1000/partition/flash_layout.h | 44 -------------------
+ 1 file changed, 44 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index c5cf94a52c..b01a3621b3 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -142,28 +142,9 @@
+                                              * Host: FIP and Kernel image
+                                              */
+ 
+-/****** TODO: START : NEED SIMPLIFICATION BASED ON GPT *******************/
+ /* Bank configurations */
+ #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
+ #define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
+-#define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
+-#define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
+-
+-/************************************************************/
+-/* Bank : Images flash offsets are with respect to the bank */
+-/************************************************************/
+-
+-/* Image 0: BL2 primary and secondary images */
+-#define FLASH_AREA_8_ID                 (1)
+-#define FLASH_AREA_8_OFFSET             (0) /* starting from 0th offset of the bank */
+-#define FLASH_AREA_8_SIZE               (SE_BL2_PARTITION_SIZE)
+-
+-#define FLASH_AREA_9_ID                 (FLASH_AREA_8_ID + 1)
+-#define FLASH_AREA_9_OFFSET             (FLASH_AREA_8_OFFSET + FLASH_AREA_8_SIZE)
+-#define FLASH_AREA_9_SIZE               (SE_BL2_PARTITION_SIZE)
+-
+-#define FWU_METADATA_IMAGE_0_OFFSET     (FLASH_AREA_8_OFFSET)
+-#define FWU_METADATA_IMAGE_0_SIZE_LIMIT (FLASH_AREA_8_SIZE + FLASH_AREA_9_SIZE)
+ 
+ /* Macros needed to imgtool.py, used when creating BL2 signed image */
+ #define BL2_IMAGE_LOAD_ADDRESS          (SRAM_BASE + TFM_PARTITION_SIZE + BL2_DATA_GAP_SIZE)
+@@ -172,33 +153,16 @@
+ 
+ /* Image 1: TF-M primary and secondary images */
+ #define FLASH_AREA_0_ID                 (1)
+-#define FLASH_AREA_0_OFFSET             (FLASH_AREA_9_OFFSET + \
+-                                         FLASH_AREA_9_SIZE)
+ #define FLASH_AREA_0_SIZE               (TFM_PARTITION_SIZE)
+-
+ #define FLASH_AREA_1_ID                 (FLASH_AREA_0_ID + 1)
+-#define FLASH_AREA_1_OFFSET             (FLASH_AREA_0_OFFSET + FLASH_AREA_0_SIZE)
+ #define FLASH_AREA_1_SIZE               (TFM_PARTITION_SIZE)
+ 
+-#define FWU_METADATA_IMAGE_1_OFFSET     (FLASH_AREA_0_OFFSET)
+-#define FWU_METADATA_IMAGE_1_SIZE_LIMIT (FLASH_AREA_0_SIZE + FLASH_AREA_1_SIZE)
+-
+ /* Image 2: Host FIP */
+ #define FIP_SIGNATURE_AREA_SIZE         (0x1000)      /* 4 KB */
+ 
+-#define FLASH_FIP_OFFSET                (FLASH_AREA_1_OFFSET + \
+-                                         FLASH_AREA_1_SIZE + FIP_SIGNATURE_AREA_SIZE)
+-#define FLASH_FIP_ADDRESS               (FLASH_BASE_ADDRESS + FLASH_FIP_OFFSET)
+-#define FLASH_FIP_SIZE                  (FIP_PARTITION_SIZE)
+-
+ /* Host BL2 (TF-A) primary and secondary image. */
+ #define FLASH_AREA_2_ID                 (FLASH_AREA_1_ID + 1)
+ #define FLASH_AREA_3_ID                 (FLASH_AREA_2_ID + 1)
+-#define FLASH_INVALID_OFFSET            (0xFFFFFFFF)
+-#define FLASH_INVALID_SIZE              (0xFFFFFFFF)
+-
+-#define FWU_METADATA_IMAGE_2_OFFSET     (FLASH_FIP_OFFSET)
+-#define FWU_METADATA_IMAGE_2_SIZE_LIMIT (FLASH_FIP_SIZE)
+ 
+ /* Macros needed to imgtool.py, used when creating TF-M signed image */
+ #define S_IMAGE_LOAD_ADDRESS            (SRAM_BASE)
+@@ -216,14 +180,6 @@
+ 
+ #define FLASH_AREA_IMAGE_SCRATCH        255
+ 
+-/* Image 3: Kernel image */
+-#define KERNEL_PARTITION_OFFSET         (FLASH_FIP_OFFSET + FLASH_FIP_SIZE)
+-
+-#define FWU_METADATA_IMAGE_3_OFFSET     (KERNEL_PARTITION_OFFSET)
+-#define FWU_METADATA_IMAGE_3_SIZE_LIMIT (KERNEL_PARTITION_SIZE)
+-
+-/****** TODO: END : NEED SIMPLIFICATION BASED ON GPT *******************/
+-
+ /*******************************/
+ /*** ITS, PS and NV Counters ***/
+ /*******************************/
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
new file mode 100644
index 000000000000..24150b66ec48
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
@@ -0,0 +1,43 @@
+From 0ee6842d348e206d511ec89a7ff5b29a6f325456 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Sun, 29 Jan 2023 19:01:08 +0000
+Subject: [PATCH] corstone1000: make sure to write fwu metadata to replica 2
+
+u-boot and other, before using fwu metadata validate if
+the copies in both replicas are good. so, make sure
+we write fwu metadata in both replicas.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../arm/corstone1000/fw_update_agent/fwu_agent.c   | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index e1fa297ac923..215902ce71b9 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -238,6 +238,20 @@ static enum fwu_agent_error_t metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+ 
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_metadata));
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_OFFSET);
++    if (ret != ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
+     FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
+                   p_metadata->active_index, p_metadata->previous_active_index);
+     return FWU_AGENT_SUCCESS;
+-- 
+2.39.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index d89aca3778b9..a8e76d016bb6 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -11,9 +11,6 @@ TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE += "-DCC312_LEGACY_DRIVER_API_ENABLED=OFF"
 
-## Setting SPM backend to IPC
-EXTRA_OECMAKE += "-DCONFIG_TFM_SPM_BACKEND=IPC"
-
 # libmetal
 LICENSE += "& BSD-3-Clause"
 LIC_FILES_CHKSUM += "file://../libmetal/LICENSE.md;md5=fe0b8a4beea8f0813b606d15a3df3d3c"
@@ -30,8 +27,18 @@ EXTRA_OECMAKE += "-DLIBOPENAMP_SRC_PATH=${S}/../openamp -DLIBOPENAMP_BIN_PATH=${
 
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
-SRC_URI:append= " \
-    file://0001-Platform-corstone1000-Increase-number-of-assets.patch  \
+SRC_URI:append:corstone1000 = " \
+    file://0001-Platform-corstone1000-Introduce-IO-framework.patch              \
+    file://0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch       \
+    file://0003-Platform-corstone1000-Add-soft-crc32-calculation.patch          \
+    file://0004-Platform-corstone1000-calculate-metadata-crc32.patch            \
+    file://0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch      \
+    file://0006-Platform-corstone1000-Add-common-platform-logger.patch          \
+    file://0007-Platform-corstone1000-Introduce-GPT-parser.patch                \
+    file://0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch      \
+    file://0009-Platform-corstone1000-BL2-uses-GPT-layout.patch                 \
+    file://0010-Platform-corstone1000-flash_layout-simplification.patch         \
+    file://0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch      \
            "
 
 do_install() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch
new file mode 100644
index 000000000000..30baf6826f95
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch
@@ -0,0 +1,595 @@
+From 1d277bc8c275fae8e8cd400344bdacbdce3a6b46 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Tue, 13 Dec 2022 19:47:49 +0000
+Subject: [PATCH 27/43] drivers/nvmxip: introduce NVM XIP block storage
+ emulation
+
+add block storage emulation for NVM XIP flash devices
+
+Some paltforms such as Corstone-1000 need to see NVM XIP raw flash
+as a block storage device with read only capability.
+
+Here NVM flash devices are devices with addressable
+memory (e.g: QSPI NOR flash).
+
+The implementation is generic and can be used by different platforms.
+
+Two drivers are provided as follows.
+
+  nvmxip-blk :
+
+    a generic block driver allowing to read from the XIP flash
+
+  nvmxip_qspi :
+
+    The driver probed with the DT and parent of the nvmxip-blk device.
+    nvmxip_qspi can be reused by other platforms. If the platform
+    has custom settings to apply before using the flash, then the platform
+    can provide its own parent driver belonging to UCLASS_NVMXIP and reuse
+    nvmxip-blk. The custom driver can be implmented like nvmxip_qspi in
+    addition to the platform custom settings.
+
+Platforms can use multiple NVM XIP devices at the same time by defining a
+DT node for each one of them.
+
+For more details please refer to doc/develop/driver-model/nvmxip.rst
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ MAINTAINERS                                |   7 ++
+ doc/develop/driver-model/index.rst         |   1 +
+ doc/develop/driver-model/nvmxip.rst        |  70 ++++++++++++
+ doc/device-tree-bindings/nvmxip/nvmxip.txt |  56 +++++++++
+ drivers/Kconfig                            |   2 +
+ drivers/Makefile                           |   1 +
+ drivers/block/blk-uclass.c                 |   1 +
+ drivers/nvmxip/Kconfig                     |  17 +++
+ drivers/nvmxip/Makefile                    |   7 ++
+ drivers/nvmxip/nvmxip-uclass.c             |  13 +++
+ drivers/nvmxip/nvmxip.c                    | 127 +++++++++++++++++++++
+ drivers/nvmxip/nvmxip.h                    |  46 ++++++++
+ drivers/nvmxip/nvmxip_qspi.c               |  65 +++++++++++
+ include/dm/uclass-id.h                     |   1 +
+ 14 files changed, 414 insertions(+)
+ create mode 100644 doc/develop/driver-model/nvmxip.rst
+ create mode 100644 doc/device-tree-bindings/nvmxip/nvmxip.txt
+ create mode 100644 drivers/nvmxip/Kconfig
+ create mode 100644 drivers/nvmxip/Makefile
+ create mode 100644 drivers/nvmxip/nvmxip-uclass.c
+ create mode 100644 drivers/nvmxip/nvmxip.c
+ create mode 100644 drivers/nvmxip/nvmxip.h
+ create mode 100644 drivers/nvmxip/nvmxip_qspi.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 9feaf0502f5b..ba15dd02d58d 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1204,6 +1204,13 @@ F:	cmd/nvme.c
+ F:	include/nvme.h
+ F:	doc/develop/driver-model/nvme.rst
+ 
++NVMXIP
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++S:	Maintained
++F:	doc/develop/driver-model/nvmxip.rst
++F:	doc/device-tree-bindings/nvmxip/nvmxip.txt
++F:	drivers/nvmxip/
++
+ NVMEM
+ M:	Sean Anderson <seanga2@gmail.com>
+ S:	Maintained
+diff --git a/doc/develop/driver-model/index.rst b/doc/develop/driver-model/index.rst
+index 7366ef818c5a..8e12bbd9366a 100644
+--- a/doc/develop/driver-model/index.rst
++++ b/doc/develop/driver-model/index.rst
+@@ -20,6 +20,7 @@ subsystems
+    livetree
+    migration
+    nvme
++   nvmxip
+    of-plat
+    pci-info
+    pmic-framework
+diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-model/nvmxip.rst
+new file mode 100644
+index 000000000000..91b24e4e50d2
+--- /dev/null
++++ b/doc/develop/driver-model/nvmxip.rst
+@@ -0,0 +1,70 @@
++.. SPDX-License-Identifier: GPL-2.0+
++
++NVM XIP Block Storage Emulation Driver
++=======================================
++
++Summary
++-------
++
++Non-Volatile Memory devices with addressable memory (e.g: QSPI NOR flash) could
++be used for block storage needs (e.g: parsing a GPT layout in a raw QSPI NOR flash).
++
++The NVMXIP class provides this functionality and can be used for any 64-bit platform.
++
++The NVMXIP class provides the following drivers:
++
++      nvmxip-blk :
++
++        A generic block driver allowing to read from the XIP flash.
++	The driver belongs to UCLASS_BLK.
++	The driver implemented by drivers/nvmxip/nvmxip.c
++
++      nvmxip_qspi :
++
++        The driver probed with the DT and parent of the nvmxip-blk device.
++        nvmxip_qspi can be reused by other platforms. If the platform
++        has custom settings to apply before using the flash, then the platform
++        can provide its own parent driver belonging to UCLASS_NVMXIP and reuse
++        nvmxip-blk. The custom driver can be implmented like nvmxip_qspi in
++        addition to the platform custom settings.
++	The nvmxip_qspi driver belongs to UCLASS_NVMXIP.
++	The driver implemented by drivers/nvmxip/nvmxip_qspi.c
++
++    The implementation is generic and can be used by different platforms.
++
++Supported hardware
++--------------------------------
++
++Any 64-bit plaform.
++
++Configuration
++----------------------
++
++config NVMXIP
++	  This option allows the emulation of a block storage device
++	  on top of a direct access non volatile memory XIP flash devices.
++	  This support provides the read operation.
++	  This option provides the block storage driver nvmxip-blk which
++	  handles the read operation. This driver is HW agnostic and can support
++	  multiple flash devices at the same time.
++
++config NVMXIP_QSPI
++	  This option allows the emulation of a block storage device on top of a QSPI XIP flash.
++	  Any platform that needs to emulate one or multiple XIP flash devices can turn this
++	  option on to enable the functionality. NVMXIP config is selected automatically.
++	  Platforms that need to add custom treatments before accessing to the flash, can
++	  write their own driver (same as nvmxip_qspi in addition to the custom settings).
++
++Device Tree nodes
++--------------------
++
++Multiple XIP flash devices can be used at the same time by describing them through DT
++nodes.
++
++Please refer to the documentation of the DT binding at:
++
++doc/device-tree-bindings/nvmxip/nvmxip.txt
++
++Contributors
++------------
++   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+diff --git a/doc/device-tree-bindings/nvmxip/nvmxip.txt b/doc/device-tree-bindings/nvmxip/nvmxip.txt
+new file mode 100644
+index 000000000000..7c4b03f66b57
+--- /dev/null
++++ b/doc/device-tree-bindings/nvmxip/nvmxip.txt
+@@ -0,0 +1,56 @@
++Specifying NVMXIP information for devices
++======================================
++
++NVM XIP flash device nodes
++---------------------------
++
++Each flash device should have its own node.
++
++Each node must specify the following fields:
++
++1)
++		compatible = "nvmxip,qspi";
++
++This allows to bind the flash device with the nvmxip_qspi driver
++If a platform has its own driver, please provide your own compatible
++string.
++
++2)
++		reg = <0x0 0x08000000 0x0 0x00200000>;
++
++The start address and size of the flash device. The values give here are an
++example (when the cell size is 2).
++
++When cell size is 1, the reg field looks like this:
++
++		reg = <0x08000000 0x00200000>;
++
++3)
++
++		lba_shift = <9>;
++
++The number of bit shifts used to calculate the size in bytes of one block.
++In this example the block size is 1 << 9 = 2 ^ 9 = 512 bytes
++
++4)
++
++		lba = <4096>;
++
++The number of blocks.
++
++Example of multiple flash devices
++----------------------------------------------------
++
++	nvmxip-qspi1@08000000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x0 0x08000000 0x0 0x00200000>;
++		lba_shift = <9>;
++		lba = <4096>;
++	};
++
++	nvmxip-qspi2@08200000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x0 0x08200000 0x0 0x00100000>;
++		lba_shift = <9>;
++		lba = <2048>;
++	};
+diff --git a/drivers/Kconfig b/drivers/Kconfig
+index e51f0547c3da..d425ff1e76c7 100644
+--- a/drivers/Kconfig
++++ b/drivers/Kconfig
+@@ -78,6 +78,8 @@ source "drivers/net/Kconfig"
+ 
+ source "drivers/nvme/Kconfig"
+ 
++source "drivers/nvmxip/Kconfig"
++
+ source "drivers/pci/Kconfig"
+ 
+ source "drivers/pci_endpoint/Kconfig"
+diff --git a/drivers/Makefile b/drivers/Makefile
+index f0a7530295c5..fb1b62cbd6ff 100644
+--- a/drivers/Makefile
++++ b/drivers/Makefile
+@@ -89,6 +89,7 @@ obj-$(CONFIG_FWU_MDATA) += fwu-mdata/
+ obj-y += misc/
+ obj-$(CONFIG_MMC) += mmc/
+ obj-$(CONFIG_NVME) += nvme/
++obj-$(CONFIG_NVMXIP) += nvmxip/
+ obj-$(CONFIG_PCI_ENDPOINT) += pci_endpoint/
+ obj-y += dfu/
+ obj-$(CONFIG_PCH) += pch/
+diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
+index c69fc4d51829..e8ab576c3253 100644
+--- a/drivers/block/blk-uclass.c
++++ b/drivers/block/blk-uclass.c
+@@ -28,6 +28,7 @@ static struct {
+ 	{ UCLASS_AHCI, "sata" },
+ 	{ UCLASS_HOST, "host" },
+ 	{ UCLASS_NVME, "nvme" },
++	{ UCLASS_NVMXIP, "nvmxip" },
+ 	{ UCLASS_EFI_MEDIA, "efi" },
+ 	{ UCLASS_EFI_LOADER, "efiloader" },
+ 	{ UCLASS_VIRTIO, "virtio" },
+diff --git a/drivers/nvmxip/Kconfig b/drivers/nvmxip/Kconfig
+new file mode 100644
+index 000000000000..6a23acaf1895
+--- /dev/null
++++ b/drivers/nvmxip/Kconfig
+@@ -0,0 +1,17 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# Copyright (C) 2022, Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++
++config NVMXIP
++	bool "NVM XIP devices support"
++	select BLK
++	help
++	  This option allows the emulation of a block storage device
++	  on top of a direct access non volatile memory XIP flash devices.
++	  This support provides the read operation.
++
++config NVMXIP_QSPI
++	bool "QSPI XIP  support"
++	select NVMXIP
++	help
++	  This option allows the emulation of a block storage device on top of a QSPI XIP flash
+diff --git a/drivers/nvmxip/Makefile b/drivers/nvmxip/Makefile
+new file mode 100644
+index 000000000000..d8ad2a160b47
+--- /dev/null
++++ b/drivers/nvmxip/Makefile
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2022
++# Abdellatif El Khlifi, Arm Limited, abdellatif.elkhlifi@arm.com.
++
++obj-y += nvmxip-uclass.o nvmxip.o
++obj-$(CONFIG_NVMXIP_QSPI) += nvmxip_qspi.o
+diff --git a/drivers/nvmxip/nvmxip-uclass.c b/drivers/nvmxip/nvmxip-uclass.c
+new file mode 100644
+index 000000000000..0f7e47b8af86
+--- /dev/null
++++ b/drivers/nvmxip/nvmxip-uclass.c
+@@ -0,0 +1,13 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++
++UCLASS_DRIVER(nvmxip) = {
++	.name	= "nvmxip",
++	.id	= UCLASS_NVMXIP,
++};
+diff --git a/drivers/nvmxip/nvmxip.c b/drivers/nvmxip/nvmxip.c
+new file mode 100644
+index 000000000000..6ba48183c575
+--- /dev/null
++++ b/drivers/nvmxip/nvmxip.c
+@@ -0,0 +1,127 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/device-internal.h>
++#include "nvmxip.h"
++
++static u32 nvmxip_bdev_max_devs;
++
++static int nvmxip_mmio_rawread(const phys_addr_t address, u64 *value)
++{
++	*value = readq(address);
++	return 0;
++}
++
++static ulong nvmxip_blk_read(struct udevice *udev, lbaint_t blknr, lbaint_t blkcnt, void *buffer)
++{
++	struct nvmxip_blk_priv *bpriv_data = dev_get_priv(udev);
++	struct blk_desc *desc = dev_get_uclass_plat(udev);
++
++	/* size of 1 block */
++	/* number of the u64 words to read */
++	u32 qwords = (blkcnt * desc->blksz) / sizeof(u64);
++	/* physical address of the first block to read */
++	phys_addr_t blkaddr = bpriv_data->pplat_data->phys_base + blknr * desc->blksz;
++	u64 *virt_blkaddr;
++	u64 *pdst = buffer;
++	u32 qdata_idx;
++
++	if (!pdst)
++		return -EINVAL;
++
++	pr_debug("[%s]: reading from blknr: %lu , blkcnt: %lu\n", udev->name, blknr, blkcnt);
++
++	virt_blkaddr = map_sysmem(blkaddr, 0);
++
++	/* assumption: the data is virtually contiguous */
++
++	for (qdata_idx = 0 ; qdata_idx < qwords ; qdata_idx++)
++		nvmxip_mmio_rawread((phys_addr_t)(virt_blkaddr + qdata_idx), pdst++);
++
++	pr_debug("[%s]:     src[0]: 0x%llx , dst[0]: 0x%llx , src[-1]: 0x%llx , dst[-1]: 0x%llx\n",
++		 udev->name,
++		 *virt_blkaddr,
++		 *(u64 *)buffer,
++		 *(u64 *)((u8 *)virt_blkaddr + desc->blksz * blkcnt - sizeof(u64)),
++		 *(u64 *)((u8 *)buffer + desc->blksz * blkcnt - sizeof(u64)));
++
++	unmap_sysmem(virt_blkaddr);
++
++	return blkcnt;
++}
++
++static int nvmxip_blk_probe(struct udevice *udev)
++{
++	struct nvmxip_priv *ppriv_data = dev_get_priv(udev->parent);
++	struct blk_desc *desc = dev_get_uclass_plat(udev);
++	struct nvmxip_blk_priv *bpriv_data = dev_get_priv(udev);
++
++	bpriv_data->bdev = udev;
++	bpriv_data->pplat_data = ppriv_data->plat_data;
++	desc->lba = bpriv_data->pplat_data->lba;
++	desc->log2blksz = bpriv_data->pplat_data->lba_shift;
++	desc->blksz = 1 << bpriv_data->pplat_data->lba_shift;
++	desc->bdev = bpriv_data->bdev;
++
++	pr_debug("[%s]: block storage layout\n    lbas: %lu , log2blksz: %d, blksz: %lu\n",
++		 udev->name, desc->lba, desc->log2blksz, desc->blksz);
++
++	return 0;
++}
++
++int nvmxip_init(struct udevice *udev)
++{
++	struct nvmxip_plat *plat_data = dev_get_plat(udev);
++	struct nvmxip_priv *priv_data = dev_get_priv(udev);
++	int ret;
++	struct udevice *bdev = NULL;
++	char bdev_name[NVMXIP_BLKDEV_NAME_SZ + 1] = {0};
++
++	priv_data->udev = udev;
++	priv_data->plat_data = plat_data;
++
++	nvmxip_bdev_max_devs++;
++
++	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "nvmxip-blk#%d", nvmxip_bdev_max_devs);
++
++	ret = blk_create_devicef(udev, NVMXIP_BLKDRV_NAME, bdev_name, UCLASS_NVMXIP,
++				 nvmxip_bdev_max_devs, NVMXIP_DEFAULT_LBA_SZ,
++				 NVMXIP_DEFAULT_LBA_COUNT, &bdev);
++	if (ret) {
++		pr_err("[%s]: failure during creation of the block device %s, error %d\n",
++		       udev->name, bdev_name, ret);
++		goto blkdev_setup_error;
++	}
++
++	ret = blk_probe_or_unbind(bdev);
++	if (ret) {
++		pr_err("[%s]: failure during probing the block device %s, error %d\n",
++		       udev->name, bdev_name, ret);
++		goto blkdev_setup_error;
++	}
++
++	pr_info("[%s]: the block device %s ready for use\n", udev->name, bdev_name);
++
++	return 0;
++
++blkdev_setup_error:
++	nvmxip_bdev_max_devs--;
++	return ret;
++}
++
++static const struct blk_ops nvmxip_blk_ops = {
++	.read	= nvmxip_blk_read,
++};
++
++U_BOOT_DRIVER(nvmxip_blk) = {
++	.name	= NVMXIP_BLKDRV_NAME,
++	.id	= UCLASS_BLK,
++	.probe	= nvmxip_blk_probe,
++	.ops	= &nvmxip_blk_ops,
++	.priv_auto	= sizeof(struct nvmxip_blk_priv),
++};
+diff --git a/drivers/nvmxip/nvmxip.h b/drivers/nvmxip/nvmxip.h
+new file mode 100644
+index 000000000000..393172cc2f86
+--- /dev/null
++++ b/drivers/nvmxip/nvmxip.h
+@@ -0,0 +1,46 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __DRIVER_NVMXIP_H__
++#define __DRIVER_NVMXIP_H__
++
++#include <asm/io.h>
++#include <blk.h>
++#include <linux/bitops.h>
++#include <linux/compat.h>
++#include <mapmem.h>
++
++#define NVMXIP_BLKDRV_NAME    "nvmxip-blk"
++
++#define NVMXIP_BLKDEV_NAME_SZ 20
++
++#define NVMXIP_DEFAULT_LBA_SHIFT 10 /* 1024 bytes per block */
++#define NVMXIP_DEFAULT_LBA_COUNT 1024 /* block count */
++
++#define NVMXIP_DEFAULT_LBA_SZ BIT(NVMXIP_DEFAULT_LBA_SHIFT)
++
++/* NVM XIP device platform data */
++struct nvmxip_plat {
++	phys_addr_t phys_base; /* NVM XIP device base address */
++	u32 lba_shift; /* block size shift count (read from device tree) */
++	lbaint_t lba; /* number of blocks (read from device tree) */
++};
++
++/* NVM XIP device private data */
++struct nvmxip_priv {
++	struct udevice *udev;
++	struct nvmxip_plat *plat_data;
++};
++
++/* Private data of the block device associated with the NVM XIP device (the parent) */
++struct nvmxip_blk_priv {
++	struct udevice *bdev;
++	struct nvmxip_plat *pplat_data; /* parent device platform data */
++};
++
++int nvmxip_init(struct udevice *udev);
++
++#endif /* __DRIVER_NVMXIP_H__ */
+diff --git a/drivers/nvmxip/nvmxip_qspi.c b/drivers/nvmxip/nvmxip_qspi.c
+new file mode 100644
+index 000000000000..749625134acd
+--- /dev/null
++++ b/drivers/nvmxip/nvmxip_qspi.c
+@@ -0,0 +1,65 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <fdt_support.h>
++#include "nvmxip.h"
++
++#include <asm/global_data.h>
++DECLARE_GLOBAL_DATA_PTR;
++
++#define NVMXIP_QSPI_DRV_NAME "nvmxip_qspi"
++
++static int nvmxip_qspi_probe(struct udevice *dev)
++{
++	pr_debug("[%s][%s]\n", __func__, dev->name);
++	return nvmxip_init(dev);
++}
++
++static int nvmxip_qspi_of_to_plat(struct udevice *dev)
++{
++	struct nvmxip_plat *plat_data = dev_get_plat(dev);
++	int ret;
++
++	plat_data->phys_base = (phys_addr_t)dev_read_addr(dev);
++	if (plat_data->phys_base == FDT_ADDR_T_NONE) {
++		pr_err("[%s]: can not get base address from device tree\n", dev->name);
++		return -EINVAL;
++	}
++
++	ret = dev_read_u32(dev, "lba_shift", &plat_data->lba_shift);
++	if (ret) {
++		pr_err("[%s]: can not get lba_shift from device tree\n", dev->name);
++		return -EINVAL;
++	}
++
++	ret = dev_read_u32(dev, "lba", (u32 *)&plat_data->lba);
++	if (ret) {
++		pr_err("[%s]: can not get lba from device tree\n", dev->name);
++		return -EINVAL;
++	}
++
++	pr_debug("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: %lu\n",
++		 dev->name, plat_data->phys_base, plat_data->lba_shift, plat_data->lba);
++
++	return 0;
++}
++
++static const struct udevice_id nvmxip_qspi_ids[] = {
++	{ .compatible = "nvmxip,qspi" },
++	{ /* sentinel */ }
++};
++
++U_BOOT_DRIVER(nvmxip_qspi) = {
++	.name = NVMXIP_QSPI_DRV_NAME,
++	.id = UCLASS_NVMXIP,
++	.of_match = nvmxip_qspi_ids,
++	.of_to_plat = nvmxip_qspi_of_to_plat,
++	.priv_auto = sizeof(struct nvmxip_priv),
++	.plat_auto = sizeof(struct nvmxip_plat),
++	.probe = nvmxip_qspi_probe,
++};
+diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
+index fa08a66ac8e0..f3564a49d912 100644
+--- a/include/dm/uclass-id.h
++++ b/include/dm/uclass-id.h
+@@ -92,6 +92,7 @@ enum uclass_id {
+ 	UCLASS_NOP,		/* No-op devices */
+ 	UCLASS_NORTHBRIDGE,	/* Intel Northbridge / SDRAM controller */
+ 	UCLASS_NVME,		/* NVM Express device */
++	UCLASS_NVMXIP,		/* NVM XIP devices */
+ 	UCLASS_P2SB,		/* (x86) Primary-to-Sideband Bus */
+ 	UCLASS_PANEL,		/* Display panel, such as an LCD */
+ 	UCLASS_PANEL_BACKLIGHT,	/* Backlight controller for panel */
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-sandbox64-fix-return-unsigned-long-in-readq.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-sandbox64-fix-return-unsigned-long-in-readq.patch
new file mode 100644
index 000000000000..b0e83667da44
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-sandbox64-fix-return-unsigned-long-in-readq.patch
@@ -0,0 +1,46 @@
+From 3262ee6a5300221969e61eff7a8f18336a135a73 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 16 Dec 2022 17:20:58 +0000
+Subject: [PATCH 28/43] sandbox64: fix: return unsigned long in readq()
+
+make readq return unsigned long
+
+readq should return 64-bit data
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/sandbox/cpu/cpu.c        | 2 +-
+ arch/sandbox/include/asm/io.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/sandbox/cpu/cpu.c b/arch/sandbox/cpu/cpu.c
+index 636d3545b954..248d17a85c82 100644
+--- a/arch/sandbox/cpu/cpu.c
++++ b/arch/sandbox/cpu/cpu.c
+@@ -230,7 +230,7 @@ phys_addr_t map_to_sysmem(const void *ptr)
+ 	return mentry->tag;
+ }
+ 
+-unsigned int sandbox_read(const void *addr, enum sandboxio_size_t size)
++unsigned long sandbox_read(const void *addr, enum sandboxio_size_t size)
+ {
+ 	struct sandbox_state *state = state_get_current();
+ 
+diff --git a/arch/sandbox/include/asm/io.h b/arch/sandbox/include/asm/io.h
+index ad6c29a4e26c..31ab7289b4bd 100644
+--- a/arch/sandbox/include/asm/io.h
++++ b/arch/sandbox/include/asm/io.h
+@@ -45,7 +45,7 @@ static inline void unmap_sysmem(const void *vaddr)
+ /* Map from a pointer to our RAM buffer */
+ phys_addr_t map_to_sysmem(const void *ptr);
+ 
+-unsigned int sandbox_read(const void *addr, enum sandboxio_size_t size);
++unsigned long sandbox_read(const void *addr, enum sandboxio_size_t size);
+ void sandbox_write(void *addr, unsigned int val, enum sandboxio_size_t size);
+ 
+ #define readb(addr) sandbox_read((const void *)addr, SB_SIZE_8)
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-add-support-for-NVMXIP-QSPI.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-add-support-for-NVMXIP-QSPI.patch
new file mode 100644
index 000000000000..d6168b998eaa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-add-support-for-NVMXIP-QSPI.patch
@@ -0,0 +1,113 @@
+From 2b0606f603de13524ce9b63578f4c3358c3ac6df Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 22 Dec 2022 12:15:42 +0000
+Subject: [PATCH 29/43] sandbox64: add support for NVMXIP QSPI
+
+enable NVMXIP QSPI for sandbox 64-bit
+
+Adding two NVM XIP QSPI storage devices.
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/sandbox/dts/sandbox64.dts | 13 +++++++++++++
+ arch/sandbox/dts/test.dts      | 14 ++++++++++++++
+ configs/sandbox_defconfig      |  1 +
+ drivers/nvmxip/nvmxip.c        |  4 ++++
+ drivers/nvmxip/nvmxip.h        |  3 +++
+ 5 files changed, 35 insertions(+)
+
+diff --git a/arch/sandbox/dts/sandbox64.dts b/arch/sandbox/dts/sandbox64.dts
+index a9cd7908f83e..aed3801af8a9 100644
+--- a/arch/sandbox/dts/sandbox64.dts
++++ b/arch/sandbox/dts/sandbox64.dts
+@@ -89,6 +89,19 @@
+ 		cs-gpios = <0>, <&gpio_a 0>;
+ 	};
+ 
++	nvmxip-qspi1@08000000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x0 0x08000000 0x0 0x00200000>;
++		lba_shift = <9>;
++		lba = <4096>;
++	};
++
++	nvmxip-qspi2@08200000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x0 0x08200000 0x0 0x00100000>;
++		lba_shift = <9>;
++		lba = <2048>;
++	};
+ };
+ 
+ #include "sandbox.dtsi"
+diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
+index 2e580f980fc6..54f2b308e793 100644
+--- a/arch/sandbox/dts/test.dts
++++ b/arch/sandbox/dts/test.dts
+@@ -1756,6 +1756,20 @@
+ 		compatible = "u-boot,fwu-mdata-gpt";
+ 		fwu-mdata-store = <&mmc0>;
+ 	};
++
++	nvmxip-qspi1@08000000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x08000000 0x00200000>;
++		lba_shift = <9>;
++		lba = <4096>;
++	};
++
++	nvmxip-qspi2@08200000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x08200000 0x00100000>;
++		lba_shift = <9>;
++		lba = <2048>;
++	};
+ };
+ 
+ #include "sandbox_pmic.dtsi"
+diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
+index e6ea96a6b924..f22230b5cce2 100644
+--- a/configs/sandbox_defconfig
++++ b/configs/sandbox_defconfig
+@@ -138,6 +138,7 @@ CONFIG_NETCONSOLE=y
+ CONFIG_IP_DEFRAG=y
+ CONFIG_BOOTP_SERVERIP=y
+ CONFIG_IPV6=y
++CONFIG_NVMXIP_QSPI=y
+ CONFIG_DM_DMA=y
+ CONFIG_DEVRES=y
+ CONFIG_DEBUG_DEVRES=y
+diff --git a/drivers/nvmxip/nvmxip.c b/drivers/nvmxip/nvmxip.c
+index 6ba48183c575..af9c9a3b7270 100644
+--- a/drivers/nvmxip/nvmxip.c
++++ b/drivers/nvmxip/nvmxip.c
+@@ -85,6 +85,10 @@ int nvmxip_init(struct udevice *udev)
+ 	priv_data->udev = udev;
+ 	priv_data->plat_data = plat_data;
+ 
++#if CONFIG_IS_ENABLED(SANDBOX64)
++	sandbox_set_enable_memio(true);
++#endif
++
+ 	nvmxip_bdev_max_devs++;
+ 
+ 	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "nvmxip-blk#%d", nvmxip_bdev_max_devs);
+diff --git a/drivers/nvmxip/nvmxip.h b/drivers/nvmxip/nvmxip.h
+index 393172cc2f86..0384ce2e2b47 100644
+--- a/drivers/nvmxip/nvmxip.h
++++ b/drivers/nvmxip/nvmxip.h
+@@ -8,6 +8,9 @@
+ #define __DRIVER_NVMXIP_H__
+ 
+ #include <asm/io.h>
++#if CONFIG_IS_ENABLED(SANDBOX64)
++#include <asm/test.h>
++#endif
+ #include <blk.h>
+ #include <linux/bitops.h>
+ #include <linux/compat.h>
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch
new file mode 100644
index 000000000000..21ad2109cc0a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch
@@ -0,0 +1,35 @@
+From 3f72e390fc8e1a0d774d80c3ccd21be38c9af1db Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 19 Dec 2022 13:20:19 +0000
+Subject: [PATCH 30/43] corstone1000: add NVM XIP QSPI device tree node
+
+add QSPI flash device node for block storage access
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/dts/corstone1000.dtsi | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+index 61e0c33247ce..faf4e12bab2a 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -38,6 +38,13 @@
+ 		reg = <0x88200000 0x77e00000>;
+ 	};
+ 
++	nvmxip-qspi@08000000 {
++		compatible = "nvmxip,qspi";
++		reg = <0x08000000 0x2000000>;
++		lba_shift = <9>;
++		lba = <65536>;
++	};
++
+ 	gic: interrupt-controller@1c000000 {
+ 		compatible = "arm,gic-400";
+ 		#interrupt-cells = <3>;
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch
new file mode 100644
index 000000000000..64bf97d1f37f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch
@@ -0,0 +1,29 @@
+From 0c3d61d499039ff0828376bb21b4fb1de071b8d2 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 19 Dec 2022 13:25:23 +0000
+Subject: [PATCH 31/43] corstone1000: enable NVM XIP QSPI flash
+
+add the QSPI flash device with block storage capability
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ configs/corstone1000_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 1179bf5f3bfd..2986cc95932f 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -58,6 +58,7 @@ CONFIG_DM_SERIAL=y
+ CONFIG_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_ERRNO_STR=y
++CONFIG_NVMXIP_QSPI=y
+ CONFIG_EFI_MM_COMM_TEE=y
+ CONFIG_ARM_FFA_TRANSPORT=y
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch
new file mode 100644
index 000000000000..5724283494bc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch
@@ -0,0 +1,174 @@
+From 3be91bde755c376a38c3affb9640b39df1acdd9c Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 22 Dec 2022 11:30:16 +0000
+Subject: [PATCH 32/43] sandbox64: add a test case for UCLASS_NVMXIP
+
+provide a test for NVM XIP devices
+
+The test case allows to make sure of the following:
+
+- The NVM XIP QSPI devices are probed
+- The DT entries are read correctly
+- the data read from the flash by the NVMXIP block driver is correct
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ MAINTAINERS      |   1 +
+ test/dm/Makefile |   4 ++
+ test/dm/nvmxip.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 120 insertions(+)
+ create mode 100644 test/dm/nvmxip.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index ba15dd02d58d..82cb6075cb32 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1210,6 +1210,7 @@ S:	Maintained
+ F:	doc/develop/driver-model/nvmxip.rst
+ F:	doc/device-tree-bindings/nvmxip/nvmxip.txt
+ F:	drivers/nvmxip/
++F:	test/dm/nvmxip.c
+ 
+ NVMEM
+ M:	Sean Anderson <seanga2@gmail.com>
+diff --git a/test/dm/Makefile b/test/dm/Makefile
+index 85e99e1c120e..bc8214da2da2 100644
+--- a/test/dm/Makefile
++++ b/test/dm/Makefile
+@@ -18,6 +18,10 @@ obj-$(CONFIG_UT_DM) += test-uclass.o
+ obj-$(CONFIG_UT_DM) += core.o
+ obj-$(CONFIG_UT_DM) += read.o
+ obj-$(CONFIG_UT_DM) += phys2bus.o
++ifeq ($(CONFIG_NVMXIP_QSPI)$(CONFIG_SANDBOX64),yy)
++obj-y += nvmxip.o
++endif
++
+ ifneq ($(CONFIG_SANDBOX),)
+ ifeq ($(CONFIG_ACPIGEN),y)
+ obj-y += acpi.o
+diff --git a/test/dm/nvmxip.c b/test/dm/nvmxip.c
+new file mode 100644
+index 000000000000..484e6077b4a9
+--- /dev/null
++++ b/test/dm/nvmxip.c
+@@ -0,0 +1,115 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Functional tests for UCLASS_FFA  class
++ *
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <console.h>
++#include <blk.h>
++#include <dm.h>
++#include <dm/test.h>
++#include "../../drivers/nvmxip/nvmxip.h"
++#include <test/test.h>
++#include <test/ut.h>
++
++/* NVMXIP devices described in the device tree  */
++#define SANDBOX_NVMXIP_DEVICES 2
++
++/* reference device tree data for the probed devices */
++static struct nvmxip_plat nvmqspi_refdata[SANDBOX_NVMXIP_DEVICES] = {
++	{0x08000000, 9, 4096}, {0x08200000, 9, 2048}
++};
++
++#define NVMXIP_BLK_START_PATTERN 0x1122334455667788ULL
++#define NVMXIP_BLK_END_PATTERN 0xa1a2a3a4a5a6a7a8ULL
++
++static int dm_nvmxip_flash_sanity(u8 device_idx, void *buffer)
++{
++	int i;
++	u64 *ptr = NULL;
++	u8 *base = NULL;
++	unsigned long blksz;
++
++	blksz = 1 << nvmqspi_refdata[device_idx].lba_shift;
++
++	/* if buffer not NULL, init the flash with the pattern data*/
++	if (!buffer)
++		base = map_sysmem(nvmqspi_refdata[device_idx].phys_base, 0);
++	else
++		base = buffer;
++
++	for (i = 0; i < nvmqspi_refdata[device_idx].lba ; i++) {
++		ptr = (u64 *)(base + i * blksz);
++
++		/* write an 8 bytes pattern at the start of the current block*/
++		if (!buffer)
++			*ptr = NVMXIP_BLK_START_PATTERN;
++		else if (*ptr != NVMXIP_BLK_START_PATTERN)
++			return -EINVAL;
++
++		ptr = (u64 *)((u8 *)ptr + blksz - sizeof(u64));
++
++		/* write an 8 bytes pattern at the end of the current block*/
++		if (!buffer)
++			*ptr = NVMXIP_BLK_END_PATTERN;
++		else if (*ptr != NVMXIP_BLK_END_PATTERN)
++			return -EINVAL;
++	}
++
++	if (!buffer)
++		unmap_sysmem(base);
++
++	return 0;
++}
++
++static int dm_test_nvmxip(struct unit_test_state *uts)
++{
++	struct nvmxip_plat *plat_data = NULL;
++	struct udevice *dev = NULL, *bdev = NULL;
++	u8 device_idx;
++	void *buffer = NULL;
++	unsigned long flashsz;
++
++	/* set the flash content first for both devices */
++	dm_nvmxip_flash_sanity(0, NULL);
++	dm_nvmxip_flash_sanity(1, NULL);
++
++	/*  probing all NVM XIP QSPI devices */
++	for (device_idx = 0, uclass_first_device(UCLASS_NVMXIP, &dev);
++	     dev;
++	     uclass_next_device(&dev), device_idx++) {
++		plat_data = dev_get_plat(dev);
++
++		/* device tree entries checks */
++		ut_assertok(nvmqspi_refdata[device_idx].phys_base != plat_data->phys_base);
++		ut_assertok(nvmqspi_refdata[device_idx].lba_shift != plat_data->lba_shift);
++		ut_assertok(nvmqspi_refdata[device_idx].lba != plat_data->lba);
++
++		/* before reading all the flash blocks, let's calculate the flash size */
++		flashsz = plat_data->lba << plat_data->lba_shift;
++
++		/* allocate the user buffer where to copy the blocks data to */
++		buffer = calloc(flashsz, 1);
++		ut_assertok(!buffer);
++
++		/* the block device is the child of the parent device probed with DT*/
++		ut_assertok(device_find_first_child(dev, &bdev));
++
++		/* reading all the flash blocks*/
++		ut_asserteq(plat_data->lba, blk_read(bdev, 0, plat_data->lba, buffer));
++
++		/* compare the data read from flash with the expected data */
++		ut_assertok(dm_nvmxip_flash_sanity(device_idx, buffer));
++
++		free(buffer);
++	}
++
++	ut_assertok(device_idx != SANDBOX_NVMXIP_DEVICES);
++
++	return CMD_RET_SUCCESS;
++}
++
++DM_TEST(dm_test_nvmxip, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-nvmxip-provide-a-u-boot-shell-test-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-nvmxip-provide-a-u-boot-shell-test-command.patch
new file mode 100644
index 000000000000..e8adbc121ad9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-nvmxip-provide-a-u-boot-shell-test-command.patch
@@ -0,0 +1,135 @@
+From 560ebe3eb6197322b9d00c8e3cf30fb7e679d8b2 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 22 Dec 2022 16:20:46 +0000
+Subject: [PATCH 33/43] nvmxip: provide a u-boot shell test command
+
+nvmxip command allows probing the NVM XIP devices manually
+
+The command is provided for test purposes only.
+
+Use:
+
+nvmxip probe
+
+Upstream-Status: Submitted
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ cmd/Kconfig                    |  7 +++++
+ cmd/Makefile                   |  1 +
+ cmd/nvmxip.c                   | 47 ++++++++++++++++++++++++++++++++++
+ configs/corstone1000_defconfig |  1 +
+ configs/sandbox_defconfig      |  1 +
+ 5 files changed, 57 insertions(+)
+ create mode 100644 cmd/nvmxip.c
+
+diff --git a/cmd/Kconfig b/cmd/Kconfig
+index 5e278ecb1597..b6a3e5908534 100644
+--- a/cmd/Kconfig
++++ b/cmd/Kconfig
+@@ -938,6 +938,13 @@ config CMD_ARMFFA
+ 		- Sending a data pattern to the specified partition
+ 		- Displaying the arm_ffa device info
+ 
++config CMD_NVMXIP
++	bool "NVM XIP probe command"
++	depends on NVMXIP
++	help
++	  Probes all NVM XIP devices. The command is for
++	  test purposes only (not to be upstreamed)
++
+ config CMD_ARMFLASH
+ 	#depends on FLASH_CFI_DRIVER
+ 	bool "armflash"
+diff --git a/cmd/Makefile b/cmd/Makefile
+index c757f1647da6..0a3d98100703 100644
+--- a/cmd/Makefile
++++ b/cmd/Makefile
+@@ -154,6 +154,7 @@ obj-$(CONFIG_CMD_RTC) += rtc.o
+ obj-$(CONFIG_SANDBOX) += host.o
+ obj-$(CONFIG_CMD_SATA) += sata.o
+ obj-$(CONFIG_CMD_NVME) += nvme.o
++obj-$(CONFIG_CMD_NVMXIP) += nvmxip.o
+ obj-$(CONFIG_SANDBOX) += sb.o
+ obj-$(CONFIG_CMD_SF) += sf.o
+ obj-$(CONFIG_CMD_SCSI) += scsi.o disk.o
+diff --git a/cmd/nvmxip.c b/cmd/nvmxip.c
+new file mode 100644
+index 000000000000..3eb0d84afc04
+--- /dev/null
++++ b/cmd/nvmxip.c
+@@ -0,0 +1,47 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <command.h>
++#include <dm.h>
++
++int do_nvmxip_probe(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
++{
++	struct udevice *dev = NULL;
++	for (uclass_first_device(UCLASS_NVMXIP, &dev); dev; uclass_next_device(&dev));
++
++	return 0;
++}
++
++static struct cmd_tbl nvmxip_commands[] = {
++	U_BOOT_CMD_MKENT(probe, 1, 1, do_nvmxip_probe, "", ""),
++};
++
++static int do_nvmxip(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
++{
++	struct cmd_tbl *nvmxip_cmd;
++	int ret;
++
++	if (argc < 2)
++		return CMD_RET_USAGE;
++
++	nvmxip_cmd = find_cmd_tbl(argv[1], nvmxip_commands, ARRAY_SIZE(nvmxip_commands));
++
++	argc -= 2;
++	argv += 2;
++
++	if (!nvmxip_cmd || argc > nvmxip_cmd->maxargs)
++		return CMD_RET_USAGE;
++
++	ret = nvmxip_cmd->cmd(nvmxip_cmd, flag, argc, argv);
++
++	return cmd_process_error(nvmxip_cmd, ret);
++}
++
++U_BOOT_CMD(nvmxip, 4, 1, do_nvmxip,
++	   "NVM XIP probe command",
++	   "probe\n"
++	"	 - probes all NVM XIP devices\n");
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 2986cc95932f..e009faee0252 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -59,6 +59,7 @@ CONFIG_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_ERRNO_STR=y
+ CONFIG_NVMXIP_QSPI=y
++CONFIG_CMD_NVMXIP=y
+ CONFIG_EFI_MM_COMM_TEE=y
+ CONFIG_ARM_FFA_TRANSPORT=y
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
+diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
+index f22230b5cce2..3b895be9e4ba 100644
+--- a/configs/sandbox_defconfig
++++ b/configs/sandbox_defconfig
+@@ -139,6 +139,7 @@ CONFIG_IP_DEFRAG=y
+ CONFIG_BOOTP_SERVERIP=y
+ CONFIG_IPV6=y
+ CONFIG_NVMXIP_QSPI=y
++CONFIG_CMD_NVMXIP=y
+ CONFIG_DM_DMA=y
+ CONFIG_DEVRES=y
+ CONFIG_DEBUG_DEVRES=y
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-add-fwu-metadata-store-info.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-add-fwu-metadata-store-info.patch
new file mode 100644
index 000000000000..facd19b3c9a2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-add-fwu-metadata-store-info.patch
@@ -0,0 +1,42 @@
+From 9ef889ff89e6d2e2e40edecbd4ab7601c3d68052 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 15:58:07 +0000
+Subject: [PATCH 34/43] corstone1000: add fwu-metadata store info
+
+Add fwu-mdata node and handle for the reference
+nvmxip-qspi.
+
+Upstream-Status: Submitted
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/dts/corstone1000.dtsi | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+index faf4e12bab2a..b1d83b5ba861 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -38,7 +38,7 @@
+ 		reg = <0x88200000 0x77e00000>;
+ 	};
+ 
+-	nvmxip-qspi@08000000 {
++	nvmxip: nvmxip-qspi@08000000 {
+ 		compatible = "nvmxip,qspi";
+ 		reg = <0x08000000 0x2000000>;
+ 		lba_shift = <9>;
+@@ -106,6 +106,11 @@
+ 		method = "smc";
+ 	};
+ 
++	fwu-mdata {
++		compatible = "u-boot,fwu-mdata-gpt";
++		fwu-mdata-store = <&nvmxip>;
++	};
++
+ 	soc {
+ 		compatible = "simple-bus";
+ 		#address-cells = <1>;
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-nvmxip-shorter-block-device-name.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-nvmxip-shorter-block-device-name.patch
new file mode 100644
index 000000000000..74e4ccb8750e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-nvmxip-shorter-block-device-name.patch
@@ -0,0 +1,44 @@
+From 83823733015998702e4dc0365764fe7dde4a321f Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 15:59:36 +0000
+Subject: [PATCH 35/43] nvmxip: shorter block device name
+
+Make the block device name shorter, so it will be set and presented
+inside the array limits.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/nvmxip/nvmxip.c      | 2 +-
+ drivers/nvmxip/nvmxip_qspi.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/nvmxip/nvmxip.c b/drivers/nvmxip/nvmxip.c
+index af9c9a3b7270..91fe995f2d4d 100644
+--- a/drivers/nvmxip/nvmxip.c
++++ b/drivers/nvmxip/nvmxip.c
+@@ -91,7 +91,7 @@ int nvmxip_init(struct udevice *udev)
+ 
+ 	nvmxip_bdev_max_devs++;
+ 
+-	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "nvmxip-blk#%d", nvmxip_bdev_max_devs);
++	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "blk#%d", nvmxip_bdev_max_devs);
+ 
+ 	ret = blk_create_devicef(udev, NVMXIP_BLKDRV_NAME, bdev_name, UCLASS_NVMXIP,
+ 				 nvmxip_bdev_max_devs, NVMXIP_DEFAULT_LBA_SZ,
+diff --git a/drivers/nvmxip/nvmxip_qspi.c b/drivers/nvmxip/nvmxip_qspi.c
+index 749625134acd..f6f5435e6377 100644
+--- a/drivers/nvmxip/nvmxip_qspi.c
++++ b/drivers/nvmxip/nvmxip_qspi.c
+@@ -43,7 +43,7 @@ static int nvmxip_qspi_of_to_plat(struct udevice *dev)
+ 		return -EINVAL;
+ 	}
+ 
+-	pr_debug("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: %lu\n",
++	log_err("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: %lu\n",
+ 		 dev->name, plat_data->phys_base, plat_data->lba_shift, plat_data->lba);
+ 
+ 	return 0;
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_boottime-allow-to-reset-a-path-after-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_boottime-allow-to-reset-a-path-after-boot.patch
new file mode 100644
index 000000000000..59a60af66800
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_boottime-allow-to-reset-a-path-after-boot.patch
@@ -0,0 +1,31 @@
+From 53d29d35cdbcf493f6a9046458947d3e91f01add Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 16:11:25 +0000
+Subject: [PATCH 36/43] efi_boottime: allow to reset a path after boot
+
+Allow to install multiple protocol interfaces in an
+already installed root interface.
+This may need to be fix in other way, but for now
+looks like the get away fix.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ lib/efi_loader/efi_boottime.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
+index fea4eb7a342e..90f43ff9a62f 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -2669,7 +2669,6 @@ efi_install_multiple_protocol_interfaces_int(efi_handle_t *handle,
+ 				EFI_PRINT("Path %pD already installed\n",
+ 					  protocol_interface);
+ 				ret = EFI_ALREADY_STARTED;
+-				break;
+ 			}
+ 		}
+ 		ret = EFI_CALL(efi_install_protocol_interface(handle, protocol,
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu_metadata-make-sure-structures-are-packed.patch
new file mode 100644
index 000000000000..7781a1edabdc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu_metadata-make-sure-structures-are-packed.patch
@@ -0,0 +1,50 @@
+From a8142be9b32a769040b6238ff611c22cb31c8cb5 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 16:13:24 +0000
+Subject: [PATCH 37/43] fwu_metadata: make sure structures are packed
+
+The fwu metadata in the metadata partitions
+should/are packed to guarantee that the info is
+correct in all platforms. Also the size of them
+are used to calculate the crc32 and that is important
+to get it right.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ include/fwu_mdata.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/fwu_mdata.h b/include/fwu_mdata.h
+index 8fda4f4ac225..c61221a91735 100644
+--- a/include/fwu_mdata.h
++++ b/include/fwu_mdata.h
+@@ -22,7 +22,7 @@ struct fwu_image_bank_info {
+ 	efi_guid_t  image_uuid;
+ 	uint32_t accepted;
+ 	uint32_t reserved;
+-};
++} __packed;
+ 
+ /**
+  * struct fwu_image_entry - information for a particular type of image
+@@ -38,7 +38,7 @@ struct fwu_image_entry {
+ 	efi_guid_t image_type_uuid;
+ 	efi_guid_t location_uuid;
+ 	struct fwu_image_bank_info img_bank_info[CONFIG_FWU_NUM_BANKS];
+-};
++} __packed;
+ 
+ /**
+  * struct fwu_mdata - FWU metadata structure for multi-bank updates
+@@ -62,6 +62,6 @@ struct fwu_mdata {
+ 	uint32_t previous_active_index;
+ 
+ 	struct fwu_image_entry img_entry[CONFIG_FWU_NUM_IMAGES_PER_BANK];
+-};
++} __packed;
+ 
+ #endif /* _FWU_MDATA_H_ */
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-add-boot-index.patch
new file mode 100644
index 000000000000..afaf9673488c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-add-boot-index.patch
@@ -0,0 +1,33 @@
+From ceae4ec0d459b1ef12e544f4e36d6043a09d3b05 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 16:15:30 +0000
+Subject: [PATCH 38/43] corstone1000: add boot index
+
+it is expected that the firmware that runs before
+u-boot somehow provide the information of the bank
+(index) of it is booting.
+We will need to extend tf-a to pass that info,
+meanwhile just set it to the default bank.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ board/armltd/corstone1000/corstone1000.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+index d6ca6e896140..0a58ccd99cdd 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -106,6 +106,7 @@ int dram_init_banksize(void)
+ 	return 0;
+ }
+ 
+-void reset_cpu(ulong addr)
++void fwu_plat_get_bootidx(int *boot_idx)
+ {
++	*boot_idx = 0;
+ }
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-adjust-boot-bank-and-kernel-location.patch
new file mode 100644
index 000000000000..a42b3a25eef5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-adjust-boot-bank-and-kernel-location.patch
@@ -0,0 +1,36 @@
+From 80a2910370b0acc35f6fb2fbe3a7e56fecb1a08a Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 16:17:21 +0000
+Subject: [PATCH 39/43] corstone1000: adjust boot bank and kernel location
+
+Adjust in the env boot script the address of the
+bootbank with the new gpt layout, and also the
+kernel partition address. Please be aware that
+this is hack and needs a proper fix, since the
+offset of the kernel partition is not fixed,
+but for the propose of PoC it is enough for testing.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ board/armltd/corstone1000/corstone1000.env | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/corstone1000/corstone1000.env
+index b24ff07fc6bd..a6ee4962211b 100644
+--- a/board/armltd/corstone1000/corstone1000.env
++++ b/board/armltd/corstone1000/corstone1000.env
+@@ -1,8 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ 
+ usb_pgood_delay=250
+-boot_bank_flag=0x08002000
+-kernel_addr_bank_0=0x083EE000
++boot_bank_flag=0x08005006
++kernel_addr_bank_0=0x08280000
+ kernel_addr_bank_1=0x0936E000
+ retrieve_kernel_load_addr=
+ 	if itest.l *${boot_bank_flag} == 0; then
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
new file mode 100644
index 000000000000..d1fa8ffb25aa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
@@ -0,0 +1,133 @@
+From 7c694af3fd5de372349f740b62cd3d909483fe2e Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 1 Feb 2023 16:19:40 +0000
+Subject: [PATCH 40/43] corstone1000: add nvmxip, fwu-mdata and gpt options
+
+Enable the newest features: nvmxip, fwu-metadata and
+gpt. Commands to print the partition info, gpt info
+and fwu metadata will be available.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ configs/corstone1000_defconfig | 31 +++++++++++++++++++------------
+ fs/fs.c                        |  5 +++++
+ 2 files changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index e009faee0252..711cf13592db 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -4,13 +4,15 @@ CONFIG_TARGET_CORSTONE1000=y
+ CONFIG_TEXT_BASE=0x80000000
+ CONFIG_SYS_MALLOC_LEN=0x2000000
+ CONFIG_NR_DRAM_BANKS=1
++CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
++CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x83f00000
++CONFIG_DM_GPIO=y
+ CONFIG_DEFAULT_DEVICE_TREE="corstone1000-mps3"
+ CONFIG_SYS_PROMPT="corstone1000# "
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+ CONFIG_SYS_LOAD_ADDR=0x82100000
++CONFIG_FWU_NUM_IMAGES_PER_BANK=4
+ CONFIG_DISTRO_DEFAULTS=y
+-CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
+-CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x83f00000
+ CONFIG_FIT=y
+ CONFIG_BOOTDELAY=3
+ CONFIG_USE_BOOTARGS=y
+@@ -23,11 +25,16 @@ CONFIG_LOGLEVEL=7
+ CONFIG_SYS_MAXARGS=64
+ CONFIG_SYS_CBSIZE=512
+ # CONFIG_CMD_CONSOLE is not set
++CONFIG_CMD_FWU_METADATA=y
+ CONFIG_CMD_BOOTZ=y
+ CONFIG_SYS_BOOTM_LEN=0x800000
+ # CONFIG_CMD_XIMG is not set
++CONFIG_CMD_NVMXIP=y
++CONFIG_CMD_GPT=y
++# CONFIG_RANDOM_UUID is not set
+ CONFIG_CMD_LOADM=y
+ # CONFIG_CMD_LOADS is not set
++CONFIG_CMD_MMC=y
+ CONFIG_CMD_USB=y
+ # CONFIG_CMD_SETEXPR is not set
+ # CONFIG_CMD_NFS is not set
+@@ -39,29 +46,29 @@ CONFIG_OF_CONTROL=y
+ CONFIG_VERSION_VARIABLE=y
+ CONFIG_NET_RANDOM_ETHADDR=y
+ CONFIG_REGMAP=y
+-CONFIG_MISC=y
++CONFIG_ARM_FFA_TRANSPORT=y
+ CONFIG_CLK=y
+-CONFIG_CMD_MMC=y
+-CONFIG_DM_MMC=y
++CONFIG_FWU_MDATA=y
++CONFIG_FWU_MDATA_GPT_BLK=y
++CONFIG_MISC=y
+ CONFIG_ARM_PL180_MMCI=y
+-CONFIG_MMC_SDHCI_ADMA_HELPERS=y
+-CONFIG_MMC_WRITE=y
+-CONFIG_DM_GPIO=y
+ CONFIG_PHYLIB=y
+ CONFIG_PHY_SMSC=y
+ CONFIG_SMC911X=y
++CONFIG_NVMXIP_QSPI=y
+ CONFIG_PHY=y
+ CONFIG_RAM=y
+ CONFIG_DM_RTC=y
+ CONFIG_RTC_EMULATION=y
+ CONFIG_DM_SERIAL=y
++CONFIG_SYSRESET=y
+ CONFIG_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_ERRNO_STR=y
+-CONFIG_NVMXIP_QSPI=y
+-CONFIG_CMD_NVMXIP=y
+ CONFIG_EFI_MM_COMM_TEE=y
+-CONFIG_ARM_FFA_TRANSPORT=y
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
++CONFIG_EFI_CAPSULE_ON_DISK=y
++CONFIG_EFI_IGNORE_OSINDICATIONS=y
+ CONFIG_EFI_CAPSULE_FIRMWARE_FIT=y
+-CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
++CONFIG_FWU_MULTI_BANK_UPDATE=y
++# CONFIG_TOOLS_MKEFICAPSULE is not set
+diff --git a/fs/fs.c b/fs/fs.c
+index 8324b4a22f20..f54955a2b7f6 100644
+--- a/fs/fs.c
++++ b/fs/fs.c
+@@ -437,11 +437,13 @@ int fs_set_blk_dev(const char *ifname, const char *dev_part_str, int fstype)
+ 	}
+ #endif
+ 
++	log_err("RUI: fs_set_blk_dev fstype: %d\n", fstype);
+ 	part = part_get_info_by_dev_and_name_or_num(ifname, dev_part_str, &fs_dev_desc,
+ 						    &fs_partition, 1);
+ 	if (part < 0)
+ 		return -1;
+ 
++	log_err("RUI: fs_set_blk_dev 1\n");
+ 	for (i = 0, info = fstypes; i < ARRAY_SIZE(fstypes); i++, info++) {
+ 		if (fstype != FS_TYPE_ANY && info->fstype != FS_TYPE_ANY &&
+ 				fstype != info->fstype)
+@@ -450,6 +452,8 @@ int fs_set_blk_dev(const char *ifname, const char *dev_part_str, int fstype)
+ 		if (!fs_dev_desc && !info->null_dev_desc_ok)
+ 			continue;
+ 
++		log_err("RUI: fs_set_blk_dev 2: info->fstype: %d part: %d\n",
++			info->fstype, part);
+ 		if (!info->probe(fs_dev_desc, &fs_partition)) {
+ 			fs_type = info->fstype;
+ 			fs_dev_part = part;
+@@ -457,6 +461,7 @@ int fs_set_blk_dev(const char *ifname, const char *dev_part_str, int fstype)
+ 		}
+ 	}
+ 
++	log_err("RUI: fs_set_blk_dev 3\n");
+ 	return -1;
+ }
+ 
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvmxip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvmxip-move-header-to-include.patch
new file mode 100644
index 000000000000..4e4ae17216b4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvmxip-move-header-to-include.patch
@@ -0,0 +1,42 @@
+From 37b3c73d9307d1de3b78e3ccba0ba6ba0867d6b8 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 23 Feb 2023 10:32:04 +0000
+Subject: [PATCH 41/43] nvmxip: move header to include
+
+Move header to include to allow external code
+to get the internal bdev structures to access
+block device operations.
+
+as at it, just add the UCLASS_NVMXIP string
+so we get the correct output in partitions
+listing.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ disk/part.c                          | 3 +++
+ {drivers/nvmxip => include}/nvmxip.h | 0
+ 2 files changed, 3 insertions(+)
+ rename {drivers/nvmxip => include}/nvmxip.h (100%)
+
+diff --git a/disk/part.c b/disk/part.c
+index 5ee60a7fb591..593dd0004fa4 100644
+--- a/disk/part.c
++++ b/disk/part.c
+@@ -270,6 +270,9 @@ static void print_part_header(const char *type, struct blk_desc *dev_desc)
+ 	case UCLASS_NVME:
+ 		puts ("NVMe");
+ 		break;
++	case UCLASS_NVMXIP:
++		puts ("NVMXIP");
++		break;
+ 	case UCLASS_PVBLOCK:
+ 		puts("PV BLOCK");
+ 		break;
+diff --git a/drivers/nvmxip/nvmxip.h b/include/nvmxip.h
+similarity index 100%
+rename from drivers/nvmxip/nvmxip.h
+rename to include/nvmxip.h
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch
new file mode 100644
index 000000000000..25e248b73464
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch
@@ -0,0 +1,112 @@
+From e8272dc9390adfd0818d1093c83f3b5c07649a95 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 23 Feb 2023 10:35:00 +0000
+Subject: [PATCH 42/43] corstone1000: set kernel_addr based on boot_idx
+
+We need to distinguish between boot banks and from which
+partition to load the kernel+initramfs to memory.
+
+For that, fetch the boot index, fetch the correspondent
+partition, calculate the correct kernel address and
+then set the env variable kernel_addr with that value.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ board/armltd/corstone1000/corstone1000.c | 55 +++++++++++++++++++++++-
+ configs/corstone1000_defconfig           |  1 +
+ 2 files changed, 55 insertions(+), 1 deletion(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+index 0a58ccd99cdd..0923ca6e8c5b 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -5,13 +5,23 @@
+  * Rui Miguel Silva <rui.silva@linaro.org>
+  */
+ 
++#include <blk.h>
+ #include <common.h>
+ #include <dm.h>
++#include <env.h>
+ #include <netdev.h>
++#include <nvmxip.h>
++#include <part.h>
+ #include <dm/platform_data/serial_pl01x.h>
+ #include <asm/armv8/mmu.h>
+ #include <asm/global_data.h>
+ 
++#define CORSTONE1000_KERNEL_PARTS 2
++#define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
++#define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
++
++static int corstone1000_boot_idx;
++
+ static struct mm_region corstone1000_mem_map[] = {
+ 	{
+ 		/* CVM */
+@@ -108,5 +118,48 @@ int dram_init_banksize(void)
+ 
+ void fwu_plat_get_bootidx(int *boot_idx)
+ {
+-	*boot_idx = 0;
++	*boot_idx = corstone1000_boot_idx;
++}
++
++int board_late_init(void)
++{
++	struct disk_partition part_info;
++	struct udevice *dev, *bdev;
++	struct nvmxip_plat *plat;
++	struct blk_desc *desc;
++	int ret;
++
++	ret = uclass_first_device_err(UCLASS_NVMXIP, &dev);
++	if (ret < 0) {
++		log_err("Cannot find kernel device\n");
++		return ret;
++	}
++
++	plat = dev_get_plat(dev);
++	device_find_first_child(dev, &bdev);
++	desc = dev_get_uclass_plat(bdev);
++
++	if (!corstone1000_boot_idx)
++		ret = part_get_info_by_name(desc, CORSTONE1000_KERNEL_PRIMARY,
++					    &part_info);
++	else
++		ret = part_get_info_by_name(desc, CORSTONE1000_KERNEL_SECONDARY,
++					    &part_info);
++
++	if (ret < 0) {
++		log_err("failed to fetch kernel partition index: %d\n",
++			corstone1000_boot_idx);
++		return ret;
++	}
++
++	ret = 0;
++
++	ret |= env_set_hex("kernel_addr", plat->phys_base +
++			   (part_info.start * part_info.blksz));
++	ret |= env_set_hex("kernel_size", part_info.size * part_info.blksz);
++
++	if (ret < 0)
++		log_err("failed to setup kernel addr and size\n");
++
++	return ret;
+ }
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 711cf13592db..68054f755624 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -22,6 +22,7 @@ CONFIG_CONSOLE_RECORD=y
+ CONFIG_LOGLEVEL=7
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_BOARD_LATE_INIT=y
+ CONFIG_SYS_MAXARGS=64
+ CONFIG_SYS_CBSIZE=512
+ # CONFIG_CMD_CONSOLE is not set
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-boot-index-from-active.patch
new file mode 100644
index 000000000000..9080ecb28823
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-boot-index-from-active.patch
@@ -0,0 +1,42 @@
+From b32aee10c66a9c2a3b6b948ad957deca3391c4bf Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Mon, 27 Feb 2023 14:40:13 +0000
+Subject: [PATCH 43/43] corstone1000: boot index from active
+
+In our platform, the Secure Enclave is the one who control
+all the boot tries and status, so, every time we get here
+we know that the we are booting from the active index.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ board/armltd/corstone1000/corstone1000.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+index 0923ca6e8c5b..e949edb79745 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -118,7 +118,18 @@ int dram_init_banksize(void)
+ 
+ void fwu_plat_get_bootidx(int *boot_idx)
+ {
+-	*boot_idx = corstone1000_boot_idx;
++	int ret;
++
++	/*
++	 * in our platform, the Secure Enclave is the one who control
++	 * all the boot tries and status, so, every time we get here
++	 * we know that the we are booting from the active index
++	 */
++	ret = fwu_get_active_index(boot_idx);
++	if (ret < 0)
++		log_err("corstone1000: failed to read active index\n");
++
++	return ret;
+ }
+ 
+ int board_late_init(void)
+-- 
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index f637fd0caee7..6e68a421c1a2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -44,6 +44,23 @@ SRC_URI:append:corstone1000 = " \
         file://0024-arm-corstone1000-esrt-support.patch					\
         file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start.patch		\
         file://0026-corstone1000-enable-distro-booting-command.patch			\
+        file://0027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch		\
+        file://0028-sandbox64-fix-return-unsigned-long-in-readq.patch			\
+        file://0029-sandbox64-add-support-for-NVMXIP-QSPI.patch			\
+        file://0030-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch		\
+        file://0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch			\
+        file://0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch			\
+        file://0033-nvmxip-provide-a-u-boot-shell-test-command.patch			\
+        file://0034-corstone1000-add-fwu-metadata-store-info.patch			\
+        file://0035-nvmxip-shorter-block-device-name.patch				\
+        file://0036-efi_boottime-allow-to-reset-a-path-after-boot.patch		\
+        file://0037-fwu_metadata-make-sure-structures-are-packed.patch			\
+        file://0038-corstone1000-add-boot-index.patch					\
+        file://0039-corstone1000-adjust-boot-bank-and-kernel-location.patch		\
+        file://0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch		\
+        file://0041-nvmxip-move-header-to-include.patch				\
+        file://0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch		\
+        file://0043-corstone1000-boot-index-from-active.patch				\
         "
 
 #
diff --git a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
index 762567970acf..5668071aa32e 100644
--- a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
+++ b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
@@ -2,14 +2,34 @@
 # Layout and maximum sizes (to be defined):
 #
 
-part --source rawcopy --sourceparams="file=bl2_signed.bin" --align 1 --no-table --fixed-size 100k
-part --source rawcopy --sourceparams="file=bl2_signed.bin" --align 1 --no-table --fixed-size 100k
+# The entries with --offset parameter should not be relocated
+# because BL1 code is statically configured for the given positions
 
-part --source rawcopy --sourceparams="file=tfm_s_signed.bin" --align 1 --no-table --fixed-size 376k
-part --source rawcopy --sourceparams="file=tfm_s_signed.bin" --align 1 --no-table --fixed-size 376k
+part --source empty --size 3k --offset 17k --part-name="reserved_1" --uuid B1F2FC8C-A7A3-4485-87CB-16961B8847D7
+
+part --source empty --size 4k --align 4 --offset 20k --part-name="FWU-Metadata" --uuid 3FDFFEE1-3223-4C6B-80F9-B0E7D780C21D --part-type 8A7A84A0-8387-40F6-AB41-A8B9A5A60D23
+part --source empty --size 4k --align 4 --offset 24k --part-name="Bkup-FWU-Metadata" --uuid B3068316-5351-4998-823A-3A7B09133EC1 --part-type 8A7A84A0-8387-40F6-AB41-A8B9A5A60D23
+
+part --source empty --size 4k --align 4 --offset 28k --part-name="private_metadata_replica_2" --uuid 3CC3B456-DEC8-4CE3-BC5C-965483CE4828 --part-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
+part --source empty --size 4k --align 4 --offset 32k --part-name="private_metadata_replica_2" --uuid DCE9C503-8DFD-4DCB-8889-647E49641552 --part-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
+
+part --source rawcopy --sourceparams="file=bl2_signed.bin" --offset 36k --align 4 --part-name="bl2_primary" --uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+
+part --source rawcopy --sourceparams="file=tfm_s_signed.bin" --align 4 --part-name="tfm_primary" --uuid 07F9616C-1233-439C-ACBA-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
 
 # Rawcopy of the FIP binary
-part --source rawcopy --sourceparams="file=signed_fip-corstone1000.bin" --align 1 --no-table --fixed-size 2
+part --source rawcopy --sourceparams="file=signed_fip-corstone1000.bin" --align 4 --part-name="FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
 
 # Rawcopy of kernel with initramfs
-part --source rawcopy --sourceparams="file=Image.gz-initramfs-${MACHINE}.bin" --no-table --fixed-size 12
+part --source rawcopy --sourceparams="file=Image.gz-initramfs-${MACHINE}.bin" --align 4 --part-name="kernel_primary" --uuid BF7A6142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC5745B05
+
+
+part --source empty --size 100k --offset 16392k --align 4 --part-name="bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+part --source empty --size 4k --align 4 --part-name="tfm_secondary" --uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
+part --source empty --size 4k --align 4 --part-name="FIP_B" --uuid 9424E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
+part --source empty --size 4k --align 4 --part-name="kernel_secondary" --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46FC-921E-141CC5745B05
+
+
+part --source empty --size 3k --offset 32748k --part-name="reserved_2" --uuid CCB18569-C0BA-42E0-A429-FE1DC862D660
+
+bootloader --ptable gpt
-- 
2.34.1


