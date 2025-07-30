Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBD3C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:53:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33462.1753876429813475246
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 295852573;
	Wed, 30 Jul 2025 04:53:41 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2324E3F66E;
	Wed, 30 Jul 2025 04:53:48 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 00/13] Add PSA FWU support and capsule generation via EDK2 tooling
Date: Wed, 30 Jul 2025 12:53:14 +0100
Message-Id: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6637

Add PSA FWU support and capsule generation via EDK2 tooling
This changeset introduces major updates to enable PSA Firmware Update (FW=
U)=20
support for the Corstone-1000 platform in meta-arm. It includes changes a=
cross U-Boot,
Trusted Services (TS), and Trusted Firmware-M (TF-M), and integrates EDK2=
 capsule=20
generation tool into the Yocto build flow.

Key highlights:

PSA FWU Implementation:
- Integrates PSA Firmware Update support for Corstone-1000.
- Enables secure and structured firmware delivery through U-Boot, TF-M an=
d TS.
- Includes partial FWU backend implementation in TF-M and capsule process=
ing logic in TS.
- Adds logic to U-Boot to detect and acknowledge FWU capsules.
- Integrates SE-Proxy communication to dispatch update acknowledgments to=
 TS.
- Supports Partial Capsule Update.


EDK2 Capsule Generation Integration:
- Adds support to use EDK2 tool for generating UEFI-compliant update caps=
ules.
- Automates capsule creation through Yocto to streamline update workflows=
.


Removal of Legacy Capsule Update Support:
- Cleans up obsolete capsule update logic from U-Boot, TS, and TF-M layer=
s.
- Removes old out-of-tree patches related to previous update flows for U-=
Boot, TS, and TF-M.


Abdellatif El Khlifi (2):
  arm-bsp/u-boot: corstone1000: Add PSA Firmware Update support (DEN0118
    v1.0A)
  arm-bsp/u-boot: corstone1000: Add rebased features patches

Ali Can Ozaslan (4):
  arm-bsp/trusted-firmware-m: corstone1000: Add Bootloader Abstraction
    Layer (BAL) support
  arm/uefi_capsule: Switch Capsule generation tool from U-Boot to EDK2
  arm-bsp/corstone1000: Support multi-payload capsule generation
  arm/edk2-basetools-native: WORKDIR fix

Harsimran Singh Tungal (7):
  arm-bsp/trusted-firmware-m: corstone1000: Permit FWU calls in
    RSE-COMMS
  arm-bsp/trusted-firmware-m: corstone-1000: Increase PS_MAX_ASSET_SIZE
    and CRYPTO_IOVEC_BUFFER_SIZE for EFI variable support
  arm-bsp: corstone1000: Add PLATFORM_IS_FVP toggle for FVP/FPGA builds
  arm-bsp/trusted-services: corstone1000: PSA FWU implementation
  arm-bsp/trusted-services: corstone-1000: Remove old capsule update
    implementation
  arm-bsp/trusted-firmware-m: corstone1000: Remove patches for old
    capsule update implementation
  arm-bsp/doc: corstone1000: Update architecture document with new PSA
    FWU implementation details

 kas/corstone1000-image-configuration.yml      |    5 +-
 .../conf/machine/corstone1000-fvp.conf        |    2 +
 .../conf/machine/corstone1000-mps3.conf       |    2 +
 .../conf/machine/include/corstone1000.inc     |    4 +-
 .../SystemArchitecturePSAFirmwareUpdate.png   |  Bin 0 -> 47522 bytes
 .../corstone1000/software-architecture.rst    |  117 +-
 .../corstone1000-flash-firmware-image.bb      |  165 +-
 ...stone1000-Align-capsule-UEFI-structs.patch |   97 -
 ...Corstone1000-Enable-firewall-in-FVP.patch} |    0
 ...-CS1000-Increase-ITS-max-asset-size.patch} |    0
 ...-Corstone1000-Fix-NV-counter-writing.patch |   69 -
 ...1000-Increase-RSE_COMMS-buffer-size.patch} |    0
 ...S1000-Increase-buffers-for-EFI-vars.patch} |    0
 ...-CS1000-Increase-flash-PS-area-size.patch} |    0
 ...S1000-Add-multicore-support-for-FVP.patch} |    0
 ...m-Corstone1000-Switch-to-metadata-v2.patch |  202 -
 ...07-Platform-CS1000-Fix-Bank-offsets.patch} |    0
 ...-CS1000-Increase-BL2-partition-size.patch} |    0
 ...Add-PSA_WANT_ALG_SHA_256-definition.patch} |    0
 ...00-Remove-reset-after-capsule-update.patch |   28 -
 ...-CS1000-Add-crypto-configs-for-ADAC.patch} |    0
 ...rm-CS1000-Fix-platform-name-in-logs.patch} |    0
 ...form-CS1000-Remove-unused-BL1-files.patch} |    0
 ...m-CS1000-Fix-compiler-switch-in-BL1.patch} |    0
 ...C312-alignment-of-cc312-differences.patch} |    0
 ...one1000-Allow-FWU-calls-in-RSE-COMMS.patch |   60 +
 ...m-specific-TFM_FWU_BOOTLOADER_LIB-se.patch |   73 +
 ...Platform-CS1000-Enable-FWU-partition.patch |   30 +
 ...000-Remove-duplicated-metadata-write.patch |   61 -
 ...e1000-Implement-Bootloader-Abstracti.patch | 5033 +++++++++++++++++
 ...m-Corstone1000-Increase-buffer-sizes.patch |   40 +
 ...1000-Validate-both-metadata-replicas.patch |  370 --
 ...orstone1000-add-unique-guid-for-mps3.patch |   41 -
 .../trusted-firmware-m-corstone1000.inc       |   40 +-
 .../u-boot/u-boot-corstone1000.inc            |  102 +-
 ...mccc-add-support-for-SMCCCv1.2-x0-x1.patch |  198 -
 ...-pointer-check-to-the-uclass-driver-.patch |   64 +
 ...d-introduce-uuid_str_to_le_bin-funct.patch |  115 -
 ...02-arm_ffa-Add-FFA_MEM_SHARE-support.patch |  598 ++
 ...d-introduce-testcase-for-uuid_str_to.patch |   91 -
 ...-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch |  232 +
 ...5-arm_ffa-introduce-Arm-FF-A-support.patch | 2129 -------
 ...Replace-the-emulator-error-log-with-.patch |   43 +
 ...v15-arm_ffa-introduce-armffa-command.patch |  433 --
 ...Improve-the-readability-of-clearing-.patch |  128 +
 ...m_ffa-introduce-sandbox-FF-A-support.patch | 1311 -----
 ...-sandbox-Add-FFA_MEM_SHARE-emulation.patch |  129 +
 ...-introduce-sandbox-test-cases-for-UC.patch |  338 --
 ..._ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch |  101 +
 ...-introduce-armffa-command-Sandbox-te.patch |   91 -
 ...andbox-Add-FFA_MEM_RECLAIM-emulation.patch |   89 +
 ...-efi-introduce-FF-A-MM-communication.patch |  446 --
 ...fa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch |   68 +
 ...-efi-corstone1000-enable-MM-communic.patch |   29 -
 ..._arm_psa-Initialize-the-update-agent.patch |  439 ++
 ...000-fwu-introduce-EFI-capsule-update.patch |  406 --
 ...-the-FWU-directory-through-get_image.patch |  894 +++
 .../0012-fwu_arm_psa-Add-staging-ABIs.patch   |  722 +++
 ...one1000-remove-guid-check-from-corst.patch |   50 -
 ...rm_psa-Add-set_image-and-get_image_i.patch |  111 +
 ..._arm_psa-Keep-the-FMP-payload-header.patch |   34 +
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |   34 -
 ...-add-get_image_info-for-corstone1000.patch |  120 -
 ...rm_psa-Skip-accepting-the-payload-af.patch |   46 +
 ...ull-pointer-exception-with-get_image.patch |   59 -
 ...wu_arm_psa-Disable-trial-state-handl.patch |   71 +
 ...017-arm-corstone1000-add-mmc-for-fvp.patch |   97 -
 ...arm_psa-Add-FWU-acceptance-mechanism.patch |  310 +
 ...ne1000-add-compressed-kernel-support.patch |   31 -
 .../0018-fwu_arm_psa-Add-ESRT-support.patch   |  219 +
 .../0019-arm-corstone1000-esrt-support.patch  |  222 -
 ...ExitBootService-notification-handler.patch |   54 +
 ...ne1000-enable-distro-booting-command.patch |   25 -
 ...ule-Add-runtime-capsule-flags-checks.patch |   67 +
 ...tone1000-add-fwu-metadata-store-info.patch |   39 -
 ..._psa-corstone1000-Enable-FWU-support.patch |  228 +
 ...tone1000-Perform-bank-logic-when-rea.patch |  143 +
 ...data-make-sure-structures-are-packed.patch |   47 -
 .../0023-corstone1000-add-boot-index.patch    |   39 -
 ...tone1000-Notify-SE-Proxy-SP-on-ExitB.patch |  104 +
 ...adjust-boot-bank-and-kernel-location.patch |   33 -
 ...tone1000-Set-Boot0001-for-on-disk-FW.patch |   59 +
 ...add-nvmxip-fwu-mdata-and-gpt-options.patch |   72 -
 ...00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch |   30 +
 ...0026-corstone1000-Enable-MMC-for-FVP.patch |   94 +
 .../0026-nvmxip-move-header-to-include.patch  |   39 -
 ...stone1000-Enable-secure-boot-configs.patch |   38 +
 ...00-set-kernel_addr-based-on-boot_idx.patch |  132 -
 ...stone1000-Enable-EFI-set_time-config.patch |   35 +
 ...-corstone1000-boot-index-from-active.patch |   38 -
 ...e1000-Enable-set-print-EFI-variables.patch |   37 +
 .../0029-corstone1000-enable-PSCI-reset.patch |   28 -
 ...030-Enable-EFI-set-get-time-services.patch |   30 -
 ...rstone1000-Enable-virtio-net-support.patch |  122 +
 ...00-Fix-unrecognized-filesystem-type.patch} |   15 +-
 ...tone1000-detect-inflated-kernel-size.patch |   26 -
 ...ne1000-ESRT-add-unique-firmware-GUID.patch |   44 -
 ...ne1000-dts-Add-external-system-node.patch} |   10 +-
 ...s-Reserve-memory-for-RSS-comm-point.patch} |   18 +-
 ...to-remove-non-compliant-nodes-and-p.patch} |   33 +-
 ...Call-the-EVT_FT_FIXUP-event-handler.patch} |   39 +-
 ...1000-Purge-U-Boot-specific-DT-nodes.patch} |   33 +-
 ...00-add-signature-device-tree-overlay.patch |   28 -
 ...-enable-authenticated-capsule-config.patch |   25 -
 ...stone1000-purge-remoteproc-DTS-node.patch} |   22 +-
 ...roduce-EFI-authenticated-capsule-upd.patch |   73 -
 ...nables-ondisk-capsule-update-feature.patch |   33 -
 ...-runtime-capsule-update-flags-checks.patch |   56 -
 .../0041-scatter-gather-flag-workaround.patch |   39 -
 ...rstone1000-enable-virtio-net-support.patch |   94 -
 ...i-Fix-bind_smccc_features-psci-check.patch |   57 -
 ...000-set-unique-GUID-for-fvp-and-mps3.patch |   57 -
 ...-efi-corstone1000-fwu-update-RPC-ABI.patch |   75 -
 ...ne1000-Change-MMCOMM-buffer-location.patch |   47 -
 ...corstone1000-Enable-UEFI-Secure-boot.patch |   28 -
 ...dd-secondary-cores-cpu-nodes-for-FVP.patch |   63 -
 .../0050-fwu-Use-metadata-v2.patch            |  105 -
 ...ub-capsule-update-service-components.patch |  378 --
 ...1-Fix-in-AEAD-for-psa-arch-test-254.patch} |    0
 ...0002-Fix-psa-api-crypto-test-no-243.patch} |    0
 .../0003-FMP-Support-in-Corstone1000.patch    |  418 --
 ...ag.patch =3D> 0003-Remove-Werror-flag.patch} |    0
 ..._HAS_ATTEST_PK-define-from-IAT-test.patch} |    0
 ...sizes-compile-time-definitions-user.patch} |    0
 ...0-Use-the-stateless-platform-service.patch |  141 -
 ...0006-Align-PSA-Crypto-with-TF-Mv2.1.patch} |    0
 ...0-Initialize-capsule-update-provider.patch |  106 -
 ...store-UEFI-variable-index-in-chunks.patch} |  140 +-
 ...ne1000-add-client_id-for-FMP-service.patch |   49 -
 .../0008-se-proxy-protobuf-change.patch       |   71 +
 ...e1000-Add-PLATFORM_IS_FVP-toggle-for.patch |   77 +
 ...-FWU-IPC-framework-for-Corstone-1000.patch |  436 ++
 ...mage-state-in-PSA-FWU-M-update-agent.patch |  188 +
 ...fine-PSA-FWU-image-mapping-structure.patch |  128 +
 ...able-index-usage-robust-with-redunda.patch |  716 ---
 ...C-psa_fwu_install-return-value-check.patch |   31 +
 ...traints-of-NV-UEFI-variables-persist.patch |  387 --
 .../0014-fwu-Add-EFI-ESRT-v1-support.patch    |  178 +
 ...orm-corstone1000-Enable-ESRT-support.patch |  129 +
 .../0015-se-proxy-protobuf-change.patch       |   64 -
 ...orstone1000-Add-event-provider-proxy.patch |  289 +
 ...ne1000-Define-GUID-for-each-payloads.patch |  141 +
 ...e-com-buffer-address-and-page-count.patch} |   27 +-
 .../trusted-services/ts-arm-platforms.inc     |   34 +-
 meta-arm/classes/uefi_capsule.bbclass         |   93 +-
 meta-arm/conf/layer.conf                      |    3 +
 .../uefi/edk2-basetools-native_202502.bb      |    2 +-
 .../scripts/generate_capsule_json_multiple.py |  142 +
 148 files changed, 12929 insertions(+), 11031 deletions(-)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/System=
ArchitecturePSAFirmwareUpdate.png
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
003-Platform-Corstone1000-Enable-firewall-in-FVP.patch =3D> 0001-Platform=
-Corstone1000-Enable-firewall-in-FVP.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Platform-CS1000-Increase-ITS-max-asset-size.patch =3D> 0002-Platform-=
CS1000-Increase-ITS-max-asset-size.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Fix-NV-counter-writing.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch =3D> 0003-Platfo=
rm-CS1000-Increase-RSE_COMMS-buffer-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch =3D> 0004-Platfor=
m-CS1000-Increase-buffers-for-EFI-vars.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
008-Platform-CS1000-Increase-flash-PS-area-size.patch =3D> 0005-Platform-=
CS1000-Increase-flash-PS-area-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
010-platform-CS1000-Add-multicore-support-for-FVP.patch =3D> 0006-platfor=
m-CS1000-Add-multicore-support-for-FVP.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-Plaform-Corstone1000-Switch-to-metadata-v2.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
011-Platform-CS1000-Fix-Bank-offsets.patch =3D> 0007-Platform-CS1000-Fix-=
Bank-offsets.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-Platform-CS1000-Increase-BL2-partition-size.patch =3D> 0008-Platform-=
CS1000-Increase-BL2-partition-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch =3D> 0009-CC312-=
ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-corstone1000-Remove-reset-after-capsule-update.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch =3D> 0010-Platform-=
CS1000-Add-crypto-configs-for-ADAC.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-Platform-CS1000-Fix-platform-name-in-logs.patch =3D> 0011-Platform-CS=
1000-Fix-platform-name-in-logs.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
017-Platform-CS1000-Remove-unused-BL1-files.patch =3D> 0012-Platform-CS10=
00-Remove-unused-BL1-files.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch =3D> 0013-Platform-C=
S1000-Fix-compiler-switch-in-BL1.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
022-CC312-alignment-of-cc312-differences.patch =3D> 0014-CC312-alignment-=
of-cc312-differences.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-Platform-CS1000-Enable-FWU-partition.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-Platform-CS1000-Remove-duplicated-metadata-write.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0019-Platform-Corstone1000-Increase-buffer-sizes.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0020-Platform-CS1000-Validate-both-metadata-replicas.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0021-platform-corstone1000-add-unique-guid-for-mps3.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
001-FF-A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
001-arm_ffa-Add-NULL-pointer-check-to-the-uclass-driver-.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
002-FF-A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
002-arm_ffa-Add-FFA_MEM_SHARE-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-arm_ffa-sandbox-Replace-the-emulator-error-log-with-.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-FF-A-v15-arm_ffa-introduce-armffa-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-arm_ffa-sandbox-Improve-the-readability-of-clearing-.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
006-arm_ffa-sandbox-Add-FFA_MEM_SHARE-emulation.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-arm_ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
008-FF-A-v15-arm_ffa-introduce-armffa-command-Sandbox-te.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
008-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-emulation.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
009-FF-A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
009-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-fwu_arm_psa-Initialize-the-update-agent.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
011-efi-corstone1000-fwu-introduce-EFI-capsule-update.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
011-fwu_arm_psa-Read-the-FWU-directory-through-get_image.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
012-fwu_arm_psa-Add-staging-ABIs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
013-efi_loader-corstone1000-remove-guid-check-from-corst.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
013-efi_loader-fwu_arm_psa-Add-set_image-and-get_image_i.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
014-efi_loader-fwu_arm_psa-Keep-the-FMP-payload-header.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
014-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
015-efi_firmware-add-get_image_info-for-corstone1000.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
015-efi_loader-fwu_arm_psa-Skip-accepting-the-payload-af.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
016-efi_loader-fix-null-pointer-exception-with-get_image.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
016-efi_loader-fwu-fwu_arm_psa-Disable-trial-state-handl.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
017-arm-corstone1000-add-mmc-for-fvp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
017-fwu_arm_psa-Add-FWU-acceptance-mechanism.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
018-corstone1000-add-compressed-kernel-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
018-fwu_arm_psa-Add-ESRT-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
019-arm-corstone1000-esrt-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
019-fwu_arm_psa-Add-ExitBootService-notification-handler.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
020-corstone1000-enable-distro-booting-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
020-efi_loader-capsule-Add-runtime-capsule-flags-checks.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
021-corstone1000-add-fwu-metadata-store-info.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
021-fwu_arm_psa-corstone1000-Enable-FWU-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
022-fwu_arm_psa-corstone1000-Perform-bank-logic-when-rea.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
022-fwu_metadata-make-sure-structures-are-packed.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
023-corstone1000-add-boot-index.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
023-fwu_arm_psa-corstone1000-Notify-SE-Proxy-SP-on-ExitB.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
024-corstone1000-adjust-boot-bank-and-kernel-location.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
024-fwu_arm_psa-corstone1000-Set-Boot0001-for-on-disk-FW.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-corstone1000-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
026-corstone1000-Enable-MMC-for-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
026-nvmxip-move-header-to-include.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-corstone1000-Enable-secure-boot-configs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-corstone1000-set-kernel_addr-based-on-boot_idx.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-corstone1000-Enable-EFI-set_time-config.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-corstone1000-boot-index-from-active.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-corstone1000-Enable-set-print-EFI-variables.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-corstone1000-enable-PSCI-reset.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-Enable-EFI-set-get-time-services.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-corstone1000-Enable-virtio-net-support.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0012-arm-cor=
stone1000-fix-unrecognized-filesystem-type.patch =3D> 0031-arm-corstone10=
00-Fix-unrecognized-filesystem-type.patch} (64%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-corstone1000-detect-inflated-kernel-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
032-corstone1000-ESRT-add-unique-firmware-GUID.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0047-corston=
e1000-dts-add-external-system-node.patch =3D> 0032-corstone1000-dts-Add-e=
xternal-system-node.patch} (79%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0052-reserve=
-memory-for-se-comm.patch =3D> 0033-arm-bsp-u-boot-dts-Reserve-memory-for=
-RSS-comm-point.patch} (75%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0033-dt-Prov=
ide-a-way-to-remove-non-compliant-nodes-and-p.patch =3D> 0034-dt-Provide-=
a-way-to-remove-non-compliant-nodes-and-p.patch} (83%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0034-bootefi=
-Call-the-EVT_FT_FIXUP-event-handler.patch =3D> 0035-bootefi-Call-the-EVT=
_FT_FIXUP-event-handler.patch} (53%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0035-corston=
e1000-purge-U-Boot-specific-DT-nodes.patch =3D> 0036-corstone1000-Purge-U=
-Boot-specific-DT-nodes.patch} (57%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
036-corstone1000-add-signature-device-tree-overlay.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
037-corstone1000-enable-authenticated-capsule-config.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0051-corston=
e1000-purge-remoteproc-dts-node.patch =3D> 0037-corstone1000-purge-remote=
proc-DTS-node.patch} (62%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
038-corstone1000-introduce-EFI-authenticated-capsule-upd.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-enables-ondisk-capsule-update-feature.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-fix-runtime-capsule-update-flags-checks.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
041-scatter-gather-flag-workaround.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
042-corstone1000-enable-virtio-net-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-firmware-psci-Fix-bind_smccc_features-psci-check.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
045-efi-corstone1000-fwu-update-RPC-ABI.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
046-Corstone1000-Change-MMCOMM-buffer-location.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
048-corstone1000-Enable-UEFI-Secure-boot.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
050-fwu-Use-metadata-v2.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-Add-stub-capsule-update-service-components.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0002=
-Fix-in-AEAD-for-psa-arch-test-254.patch =3D> 0001-Fix-in-AEAD-for-psa-ar=
ch-test-254.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0004=
-Fix-psa-api-crypto-test-no-243.patch =3D> 0002-Fix-psa-api-crypto-test-n=
o-243.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0003-FMP-Support-in-Corstone1000.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0008=
-Remove-Werror-flag.patch =3D> 0003-Remove-Werror-flag.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0009=
-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch =3D> 0004-Remov=
e-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0010=
-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch =3D> 0005-Mak=
e-RSS-and-MHU-sizes-compile-time-definitions-user.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-plat-corstone1000-Use-the-stateless-platform-service.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0011=
-Align-PSA-Crypto-with-TF-Mv2.1.patch =3D> 0006-Align-PSA-Crypto-with-TF-=
Mv2.1.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-plat-corstone1000-Initialize-capsule-update-provider.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0013=
-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch =3D> 0007-Reve=
rt-Load-and-store-UEFI-variable-index-in-chunks.patch} (74%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-plat-corstone1000-add-client_id-for-FMP-service.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-se-proxy-protobuf-change.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Revert-Make-variable-index-usage-robust-with-redunda.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-fwu-Add-EFI-ESRT-v1-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-platform-corstone1000-Enable-ESRT-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-se-proxy-protobuf-change.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-platform-corstone1000-Add-event-provider-proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-platform-corstone1000-Define-GUID-for-each-payloads.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0016=
-Add-the-com-buffer-address-and-page-count.patch =3D> 0018-Add-the-com-bu=
ffer-address-and-page-count.patch} (60%)
 create mode 100644 meta-arm/scripts/generate_capsule_json_multiple.py


