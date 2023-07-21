Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EE1C04E69
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 10:43:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4492.1689936206335573482
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jul 2023 03:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8ADA2F4;
	Fri, 21 Jul 2023 03:44:08 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.0.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31B563F738;
	Fri, 21 Jul 2023 03:43:24 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/2] corstone1000: u-boot: upgrade to v2023.07
Date: Fri, 21 Jul 2023 11:43:13 +0100
Message-Id: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jul 2023 10:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4913

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Changes made:

- Porting out-of-tree U-Boot patches to v2023.07
- Upgrading U-Boot FF-A support to the latest version of the FF-A patchse=
t
- Adding a workaround in TF-A due to an issue in U-Boot's PSCI driver (Fi=
x in progress)

Cheers
Abdellatif

Abdellatif El Khlifi (2):
  arm-bsp/trusted-firmware-a: corstone1000: psci: SMCCC_ARCH_FEATURES
    discovery through PSCI_FEATURES
  arm-bsp/u-boot: corstone1000: upgrade to v2023.07

 .../conf/machine/include/corstone1000.inc     |    2 +-
 ...URES-discovery-through-PSCI_FEATURES.patch |   29 +
 .../trusted-firmware-a-corstone1000.inc       |    1 +
 ...ccc-add-support-for-SMCCCv1.2-x0-x1.patch} |   80 +-
 ...-introduce-uuid_str_to_le_bin-funct.patch} |   71 +-
 ...d-introduce-testcase-for-uuid_str_to.patch |   94 +
 ...-introduce-Arm-FF-A-low-level-driver.patch | 2139 -----------------
 ...5-arm_ffa-introduce-Arm-FF-A-support.patch | 2132 ++++++++++++++++
 ...0004-arm_ffa-efi-unmap-RX-TX-buffers.patch |   74 -
 ...v15-arm_ffa-introduce-armffa-command.patch |  436 ++++
 ...005-arm_ffa-introduce-armffa-command.patch |  364 ---
 ...m_ffa-introduce-sandbox-FF-A-support.patch | 1314 ++++++++++
 ...fa-introduce-the-FF-A-Sandbox-driver.patch | 1164 ---------
 ...-introduce-sandbox-test-cases-for-UC.patch |  341 +++
 ...ce-Sandbox-test-cases-for-UCLASS_FFA.patch |  472 ----
 ...introduce-armffa-command-Sandbox-te.patch} |   65 +-
 ...efi-introduce-FF-A-MM-communication.patch} |  369 ++-
 ...-efi-corstone1000-enable-MM-communic.patch |   33 +
 ...corstone1000-enable-MM-communication.patch |   86 -
 ...00-fwu-introduce-EFI-capsule-update.patch} |  223 +-
 ...000-fix-unrecognized-filesystem-type.patch |    4 +-
 ...tone1000-pass-interface-id-and-buffe.patch |   74 -
 ...ne1000-remove-guid-check-from-corst.patch} |   10 +-
 ...stone1000-pass-interface-id-and-kern.patch |   58 -
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |    8 +-
 ...add-get_image_info-for-corstone1000.patch} |    4 +-
 ...ll-pointer-exception-with-get_image.patch} |    8 +-
 ...17-arm-corstone1000-add-mmc-for-fvp.patch} |   25 +-
 ...e1000-add-compressed-kernel-support.patch} |    8 +-
 ...bootcomplete-message-to-secure-encla.patch |  183 --
 ...-external-sys-driver-to-device-tree.patch} |    8 +-
 ...-rpmsg-client-to-u-boot-device-tree.patch} |    8 +-
 ... 0021-arm-corstone1000-esrt-support.patch} |   22 +-
 ...e1000-enable-distro-booting-command.patch} |   12 +-
 ...one1000-add-fwu-metadata-store-info.patch} |    4 +-
 ...ata-make-sure-structures-are-packed.patch} |    4 +-
 .../0025-corstone1000-add-boot-index.patch    |   42 +
 ...er-FF-A-bus-before-raising-EFI-start.patch |   51 -
 ...djust-boot-bank-and-kernel-location.patch} |    4 +-
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |   65 +-
 ...ip-introduce-NVM-XIP-block-storage-e.patch |  455 ----
 ...mtd-nvmxip-introduce-QSPI-XIP-driver.patch |  271 ---
 ... 0028-nvmxip-move-header-to-include.patch} |    8 +-
 ...0-set-kernel_addr-based-on-boot_idx.patch} |   20 +-
 ...64-fix-return-unsigned-long-in-readq.patch |   45 -
 ...corstone1000-boot-index-from-active.patch} |   19 +-
 ...andbox64-add-support-for-NVMXIP-QSPI.patch |  161 --
 ...00-add-NVM-XIP-QSPI-device-tree-node.patch |   42 -
 ...0031-corstone1000-enable-PSCI-reset.patch} |   27 +-
 ...32-Enable-EFI-set-get-time-services.patch} |   27 +-
 ...64-add-a-test-case-for-UCLASS_NVMXIP.patch |  219 --
 .../0035-corstone1000-add-boot-index.patch    |   33 -
 ...ion-warnings-in-fwu_plat_get_bootidx.patch |   47 -
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   75 +-
 54 files changed, 4972 insertions(+), 6568 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.p=
atch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0001-arm64-s=
mccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch =3D> 0001-FF-A-v15-ar=
m64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch} (79%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0002-lib-uui=
d-introduce-uuid_str_to_le_bin-function.patch =3D> 0002-FF-A-v15-lib-uuid=
-introduce-uuid_str_to_le_bin-funct.patch} (64%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-arm_ffa-efi-unmap-RX-TX-buffers.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-FF-A-v15-arm_ffa-introduce-armffa-command.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-arm_ffa-introduce-armffa-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0008-arm_ffa=
-introduce-armffa-command-Sandbox-test.patch =3D> 0008-FF-A-v15-arm_ffa-i=
ntroduce-armffa-command-Sandbox-te.patch} (58%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0009-arm_ffa=
-efi-introduce-FF-A-MM-communication.patch =3D> 0009-FF-A-v15-arm_ffa-efi=
-introduce-FF-A-MM-communication.patch} (57%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-arm_ffa-efi-corstone1000-enable-MM-communication.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0011-efi-cor=
stone1000-introduce-EFI-capsule-update.patch =3D> 0011-efi-corstone1000-f=
wu-introduce-EFI-capsule-update.patch} (66%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
013-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0015-efi_loa=
der-corstone1000-remove-guid-check-from-corst.patch =3D> 0013-efi_loader-=
corstone1000-remove-guid-check-from-corst.patch} (83%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
014-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0016-efi_loa=
der-populate-ESRT-table-if-EFI_ESRT-config-op.patch =3D> 0014-efi_loader-=
populate-ESRT-table-if-EFI_ESRT-config-op.patch} (80%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0017-efi_fir=
mware-add-get_image_info-for-corstone1000.patch =3D> 0015-efi_firmware-ad=
d-get_image_info-for-corstone1000.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0019-efi_loa=
der-fix-null-pointer-exception-with-get_image.patch =3D> 0016-efi_loader-=
fix-null-pointer-exception-with-get_image.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-arm-cor=
stone1000-add-mmc-for-fvp.patch =3D> 0017-arm-corstone1000-add-mmc-for-fv=
p.patch} (81%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0021-corston=
e1000-add-compressed-kernel-support.patch =3D> 0018-corstone1000-add-comp=
ressed-kernel-support.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
018-efi_loader-send-bootcomplete-message-to-secure-encla.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-Introdu=
ce-external-sys-driver-to-device-tree.patch =3D> 0019-Introduce-external-=
sys-driver-to-device-tree.patch} (81%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-Add-mhu=
-and-rpmsg-client-to-u-boot-device-tree.patch =3D> 0020-Add-mhu-and-rpmsg=
-client-to-u-boot-device-tree.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0024-arm-cor=
stone1000-esrt-support.patch =3D> 0021-arm-corstone1000-esrt-support.patc=
h} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-corston=
e1000-enable-distro-booting-command.patch =3D> 0022-corstone1000-enable-d=
istro-booting-command.patch} (72%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0033-corston=
e1000-add-fwu-metadata-store-info.patch =3D> 0023-corstone1000-add-fwu-me=
tadata-store-info.patch} (87%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0034-fwu_met=
adata-make-sure-structures-are-packed.patch =3D> 0024-fwu_metadata-make-s=
ure-structures-are-packed.patch} (90%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-corstone1000-add-boot-index.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-efi_setup-discover-FF-A-bus-before-raising-EFI-start.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-corston=
e1000-adjust-boot-bank-and-kernel-location.patch =3D> 0026-corstone1000-a=
djust-boot-bank-and-kernel-location.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =3D> 0027-corstone1000-a=
dd-nvmxip-fwu-mdata-and-gpt-options.patch} (63%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-drivers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-drivers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-nvmxip-=
move-header-to-include.patch =3D> 0028-nvmxip-move-header-to-include.patc=
h} (82%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-corston=
e1000-set-kernel_addr-based-on-boot_idx.patch =3D> 0029-corstone1000-set-=
kernel_addr-based-on-boot_idx.patch} (89%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-sandbox64-fix-return-unsigned-long-in-readq.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-boot-index-from-active.patch =3D> 0030-corstone1000-boot-index-from=
-active.patch} (64%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-sandbox64-add-support-for-NVMXIP-QSPI.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0041-corston=
e1000-enable-PSCI-reset.patch =3D> 0031-corstone1000-enable-PSCI-reset.pa=
tch} (50%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0042-Enable-=
EFI-set-get-time-services.patch =3D> 0032-Enable-EFI-set-get-time-service=
s.patch} (52%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-corstone1000-add-boot-index.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch

--=20
2.25.1


