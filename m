Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE7FC87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33478.1753876440759178432
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54FDE2573;
	Wed, 30 Jul 2025 04:53:52 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B8D83F66E;
	Wed, 30 Jul 2025 04:53:59 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 10/13] arm-bsp/u-boot: corstone1000: Add PSA Firmware Update support (DEN0118 v1.0A)
Date: Wed, 30 Jul 2025 12:53:24 +0100
Message-Id: <20250730115327.3671160-11-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6647

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Add PSA FWU support on U-Boot v2025.04

Introduce Platform Security Architecture (PSA) Firmware Update (FWU) supp=
ort to
U-Boot v2025.04 on the Corstone-1000 reference design. This implements th=
e
Arm DEN0118 v1.0A specification and provides a generic, upstreamable FWU
framework for reuse across other Arm platforms.

Design overview:

Client/Runner: U-Boot parses the capsule and  executes the FWU state mach=
ine.

Update agent: Secure world handles flash writes and metadata updates.

Key features:

- Capsule-based firmware updates with support for multiple payloads
- On-disk capsule handling (ESP-based update)
- Optional image acceptance at ExitBootServices()
- ESRT (EFI System Resource Table) support
- FFA_MEM_SHARE and FFA_MEM_RECLAIM ABI support
- FWU enabled for the Corstone-1000 platform

[1]: Platform Security Firmware Update for the A-profile Arm Architecture=
,
    https://developer.arm.com/documentation/den0118/latest/

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |    4 +-
 .../u-boot/u-boot-corstone1000.inc            |   83 +-
 ...mccc-add-support-for-SMCCCv1.2-x0-x1.patch |  198 --
 ...-pointer-check-to-the-uclass-driver-.patch |   64 +
 ...d-introduce-uuid_str_to_le_bin-funct.patch |  115 -
 ...02-arm_ffa-Add-FFA_MEM_SHARE-support.patch |  598 +++++
 ...d-introduce-testcase-for-uuid_str_to.patch |   91 -
 ...-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch |  232 ++
 ...5-arm_ffa-introduce-Arm-FF-A-support.patch | 2129 -----------------
 ...Replace-the-emulator-error-log-with-.patch |   43 +
 ...v15-arm_ffa-introduce-armffa-command.patch |  433 ----
 ...Improve-the-readability-of-clearing-.patch |  128 +
 ...m_ffa-introduce-sandbox-FF-A-support.patch | 1311 ----------
 ...-sandbox-Add-FFA_MEM_SHARE-emulation.patch |  129 +
 ...-introduce-sandbox-test-cases-for-UC.patch |  338 ---
 ..._ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch |  101 +
 ...-introduce-armffa-command-Sandbox-te.patch |   91 -
 ...andbox-Add-FFA_MEM_RECLAIM-emulation.patch |   89 +
 ...-efi-introduce-FF-A-MM-communication.patch |  446 ----
 ...fa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch |   68 +
 ...-efi-corstone1000-enable-MM-communic.patch |   29 -
 ..._arm_psa-Initialize-the-update-agent.patch |  439 ++++
 ...000-fwu-introduce-EFI-capsule-update.patch |  406 ----
 ...-the-FWU-directory-through-get_image.patch |  894 +++++++
 ...000-fix-unrecognized-filesystem-type.patch |   28 -
 .../0012-fwu_arm_psa-Add-staging-ABIs.patch   |  722 ++++++
 ...one1000-remove-guid-check-from-corst.patch |   50 -
 ...rm_psa-Add-set_image-and-get_image_i.patch |  111 +
 ..._arm_psa-Keep-the-FMP-payload-header.patch |   34 +
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |   34 -
 ...-add-get_image_info-for-corstone1000.patch |  120 -
 ...rm_psa-Skip-accepting-the-payload-af.patch |   46 +
 ...ull-pointer-exception-with-get_image.patch |   59 -
 ...wu_arm_psa-Disable-trial-state-handl.patch |   71 +
 ...017-arm-corstone1000-add-mmc-for-fvp.patch |   97 -
 ...arm_psa-Add-FWU-acceptance-mechanism.patch |  310 +++
 ...ne1000-add-compressed-kernel-support.patch |   31 -
 .../0018-fwu_arm_psa-Add-ESRT-support.patch   |  219 ++
 .../0019-arm-corstone1000-esrt-support.patch  |  222 --
 ...ExitBootService-notification-handler.patch |   54 +
 ...ne1000-enable-distro-booting-command.patch |   25 -
 ...ule-Add-runtime-capsule-flags-checks.patch |   67 +
 ...tone1000-add-fwu-metadata-store-info.patch |   39 -
 ..._psa-corstone1000-Enable-FWU-support.patch |  228 ++
 ...tone1000-Perform-bank-logic-when-rea.patch |  143 ++
 ...data-make-sure-structures-are-packed.patch |   47 -
 .../0023-corstone1000-add-boot-index.patch    |   39 -
 ...tone1000-Notify-SE-Proxy-SP-on-ExitB.patch |  104 +
 ...adjust-boot-bank-and-kernel-location.patch |   33 -
 ...tone1000-Set-Boot0001-for-on-disk-FW.patch |   59 +
 ...add-nvmxip-fwu-mdata-and-gpt-options.patch |   72 -
 .../0026-nvmxip-move-header-to-include.patch  |   39 -
 ...00-set-kernel_addr-based-on-boot_idx.patch |  132 -
 ...-corstone1000-boot-index-from-active.patch |   38 -
 .../0029-corstone1000-enable-PSCI-reset.patch |   28 -
 ...030-Enable-EFI-set-get-time-services.patch |   30 -
 ...tone1000-detect-inflated-kernel-size.patch |   26 -
 ...ne1000-ESRT-add-unique-firmware-GUID.patch |   44 -
 ...-to-remove-non-compliant-nodes-and-p.patch |  134 --
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch |   53 -
 ...e1000-purge-U-Boot-specific-DT-nodes.patch |   48 -
 ...00-add-signature-device-tree-overlay.patch |   28 -
 ...-enable-authenticated-capsule-config.patch |   25 -
 ...roduce-EFI-authenticated-capsule-upd.patch |   73 -
 ...nables-ondisk-capsule-update-feature.patch |   33 -
 ...-runtime-capsule-update-flags-checks.patch |   56 -
 .../0041-scatter-gather-flag-workaround.patch |   39 -
 ...rstone1000-enable-virtio-net-support.patch |   94 -
 ...i-Fix-bind_smccc_features-psci-check.patch |   57 -
 ...000-set-unique-GUID-for-fvp-and-mps3.patch |   57 -
 ...-efi-corstone1000-fwu-update-RPC-ABI.patch |   75 -
 ...ne1000-Change-MMCOMM-buffer-location.patch |   47 -
 ...one1000-dts-add-external-system-node.patch |   34 -
 ...corstone1000-Enable-UEFI-Secure-boot.patch |   28 -
 ...dd-secondary-cores-cpu-nodes-for-FVP.patch |   63 -
 .../0050-fwu-Use-metadata-v2.patch            |  105 -
 ...rstone1000-purge-remoteproc-dts-node.patch |   34 -
 .../0052-reserve-memory-for-se-comm.patch     |   46 -
 78 files changed, 4982 insertions(+), 8007 deletions(-)
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
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
012-arm-corstone1000-fix-unrecognized-filesystem-type.patch
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
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
026-nvmxip-move-header-to-include.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-corstone1000-set-kernel_addr-based-on-boot_idx.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-corstone1000-boot-index-from-active.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-corstone1000-enable-PSCI-reset.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-Enable-EFI-set-get-time-services.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-corstone1000-detect-inflated-kernel-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
032-corstone1000-ESRT-add-unique-firmware-GUID.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
033-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
034-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-corstone1000-purge-U-Boot-specific-DT-nodes.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
036-corstone1000-add-signature-device-tree-overlay.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
037-corstone1000-enable-authenticated-capsule-config.patch
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
047-corstone1000-dts-add-external-system-node.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
048-corstone1000-Enable-UEFI-Secure-boot.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
050-fwu-Use-metadata-v2.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
051-corstone1000-purge-remoteproc-dts-node.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
052-reserve-memory-for-se-comm.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index ecaea64d..af077083 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -23,8 +23,8 @@ TS_SP_SE_PROXY_CONFIG =3D "corstone1000"
 # Include smm-gateway and se-proxy SPs into optee-os binary
 MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
=20
-# u-boot
-PREFERRED_VERSION_u-boot ?=3D "2023.07%"
+# U-Boot
+PREFERRED_VERSION_u-boot ?=3D "2025.04%"
 MACHINE_FEATURES +=3D "efi"
 EFI_PROVIDER ?=3D "grub-efi"
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index bb9da10d..e19034f7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -15,70 +15,41 @@ UBOOT_EXTLINUX =3D "0"
=20
 SYSROOT_DIRS:append =3D " /boot"
=20
+# FWU patches
 SRC_URI:append =3D " \
-    file://0001-FF-A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.pat=
ch \
-    file://0002-FF-A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct.pat=
ch \
-    file://0003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.pat=
ch \
-    file://0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch \
-    file://0005-FF-A-v15-arm_ffa-introduce-armffa-command.patch \
-    file://0006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch \
-    file://0007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.pat=
ch \
-    file://0008-FF-A-v15-arm_ffa-introduce-armffa-command-Sandbox-te.pat=
ch \
-    file://0009-FF-A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.pat=
ch \
-    file://0010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.pat=
ch \
-    file://0011-efi-corstone1000-fwu-introduce-EFI-capsule-update.patch =
\
-    file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.patch =
\
-    file://0013-efi_loader-corstone1000-remove-guid-check-from-corst.pat=
ch \
-    file://0014-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.pat=
ch \
-    file://0015-efi_firmware-add-get_image_info-for-corstone1000.patch \
-    file://0016-efi_loader-fix-null-pointer-exception-with-get_image.pat=
ch \
-    file://0017-arm-corstone1000-add-mmc-for-fvp.patch \
-    file://0018-corstone1000-add-compressed-kernel-support.patch \
-    file://0019-arm-corstone1000-esrt-support.patch \
-    file://0020-corstone1000-enable-distro-booting-command.patch \
-    file://0021-corstone1000-add-fwu-metadata-store-info.patch \
-    file://0022-fwu_metadata-make-sure-structures-are-packed.patch \
-    file://0023-corstone1000-add-boot-index.patch \
-    file://0024-corstone1000-adjust-boot-bank-and-kernel-location.patch =
\
-    file://0025-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =
\
-    file://0026-nvmxip-move-header-to-include.patch \
-    file://0027-corstone1000-set-kernel_addr-based-on-boot_idx.patch \
-    file://0028-corstone1000-boot-index-from-active.patch \
-    file://0029-corstone1000-enable-PSCI-reset.patch \
-    file://0030-Enable-EFI-set-get-time-services.patch \
-    file://0031-corstone1000-detect-inflated-kernel-size.patch \
-    file://0032-corstone1000-ESRT-add-unique-firmware-GUID.patch \
-    file://0033-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.pat=
ch \
-    file://0034-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
-    file://0035-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
-    file://0036-corstone1000-add-signature-device-tree-overlay.patch \
-    file://0037-corstone1000-enable-authenticated-capsule-config.patch \
-    file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.pat=
ch \
-    file://0039-enables-ondisk-capsule-update-feature.patch		  \
-    file://0040-fix-runtime-capsule-update-flags-checks.patch		  \
-    file://0041-scatter-gather-flag-workaround.patch			  \
-    file://0042-corstone1000-enable-virtio-net-support.patch		  \
-    file://0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch		=
  \
-    file://0044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch		  \
-    file://0045-efi-corstone1000-fwu-update-RPC-ABI.patch			  \
-    file://0046-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
-    file://0047-corstone1000-dts-add-external-system-node.patch \
-    file://0048-corstone1000-Enable-UEFI-Secure-boot.patch 			  \
-    file://0049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch=
	  \
-    file://0050-fwu-Use-metadata-v2.patch	  \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', \
-                         '', 'file://0051-corstone1000-purge-remoteproc-=
dts-node.patch' , d)} \
-    file://0052-reserve-memory-for-se-comm.patch \
+    file://0001-arm_ffa-Add-NULL-pointer-check-to-the-uclass-driver-.pat=
ch \
+    file://0002-arm_ffa-Add-FFA_MEM_SHARE-support.patch                 =
   \
+    file://0003-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch               =
   \
+    file://0004-arm_ffa-sandbox-Replace-the-emulator-error-log-with-.pat=
ch \
+    file://0005-arm_ffa-sandbox-Improve-the-readability-of-clearing-.pat=
ch \
+    file://0006-arm_ffa-sandbox-Add-FFA_MEM_SHARE-emulation.patch       =
   \
+    file://0007-arm_ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch           =
   \
+    file://0008-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-emulation.patch     =
   \
+    file://0009-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch         =
   \
+    file://0010-fwu_arm_psa-Initialize-the-update-agent.patch           =
   \
+    file://0011-fwu_arm_psa-Read-the-FWU-directory-through-get_image.pat=
ch \
+    file://0012-fwu_arm_psa-Add-staging-ABIs.patch                      =
   \
+    file://0013-efi_loader-fwu_arm_psa-Add-set_image-and-get_image_i.pat=
ch \
+    file://0014-efi_loader-fwu_arm_psa-Keep-the-FMP-payload-header.patch=
   \
+    file://0015-efi_loader-fwu_arm_psa-Skip-accepting-the-payload-af.pat=
ch \
+    file://0016-efi_loader-fwu-fwu_arm_psa-Disable-trial-state-handl.pat=
ch \
+    file://0017-fwu_arm_psa-Add-FWU-acceptance-mechanism.patch          =
   \
+    file://0018-fwu_arm_psa-Add-ESRT-support.patch                      =
   \
+    file://0019-fwu_arm_psa-Add-ExitBootService-notification-handler.pat=
ch \
+    file://0020-efi_loader-capsule-Add-runtime-capsule-flags-checks.patc=
h  \
+    file://0021-fwu_arm_psa-corstone1000-Enable-FWU-support.patch       =
   \
+    file://0022-fwu_arm_psa-corstone1000-Perform-bank-logic-when-rea.pat=
ch \
+    file://0023-fwu_arm_psa-corstone1000-Notify-SE-Proxy-SP-on-ExitB.pat=
ch \
+    file://0024-fwu_arm_psa-corstone1000-Set-Boot0001-for-on-disk-FW.pat=
ch \
     "
=20
 do_configure:append() {
-    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout =
${B}/CRT.key -out ${B}/CRT.crt -nodes -days 365
-    cert-to-efi-sig-list ${B}/CRT.crt ${B}/corstone1000_defconfig/CRT.es=
l
+   openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out ${B}/corstone1000_defconfig/CRT.crt -nodes -days 365
 }
=20
 FILES:${PN} +=3D "/corstone1000_capsule_*"
 do_install:append() {
-   install -D -p -m 0644 ${B}/CRT.crt ${D}/corstone1000_capsule_cert.crt
+   install -D -p -m 0644 ${B}/corstone1000_defconfig/CRT.crt ${D}/corsto=
ne1000_capsule_cert.crt
    install -D -p -m 0644 ${B}/CRT.key ${D}/corstone1000_capsule_key.key
 }
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-=
A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-arm64-smccc-add-suppor=
t-for-SMCCCv1.2-x0-x1.patch
deleted file mode 100644
index 0e467a85..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-a=
rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-From cc651db9a1370e697fd2525ce58b81ff7e112474 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH] FF-A v15: arm64: smccc: add support for SMCCCv1.2 x0-x1=
7
- registers
-
-add support for x0-x17 registers used by the SMC calls
-
-In SMCCC v1.2 [1] arguments are passed in registers x1-x17.
-Results are returned in x0-x17.
-
-This work is inspired from the following kernel commit:
-
-arm64: smccc: Add support for SMCCCv1.2 extended input/output registers
-
-[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4=
c6?token=3D
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- arch/arm/cpu/armv8/smccc-call.S | 57 ++++++++++++++++++++++++++++++++-
- arch/arm/lib/asm-offsets.c      | 16 +++++++++
- include/linux/arm-smccc.h       | 45 ++++++++++++++++++++++++++
- 3 files changed, 117 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
-index dc92b28777..93f66d3366 100644
---- a/arch/arm/cpu/armv8/smccc-call.S
-+++ b/arch/arm/cpu/armv8/smccc-call.S
-@@ -1,7 +1,11 @@
- /* SPDX-License-Identifier: GPL-2.0 */
- /*
-  * Copyright (c) 2015, Linaro Limited
-- */
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+*/
- #include <linux/linkage.h>
- #include <linux/arm-smccc.h>
- #include <generated/asm-offsets.h>
-@@ -45,3 +49,54 @@ ENDPROC(__arm_smccc_smc)
- ENTRY(__arm_smccc_hvc)
- 	SMCCC	hvc
- ENDPROC(__arm_smccc_hvc)
-+
-+#ifdef CONFIG_ARM64
-+
-+	.macro SMCCC_1_2 instr
-+	/* Save `res` and free a GPR that won't be clobbered */
-+	stp     x1, x19, [sp, #-16]!
-+
-+	/* Ensure `args` won't be clobbered while loading regs in next step */
-+	mov	x19, x0
-+
-+	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
-+	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	\instr #0
-+
-+	/* Load the `res` from the stack */
-+	ldr	x19, [sp]
-+
-+	/* Store the registers x0 - x17 into the result structure */
-+	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	/* Restore original x19 */
-+	ldp     xzr, x19, [sp], #16
-+	ret
-+	.endm
-+
-+/*
-+ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+ENTRY(arm_smccc_1_2_smc)
-+	SMCCC_1_2 smc
-+ENDPROC(arm_smccc_1_2_smc)
-+
-+#endif
-diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
-index 6de0ce9152..181a8ac4c2 100644
---- a/arch/arm/lib/asm-offsets.c
-+++ b/arch/arm/lib/asm-offsets.c
-@@ -9,6 +9,11 @@
-  * generate asm statements containing #defines,
-  * compile this file to assembler, and then extract the
-  * #defines from the assembly-language output.
-+ *
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #include <common.h>
-@@ -90,6 +95,17 @@ int main(void)
- 	DEFINE(ARM_SMCCC_RES_X2_OFFS, offsetof(struct arm_smccc_res, a2));
- 	DEFINE(ARM_SMCCC_QUIRK_ID_OFFS, offsetof(struct arm_smccc_quirk, id));
- 	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, st=
ate));
-+#ifdef CONFIG_ARM64
-+	DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a0));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a2));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a4));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a6));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a8));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a10));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a12));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a14));
-+	DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a16));
-+#endif
- #endif
-=20
- 	return 0;
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index e1d09884a1..f44e9e8f93 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -1,6 +1,10 @@
- /* SPDX-License-Identifier: GPL-2.0 */
- /*
-  * Copyright (c) 2015, Linaro Limited
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
- #ifndef __LINUX_ARM_SMCCC_H
- #define __LINUX_ARM_SMCCC_H
-@@ -70,6 +74,47 @@ struct arm_smccc_res {
- 	unsigned long a3;
- };
-=20
-+#ifdef CONFIG_ARM64
-+/**
-+ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
-+ * @a0-a17 argument values from registers 0 to 17
-+ */
-+struct arm_smccc_1_2_regs {
-+	unsigned long a0;
-+	unsigned long a1;
-+	unsigned long a2;
-+	unsigned long a3;
-+	unsigned long a4;
-+	unsigned long a5;
-+	unsigned long a6;
-+	unsigned long a7;
-+	unsigned long a8;
-+	unsigned long a9;
-+	unsigned long a10;
-+	unsigned long a11;
-+	unsigned long a12;
-+	unsigned long a13;
-+	unsigned long a14;
-+	unsigned long a15;
-+	unsigned long a16;
-+	unsigned long a17;
-+};
-+
-+/**
-+ * arm_smccc_1_2_smc() - make SMC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make SMC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the SMC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the SMC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+#endif
-+
- /**
-  * struct arm_smccc_quirk - Contains quirk information
-  * @id: quirk identification
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm=
_ffa-Add-NULL-pointer-check-to-the-uclass-driver-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Add-NULL-pointer-check-=
to-the-uclass-driver-.patch
new file mode 100644
index 00000000..a2a6f348
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Ad=
d-NULL-pointer-check-to-the-uclass-driver-.patch
@@ -0,0 +1,64 @@
+From 9b001c37347aa8fa5ecbd68f12714a12c74b6ea5 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 30 Oct 2024 14:10:43 +0000
+Subject: [PATCH 01/36] arm_ffa: Add NULL pointer check to the uclass dri=
ver
+ operations
+
+Add NULL pointer check for ops
+
+The device driver can miss defining an operations structure.
+So, ffa_get_ops() can return NULL.
+This commit adds checks for ops in the uclass driver operations
+and an error is returned when ops is NULL.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
+index 96c64964bb7..f8d231204db 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
++++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -954,6 +954,9 @@ int ffa_partition_info_get(struct udevice *dev, cons=
t char *uuid_str,
+ {
+ 	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
+=20
++	if (!ops)
++		return -EINVAL;
++
+ 	if (!ops->partition_info_get)
+ 		return -ENOSYS;
+=20
+@@ -979,6 +982,9 @@ int ffa_sync_send_receive(struct udevice *dev, u16 d=
st_part_id,
+ {
+ 	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
+=20
++	if (!ops)
++		return -EINVAL;
++
+ 	if (!ops->sync_send_receive)
+ 		return -ENOSYS;
+=20
+@@ -1000,6 +1006,9 @@ int ffa_rxtx_unmap(struct udevice *dev)
+ {
+ 	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
+=20
++	if (!ops)
++		return -EINVAL;
++
+ 	if (!ops->rxtx_unmap)
+ 		return -ENOSYS;
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-=
A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-lib-uuid-introduce-uui=
d_str_to_le_bin-funct.patch
deleted file mode 100644
index 2fc5caaf..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-l=
ib-uuid-introduce-uuid_str_to_le_bin-funct.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 4c1eaa36a882f9f921c3bc3b1352bbb04a939c4f Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH] FF-A v15: lib: uuid: introduce uuid_str_to_le_bin funct=
ion
-
-convert UUID string to little endian binary data
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- include/uuid.h | 15 +++++++++++++++
- lib/uuid.c     | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 63 insertions(+)
-
-diff --git a/include/uuid.h b/include/uuid.h
-index 4a4883d3b5..89b93e642b 100644
---- a/include/uuid.h
-+++ b/include/uuid.h
-@@ -2,6 +2,10 @@
- /*
-  * Copyright (C) 2014 Samsung Electronics
-  * Przemyslaw Marczak <p.marczak@samsung.com>
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
- #ifndef __UUID_H__
- #define __UUID_H__
-@@ -44,4 +48,15 @@ int uuid_guid_get_bin(const char *guid_str, unsigned =
char *guid_bin);
- const char *uuid_guid_get_str(const unsigned char *guid_bin);
- void gen_rand_uuid(unsigned char *uuid_bin);
- void gen_rand_uuid_str(char *uuid_str, int str_format);
-+
-+/**
-+ * uuid_str_to_le_bin() - Convert string UUID to little endian binary d=
ata.
-+ * @uuid_str:	pointer to UUID string
-+ * @uuid_bin:	pointer to allocated array for little endian output [16B]
-+ * Return:
-+ *    uuid_bin filled with little endian UUID data
-+ *    On success 0 is returned. Otherwise, failure code.
-+ */
-+int uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin);
-+
- #endif
-diff --git a/lib/uuid.c b/lib/uuid.c
-index 96e1af3c8b..45f325d964 100644
---- a/lib/uuid.c
-+++ b/lib/uuid.c
-@@ -1,6 +1,10 @@
- // SPDX-License-Identifier: GPL-2.0+
- /*
-  * Copyright 2011 Calxeda, Inc.
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #include <common.h>
-@@ -354,6 +358,50 @@ int uuid_str_to_bin(const char *uuid_str, unsigned =
char *uuid_bin,
- 	return 0;
- }
-=20
-+/**
-+ * uuid_str_to_le_bin() - Convert string UUID to little endian binary d=
ata.
-+ * @uuid_str:	pointer to UUID string
-+ * @uuid_bin:	pointer to allocated array for little endian output [16B]
-+ *
-+ * UUID string is 36 characters (36 bytes):
-+ *
-+ * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
-+ *
-+ * where x is a hexadecimal character. Fields are separated by '-'s.
-+ * When converting to a little endian binary UUID, the string fields ar=
e reversed.
-+ *
-+ * Return:
-+ *
-+ *    uuid_bin filled with little endian UUID data
-+ *    On success 0 is returned. Otherwise, failure code.
-+ */
-+int uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin)
-+{
-+	u16 tmp16;
-+	u32 tmp32;
-+	u64 tmp64;
-+
-+	if (!uuid_str_valid(uuid_str) || !uuid_bin)
-+		return -EINVAL;
-+
-+	tmp32 =3D cpu_to_le32(hextoul(uuid_str, NULL));
-+	memcpy(uuid_bin, &tmp32, 4);
-+
-+	tmp16 =3D cpu_to_le16(hextoul(uuid_str + 9, NULL));
-+	memcpy(uuid_bin + 4, &tmp16, 2);
-+
-+	tmp16 =3D cpu_to_le16(hextoul(uuid_str + 14, NULL));
-+	memcpy(uuid_bin + 6, &tmp16, 2);
-+
-+	tmp16 =3D cpu_to_le16(hextoul(uuid_str + 19, NULL));
-+	memcpy(uuid_bin + 8, &tmp16, 2);
-+
-+	tmp64 =3D cpu_to_le64(simple_strtoull(uuid_str + 24, NULL, 16));
-+	memcpy(uuid_bin + 10, &tmp64, 6);
-+
-+	return 0;
-+}
-+
- /*
-  * uuid_bin_to_str() - convert big endian binary data to string UUID or=
 GUID.
-  *
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm=
_ffa-Add-FFA_MEM_SHARE-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-=
boot/corstone1000/0002-arm_ffa-Add-FFA_MEM_SHARE-support.patch
new file mode 100644
index 00000000..68578e32
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm_ffa-Ad=
d-FFA_MEM_SHARE-support.patch
@@ -0,0 +1,598 @@
+From 7d4fbdc82bb004a4a7852016f94b56a82a9c3e7e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Tue, 29 Oct 2024 17:22:35 +0000
+Subject: [PATCH 02/36] arm_ffa: Add FFA_MEM_SHARE support
+
+Add to the FF-A bus FFA_MEM_SHARE ABI
+
+The FFA_MEM_SHARE is a memory management ABI described in the FF-A v1.0
+specification [1].
+
+This ABI starts a transaction to grant access to a memory region
+to one or more Borrowers (aka Secure Partitions or endpoints).
+
+This work is based on the implementation in Linux kernel [2].
+
+[1]: https://developer.arm.com/documentation/den0077/a/?lang=3Den
+[2]: commit cc2195fe536c28e192df5d07e6dd277af36814b4
+     Files: drivers/firmware/arm_ffa/driver.c , include/linux/arm_ffa.h
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ doc/arch/arm64.ffa.rst                    |   2 +
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c | 210 ++++++++++++++++++++++
+ drivers/firmware/arm-ffa/arm-ffa.c        |   3 +-
+ include/arm_ffa.h                         |  86 ++++++++-
+ include/arm_ffa_priv.h                    | 142 ++++++++++++++-
+ 5 files changed, 439 insertions(+), 4 deletions(-)
+
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+index f966f8ba6af..3eec735d741 100644
+--- a/doc/arch/arm64.ffa.rst
++++ b/doc/arch/arm64.ffa.rst
+@@ -185,6 +185,7 @@ The following features are provided:
+     - FFA_INTERRUPT
+     - FFA_MSG_SEND_DIRECT_REQ
+     - FFA_MSG_SEND_DIRECT_RESP
++    - FFA_MEM_SHARE
+=20
+ - Support for the 64-bit version of the following ABIs:
+=20
+@@ -203,6 +204,7 @@ The following features are provided:
+     - ffa_partition_info_get
+     - ffa_sync_send_receive
+     - ffa_rxtx_unmap
++    - ffa_memory_share
+=20
+ - FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
+   with the driver
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
+index f8d231204db..2ba0b925fa6 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
++++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+@@ -95,6 +95,20 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_C=
OUNT] =3D {
+ 			"DENIED: Buffer pair already registered",
+ 		},
+ 	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_MEM_SHARE)] =3D {
++		{
++			[ABORTED] =3D
++			"ABORTED: Failure in the transmission of fragments or in time slicin=
g",
++			[INVALID_PARAMETERS] =3D
++			"INVALID_PARAMETERS: Validation failed for the Memory Transaction or=
 the Endpoint memory access descriptor",
++			[NO_MEMORY] =3D
++			"NO_MEMORY: Insufficient memory to complete this operation",
++			[BUSY] =3D
++			"BUSY: The TX buffer is busy",
++			[DENIED] =3D
++			"DENIED: Memory region ownership, permission, access or attributes e=
rror",
++		},
++	},
+ };
+=20
+ /**
+@@ -929,6 +943,177 @@ int ffa_msg_send_direct_req_hdlr(struct udevice *d=
ev, u16 dst_part_id,
+ 	return ffa_to_std_errno(ffa_errno);
+ }
+=20
++/**
++ * ffa_mem_desc_offset() - helper for descriptors offset calculation
++ * @count: An integer defining the number of Endpoint memory access des=
criptors
++ *
++ * Calculate the offset of the Endpoint memory access descriptor and
++ * the Composite memory region descriptor.
++ *
++ * Return:
++ *
++ * The descriptor offset.
++ */
++static inline u32 ffa_mem_desc_offset(int count)
++{
++	u32 offset =3D count * sizeof(struct ffa_mem_region_attributes);
++
++	offset +=3D sizeof(struct ffa_mem_region);
++
++	return offset;
++}
++
++/**
++ * ffa_setup_and_transmit() - set up the memory and transmit data using=
 FF-A
++ * @dev: The FF-A bus device
++ * @func_id: An integer identifying the function
++ * @buffer: A pointer to the data to be transmitted (FF-A TX buffer)
++ * @args: A pointer to a structure containing additional user arguments
++ *
++ * Setup the memory transaction related to the access to a specified
++ * memory region.
++ * Currently we support FFA_MEM_SHARE only.
++ *
++ * Return:
++ *
++ * 0 on success. . Otherwise, failure
++ */
++static int ffa_setup_and_transmit(struct udevice *dev, u32 func_id,
++				  void *buffer, struct ffa_mem_ops_args *args)
++{
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++	u32 composite_offset;
++	u32 total_length;
++	struct ffa_mem_region *mem_region =3D buffer;
++	struct ffa_composite_mem_region *composite;
++	struct ffa_mem_region_addr_range *constituent;
++	struct ffa_mem_region_attributes *ep_mem_access;
++	u32 idx;
++	struct ffa_priv *uc_priv;
++
++	uc_priv =3D dev_get_uclass_priv(dev);
++
++	mem_region->tag =3D args->tag;
++	mem_region->flags =3D args->flags;
++	mem_region->sender_id =3D uc_priv->id;
++
++	/*
++	 * These attributes are only valid for FFA_MEM_SHARE.
++	 * They are not valid for FFA_MEM_LEND (no implemented).
++	 */
++	if (func_id =3D=3D FFA_MEM_SHARE)
++		mem_region->attributes =3D FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK
++				 | FFA_MEM_INNER_SHAREABLE;
++	else
++		mem_region->attributes =3D 0;
++
++	mem_region->handle =3D 0;
++	mem_region->ep_count =3D args->nattrs;
++	mem_region->reserved1 =3D 0;
++	mem_region->reserved2 =3D 0;
++
++	ep_mem_access =3D buffer + ffa_mem_desc_offset(0);
++
++	composite_offset =3D ffa_mem_desc_offset(args->nattrs);
++
++	/* Multiple borrowers supported */
++	for (idx =3D 0; idx < args->nattrs; idx++, ep_mem_access++) {
++		ep_mem_access->receiver =3D args->attrs[idx].receiver;
++		ep_mem_access->attrs =3D args->attrs[idx].attrs;
++		ep_mem_access->composite_off =3D composite_offset;
++		ep_mem_access->flag =3D 0;
++		ep_mem_access->reserved =3D 0;
++	}
++
++	/* Only one Composite and one Constituent memory region supported */
++	composite =3D buffer + composite_offset;
++	composite->total_pg_cnt =3D args->pg_cnt;
++	composite->addr_range_cnt =3D FFA_MEM_CONSTITUENTS;
++	composite->reserved =3D 0;
++
++	constituent =3D &composite->constituents[0];
++	constituent->address =3D map_to_sysmem(args->address);
++	constituent->pg_cnt =3D args->pg_cnt;
++	constituent->reserved =3D 0;
++
++	total_length =3D composite_offset + sizeof(*composite) +
++		sizeof(*constituent);
++
++	/*
++	 * Note: Time slicing is not supported.
++	 * It's only available to EL1 and S-EL1 endpoints.
++	 */
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(func_id),
++			.a1 =3D total_length,
++			.a2 =3D total_length,
++			.a3 =3D 0, /* the TX buffer is used */
++			.a4 =3D 0, /* the TX buffer is used */
++			},
++			&res
++	);
++
++	if (res.a0 !=3D FFA_SMC_32(FFA_SUCCESS)) {
++		ffa_errno =3D res.a2;
++		ffa_print_error_log(func_id, ffa_errno);
++		return ffa_to_std_errno(ffa_errno);
++	}
++
++	args->g_handle =3D PACK_HANDLE(res.a2, res.a3);
++	return 0;
++}
++
++/**
++ * ffa_memory_ops() - wrapper for the memory management ABIs
++ * @dev: The FF-A bus device
++ * @func_id: An integer identifying the function
++ * @args: A pointer to a structure containing additional user arguments
++ *
++ * Verify the use of the TX buffer then call ffa_setup_and_transmit().
++ * Currently we support FFA_MEM_SHARE only.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_memory_ops(struct udevice *dev, u32 func_id,
++			  struct ffa_mem_ops_args *args)
++{
++	void *buffer;
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	if (!args->use_txbuf) {
++		log_err("only TX buffer supported\n");
++		return -EPROTONOSUPPORT;
++	}
++
++	buffer =3D uc_priv->pair.txbuf;
++
++	if (!buffer || !args->attrs || !args->address)
++		return -EINVAL;
++
++	return ffa_setup_and_transmit(dev, func_id, buffer, args);
++}
++
++/**
++ * ffa_memory_share_hdlr() - FFA_MEM_SHARE handler function
++ * @dev: The FF-A bus device
++ * @args: A pointer to a structure containing additional user arguments
++ *
++ * Implement FFA_MEM_SHARE FF-A function
++ * to grant access to a memory region to one or more Borrowers.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_memory_share_hdlr(struct udevice *dev, struct ffa_mem_ops_args =
*args)
++{
++	return ffa_memory_ops(dev, FFA_MEM_SHARE, args);
++}
++
+ /* FF-A driver operations (used by clients for communicating with FF-A)=
*/
+=20
+ /**
+@@ -1015,6 +1200,31 @@ int ffa_rxtx_unmap(struct udevice *dev)
+ 	return ops->rxtx_unmap(dev);
+ }
+=20
++/**
++ * ffa_memory_share() - FFA_MEM_SHARE driver operation
++ * @dev: The FF-A bus device
++ * @args: A pointer to a structure containing additional user arguments
++ *
++ * Driver operation for FFA_MEM_SHARE.
++ * Please see ffa_memory_share_hdlr() description for more details.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_memory_share(struct udevice *dev, struct ffa_mem_ops_args *args=
)
++{
++	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
++
++	if (!ops || !args)
++		return -EINVAL;
++
++	if (!ops->memory_share)
++		return -ENOSYS;
++
++	return ops->memory_share(dev, args);
++}
++
+ /**
+  * ffa_do_probe() - probing FF-A framework
+  * @dev:	the FF-A bus device (arm_ffa)
+diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
+index 94e6105cb38..df904cae412 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa.c
++++ b/drivers/firmware/arm-ffa/arm-ffa.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -84,6 +84,7 @@ static const struct ffa_bus_ops ffa_ops =3D {
+ 	.partition_info_get =3D ffa_get_partitions_info_hdlr,
+ 	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
+ 	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
++	.memory_share =3D ffa_memory_share_hdlr,
+ };
+=20
+ /* Registering the FF-A driver as an SMCCC feature driver */
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+index db9b1be995e..4d2ea7fd1a6 100644
+--- a/include/arm_ffa.h
++++ b/include/arm_ffa.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -81,11 +81,74 @@ struct ffa_send_direct_data {
+=20
+ struct udevice;
+=20
++/**
++ * struct ffa_mem_region_attributes - Endpoint memory access descriptor
++ *
++ * The data structure used in memory management transactions to create =
an
++ * association between an endpoint, memory access permissions and a com=
posite
++ * memory region description.
++ *
++ * For more details, please refer to Table 5.16 and Table 5.15 in the F=
F-A
++ * specification v1.0.
++ *
++ * This structure was taken from Linux.
++ */
++struct ffa_mem_region_attributes {
++	/* The ID of the VM to which the memory is being given or shared. */
++	u16 receiver;
++	/*
++	 * The permissions with which the memory region should be mapped in th=
e
++	 * receiver's page table.
++	 */
++#define FFA_MEM_EXEC		BIT(3)
++#define FFA_MEM_NO_EXEC		BIT(2)
++#define FFA_MEM_RW		BIT(1)
++#define FFA_MEM_RO		BIT(0)
++	u8 attrs;
++	/*
++	 * Flags used during FFA_MEM_RETRIEVE_REQ and FFA_MEM_RETRIEVE_RESP
++	 * for memory regions with multiple borrowers.
++	 */
++#define FFA_MEM_RETRIEVE_SELF_BORROWER	BIT(0)
++	u8 flag;
++	/*
++	 * Offset in bytes from the start of the outer `ffa_memory_region` to
++	 * an `struct ffa_mem_region_addr_range`.
++	 */
++	u32 composite_off;
++	u64 reserved;
++};
++
++/**
++ * struct ffa_mem_ops_args - User arguments to the memory management AB=
Is
++ * @use_txbuf:	Whether to use the TX buffer for the memory transaction
++ * @nattrs:	Number of the borrowers
++ * @flags:	Memory transaction flags
++ * @tag:	The tag associated with the transaction
++ * @g_handle:	Globally unique Handle to identify the memory region (out=
)
++ * @address:	Virtual address of the memory region
++ * @attrs:	Memory access permissions of each borrower
++ *
++ * The structured filled by the user and passed to the memory
++ * management ABIs (e.g: FFA_MEM_SHARE)
++ */
++struct ffa_mem_ops_args {
++	bool use_txbuf;
++	u32 nattrs;
++	u32 flags;
++	u64 tag;
++	u64 g_handle;
++	void *address;
++	u32 pg_cnt;
++	struct ffa_mem_region_attributes *attrs;
++};
++
+ /**
+  * struct ffa_bus_ops - Operations for FF-A
+  * @partition_info_get:	callback for the FFA_PARTITION_INFO_GET
+  * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
+  * @rxtx_unmap:	callback for the FFA_RXTX_UNMAP
++ * @memory_share:	callback for the FFA_MEM_SHARE
+  *
+  * The data structure providing all the operations supported by the dri=
ver.
+  * This structure is EFI runtime resident.
+@@ -97,6 +160,7 @@ struct ffa_bus_ops {
+ 				 struct ffa_send_direct_data *msg,
+ 				 bool is_smc64);
+ 	int (*rxtx_unmap)(struct udevice *dev);
++	int (*memory_share)(struct udevice *dev, struct ffa_mem_ops_args *args=
);
+ };
+=20
+ #define ffa_get_ops(dev)        ((struct ffa_bus_ops *)(dev)->driver->o=
ps)
+@@ -196,6 +260,26 @@ int ffa_partition_info_get(struct udevice *dev, con=
st char *uuid_str,
+ int ffa_get_partitions_info_hdlr(struct udevice *dev, const char *uuid_=
str,
+ 				 u32 *sp_count, struct ffa_partition_desc **sp_descs);
+=20
++/**
++ * ffa_memory_share() - FFA_MEM_SHARE driver operation
++ * Please see ffa_memory_share_hdlr() description for more details.
++ */
++int ffa_memory_share(struct udevice *dev, struct ffa_mem_ops_args *args=
);
++
++/**
++ * ffa_memory_share_hdlr() - FFA_MEM_SHARE handler function
++ * @dev: The FF-A bus device
++ * @args: A pointer to a structure containing additional user arguments
++ *
++ * Implement FFA_MEM_SHARE FF-A function
++ * to grant access to a memory region to one or more Borrowers.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_memory_share_hdlr(struct udevice *dev, struct ffa_mem_ops_args =
*args);
++
+ struct ffa_priv;
+=20
+ /**
+diff --git a/include/arm_ffa_priv.h b/include/arm_ffa_priv.h
+index d564c33c647..a259911d5b9 100644
+--- a/include/arm_ffa_priv.h
++++ b/include/arm_ffa_priv.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -132,10 +132,11 @@ enum ffa_abis {
+ 	FFA_RUN                   =3D 0x6d,
+ 	FFA_MSG_SEND_DIRECT_REQ   =3D 0x6f,
+ 	FFA_MSG_SEND_DIRECT_RESP  =3D 0x70,
++	FFA_MEM_SHARE             =3D 0x73,
+=20
+ 	/* To be updated when adding new FFA IDs */
+ 	FFA_FIRST_ID              =3D FFA_ERROR, /* Lowest number ID */
+-	FFA_LAST_ID               =3D FFA_MSG_SEND_DIRECT_RESP, /* Highest num=
ber ID */
++	FFA_LAST_ID               =3D FFA_MEM_SHARE, /* Highest number ID */
+ };
+=20
+ enum ffa_abi_errcode {
+@@ -219,6 +220,143 @@ struct ffa_priv {
+ 	struct ffa_rxtxpair pair;
+ };
+=20
++/* FF-A memory management ABIs data structures */
++
++/**
++ * struct ffa_mem_region - Lend, donate or share memory transaction des=
criptor
++ *
++ * Specifies the data structure that must be used by the Owner/Lender a=
nd a
++ * Borrower/Receiver in a transaction to donate, lend or share a memory=
 region.
++ * It specifies the memory region description, properties and other tra=
nsaction
++ * attributes in an invocation of the following ABIs.
++ *
++ * FFA_MEM_DONATE.
++ * FFA_MEM_LEND.
++ * FFA_MEM_SHARE.
++ * FFA_MEM_RETRIEVE_REQ.
++ * FFA_MEM_RETRIEVE_RESP.
++ *
++ * For more details, please refer to the Table 5.19 in the FF-A specifi=
cation
++ * v1.0.
++ *
++ * The interpretation of some fields depends on the ABI this structure =
is used
++ * with. This variance in behavior is also specified in the Table 5.19.
++ *
++ * This structure was taken from Linux and adapted to FF-A v1.0.
++ */
++struct ffa_mem_region {
++	/* The ID of the VM/owner which originally sent the memory region */
++	u16 sender_id;
++#define FFA_MEM_NORMAL		BIT(5)
++#define FFA_MEM_DEVICE		BIT(4)
++
++#define FFA_MEM_WRITE_BACK	(3 << 2)
++#define FFA_MEM_NON_CACHEABLE	BIT(2)
++
++#define FFA_DEV_nGnRnE		(0 << 2)
++#define FFA_DEV_nGnRE		BIT(2)
++#define FFA_DEV_nGRE		(2 << 2)
++#define FFA_DEV_GRE		(3 << 2)
++
++#define FFA_MEM_NON_SHAREABLE	(0)
++#define FFA_MEM_OUTER_SHAREABLE	(2)
++#define FFA_MEM_INNER_SHAREABLE	(3)
++	/* Memory region attributes */
++	u8 attributes;
++
++	u8 reserved1;
++
++/*
++ * Clear memory region contents after unmapping it from the sender and
++ * before mapping it for any receiver.
++ */
++#define FFA_MEM_CLEAR			BIT(0)
++/*
++ * Whether the hypervisor may time slice the memory sharing or retrieva=
l
++ * operation.
++ */
++#define FFA_TIME_SLICE_ENABLE		BIT(1)
++
++#define FFA_MEM_RETRIEVE_TYPE_IN_RESP	(0 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_SHARE	BIT(3)
++#define FFA_MEM_RETRIEVE_TYPE_LEND	(2 << 3)
++#define FFA_MEM_RETRIEVE_TYPE_DONATE	(3 << 3)
++
++#define FFA_MEM_RETRIEVE_ADDR_ALIGN_HINT	BIT(9)
++#define FFA_MEM_RETRIEVE_ADDR_ALIGN(x)		((x) << 5)
++	/* Flags to control behaviour of the transaction. */
++	u32 flags;
++#define HANDLE_LOW_MASK		GENMASK_ULL(31, 0)
++#define HANDLE_HIGH_MASK	GENMASK_ULL(63, 32)
++#define HANDLE_LOW(x)		((u32)(FIELD_GET(HANDLE_LOW_MASK, (x))))
++#define	HANDLE_HIGH(x)		((u32)(FIELD_GET(HANDLE_HIGH_MASK, (x))))
++
++#define PACK_HANDLE(l, h)		\
++	(FIELD_PREP(HANDLE_LOW_MASK, (l)) | FIELD_PREP(HANDLE_HIGH_MASK, (h)))
++	/*
++	 * A globally-unique ID assigned by the hypervisor for a region
++	 * of memory being sent between VMs.
++	 */
++	u64 handle;
++	/*
++	 * An implementation defined value associated with the receiver and th=
e
++	 * memory region.
++	 */
++	u64 tag;
++
++	u32 reserved2;
++
++	/*
++	 * The number of `ffa_mem_region_attributes` entries included in this
++	 * transaction.
++	 */
++	u32 ep_count;
++};
++
++/**
++ * struct ffa_mem_region_addr_range - Constituent memory region descrip=
tor
++ *
++ * Each descriptor specifies the base address and size of a virtually o=
r
++ * physically contiguous memory region.
++ *
++ * For more details, please refer to Table 5.14 in the FF-A
++ * specification v1.0.
++ *
++ * This structure was taken from Linux.
++ */
++struct ffa_mem_region_addr_range {
++	/* The base IPA of the constituent memory region, aligned to 4 kiB */
++	u64 address;
++	/* The number of 4 kiB pages in the constituent memory region. */
++	u32 pg_cnt;
++	u32 reserved;
++};
++
++/**
++ * struct ffa_composite_mem_region - Composite memory region descriptor
++ *
++ * For more details, please refer to Table 5.13 in the FF-A
++ * specification v1.0.
++ *
++ * This structure was taken from Linux.
++ */
++struct ffa_composite_mem_region {
++	/*
++	 * The total number of 4 kiB pages included in this memory region. Thi=
s
++	 * must be equal to the sum of page counts specified in each
++	 * `struct ffa_mem_region_addr_range`.
++	 */
++	u32 total_pg_cnt;
++	/* The number of constituents included in this memory region range */
++#define FFA_MEM_CONSTITUENTS		(1)
++	u32 addr_range_cnt;
++	u64 reserved;
++	/** An array of `addr_range_cnt` memory region constituents. */
++	struct ffa_mem_region_addr_range constituents[];
++};
++
++/* Functions prototypes */
++
+ /**
+  * ffa_get_version_hdlr() - FFA_VERSION handler function
+  * @dev: The FF-A bus device
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-=
A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-lib-uuid-introduce-tes=
tcase-for-uuid_str_to.patch
deleted file mode 100644
index bec856e1..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-l=
ib-uuid-introduce-testcase-for-uuid_str_to.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From fe51e27e4f0033e9737a1099d0dd06f976a60705 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 27 Mar 2023 16:24:29 +0100
-Subject: [PATCH] FF-A v15: lib: uuid: introduce testcase for
- uuid_str_to_le_bin
-
-provide a test case
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- MAINTAINERS       |  5 +++++
- test/lib/Makefile |  1 +
- test/lib/uuid.c   | 41 +++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 47 insertions(+)
- create mode 100644 test/lib/uuid.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 3bf60c4643..a1122afb01 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -1632,3 +1632,8 @@ S:	Maintained
- F:	arch/arm/dts/ls1021a-twr-u-boot.dtsi
- F:	drivers/crypto/fsl/
- F:	include/fsl_sec.h
-+
-+UUID testing
-+M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+S:	Maintained
-+F:	test/lib/uuid.c
-diff --git a/test/lib/Makefile b/test/lib/Makefile
-index e0bd9e04e8..e75a263e6a 100644
---- a/test/lib/Makefile
-+++ b/test/lib/Makefile
-@@ -22,6 +22,7 @@ obj-$(CONFIG_AES) +=3D test_aes.o
- obj-$(CONFIG_GETOPT) +=3D getopt.o
- obj-$(CONFIG_CRC8) +=3D test_crc8.o
- obj-$(CONFIG_UT_LIB_CRYPT) +=3D test_crypt.o
-+obj-$(CONFIG_LIB_UUID) +=3D uuid.o
- else
- obj-$(CONFIG_SANDBOX) +=3D kconfig_spl.o
- endif
-diff --git a/test/lib/uuid.c b/test/lib/uuid.c
-new file mode 100644
-index 0000000000..e24331a136
---- /dev/null
-+++ b/test/lib/uuid.c
-@@ -0,0 +1,41 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Functional tests for UCLASS_FFA  class
-+ *
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <uuid.h>
-+#include <test/lib.h>
-+#include <test/test.h>
-+#include <test/ut.h>
-+
-+/* test UUID */
-+#define TEST_SVC_UUID	"ed32d533-4209-99e6-2d72-cdd998a79cc0"
-+
-+#define UUID_SIZE 16
-+
-+/* The UUID binary data (little-endian format) */
-+static const u8 ref_uuid_bin[UUID_SIZE] =3D {
-+	0x33, 0xd5, 0x32, 0xed,
-+	0x09, 0x42, 0xe6, 0x99,
-+	0x72, 0x2d, 0xc0, 0x9c,
-+	0xa7, 0x98, 0xd9, 0xcd
-+};
-+
-+static int lib_test_uuid_to_le(struct unit_test_state *uts)
-+{
-+	const char *uuid_str =3D TEST_SVC_UUID;
-+	u8 ret_uuid_bin[UUID_SIZE] =3D {0};
-+
-+	ut_assertok(uuid_str_to_le_bin(uuid_str, ret_uuid_bin));
-+	ut_asserteq_mem(ref_uuid_bin, ret_uuid_bin, UUID_SIZE);
-+
-+	return 0;
-+}
-+
-+LIB_TEST(lib_test_uuid_to_le, 0);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm=
_ffa-Add-FFA_MEM_RECLAIM-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0003-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch
new file mode 100644
index 00000000..a1d3e812
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-Ad=
d-FFA_MEM_RECLAIM-support.patch
@@ -0,0 +1,232 @@
+From 09d9e3d05845de1c18672e3bcfabb3ef78092653 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Tue, 29 Oct 2024 17:24:43 +0000
+Subject: [PATCH 03/36] arm_ffa: Add FFA_MEM_RECLAIM support
+
+Add to the FF-A bus FFA_MEM_RECLAIM ABI
+
+The FFA_MEM_RECLAIM is a memory management ABI described in the FF-A
+v1.0 specification [1].
+
+This ABI restores exclusive access to a memory region back to its Owner.
+
+This work is based on the implementation in Linux [2].
+
+[1]: https://developer.arm.com/documentation/den0077/a/?lang=3Den
+[2]: commit cc2195fe536c28e192df5d07e6dd277af36814b4
+     File: drivers/firmware/arm_ffa/driver.c
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ doc/arch/arm64.ffa.rst                    |  2 +
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c | 76 +++++++++++++++++++++++
+ drivers/firmware/arm-ffa/arm-ffa.c        |  1 +
+ include/arm_ffa.h                         | 25 +++++++-
+ include/arm_ffa_priv.h                    |  3 +-
+ 5 files changed, 105 insertions(+), 2 deletions(-)
+
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+index 3eec735d741..d2c4fb49f79 100644
+--- a/doc/arch/arm64.ffa.rst
++++ b/doc/arch/arm64.ffa.rst
+@@ -186,6 +186,7 @@ The following features are provided:
+     - FFA_MSG_SEND_DIRECT_REQ
+     - FFA_MSG_SEND_DIRECT_RESP
+     - FFA_MEM_SHARE
++    - FFA_MEM_RECLAIM
+=20
+ - Support for the 64-bit version of the following ABIs:
+=20
+@@ -205,6 +206,7 @@ The following features are provided:
+     - ffa_sync_send_receive
+     - ffa_rxtx_unmap
+     - ffa_memory_share
++    - ffa_memory_reclaim
+=20
+ - FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
+   with the driver
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
+index 2ba0b925fa6..597b4e994b4 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
++++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+@@ -109,6 +109,18 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP=
_COUNT] =3D {
+ 			"DENIED: Memory region ownership, permission, access or attributes e=
rror",
+ 		},
+ 	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_MEM_RECLAIM)] =3D {
++		{
++			[ABORTED] =3D
++			"ABORTED: ABI invocation failure",
++			[INVALID_PARAMETERS] =3D
++			"INVALID_PARAMETERS: Invalid handle or flags",
++			[NO_MEMORY] =3D
++			"NO_MEMORY: Failure to create the Owner's mapping",
++			[DENIED] =3D
++			"DENIED: Memory region state issue",
++		},
++	},
+ };
+=20
+ /**
+@@ -1114,6 +1126,44 @@ int ffa_memory_share_hdlr(struct udevice *dev, st=
ruct ffa_mem_ops_args *args)
+ 	return ffa_memory_ops(dev, FFA_MEM_SHARE, args);
+ }
+=20
++/**
++ * ffa_memory_reclaim_hdlr() - FFA_MEM_RECLAIM handler function
++ * @dev: The FF-A bus device
++ * @g_handle: The memory region globally unique Handle
++ * @flags: Zero memory and time slicing flags
++ *
++ * Implement FFA_MEM_RECLAIM FF-A function
++ * to restore exclusive access to a memory region back to its Owner.
++ * Note: FFA_MEM_RECLAIM can not be used at EFI runtime because memory =
that was
++ * lent as per the memory map during boot time can not be reclaimed int=
o the
++ * memory map during runtime.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_memory_reclaim_hdlr(struct udevice *dev, u64 g_handle, u32 flag=
s)
++{
++	ffa_value_t res;
++	int ffa_errno;
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_MEM_RECLAIM),
++			.a1 =3D HANDLE_LOW(g_handle), .a2 =3D HANDLE_HIGH(g_handle),
++			.a3 =3D flags,
++			},
++			&res
++	);
++
++	if (res.a0 !=3D FFA_SMC_32(FFA_SUCCESS)) {
++		ffa_errno =3D res.a2;
++		ffa_print_error_log(FFA_MEM_RECLAIM, ffa_errno);
++		return ffa_to_std_errno(ffa_errno);
++	}
++
++	return 0;
++}
++
+ /* FF-A driver operations (used by clients for communicating with FF-A)=
*/
+=20
+ /**
+@@ -1225,6 +1275,32 @@ int ffa_memory_share(struct udevice *dev, struct =
ffa_mem_ops_args *args)
+ 	return ops->memory_share(dev, args);
+ }
+=20
++/**
++ * ffa_memory_reclaim() - FFA_MEM_RECLAIM driver operation
++ * @dev: The FF-A bus device
++ * @g_handle: The memory region globally unique Handle
++ * @flags: Zero memory and time slicing flags
++ *
++ * Driver operation for FFA_MEM_RECLAIM.
++ * Please see ffa_memory_reclaim_hdlr() description for more details.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_memory_reclaim(struct udevice *dev, u64 g_handle, u32 flags)
++{
++	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
++
++	if (!ops)
++		return -EINVAL;
++
++	if (!ops->memory_reclaim)
++		return -ENOSYS;
++
++	return ops->memory_reclaim(dev, g_handle, flags);
++}
++
+ /**
+  * ffa_do_probe() - probing FF-A framework
+  * @dev:	the FF-A bus device (arm_ffa)
+diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
+index df904cae412..de36f5647d2 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa.c
++++ b/drivers/firmware/arm-ffa/arm-ffa.c
+@@ -85,6 +85,7 @@ static const struct ffa_bus_ops ffa_ops =3D {
+ 	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
+ 	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
+ 	.memory_share =3D ffa_memory_share_hdlr,
++	.memory_reclaim =3D ffa_memory_reclaim_hdlr,
+ };
+=20
+ /* Registering the FF-A driver as an SMCCC feature driver */
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+index 4d2ea7fd1a6..a36f461662c 100644
+--- a/include/arm_ffa.h
++++ b/include/arm_ffa.h
+@@ -147,8 +147,9 @@ struct ffa_mem_ops_args {
+  * struct ffa_bus_ops - Operations for FF-A
+  * @partition_info_get:	callback for the FFA_PARTITION_INFO_GET
+  * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
+- * @rxtx_unmap:	callback for the FFA_RXTX_UNMAP
++ * @rxtx_unmap:		callback for the FFA_RXTX_UNMAP
+  * @memory_share:	callback for the FFA_MEM_SHARE
++ * @memory_reclaim:	callback for the FFA_MEM_RECLAIM
+  *
+  * The data structure providing all the operations supported by the dri=
ver.
+  * This structure is EFI runtime resident.
+@@ -161,6 +162,7 @@ struct ffa_bus_ops {
+ 				 bool is_smc64);
+ 	int (*rxtx_unmap)(struct udevice *dev);
+ 	int (*memory_share)(struct udevice *dev, struct ffa_mem_ops_args *args=
);
++	int (*memory_reclaim)(struct udevice *dev, u64 g_handle, u32 flags);
+ };
+=20
+ #define ffa_get_ops(dev)        ((struct ffa_bus_ops *)(dev)->driver->o=
ps)
+@@ -280,6 +282,27 @@ int ffa_memory_share(struct udevice *dev, struct ff=
a_mem_ops_args *args);
+  */
+ int ffa_memory_share_hdlr(struct udevice *dev, struct ffa_mem_ops_args =
*args);
+=20
++/**
++ * ffa_memory_reclaim() - FFA_MEM_RECLAIM driver operation
++ * Please see ffa_memory_reclaim_hdlr() description for more details.
++ */
++int ffa_memory_reclaim(struct udevice *dev, u64 g_handle, u32 flags);
++
++/**
++ * ffa_memory_reclaim_hdlr() - FFA_MEM_RECLAIM handler function
++ * @dev: The FF-A bus device
++ * @g_handle: The memory region globally unique Handle
++ * @flags: Zero memory and time slicing flags
++ *
++ * Implement FFA_MEM_RECLAIM FF-A function
++ * to restore exclusive access to a memory region back to its Owner.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_memory_reclaim_hdlr(struct udevice *dev, u64 g_handle, u32 flag=
s);
++
+ struct ffa_priv;
+=20
+ /**
+diff --git a/include/arm_ffa_priv.h b/include/arm_ffa_priv.h
+index a259911d5b9..54196199ce3 100644
+--- a/include/arm_ffa_priv.h
++++ b/include/arm_ffa_priv.h
+@@ -133,10 +133,11 @@ enum ffa_abis {
+ 	FFA_MSG_SEND_DIRECT_REQ   =3D 0x6f,
+ 	FFA_MSG_SEND_DIRECT_RESP  =3D 0x70,
+ 	FFA_MEM_SHARE             =3D 0x73,
++	FFA_MEM_RECLAIM           =3D 0x77,
+=20
+ 	/* To be updated when adding new FFA IDs */
+ 	FFA_FIRST_ID              =3D FFA_ERROR, /* Lowest number ID */
+-	FFA_LAST_ID               =3D FFA_MEM_SHARE, /* Highest number ID */
++	FFA_LAST_ID               =3D FFA_MEM_RECLAIM, /* Highest number ID */
+ };
+=20
+ enum ffa_abi_errcode {
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-=
A-v15-arm_ffa-introduce-Arm-FF-A-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-supp=
ort.patch
deleted file mode 100644
index dcbc5744..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-A-v15-a=
rm_ffa-introduce-Arm-FF-A-support.patch
+++ /dev/null
@@ -1,2129 +0,0 @@
-From d1f0d01f1d863c2b98cc181dfc752f6c71faefaf Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 17 Jul 2023 15:11:43 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: introduce Arm FF-A support
-
-Add Arm FF-A support implementing Arm Firmware Framework for Armv8-A v1.=
0
-
-The Firmware Framework for Arm A-profile processors (FF-A v1.0) [1]
-describes interfaces (ABIs) that standardize communication
-between the Secure World and Normal World leveraging TrustZone
-technology.
-
-This driver uses 64-bit registers as per SMCCCv1.2 spec and comes
-on top of the SMCCC layer. The driver provides the FF-A ABIs needed for
-querying the FF-A framework from the secure world.
-
-The driver uses SMC32 calling convention which means using the first
-32-bit data of the Xn registers.
-
-All supported ABIs come with their 32-bit version except FFA_RXTX_MAP
-which has 64-bit version supported.
-
-Both 32-bit and 64-bit direct messaging are supported which allows both
-32-bit and 64-bit clients to use the FF-A bus.
-
-FF-A is a discoverable bus and similar to architecture features.
-FF-A bus is discovered using ARM_SMCCC_FEATURES mechanism performed
-by the PSCI driver.
-
-Clients are able to probe then use the FF-A bus by calling the DM class
-searching APIs (e.g: uclass_first_device).
-
-The Secure World is considered as one entity to communicate with
-using the FF-A bus. FF-A communication is handled by one device and
-one instance (the bus). This FF-A driver takes care of all the
-interactions between Normal world and Secure World.
-
-The driver exports its operations to be used by upper layers.
-
-Exported operations:
-
-- ffa_partition_info_get
-- ffa_sync_send_receive
-- ffa_rxtx_unmap
-
-Generic FF-A methods are implemented in the Uclass (arm-ffa-uclass.c).
-Arm specific methods are implemented in the Arm driver (arm-ffa.c).
-
-For more details please refer to the driver documentation [2].
-
-[1]: https://developer.arm.com/documentation/den0077/latest/
-[2]: doc/arch/arm64.ffa.rst
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- MAINTAINERS                                   |    8 +
- doc/arch/arm64.ffa.rst                        |  238 ++++
- doc/arch/index.rst                            |    1 +
- drivers/Makefile                              |    1 +
- drivers/firmware/Kconfig                      |    1 +
- drivers/firmware/arm-ffa/Kconfig              |   36 +
- drivers/firmware/arm-ffa/Makefile             |    8 +
- drivers/firmware/arm-ffa/arm-ffa-uclass.c     | 1065 +++++++++++++++++
- drivers/firmware/arm-ffa/arm-ffa.c            |  104 ++
- .../firmware/arm-ffa/sandbox_arm_ffa_priv.h   |   14 +
- include/arm_ffa.h                             |  213 ++++
- include/arm_ffa_priv.h                        |  246 ++++
- include/dm/uclass-id.h                        |    6 +
- 13 files changed, 1941 insertions(+)
- create mode 100644 doc/arch/arm64.ffa.rst
- create mode 100644 drivers/firmware/arm-ffa/Kconfig
- create mode 100644 drivers/firmware/arm-ffa/Makefile
- create mode 100644 drivers/firmware/arm-ffa/arm-ffa-uclass.c
- create mode 100644 drivers/firmware/arm-ffa/arm-ffa.c
- create mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
- create mode 100644 include/arm_ffa.h
- create mode 100644 include/arm_ffa_priv.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index a1122afb01..9c5ebf312c 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -266,6 +266,14 @@ F:	drivers/net/cortina_ni.h
- F:	drivers/net/phy/ca_phy.c
- F:	configs/cortina_presidio-asic-pnand_defconfig
-=20
-+ARM FF-A
-+M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+S:	Maintained
-+F:	doc/arch/arm64.ffa.rst
-+F:	drivers/firmware/arm-ffa/
-+F:	include/arm_ffa.h
-+F:	include/sandbox_arm_ffa.h
-+
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
- M:	Fabio Estevam <festevam@gmail.com>
-diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
-new file mode 100644
-index 0000000000..4f817f053c
---- /dev/null
-+++ b/doc/arch/arm64.ffa.rst
-@@ -0,0 +1,238 @@
-+.. SPDX-License-Identifier: GPL-2.0+
-+
-+Arm FF-A Support
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+Summary
-+-------
-+
-+FF-A stands for Firmware Framework for Arm A-profile processors.
-+
-+FF-A specifies interfaces that enable a pair of software execution envi=
ronments aka partitions to
-+communicate with each other. A partition could be a VM in the Normal or=
 Secure world, an
-+application in S-EL0, or a Trusted OS in S-EL1.
-+
-+The U-Boot FF-A support (the bus) implements the interfaces to communic=
ate
-+with partitions in the Secure world aka Secure partitions (SPs).
-+
-+The FF-A support specifically focuses on communicating with SPs that
-+isolate portions of EFI runtime services that must run in a protected
-+environment which is inaccessible by the Host OS or Hypervisor.
-+Examples of such services are set/get variables.
-+
-+The FF-A support uses the SMC ABIs defined by the FF-A specification to=
:
-+
-+- Discover the presence of SPs of interest
-+- Access an SP's service through communication protocols
-+  e.g. EFI MM communication protocol
-+
-+At this stage of development only EFI boot-time services are supported.
-+Runtime support will be added in future developments.
-+
-+The U-Boot FF-A support provides the following parts:
-+
-+- A Uclass driver providing generic FF-A methods.
-+- An Arm FF-A device driver providing Arm-specific methods and reusing =
the Uclass methods.
-+
-+FF-A and SMC specifications
-+-------------------------------------------
-+
-+The current implementation of the U-Boot FF-A support relies on
-+`FF-A v1.0 specification`_ and uses SMC32 calling convention which
-+means using the first 32-bit data of the Xn registers.
-+
-+At this stage we only need the FF-A v1.0 features.
-+
-+The FF-A support has been tested with OP-TEE which supports SMC32 calli=
ng
-+convention.
-+
-+Hypervisors are supported if they are configured to trap SMC calls.
-+
-+The FF-A support uses 64-bit registers as per `SMC Calling Convention v=
1.2 specification`_.
-+
-+Supported hardware
-+--------------------------------
-+
-+Aarch64 plaforms
-+
-+Configuration
-+----------------------
-+
-+CONFIG_ARM_FFA_TRANSPORT
-+    Enables the FF-A support. Turn this on if you want to use FF-A
-+    communication.
-+    When using an Arm 64-bit platform, the Arm FF-A driver will be used=
.
-+
-+FF-A ABIs under the hood
-+---------------------------------------
-+
-+Invoking an FF-A ABI involves providing to the secure world/hypervisor =
the
-+expected arguments from the ABI.
-+
-+On an Arm 64-bit platform, the ABI arguments are stored in x0 to x7 reg=
isters.
-+Then, an SMC instruction is executed.
-+
-+At the secure side level or hypervisor the ABI is handled at a higher e=
xception
-+level and the arguments are read and processed.
-+
-+The response is put back through x0 to x7 registers and control is give=
n back
-+to the U-Boot Arm FF-A driver (non-secure world).
-+
-+The driver reads the response and processes it accordingly.
-+
-+This methodology applies to all the FF-A ABIs.
-+
-+FF-A bus discovery on Arm 64-bit platforms
-+---------------------------------------------
-+
-+When CONFIG_ARM_FFA_TRANSPORT is enabled, the FF-A bus is considered as
-+an architecture feature and discovered using ARM_SMCCC_FEATURES mechani=
sm.
-+This discovery mechanism is performed by the PSCI driver.
-+
-+The PSCI driver comes with a PSCI device tree node which is the root no=
de for all
-+architecture features including FF-A bus.
-+
-+::
-+
-+   =3D> dm tree
-+
-+    Class     Index  Probed  Driver                Name
-+   -----------------------------------------------------------
-+   ...
-+    firmware      0  [ + ]   psci                      |-- psci
-+    ffa                   0  [   ]   arm_ffa               |   `-- arm_=
ffa
-+   ...
-+
-+The PSCI driver is bound to the PSCI device and when probed it tries to=
 discover
-+the architecture features by calling a callback the features drivers pr=
ovide.
-+
-+In case of FF-A, the callback is arm_ffa_is_supported() which tries to =
discover the
-+FF-A framework by querying the FF-A framework version from secure world=
 using
-+FFA_VERSION ABI. When discovery is successful, the ARM_SMCCC_FEATURES
-+mechanism creates a U-Boot device for the FF-A bus and binds the Arm FF=
-A driver
-+with the device using device_bind_driver().
-+
-+At this stage the FF-A bus is registered with the DM and can be interac=
ted with using
-+the DM APIs.
-+
-+Clients are able to probe then use the FF-A bus by calling uclass_first=
_device().
-+Please refer to the armffa command implementation as an example of how =
to probe
-+and interact with the FF-A bus.
-+
-+When calling uclass_first_device(), the FF-A driver is probed and ends =
up calling
-+ffa_do_probe() provided by the Uclass which does the following:
-+
-+    - saving the FF-A framework version in uc_priv
-+    - querying from secure world the u-boot endpoint ID
-+    - querying from secure world the supported features of FFA_RXTX_MAP
-+    - mapping the RX/TX buffers
-+    - querying from secure world all the partitions information
-+
-+When one of the above actions fails, probing fails and the driver stays=
 not active
-+and can be probed again if needed.
-+
-+Requirements for clients
-+-------------------------------------
-+
-+When using the FF-A bus with EFI, clients must query the SPs they are l=
ooking for
-+during EFI boot-time mode using the service UUID.
-+
-+The RX/TX buffers are only available at EFI boot-time. Querying partiti=
ons is
-+done at boot time and data is cached for future use.
-+
-+RX/TX buffers should be unmapped before EFI runtime mode starts.
-+The driver provides a bus operation for that called ffa_rxtx_unmap().
-+
-+The user should call ffa_rxtx_unmap() to unmap the RX/TX buffers when r=
equired
-+(e.g: at efi_exit_boot_services()).
-+
-+The Linux kernel allocates its own RX/TX buffers. To be able to registe=
r these kernel buffers
-+with secure world, the U-Boot's RX/TX buffers should be unmapped before=
 EFI runtime starts.
-+
-+When invoking FF-A direct messaging, clients should specify which ABI p=
rotocol
-+they want to use (32-bit vs 64-bit). Selecting the protocol means using
-+the 32-bit or 64-bit version of FFA_MSG_SEND_DIRECT_{REQ, RESP}.
-+The calling convention between U-Boot and the secure world stays the sa=
me: SMC32.
-+
-+Requirements for user drivers
-+-------------------------------------
-+
-+Users who want to implement their custom FF-A device driver while reusi=
ng the FF-A Uclass can do so
-+by implementing their own invoke_ffa_fn() in the user driver.
-+
-+The bus driver layer
-+------------------------------
-+
-+FF-A support comes on top of the SMCCC layer and is implemented by the =
FF-A Uclass drivers/firmware/arm-ffa/arm-ffa-uclass.c
-+
-+The following features are provided:
-+
-+- Support for the 32-bit version of the following ABIs:
-+
-+    - FFA_VERSION
-+    - FFA_ID_GET
-+    - FFA_FEATURES
-+    - FFA_PARTITION_INFO_GET
-+    - FFA_RXTX_UNMAP
-+    - FFA_RX_RELEASE
-+    - FFA_RUN
-+    - FFA_ERROR
-+    - FFA_SUCCESS
-+    - FFA_INTERRUPT
-+    - FFA_MSG_SEND_DIRECT_REQ
-+    - FFA_MSG_SEND_DIRECT_RESP
-+
-+- Support for the 64-bit version of the following ABIs:
-+
-+    - FFA_RXTX_MAP
-+    - FFA_MSG_SEND_DIRECT_REQ
-+    - FFA_MSG_SEND_DIRECT_RESP
-+
-+- Processing the received data from the secure world/hypervisor and cac=
hing it
-+
-+- Hiding from upper layers the FF-A protocol and registers details. Upp=
er
-+  layers focus on exchanged data, FF-A support takes care of how to tra=
nsport
-+  that to the secure world/hypervisor using FF-A
-+
-+- FF-A support provides driver operations to be used by upper layers:
-+
-+    - ffa_partition_info_get
-+    - ffa_sync_send_receive
-+    - ffa_rxtx_unmap
-+
-+- FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
-+  with the driver
-+
-+- FF-A bus can be compiled and used without EFI
-+
-+Example of boot logs with FF-A enabled
-+--------------------------------------
-+
-+For example, when using FF-A with Corstone-1000 the logs are as follows=
:
-+
-+::
-+
-+   U-Boot 2023.01 (May 10 2023 - 11:08:07 +0000) corstone1000 aarch64
-+
-+   DRAM:  2 GiB
-+   Arm FF-A framework discovery
-+   FF-A driver 1.0
-+   FF-A framework 1.0
-+   FF-A versions are compatible
-+   ...
-+   FF-A driver 1.0
-+   FF-A framework 1.0
-+   FF-A versions are compatible
-+   EFI: MM partition ID 0x8003
-+   ...
-+   EFI stub: Booting Linux Kernel...
-+   ...
-+   Linux version 6.1.9-yocto-standard (oe-user@oe-host) (aarch64-poky-l=
inux-musl-gcc (GCC) 12.2.0, GNU ld (GNU Binutils) 2.40.202301193
-+   Machine model: ARM Corstone1000 FPGA MPS3 board
-+
-+Contributors
-+------------
-+   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+
-+.. _`FF-A v1.0 specification`: https://documentation-service.arm.com/st=
atic/5fb7e8a6ca04df4095c1d65e
-+.. _`SMC Calling Convention v1.2 specification`: https://documentation-=
service.arm.com/static/5f8edaeff86e16515cdbe4c6
-diff --git a/doc/arch/index.rst b/doc/arch/index.rst
-index b8da4b8c8e..2f916f4026 100644
---- a/doc/arch/index.rst
-+++ b/doc/arch/index.rst
-@@ -8,6 +8,7 @@ Architecture-specific doc
-=20
-    arc
-    arm64
-+   arm64.ffa
-    m68k
-    mips
-    nios2
-diff --git a/drivers/Makefile b/drivers/Makefile
-index 29be78a3f2..6094fac50d 100644
---- a/drivers/Makefile
-+++ b/drivers/Makefile
-@@ -114,6 +114,7 @@ obj-y +=3D iommu/
- obj-y +=3D smem/
- obj-y +=3D thermal/
- obj-$(CONFIG_TEE) +=3D tee/
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D firmware/arm-ffa/
- obj-y +=3D axi/
- obj-y +=3D ufs/
- obj-$(CONFIG_W1) +=3D w1/
-diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
-index eae1c8ddc9..8789b1ea14 100644
---- a/drivers/firmware/Kconfig
-+++ b/drivers/firmware/Kconfig
-@@ -45,4 +45,5 @@ config ARM_SMCCC_FEATURES
- 	  the PSCI driver is always probed and binds dirvers registered to the=
 Arm SMCCC
- 	  services if any and reported as supported by the SMCCC firmware.
-=20
-+source "drivers/firmware/arm-ffa/Kconfig"
- source "drivers/firmware/scmi/Kconfig"
-diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-new file mode 100644
-index 0000000000..9200c8028b
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -0,0 +1,36 @@
-+# SPDX-License-Identifier: GPL-2.0
-+
-+config ARM_FFA_TRANSPORT
-+	bool "Enable Arm Firmware Framework for Armv8-A driver"
-+	depends on DM && ARM64
-+	select ARM_SMCCC
-+	select ARM_SMCCC_FEATURES
-+	select LIB_UUID
-+	select DEVRES
-+	help
-+	  The Firmware Framework for Arm A-profile processors (FF-A)
-+	  describes interfaces (ABIs) that standardize communication
-+	  between the Secure World and Normal World leveraging TrustZone
-+	  technology.
-+
-+	  The FF-A support in U-Boot is based on FF-A specification v1.0 and u=
ses SMC32
-+	  calling convention.
-+
-+	  FF-A specification:
-+
-+	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
-+
-+	  In U-Boot FF-A design, FF-A is considered as a discoverable bus.
-+	  FF-A bus is discovered using ARM_SMCCC_FEATURES mechanism performed
-+	  by the PSCI driver.
-+	  The Secure World is considered as one entity to communicate with
-+	  using the FF-A bus.
-+	  FF-A communication is handled by one device and one instance (the bu=
s).
-+	  The FF-A support on U-Boot  takes care of all the interactions betwe=
en Normal
-+	  world and Secure World.
-+
-+	  Generic FF-A methods are implemented in the Uclass (arm-ffa-uclass.c=
).
-+	  Arm specific methods are implemented in the Arm driver (arm-ffa.c).
-+
-+	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
-+
-diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-new file mode 100644
-index 0000000000..11b1766285
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/Makefile
-@@ -0,0 +1,8 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
-+#
-+# Authors:
-+#   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+
-+obj-y +=3D arm-ffa-uclass.o arm-ffa.o
-diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
-new file mode 100644
-index 0000000000..ffa9d81fa7
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
-@@ -0,0 +1,1065 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+#include <common.h>
-+#include <arm_ffa.h>
-+#include <arm_ffa_priv.h>
-+#include <dm.h>
-+#include <log.h>
-+#include <malloc.h>
-+#include <string.h>
-+#include <uuid.h>
-+#include <asm/global_data.h>
-+#include <dm/device-internal.h>
-+#include <dm/devres.h>
-+#include <dm/root.h>
-+#include <linux/errno.h>
-+#include <linux/sizes.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/* Error mapping declarations */
-+
-+int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
-+	[NOT_SUPPORTED] =3D -EOPNOTSUPP,
-+	[INVALID_PARAMETERS] =3D -EINVAL,
-+	[NO_MEMORY] =3D -ENOMEM,
-+	[BUSY] =3D -EBUSY,
-+	[INTERRUPTED] =3D -EINTR,
-+	[DENIED] =3D -EACCES,
-+	[RETRY] =3D -EAGAIN,
-+	[ABORTED] =3D -ECANCELED,
-+};
-+
-+static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] =3D {
-+	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: A Firmware Framework implementation does not exist",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_ID_GET)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_FEATURES)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: FFA_RXTX_MAP is not implemented at this FF-A instanc=
e",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_PARTITION_INFO_GET)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+			[INVALID_PARAMETERS] =3D
-+			"INVALID_PARAMETERS: Unrecognized UUID",
-+			[NO_MEMORY] =3D
-+			"NO_MEMORY: Results cannot fit in RX buffer of the caller",
-+			[BUSY] =3D
-+			"BUSY: RX buffer of the caller is not free",
-+			[DENIED] =3D
-+			"DENIED: Callee is not in a state to handle this request",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_UNMAP)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: FFA_RXTX_UNMAP is not implemented at this FF-A insta=
nce",
-+			[INVALID_PARAMETERS] =3D
-+			"INVALID_PARAMETERS: No buffer pair registered on behalf of the call=
er",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_RX_RELEASE)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: FFA_RX_RELEASE is not implemented at this FF-A insta=
nce",
-+			[DENIED] =3D
-+			"DENIED: Caller did not have ownership of the RX buffer",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_MAP)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+			[INVALID_PARAMETERS] =3D
-+			"INVALID_PARAMETERS: Field(s) in input parameters incorrectly encode=
d",
-+			[NO_MEMORY] =3D
-+			"NO_MEMORY: Not enough memory",
-+			[DENIED] =3D
-+			"DENIED: Buffer pair already registered",
-+		},
-+	},
-+};
-+
-+/**
-+ * ffa_to_std_errno() - convert FF-A error code to standard error code
-+ * @ffa_errno:	Error code returned by the FF-A ABI
-+ *
-+ * Map the given FF-A error code as specified
-+ * by the spec to a u-boot standard error code.
-+ *
-+ * Return:
-+ *
-+ * The standard error code on success. . Otherwise, failure
-+ */
-+static int ffa_to_std_errno(int ffa_errno)
-+{
-+	int err_idx =3D -ffa_errno;
-+
-+	/* Map the FF-A error code to the standard u-boot error code */
-+	if (err_idx > 0 && err_idx < MAX_NUMBER_FFA_ERR)
-+		return ffa_to_std_errmap[err_idx];
-+	return -EINVAL;
-+}
-+
-+/**
-+ * ffa_print_error_log() - print the error log corresponding to the sel=
ected FF-A ABI
-+ * @ffa_id:	FF-A ABI ID
-+ * @ffa_errno:	Error code returned by the FF-A ABI
-+ *
-+ * Map the FF-A error code to the error log relevant to the
-+ * selected FF-A ABI. Then the error log is printed.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. . Otherwise, failure
-+ */
-+static int ffa_print_error_log(u32 ffa_id, int ffa_errno)
-+{
-+	int err_idx =3D -ffa_errno, abi_idx =3D 0;
-+
-+	/* Map the FF-A error code to the corresponding error log */
-+
-+	if (err_idx <=3D 0 || err_idx >=3D MAX_NUMBER_FFA_ERR)
-+		return -EINVAL;
-+
-+	if (ffa_id < FFA_FIRST_ID || ffa_id > FFA_LAST_ID)
-+		return -EINVAL;
-+
-+	abi_idx =3D FFA_ID_TO_ERRMAP_ID(ffa_id);
-+	if (abi_idx < 0 || abi_idx >=3D FFA_ERRMAP_COUNT)
-+		return -EINVAL;
-+
-+	if (!err_msg_map[abi_idx].err_str[err_idx])
-+		return -EINVAL;
-+
-+	log_err("%s\n", err_msg_map[abi_idx].err_str[err_idx]);
-+
-+	return 0;
-+}
-+
-+/* FF-A ABIs implementation (U-Boot side) */
-+
-+/**
-+ * invoke_ffa_fn() - SMC wrapper
-+ * @args: FF-A ABI arguments to be copied to Xn registers
-+ * @res: FF-A ABI return data to be copied from Xn registers
-+ *
-+ * Calls low level SMC implementation.
-+ * This function should be implemented by the user driver.
-+ */
-+void __weak invoke_ffa_fn(ffa_value_t args, ffa_value_t *res)
-+{
-+}
-+
-+/**
-+ * ffa_get_version_hdlr() - FFA_VERSION handler function
-+ * @dev: The FF-A bus device
-+ *
-+ * Implement FFA_VERSION FF-A function
-+ * to get from the secure world the FF-A framework version
-+ * FFA_VERSION is used to discover the FF-A framework.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_get_version_hdlr(struct udevice *dev)
-+{
-+	u16 major, minor;
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+	struct ffa_priv *uc_priv;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_VERSION), .a1 =3D FFA_VERSION_1_0,
-+			}, &res);
-+
-+	ffa_errno =3D res.a0;
-+	if (ffa_errno < 0) {
-+		ffa_print_error_log(FFA_VERSION, ffa_errno);
-+		return ffa_to_std_errno(ffa_errno);
-+	}
-+
-+	major =3D GET_FFA_MAJOR_VERSION(res.a0);
-+	minor =3D GET_FFA_MINOR_VERSION(res.a0);
-+
-+	log_info("FF-A driver %d.%d\nFF-A framework %d.%d\n",
-+		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
-+
-+	if (major =3D=3D FFA_MAJOR_VERSION && minor >=3D FFA_MINOR_VERSION) {
-+		log_info("FF-A versions are compatible\n");
-+
-+		if (dev) {
-+			uc_priv =3D dev_get_uclass_priv(dev);
-+			if (uc_priv)
-+				uc_priv->fwk_version =3D res.a0;
-+		}
-+
-+		return 0;
-+	}
-+
-+	log_err("versions are incompatible\nExpected: %d.%d , Found: %d.%d\n",
-+		FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
-+
-+	return -EPROTONOSUPPORT;
-+}
-+
-+/**
-+ * ffa_get_endpoint_id() - FFA_ID_GET handler function
-+ * @dev: The FF-A bus device
-+ *
-+ * Implement FFA_ID_GET FF-A function
-+ * to get from the secure world u-boot endpoint ID
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_get_endpoint_id(struct udevice *dev)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_ID_GET),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		uc_priv->id =3D GET_SELF_ENDPOINT_ID((u32)res.a2);
-+		log_debug("FF-A endpoint ID is %u\n", uc_priv->id);
-+
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+
-+	ffa_print_error_log(FFA_ID_GET, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_set_rxtx_buffers_pages_cnt() - set the minimum number of pages i=
n each of the RX/TX buffers
-+ * @dev: The FF-A bus device
-+ * @prop_field: properties field obtained from FFA_FEATURES ABI
-+ *
-+ * Set the minimum number of pages in each of the RX/TX buffers in uc_p=
riv
-+ *
-+ * Return:
-+ *
-+ * rxtx_min_pages field contains the returned number of pages
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_set_rxtx_buffers_pages_cnt(struct udevice *dev, u32 prop=
_field)
-+{
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	switch (prop_field) {
-+	case RXTX_4K:
-+		uc_priv->pair.rxtx_min_pages =3D 1;
-+		break;
-+	case RXTX_16K:
-+		uc_priv->pair.rxtx_min_pages =3D 4;
-+		break;
-+	case RXTX_64K:
-+		uc_priv->pair.rxtx_min_pages =3D 16;
-+		break;
-+	default:
-+		log_err("RX/TX buffer size not supported\n");
-+		return -EINVAL;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_get_rxtx_map_features_hdlr() - FFA_FEATURES handler function wit=
h FFA_RXTX_MAP argument
-+ * @dev: The FF-A bus device
-+ *
-+ * Implement FFA_FEATURES FF-A function to retrieve the FFA_RXTX_MAP fe=
atures
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_get_rxtx_map_features_hdlr(struct udevice *dev)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_FEATURES),
-+			.a1 =3D FFA_SMC_64(FFA_RXTX_MAP),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
-+		return ffa_set_rxtx_buffers_pages_cnt(dev, res.a2);
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_FEATURES, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_free_rxtx_buffers() - free the RX/TX buffers
-+ * @dev: The FF-A bus device
-+ *
-+ * Free the RX/TX buffers
-+ */
-+static void ffa_free_rxtx_buffers(struct udevice *dev)
-+{
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	log_debug("Freeing FF-A RX/TX buffers\n");
-+
-+	if (uc_priv->pair.rxbuf) {
-+		free(uc_priv->pair.rxbuf);
-+		uc_priv->pair.rxbuf =3D NULL;
-+	}
-+
-+	if (uc_priv->pair.txbuf) {
-+		free(uc_priv->pair.txbuf);
-+		uc_priv->pair.txbuf =3D NULL;
-+	}
-+}
-+
-+/**
-+ * ffa_alloc_rxtx_buffers() - allocate the RX/TX buffers
-+ * @dev: The FF-A bus device
-+ *
-+ * Used by ffa_map_rxtx_buffers to allocate
-+ * the RX/TX buffers before mapping them. The allocated memory is physi=
cally
-+ * contiguous since memalign ends up calling malloc which allocates
-+ * contiguous memory in u-boot.
-+ * The size of the memory allocated is the minimum allowed.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_alloc_rxtx_buffers(struct udevice *dev)
-+{
-+	u64 bytes;
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	log_debug("Using %lu 4KB page(s) for FF-A RX/TX buffers size\n",
-+		  uc_priv->pair.rxtx_min_pages);
-+
-+	bytes =3D uc_priv->pair.rxtx_min_pages * SZ_4K;
-+
-+	/*
-+	 * The alignment of the RX and TX buffers must be equal
-+	 * to the larger translation granule size
-+	 * Assumption: Memory allocated with memalign is always physically con=
tiguous
-+	 */
-+
-+	uc_priv->pair.rxbuf =3D memalign(bytes, bytes);
-+	if (!uc_priv->pair.rxbuf) {
-+		log_err("failure to allocate RX buffer\n");
-+		return -ENOBUFS;
-+	}
-+
-+	log_debug("FF-A RX buffer at virtual address %p\n", uc_priv->pair.rxbu=
f);
-+
-+	uc_priv->pair.txbuf =3D memalign(bytes, bytes);
-+	if (!uc_priv->pair.txbuf) {
-+		free(uc_priv->pair.rxbuf);
-+		uc_priv->pair.rxbuf =3D NULL;
-+		log_err("failure to allocate the TX buffer\n");
-+		return -ENOBUFS;
-+	}
-+
-+	log_debug("FF-A TX buffer at virtual address %p\n", uc_priv->pair.txbu=
f);
-+
-+	/* Make sure the buffers are cleared before use */
-+	memset(uc_priv->pair.rxbuf, 0, bytes);
-+	memset(uc_priv->pair.txbuf, 0, bytes);
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_map_rxtx_buffers_hdlr() - FFA_RXTX_MAP handler function
-+ * @dev: The FF-A bus device
-+ *
-+ * Implement FFA_RXTX_MAP FF-A function to map the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_map_rxtx_buffers_hdlr(struct udevice *dev)
-+{
-+	int ret;
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	ret =3D ffa_alloc_rxtx_buffers(dev);
-+	if (ret)
-+		return ret;
-+
-+	/*
-+	 * we need to pass the physical addresses of the RX/TX buffers
-+	 * in u-boot physical/virtual mapping is 1:1
-+	 * no need to convert from virtual to physical
-+	 */
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_64(FFA_RXTX_MAP),
-+			.a1 =3D map_to_sysmem(uc_priv->pair.txbuf),
-+			.a2 =3D map_to_sysmem(uc_priv->pair.rxbuf),
-+			.a3 =3D uc_priv->pair.rxtx_min_pages,
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		log_debug("FF-A RX/TX buffers mapped\n");
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_RXTX_MAP, ffa_errno);
-+
-+	ffa_free_rxtx_buffers(dev);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_unmap_rxtx_buffers_hdlr() - FFA_RXTX_UNMAP handler function
-+ * @dev: The FF-A bus device
-+ *
-+ * Implement FFA_RXTX_UNMAP FF-A function to unmap the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+	struct ffa_priv *uc_priv;
-+
-+	log_debug("unmapping FF-A RX/TX buffers\n");
-+
-+	uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_RXTX_UNMAP),
-+			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->id),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		ffa_free_rxtx_buffers(dev);
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_RXTX_UNMAP, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_release_rx_buffer_hdlr() - FFA_RX_RELEASE handler function
-+ * @dev: The FF-A bus device
-+ *
-+ * Invoke FFA_RX_RELEASE FF-A function to release the ownership of the =
RX buffer
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_release_rx_buffer_hdlr(struct udevice *dev)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_RX_RELEASE),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
-+		return 0;
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_RX_RELEASE, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_uuid_are_identical() - check whether two given UUIDs are identic=
al
-+ * @uuid1: first UUID
-+ * @uuid2: second UUID
-+ *
-+ * Used by ffa_read_partitions_info to search for a UUID in the partiti=
ons descriptors table
-+ *
-+ * Return:
-+ *
-+ * 1 when UUIDs match. Otherwise, 0
-+ */
-+static bool ffa_uuid_are_identical(const struct ffa_partition_uuid *uui=
d1,
-+				   const struct ffa_partition_uuid *uuid2)
-+{
-+	if (!uuid1 || !uuid2)
-+		return 0;
-+
-+	return !memcmp(uuid1, uuid2, sizeof(struct ffa_partition_uuid));
-+}
-+
-+/**
-+ * ffa_read_partitions_info() - read queried partition data
-+ * @dev: The FF-A bus device
-+ * @count: The number of partitions queried
-+ * @part_uuid: Pointer to the partition(s) UUID
-+ *
-+ * Read the partitions information returned by the FFA_PARTITION_INFO_G=
ET and saves it in uc_priv
-+ *
-+ * Return:
-+ *
-+ * uc_priv is updated with the partition(s) information
-+ * 0 is returned on success. Otherwise, failure
-+ */
-+static int ffa_read_partitions_info(struct udevice *dev, u32 count,
-+				    struct ffa_partition_uuid *part_uuid)
-+{
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	if (!count) {
-+		log_err("no partition detected\n");
-+		return -ENODATA;
-+	}
-+
-+	log_debug("Reading FF-A partitions data from the RX buffer\n");
-+
-+	if (!part_uuid) {
-+		/* Querying information of all partitions */
-+		u64 buf_bytes;
-+		u64 data_bytes;
-+		u32 desc_idx;
-+		struct ffa_partition_info *parts_info;
-+
-+		data_bytes =3D count * sizeof(struct ffa_partition_desc);
-+
-+		buf_bytes =3D uc_priv->pair.rxtx_min_pages * SZ_4K;
-+
-+		if (data_bytes > buf_bytes) {
-+			log_err("partitions data size exceeds the RX buffer size:\n");
-+			log_err("    sizes in bytes: data %llu , RX buffer %llu\n",
-+				data_bytes,
-+				buf_bytes);
-+
-+			return -ENOMEM;
-+		}
-+
-+		uc_priv->partitions.descs =3D devm_kmalloc(dev, data_bytes, __GFP_ZER=
O);
-+		if (!uc_priv->partitions.descs) {
-+			log_err("cannot  allocate partitions data buffer\n");
-+			return -ENOMEM;
-+		}
-+
-+		parts_info =3D uc_priv->pair.rxbuf;
-+
-+		for (desc_idx =3D 0 ; desc_idx < count ; desc_idx++) {
-+			uc_priv->partitions.descs[desc_idx].info =3D
-+				parts_info[desc_idx];
-+
-+			log_debug("FF-A partition ID %x : info cached\n",
-+				  uc_priv->partitions.descs[desc_idx].info.id);
-+		}
-+
-+		uc_priv->partitions.count =3D count;
-+
-+		log_debug("%d FF-A partition(s) found and cached\n", count);
-+
-+	} else {
-+		u32 rx_desc_idx, cached_desc_idx;
-+		struct ffa_partition_info *parts_info;
-+		u8 desc_found;
-+
-+		parts_info =3D uc_priv->pair.rxbuf;
-+
-+		/*
-+		 * Search for the SP IDs read from the RX buffer
-+		 * in the already cached SPs.
-+		 * Update the UUID when ID found.
-+		 */
-+		for (rx_desc_idx =3D 0; rx_desc_idx < count ; rx_desc_idx++) {
-+			desc_found =3D 0;
-+
-+			/* Search the current ID in the cached partitions */
-+			for (cached_desc_idx =3D 0;
-+			     cached_desc_idx < uc_priv->partitions.count;
-+			     cached_desc_idx++) {
-+				/* Save the UUID */
-+				if (uc_priv->partitions.descs[cached_desc_idx].info.id =3D=3D
-+				    parts_info[rx_desc_idx].id) {
-+					uc_priv->partitions.descs[cached_desc_idx].sp_uuid =3D
-+						*part_uuid;
-+
-+					desc_found =3D 1;
-+					break;
-+				}
-+			}
-+
-+			if (!desc_found)
-+				return -ENODATA;
-+		}
-+	}
-+
-+	return  0;
-+}
-+
-+/**
-+ * ffa_query_partitions_info() - invoke FFA_PARTITION_INFO_GET and save=
 partitions data
-+ * @dev: The FF-A bus device
-+ * @part_uuid: Pointer to the partition(s) UUID
-+ * @pcount: Pointer to the number of partitions variable filled when qu=
erying
-+ *
-+ * Execute the FFA_PARTITION_INFO_GET to query the partitions data.
-+ * Then, call ffa_read_partitions_info to save the data in uc_priv.
-+ *
-+ * After reading the data the RX buffer is released using ffa_release_r=
x_buffer
-+ *
-+ * Return:
-+ *
-+ * When part_uuid is NULL, all partitions data are retrieved from secur=
e world
-+ * When part_uuid is non NULL, data for partitions matching the given U=
UID are
-+ * retrieved and the number of partitions is returned
-+ * 0 is returned on success. Otherwise, failure
-+ */
-+static int ffa_query_partitions_info(struct udevice *dev, struct ffa_pa=
rtition_uuid *part_uuid,
-+				     u32 *pcount)
-+{
-+	struct ffa_partition_uuid query_uuid =3D {0};
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	/*
-+	 * If a UUID is specified. Information for one or more
-+	 * partitions in the system is queried. Otherwise, information
-+	 * for all installed partitions is queried
-+	 */
-+
-+	if (part_uuid) {
-+		if (!pcount)
-+			return -EINVAL;
-+
-+		query_uuid =3D *part_uuid;
-+	} else if (pcount) {
-+		return -EINVAL;
-+	}
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_PARTITION_INFO_GET),
-+			.a1 =3D query_uuid.a1,
-+			.a2 =3D query_uuid.a2,
-+			.a3 =3D query_uuid.a3,
-+			.a4 =3D query_uuid.a4,
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		int ret;
-+
-+		/*
-+		 * res.a2 contains the count of partition information descriptors
-+		 * populated in the RX buffer
-+		 */
-+		if (res.a2) {
-+			ret =3D ffa_read_partitions_info(dev, (u32)res.a2, part_uuid);
-+			if (ret) {
-+				log_err("failed reading SP(s) data , err (%d)\n", ret);
-+				ffa_release_rx_buffer_hdlr(dev);
-+				return -EINVAL;
-+			}
-+		}
-+
-+		/* Return the SP count (when querying using a UUID) */
-+		if (pcount)
-+			*pcount =3D (u32)res.a2;
-+
-+		/*
-+		 * After calling FFA_PARTITION_INFO_GET the buffer ownership
-+		 * is assigned to the consumer (u-boot). So, we need to give
-+		 * the ownership back to the SPM or hypervisor
-+		 */
-+		ret =3D ffa_release_rx_buffer_hdlr(dev);
-+
-+		return ret;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_PARTITION_INFO_GET, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_get_partitions_info_hdlr() - FFA_PARTITION_INFO_GET handler func=
tion
-+ *	@uuid_str: pointer to the UUID string
-+ *	@sp_count: address of the variable containing the number of partitio=
ns matching the UUID
-+ *			 The variable is set by the driver
-+ *	@sp_descs: address of the descriptors of the partitions matching the=
 UUID
-+ *			 The address is set by the driver
-+ *
-+ * Return the number of partitions and their descriptors matching the U=
UID
-+ *
-+ * Query the secure partition data from uc_priv.
-+ * If not found, invoke FFA_PARTITION_INFO_GET FF-A function to query t=
he partition information
-+ * from secure world.
-+ *
-+ * A client of the FF-A driver should know the UUID of the service it w=
ants to
-+ * access. It should use the UUID to request the FF-A driver to provide=
 the
-+ * partition(s) information of the service. The FF-A driver uses
-+ * PARTITION_INFO_GET to obtain this information. This is implemented t=
hrough
-+ * ffa_get_partitions_info_hdlr() function.
-+ * If the partition(s) matching the UUID found, the partition(s) inform=
ation and the
-+ * number are returned.
-+ * If no partition matching the UUID is found in the cached area, a new=
 FFA_PARTITION_INFO_GET
-+ * call is issued.
-+ * If not done yet, the UUID is updated in the cached area.
-+ * This assumes that partitions data does not change in the secure worl=
d.
-+ * Otherwise u-boot will have an outdated partition data. The benefit o=
f caching
-+ * the information in the FF-A driver is to accommodate discovery after
-+ * ExitBootServices().
-+ *
-+ * Return:
-+ *
-+ * @sp_count: the number of partitions
-+ * @sp_descs: address of the partitions descriptors
-+ *
-+ * On success 0 is returned. Otherwise, failure
-+ */
-+int ffa_get_partitions_info_hdlr(struct udevice *dev, const char *uuid_=
str,
-+				 u32 *sp_count, struct ffa_partition_desc **sp_descs)
-+{
-+	u32 i;
-+	struct ffa_partition_uuid part_uuid =3D {0};
-+	struct ffa_priv *uc_priv;
-+	struct ffa_partition_desc *rx_descs;
-+
-+	uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	if (!uc_priv->partitions.count || !uc_priv->partitions.descs) {
-+		log_err("no partition installed\n");
-+		return -EINVAL;
-+	}
-+
-+	if (!uuid_str) {
-+		log_err("no UUID provided\n");
-+		return -EINVAL;
-+	}
-+
-+	if (!sp_count) {
-+		log_err("no count argument provided\n");
-+		return -EINVAL;
-+	}
-+
-+	if (!sp_descs) {
-+		log_err("no info argument provided\n");
-+		return -EINVAL;
-+	}
-+
-+	if (uuid_str_to_le_bin(uuid_str, (unsigned char *)&part_uuid)) {
-+		log_err("invalid UUID\n");
-+		return -EINVAL;
-+	}
-+
-+	log_debug("Searching FF-A partitions using the provided UUID\n");
-+
-+	*sp_count =3D 0;
-+	*sp_descs =3D uc_priv->pair.rxbuf;
-+	rx_descs =3D *sp_descs;
-+
-+	/* Search in the cached partitions */
-+	for (i =3D 0; i < uc_priv->partitions.count; i++)
-+		if (ffa_uuid_are_identical(&uc_priv->partitions.descs[i].sp_uuid,
-+					   &part_uuid)) {
-+			log_debug("FF-A partition ID %x matches the provided UUID\n",
-+				  uc_priv->partitions.descs[i].info.id);
-+
-+			(*sp_count)++;
-+			*rx_descs++ =3D uc_priv->partitions.descs[i];
-+			}
-+
-+	if (!(*sp_count)) {
-+		int ret;
-+
-+		log_debug("No FF-A partition found. Querying framework ...\n");
-+
-+		ret =3D ffa_query_partitions_info(dev, &part_uuid, sp_count);
-+
-+		if (!ret) {
-+			log_debug("Number of FF-A partition(s) matching the UUID: %d\n", *sp=
_count);
-+
-+			if (*sp_count)
-+				ret =3D ffa_get_partitions_info_hdlr(dev, uuid_str, sp_count,
-+								   sp_descs);
-+			else
-+				ret =3D -ENODATA;
-+		}
-+
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_cache_partitions_info() - Query and saves all secure partitions =
data
-+ * @dev: The FF-A bus device
-+ *
-+ * Invoke FFA_PARTITION_INFO_GET FF-A function to query from secure wor=
ld
-+ * all partitions information.
-+ *
-+ * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argume=
nt.
-+ * All installed partitions information are returned. We cache them in =
uc_priv
-+ * and we keep the UUID field empty (in FF-A 1.0 UUID is not provided b=
y the partition descriptor)
-+ *
-+ * Called at the device probing level.
-+ * ffa_cache_partitions_info uses ffa_query_partitions_info to get the =
data
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_cache_partitions_info(struct udevice *dev)
-+{
-+	return ffa_query_partitions_info(dev, NULL, NULL);
-+}
-+
-+/**
-+ * ffa_msg_send_direct_req_hdlr() - FFA_MSG_SEND_DIRECT_{REQ,RESP} hand=
ler function
-+ * @dev: The FF-A bus device
-+ * @dst_part_id: destination partition ID
-+ * @msg: pointer to the message data preallocated by the client (in/out=
)
-+ * @is_smc64: select 64-bit or 32-bit FF-A ABI
-+ *
-+ * Implement FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * FF-A functions.
-+ *
-+ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
-+ * The response from the secure partition is handled by reading the
-+ * FFA_MSG_SEND_DIRECT_RESP arguments.
-+ *
-+ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
-+ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
-+ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_msg_send_direct_req_hdlr(struct udevice *dev, u16 dst_part_id,
-+				 struct ffa_send_direct_data *msg, bool is_smc64)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+	u64 req_mode, resp_mode;
-+	struct ffa_priv *uc_priv;
-+
-+	uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	/* No partition installed */
-+	if (!uc_priv->partitions.count || !uc_priv->partitions.descs)
-+		return -ENODEV;
-+
-+	if (is_smc64) {
-+		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
-+		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
-+	} else {
-+		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
-+		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
-+	}
-+
-+	invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D req_mode,
-+			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->id) |
-+				PREP_PART_ENDPOINT_ID(dst_part_id),
-+			.a2 =3D 0,
-+			.a3 =3D msg->data0,
-+			.a4 =3D msg->data1,
-+			.a5 =3D msg->data2,
-+			.a6 =3D msg->data3,
-+			.a7 =3D msg->data4,
-+			}, &res);
-+
-+	while (res.a0 =3D=3D FFA_SMC_32(FFA_INTERRUPT))
-+		invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_RUN),
-+			.a1 =3D res.a1,
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		/* Message sent with no response */
-+		return 0;
-+	}
-+
-+	if (res.a0 =3D=3D resp_mode) {
-+		/* Message sent with response extract the return data */
-+		msg->data0 =3D res.a3;
-+		msg->data1 =3D res.a4;
-+		msg->data2 =3D res.a5;
-+		msg->data3 =3D res.a6;
-+		msg->data4 =3D res.a7;
-+
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/* FF-A driver operations (used by clients for communicating with FF-A)=
*/
-+
-+/**
-+ * ffa_partition_info_get() - FFA_PARTITION_INFO_GET driver operation
-+ *	@uuid_str: pointer to the UUID string
-+ *	@sp_count: address of the variable containing the number of partitio=
ns matching the UUID
-+ *			 The variable is set by the driver
-+ *	@sp_descs: address of the descriptors of the partitions matching the=
 UUID
-+ *			 The address is set by the driver
-+ *
-+ * Driver operation for FFA_PARTITION_INFO_GET.
-+ * Please see ffa_get_partitions_info_hdlr() description for more detai=
ls.
-+ *
-+ * Return:
-+ *
-+ * @sp_count: the number of partitions
-+ * @sp_descs: address of the partitions descriptors
-+ *
-+ * On success 0 is returned. Otherwise, failure
-+ */
-+int ffa_partition_info_get(struct udevice *dev, const char *uuid_str,
-+			   u32 *sp_count, struct ffa_partition_desc **sp_descs)
-+{
-+	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
-+
-+	if (!ops->partition_info_get)
-+		return -ENOSYS;
-+
-+	return ops->partition_info_get(dev, uuid_str, sp_count, sp_descs);
-+}
-+
-+/**
-+ * ffa_sync_send_receive() - FFA_MSG_SEND_DIRECT_{REQ,RESP} driver oper=
ation
-+ * @dev: The FF-A bus device
-+ * @dst_part_id: destination partition ID
-+ * @msg: pointer to the message data preallocated by the client (in/out=
)
-+ * @is_smc64: select 64-bit or 32-bit FF-A ABI
-+ *
-+ * Driver operation for FFA_MSG_SEND_DIRECT_{REQ,RESP}.
-+ * Please see ffa_msg_send_direct_req_hdlr() description for more detai=
ls.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_sync_send_receive(struct udevice *dev, u16 dst_part_id,
-+			  struct ffa_send_direct_data *msg, bool is_smc64)
-+{
-+	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
-+
-+	if (!ops->sync_send_receive)
-+		return -ENOSYS;
-+
-+	return ops->sync_send_receive(dev, dst_part_id, msg, is_smc64);
-+}
-+
-+/**
-+ * ffa_rxtx_unmap() - FFA_RXTX_UNMAP driver operation
-+ * @dev: The FF-A bus device
-+ *
-+ * Driver operation for FFA_RXTX_UNMAP.
-+ * Please see ffa_unmap_rxtx_buffers_hdlr() description for more detail=
s.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_rxtx_unmap(struct udevice *dev)
-+{
-+	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
-+
-+	if (!ops->rxtx_unmap)
-+		return -ENOSYS;
-+
-+	return ops->rxtx_unmap(dev);
-+}
-+
-+/**
-+ * ffa_do_probe() - probing FF-A framework
-+ * @dev:	the FF-A bus device (arm_ffa)
-+ *
-+ * Probing is triggered on demand by clients searching for the uclass.
-+ * At probe level the following actions are done:
-+ *	- saving the FF-A framework version in uc_priv
-+ *	- querying from secure world the u-boot endpoint ID
-+ *	- querying from secure world the supported features of FFA_RXTX_MAP
-+ *	- mapping the RX/TX buffers
-+ *	- querying from secure world all the partitions information
-+ *
-+ * All data queried from secure world is saved in uc_priv.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_do_probe(struct udevice *dev)
-+{
-+	int ret;
-+
-+	ret =3D ffa_get_version_hdlr(dev);
-+	if (ret)
-+		return ret;
-+
-+	ret =3D ffa_get_endpoint_id(dev);
-+	if (ret)
-+		return ret;
-+
-+	ret =3D ffa_get_rxtx_map_features_hdlr(dev);
-+	if (ret)
-+		return ret;
-+
-+	ret =3D ffa_map_rxtx_buffers_hdlr(dev);
-+	if (ret)
-+		return ret;
-+
-+	ret =3D ffa_cache_partitions_info(dev);
-+	if (ret) {
-+		ffa_unmap_rxtx_buffers_hdlr(dev);
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+UCLASS_DRIVER(ffa) =3D {
-+	.name			=3D "ffa",
-+	.id			=3D UCLASS_FFA,
-+	.pre_probe		=3D ffa_do_probe,
-+	.pre_remove		=3D ffa_unmap_rxtx_buffers_hdlr,
-+	.per_device_auto	=3D sizeof(struct ffa_priv)
-+};
-diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
-new file mode 100644
-index 0000000000..68df75bd9e
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/arm-ffa.c
-@@ -0,0 +1,104 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <arm_ffa.h>
-+#include <arm_ffa_priv.h>
-+#include <dm.h>
-+#include <log.h>
-+#include <asm/global_data.h>
-+#include <dm/device-internal.h>
-+#include <linux/errno.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/**
-+ * invoke_ffa_fn() - SMC wrapper
-+ * @args: FF-A ABI arguments to be copied to Xn registers
-+ * @res: FF-A ABI return data to be copied from Xn registers
-+ *
-+ * Calls low level SMC assembly function
-+ */
-+void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_smc(&args, res);
-+}
-+
-+/**
-+ * arm_ffa_discover() - perform FF-A discovery
-+ * @dev: The Arm FF-A bus device (arm_ffa)
-+ * Try to discover the FF-A framework. Discovery is performed by
-+ * querying the FF-A framework version from secure world using the FFA_=
VERSION ABI.
-+ * Return:
-+ *
-+ * true on success. Otherwise, false.
-+ */
-+static bool arm_ffa_discover(struct udevice *dev)
-+{
-+	int ret;
-+
-+	log_info("Arm FF-A framework discovery\n");
-+
-+	ret =3D ffa_get_version_hdlr(dev);
-+	if (ret)
-+		return false;
-+
-+	return true;
-+}
-+
-+/**
-+ * arm_ffa_is_supported() - FF-A bus discovery callback
-+ * @invoke_fn: legacy SMC invoke function (not used)
-+ *
-+ * Perform FF-A discovery by calling arm_ffa_discover().
-+ * Discovery is performed by querying the FF-A framework version from
-+ * secure world using the FFA_VERSION ABI.
-+ *
-+ * The FF-A driver is registered as an SMCCC feature driver. So, featur=
es discovery
-+ * callbacks are called by the PSCI driver (PSCI device is the SMCCC fe=
atures
-+ * root device).
-+ *
-+ * The FF-A driver supports the SMCCCv1.2 extended input/output registe=
rs.
-+ * So, the legacy SMC invocation is not used.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static bool arm_ffa_is_supported(void (*invoke_fn)(ulong a0, ulong a1,
-+						   ulong a2, ulong a3,
-+						   ulong a4, ulong a5,
-+						   ulong a6, ulong a7,
-+						   struct arm_smccc_res *res))
-+{
-+	return arm_ffa_discover(NULL);
-+}
-+
-+/* Arm FF-A driver operations */
-+
-+static const struct ffa_bus_ops ffa_ops =3D {
-+	.partition_info_get =3D ffa_get_partitions_info_hdlr,
-+	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
-+	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
-+};
-+
-+/* Registering the FF-A driver as an SMCCC feature driver */
-+
-+ARM_SMCCC_FEATURE_DRIVER(arm_ffa) =3D {
-+	.driver_name =3D FFA_DRV_NAME,
-+	.is_supported =3D arm_ffa_is_supported,
-+};
-+
-+/* Declaring the FF-A driver under UCLASS_FFA */
-+
-+U_BOOT_DRIVER(arm_ffa) =3D {
-+	.name		=3D FFA_DRV_NAME,
-+	.id		=3D UCLASS_FFA,
-+	.flags		=3D DM_REMOVE_OS_PREPARE,
-+	.ops		=3D &ffa_ops,
-+};
-diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h b/drivers/f=
irmware/arm-ffa/sandbox_arm_ffa_priv.h
-new file mode 100644
-index 0000000000..4338f9c9b1
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
-@@ -0,0 +1,14 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __SANDBOX_ARM_FFA_PRV_H
-+#define __SANDBOX_ARM_FFA_PRV_H
-+
-+/* Future sandbox support private declarations */
-+
-+#endif
-diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-new file mode 100644
-index 0000000000..db9b1be995
---- /dev/null
-+++ b/include/arm_ffa.h
-@@ -0,0 +1,213 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_H
-+#define __ARM_FFA_H
-+
-+#include <linux/printk.h>
-+
-+/*
-+ * This header is public. It can be used by clients to access
-+ * data structures and definitions they need
-+ */
-+
-+/*
-+ * struct ffa_partition_info - Partition information descriptor
-+ * @id:	Partition ID
-+ * @exec_ctxt:	Execution context count
-+ * @properties:	Partition properties
-+ *
-+ * Data structure containing information about partitions instantiated =
in the system
-+ * This structure is filled with the data queried by FFA_PARTITION_INFO=
_GET
-+ */
-+struct ffa_partition_info {
-+	u16 id;
-+	u16 exec_ctxt;
-+/* partition supports receipt of direct requests */
-+#define FFA_PARTITION_DIRECT_RECV	BIT(0)
-+/* partition can send direct requests. */
-+#define FFA_PARTITION_DIRECT_SEND	BIT(1)
-+/* partition can send and receive indirect messages. */
-+#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
-+	u32 properties;
-+};
-+
-+/*
-+ * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
-+ * @a1-4:	32-bit words access to the UUID data
-+ *
-+ */
-+struct ffa_partition_uuid {
-+	u32 a1; /* w1 */
-+	u32 a2; /* w2 */
-+	u32 a3; /* w3 */
-+	u32 a4; /* w4 */
-+};
-+
-+/**
-+ * struct ffa_partition_desc - the secure partition descriptor
-+ * @info:	partition information
-+ * @sp_uuid:	the secure partition UUID
-+ *
-+ * Each partition has its descriptor containing the partitions informat=
ion and the UUID
-+ */
-+struct ffa_partition_desc {
-+	struct ffa_partition_info info;
-+	struct ffa_partition_uuid sp_uuid;
-+};
-+
-+/*
-+ * struct ffa_send_direct_data - Data structure hosting the data
-+ *                                       used by FFA_MSG_SEND_DIRECT_{R=
EQ,RESP}
-+ * @data0-4:	Data read/written from/to x3-x7 registers
-+ *
-+ * Data structure containing the data to be sent by FFA_MSG_SEND_DIRECT=
_REQ
-+ * or read from FFA_MSG_SEND_DIRECT_RESP
-+ */
-+
-+/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
-+struct ffa_send_direct_data {
-+	ulong data0; /* w3/x3 */
-+	ulong data1; /* w4/x4 */
-+	ulong data2; /* w5/x5 */
-+	ulong data3; /* w6/x6 */
-+	ulong data4; /* w7/x7 */
-+};
-+
-+struct udevice;
-+
-+/**
-+ * struct ffa_bus_ops - Operations for FF-A
-+ * @partition_info_get:	callback for the FFA_PARTITION_INFO_GET
-+ * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
-+ * @rxtx_unmap:	callback for the FFA_RXTX_UNMAP
-+ *
-+ * The data structure providing all the operations supported by the dri=
ver.
-+ * This structure is EFI runtime resident.
-+ */
-+struct ffa_bus_ops {
-+	int (*partition_info_get)(struct udevice *dev, const char *uuid_str,
-+				  u32 *sp_count, struct ffa_partition_desc **sp_descs);
-+	int (*sync_send_receive)(struct udevice *dev, u16 dst_part_id,
-+				 struct ffa_send_direct_data *msg,
-+				 bool is_smc64);
-+	int (*rxtx_unmap)(struct udevice *dev);
-+};
-+
-+#define ffa_get_ops(dev)        ((struct ffa_bus_ops *)(dev)->driver->o=
ps)
-+
-+/**
-+ * ffa_rxtx_unmap() - FFA_RXTX_UNMAP driver operation
-+ * Please see ffa_unmap_rxtx_buffers_hdlr() description for more detail=
s.
-+ */
-+int ffa_rxtx_unmap(struct udevice *dev);
-+
-+/**
-+ * ffa_unmap_rxtx_buffers_hdlr() - FFA_RXTX_UNMAP handler function
-+ * @dev: The arm_ffa bus device
-+ *
-+ * This function implements FFA_RXTX_UNMAP FF-A function
-+ * to unmap the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev);
-+
-+/**
-+ * ffa_sync_send_receive() - FFA_MSG_SEND_DIRECT_{REQ,RESP} driver oper=
ation
-+ * Please see ffa_msg_send_direct_req_hdlr() description for more detai=
ls.
-+ */
-+int ffa_sync_send_receive(struct udevice *dev, u16 dst_part_id,
-+			  struct ffa_send_direct_data *msg, bool is_smc64);
-+
-+/**
-+ * ffa_msg_send_direct_req_hdlr() - FFA_MSG_SEND_DIRECT_{REQ,RESP} hand=
ler function
-+ * @dev: The arm_ffa bus device
-+ * @dst_part_id: destination partition ID
-+ * @msg: pointer to the message data preallocated by the client (in/out=
)
-+ * @is_smc64: select 64-bit or 32-bit FF-A ABI
-+ *
-+ * This function implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * FF-A functions.
-+ *
-+ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
-+ * The response from the secure partition is handled by reading the
-+ * FFA_MSG_SEND_DIRECT_RESP arguments.
-+ *
-+ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
-+ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
-+ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_msg_send_direct_req_hdlr(struct udevice *dev, u16 dst_part_id,
-+				 struct ffa_send_direct_data *msg, bool is_smc64);
-+
-+/**
-+ * ffa_partition_info_get() - FFA_PARTITION_INFO_GET driver operation
-+ * Please see ffa_get_partitions_info_hdlr() description for more detai=
ls.
-+ */
-+int ffa_partition_info_get(struct udevice *dev, const char *uuid_str,
-+			   u32 *sp_count, struct ffa_partition_desc **sp_descs);
-+
-+/**
-+ * ffa_get_partitions_info_hdlr() - FFA_PARTITION_INFO_GET handler func=
tion
-+ *	@uuid_str: pointer to the UUID string
-+ *	@sp_count: address of the variable containing the number of partitio=
ns matching the UUID
-+ *			 The variable is set by the driver
-+ *	@sp_descs: address of the descriptors of the partitions matching the=
 UUID
-+ *			 The address is set by the driver
-+ *
-+ * Return the number of partitions and their descriptors matching the U=
UID
-+ *
-+ * Query the secure partition data from uc_priv.
-+ * If not found, invoke FFA_PARTITION_INFO_GET
-+ * FF-A function to query the partition information from secure world.
-+ *
-+ * A client of the FF-A driver should know the UUID of the service it w=
ants to
-+ * access. It should use the UUID to request the FF-A driver to provide=
 the
-+ * partition(s) information of the service. The FF-A driver uses
-+ * PARTITION_INFO_GET to obtain this information. This is implemented t=
hrough
-+ * ffa_get_partitions_info_hdlr() function.
-+ * A new FFA_PARTITION_INFO_GET call is issued (first one performed thr=
ough
-+ * ffa_cache_partitions_info) allowing to retrieve the partition(s) inf=
ormation.
-+ * They are not saved (already done). We only update the UUID in the ca=
ched area.
-+ * This assumes that partitions data does not change in the secure worl=
d.
-+ * Otherwise u-boot will have an outdated partition data. The benefit o=
f caching
-+ * the information in the FF-A driver is to accommodate discovery after
-+ * ExitBootServices().
-+ *
-+ * Return:
-+ *
-+ * @sp_count: the number of partitions
-+ * @sp_descs: address of the partitions descriptors
-+ *
-+ * On success 0 is returned. Otherwise, failure
-+ */
-+int ffa_get_partitions_info_hdlr(struct udevice *dev, const char *uuid_=
str,
-+				 u32 *sp_count, struct ffa_partition_desc **sp_descs);
-+
-+struct ffa_priv;
-+
-+/**
-+ * ffa_set_smc_conduit() - Set the SMC conduit
-+ * @dev: The FF-A bus device
-+ *
-+ * Selects the SMC conduit by setting the FF-A ABI invoke function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_set_smc_conduit(struct udevice *dev);
-+
-+#endif
-diff --git a/include/arm_ffa_priv.h b/include/arm_ffa_priv.h
-new file mode 100644
-index 0000000000..d564c33c64
---- /dev/null
-+++ b/include/arm_ffa_priv.h
-@@ -0,0 +1,246 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_PRV_H
-+#define __ARM_FFA_PRV_H
-+
-+#include <mapmem.h>
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+
-+/* This header is exclusively used by the FF-A Uclass and FF-A driver(s=
) */
-+
-+/* Arm FF-A driver name */
-+#define FFA_DRV_NAME "arm_ffa"
-+
-+/* The FF-A SMC function definitions */
-+
-+#if CONFIG_IS_ENABLED(SANDBOX)
-+
-+/* Providing Arm SMCCC declarations to sandbox */
-+
-+/**
-+ * struct sandbox_smccc_1_2_regs - emulated SMC call arguments or resul=
ts
-+ * @a0-a17 argument values from registers 0 to 17
-+ */
-+struct sandbox_smccc_1_2_regs {
-+	ulong a0;
-+	ulong a1;
-+	ulong a2;
-+	ulong a3;
-+	ulong a4;
-+	ulong a5;
-+	ulong a6;
-+	ulong a7;
-+	ulong a8;
-+	ulong a9;
-+	ulong a10;
-+	ulong a11;
-+	ulong a12;
-+	ulong a13;
-+	ulong a14;
-+	ulong a15;
-+	ulong a16;
-+	ulong a17;
-+};
-+
-+typedef struct sandbox_smccc_1_2_regs ffa_value_t;
-+
-+#define ARM_SMCCC_FAST_CALL		1UL
-+#define ARM_SMCCC_OWNER_STANDARD	4
-+#define ARM_SMCCC_SMC_32		0
-+#define ARM_SMCCC_SMC_64		1
-+#define ARM_SMCCC_TYPE_SHIFT		31
-+#define ARM_SMCCC_CALL_CONV_SHIFT	30
-+#define ARM_SMCCC_OWNER_MASK		0x3f
-+#define ARM_SMCCC_OWNER_SHIFT		24
-+#define ARM_SMCCC_FUNC_MASK		0xffff
-+
-+#define ARM_SMCCC_CALL_VAL(type, calling_convention, owner, func_num) \
-+	(((type) << ARM_SMCCC_TYPE_SHIFT) | \
-+	((calling_convention) << ARM_SMCCC_CALL_CONV_SHIFT) | \
-+	(((owner) & ARM_SMCCC_OWNER_MASK) << ARM_SMCCC_OWNER_SHIFT) | \
-+	((func_num) & ARM_SMCCC_FUNC_MASK))
-+
-+#else
-+/* CONFIG_ARM64 */
-+#include <linux/arm-smccc.h>
-+typedef struct arm_smccc_1_2_regs ffa_value_t;
-+#endif
-+
-+/* Defining the function pointer type for the function executing the FF=
-A ABIs */
-+typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
-+
-+/* FF-A driver version definitions */
-+
-+#define MAJOR_VERSION_MASK		GENMASK(30, 16)
-+#define MINOR_VERSION_MASK		GENMASK(15, 0)
-+#define GET_FFA_MAJOR_VERSION(x)		\
-+				((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
-+#define GET_FFA_MINOR_VERSION(x)		\
-+				((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define PACK_VERSION_INFO(major, minor)			\
-+	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
-+	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
-+
-+#define FFA_MAJOR_VERSION		(1)
-+#define FFA_MINOR_VERSION		(0)
-+#define FFA_VERSION_1_0		\
-+			PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
-+
-+/* Endpoint ID mask (u-boot endpoint ID) */
-+
-+#define GET_SELF_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define GET_SELF_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_GET(GET_SELF_ENDPOINT_ID_MASK, (x))))
-+
-+#define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
-+#define PREP_SELF_ENDPOINT_ID(x)		\
-+			(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x)))
-+
-+/* Partition endpoint ID mask  (partition with which u-boot communicate=
s with) */
-+
-+#define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define PREP_PART_ENDPOINT_ID(x)		\
-+			(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x)))
-+
-+/* Definitions of the Arm FF-A interfaces supported by the Arm FF-A dri=
ver */
-+
-+#define FFA_SMC(calling_convention, func_num)				\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
-+
-+#define FFA_SMC_32(func_num)				FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
-+#define FFA_SMC_64(func_num)				FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
-+
-+enum ffa_abis {
-+	FFA_ERROR                 =3D 0x60,
-+	FFA_SUCCESS               =3D 0x61,
-+	FFA_INTERRUPT             =3D 0x62,
-+	FFA_VERSION               =3D 0x63,
-+	FFA_FEATURES              =3D 0x64,
-+	FFA_RX_RELEASE            =3D 0x65,
-+	FFA_RXTX_MAP              =3D 0x66,
-+	FFA_RXTX_UNMAP            =3D 0x67,
-+	FFA_PARTITION_INFO_GET    =3D 0x68,
-+	FFA_ID_GET                =3D 0x69,
-+	FFA_RUN                   =3D 0x6d,
-+	FFA_MSG_SEND_DIRECT_REQ   =3D 0x6f,
-+	FFA_MSG_SEND_DIRECT_RESP  =3D 0x70,
-+
-+	/* To be updated when adding new FFA IDs */
-+	FFA_FIRST_ID              =3D FFA_ERROR, /* Lowest number ID */
-+	FFA_LAST_ID               =3D FFA_MSG_SEND_DIRECT_RESP, /* Highest num=
ber ID */
-+};
-+
-+enum ffa_abi_errcode {
-+	NOT_SUPPORTED =3D 1,
-+	INVALID_PARAMETERS,
-+	NO_MEMORY,
-+	BUSY,
-+	INTERRUPTED,
-+	DENIED,
-+	RETRY,
-+	ABORTED,
-+	MAX_NUMBER_FFA_ERR
-+};
-+
-+extern int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR];
-+
-+/* Container structure and helper macros to map between an FF-A error a=
nd relevant error log */
-+struct ffa_abi_errmap {
-+	char *err_str[MAX_NUMBER_FFA_ERR];
-+};
-+
-+#define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
-+#define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
-+
-+/**
-+ * enum ffa_rxtx_buf_sizes - minimum sizes supported
-+ * for the RX/TX buffers
-+ */
-+enum ffa_rxtx_buf_sizes {
-+	RXTX_4K,
-+	RXTX_64K,
-+	RXTX_16K
-+};
-+
-+/**
-+ * struct ffa_rxtxpair - Hosts the RX/TX buffers virtual addresses
-+ * @rxbuf:	virtual address of the RX buffer
-+ * @txbuf:	virtual address of the TX buffer
-+ * @rxtx_min_pages:	RX/TX buffers minimum size in pages
-+ *
-+ * Hosts the virtual addresses of the mapped RX/TX buffers
-+ * These addresses are used by the FF-A functions that use the RX/TX bu=
ffers
-+ */
-+struct ffa_rxtxpair {
-+	void *rxbuf; /* Virtual address returned by memalign */
-+	void *txbuf; /* Virtual address returned by memalign */
-+	size_t rxtx_min_pages; /* Minimum number of pages in each of the RX/TX=
 buffers */
-+};
-+
-+struct ffa_partition_desc;
-+
-+/**
-+ * struct ffa_partitions - descriptors for all secure partitions
-+ * @count:	The number of partitions descriptors
-+ * @descs	The partitions descriptors table
-+ *
-+ * Contains the partitions descriptors table
-+ */
-+struct ffa_partitions {
-+	u32 count;
-+	struct ffa_partition_desc *descs; /* Virtual address */
-+};
-+
-+/**
-+ * struct ffa_priv - the driver private data structure
-+ *
-+ * @fwk_version:	FF-A framework version
-+ * @emul:	FF-A sandbox emulator
-+ * @id:	u-boot endpoint ID
-+ * @partitions:	The partitions descriptors structure
-+ * @pair:	The RX/TX buffers pair
-+ *
-+ * The device private data structure containing all the
-+ * data read from secure world.
-+ */
-+struct ffa_priv {
-+	u32 fwk_version;
-+	struct udevice *emul;
-+	u16 id;
-+	struct ffa_partitions partitions;
-+	struct ffa_rxtxpair pair;
-+};
-+
-+/**
-+ * ffa_get_version_hdlr() - FFA_VERSION handler function
-+ * @dev: The FF-A bus device
-+ *
-+ * Implement FFA_VERSION FF-A function
-+ * to get from the secure world the FF-A framework version
-+ * FFA_VERSION is used to discover the FF-A framework.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_get_version_hdlr(struct udevice *dev);
-+
-+/**
-+ * invoke_ffa_fn() - SMC wrapper
-+ * @args: FF-A ABI arguments to be copied to Xn registers
-+ * @res: FF-A ABI return data to be copied from Xn registers
-+ *
-+ * Calls low level SMC implementation.
-+ * This function should be implemented by the user driver.
-+ */
-+void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res);
-+
-+#endif
-diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index 307ad6931c..3c6af2e3d2 100644
---- a/include/dm/uclass-id.h
-+++ b/include/dm/uclass-id.h
-@@ -4,6 +4,11 @@
-  *
-  * (C) Copyright 2012
-  * Pavel Herrmann <morpheus.ibis@gmail.com>
-+ *
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #ifndef _DM_UCLASS_ID_H
-@@ -57,6 +62,7 @@ enum uclass_id {
- 	UCLASS_ETH,		/* Ethernet device */
- 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
- 	UCLASS_EXTCON,		/* External Connector Class */
-+	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
- 	UCLASS_FIRMWARE,	/* Firmware */
- 	UCLASS_FPGA,		/* FPGA device */
- 	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-sandbox-Replace-the-emulator-error-log-with-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sandbox-Replace-the-emu=
lator-error-log-with-.patch
new file mode 100644
index 00000000..5ffb7a06
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sa=
ndbox-Replace-the-emulator-error-log-with-.patch
@@ -0,0 +1,43 @@
+From 939406ee3612ad261a51c002655e90431741aa78 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 17 Oct 2024 22:11:22 +0100
+Subject: [PATCH 04/36] arm_ffa: sandbox: Replace the emulator error log =
with
+ debug log
+
+Set the log to a debug log and reformulate the message
+
+The message is about showing what the emulated FF-A ABI decided
+based on the user arguments. The log is just for information purposes
+and helpful when debugging.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+index 1521d9b66ac..d2f051f7e2a 100644
+--- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -658,8 +658,7 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
+ 			args->a0);
+ 	}
+=20
+-	if (ret !=3D 0)
+-		log_err("FF-A ABI internal failure (%d)\n", ret);
++	log_debug("Emulated FF-A ABI feedback (%d)\n", ret);
+ }
+=20
+ /**
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-=
A-v15-arm_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0005-FF-A-v15-arm_ffa-introduce-armffa-command.=
patch
deleted file mode 100644
index 8672652b..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-A-v15-a=
rm_ffa-introduce-armffa-command.patch
+++ /dev/null
@@ -1,433 +0,0 @@
-From 57e4d6e9c5fc174a96366268150bc85de75baa79 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 10 May 2023 17:27:01 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: introduce armffa command
-
-Provide armffa command showcasing the use of the U-Boot FF-A support
-
-armffa is a command showcasing how to invoke FF-A operations.
-This provides a guidance to the client developers on how to
-call the FF-A bus interfaces. The command also allows to gather secure
-partitions information and ping these  partitions. The command is also
-helpful in testing the communication with secure partitions.
-
-For more details please refer to the command documentation [1].
-
-[1]: doc/usage/cmd/armffa.rst
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- MAINTAINERS                      |   2 +
- cmd/Kconfig                      |  10 ++
- cmd/Makefile                     |   1 +
- cmd/armffa.c                     | 202 +++++++++++++++++++++++++++++++
- doc/arch/arm64.ffa.rst           |   7 ++
- doc/usage/cmd/armffa.rst         |  93 ++++++++++++++
- doc/usage/index.rst              |   1 +
- drivers/firmware/arm-ffa/Kconfig |   1 +
- 8 files changed, 317 insertions(+)
- create mode 100644 cmd/armffa.c
- create mode 100644 doc/usage/cmd/armffa.rst
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 9c5ebf312c..4ae82229fc 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -269,7 +269,9 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
- ARM FF-A
- M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
- S:	Maintained
-+F:	cmd/armffa.c
- F:	doc/arch/arm64.ffa.rst
-+F:	doc/usage/cmd/armffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
- F:	include/sandbox_arm_ffa.h
-diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 02e54f1e50..79b4f8367a 100644
---- a/cmd/Kconfig
-+++ b/cmd/Kconfig
-@@ -935,6 +935,16 @@ endmenu
-=20
- menu "Device access commands"
-=20
-+config CMD_ARMFFA
-+	bool "Arm FF-A test command"
-+	depends on ARM_FFA_TRANSPORT
-+	help
-+	  Provides a test command for the FF-A support
-+	  supported options:
-+		- Listing the partition(s) info
-+		- Sending a data pattern to the specified partition
-+		- Displaying the arm_ffa device info
-+
- config CMD_ARMFLASH
- 	#depends on FLASH_CFI_DRIVER
- 	bool "armflash"
-diff --git a/cmd/Makefile b/cmd/Makefile
-index 6c37521b4e..7d20a85a46 100644
---- a/cmd/Makefile
-+++ b/cmd/Makefile
-@@ -12,6 +12,7 @@ obj-y +=3D panic.o
- obj-y +=3D version.o
-=20
- # command
-+obj-$(CONFIG_CMD_ARMFFA) +=3D armffa.o
- obj-$(CONFIG_CMD_2048) +=3D 2048.o
- obj-$(CONFIG_CMD_ACPI) +=3D acpi.o
- obj-$(CONFIG_CMD_ADDRMAP) +=3D addrmap.o
-diff --git a/cmd/armffa.c b/cmd/armffa.c
-new file mode 100644
-index 0000000000..7e6eafc03a
---- /dev/null
-+++ b/cmd/armffa.c
-@@ -0,0 +1,202 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+#include <common.h>
-+#include <arm_ffa.h>
-+#include <command.h>
-+#include <dm.h>
-+#include <mapmem.h>
-+#include <stdlib.h>
-+#include <asm/io.h>
-+
-+/* Select the right physical address formatting according to the platfo=
rm */
-+#ifdef CONFIG_PHYS_64BIT
-+#define PhysAddrLength "ll"
-+#else
-+#define PhysAddrLength ""
-+#endif
-+#define PHYS_ADDR_LN "%" PhysAddrLength "x"
-+
-+/**
-+ * ffa_get_dev() - Return the FF-A device
-+ * @devp:	pointer to the FF-A device
-+ *
-+ * Search for the FF-A device.
-+ *
-+ * Return:
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_get_dev(struct udevice **devp)
-+{
-+	int ret;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA, devp);
-+	if (ret) {
-+		log_err("Cannot find FF-A bus device\n");
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * do_ffa_getpart() - implementation of the getpart subcommand
-+ * @cmdtp:		Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * Query a secure partition information. The secure partition UUID is p=
rovided
-+ * as an argument. The function uses the arm_ffa driver
-+ * partition_info_get operation which implements FFA_PARTITION_INFO_GET
-+ * ABI to retrieve the data. The input UUID string is expected to be in=
 big
-+ * endian format.
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+static int do_ffa_getpart(struct cmd_tbl *cmdtp, int flag, int argc,
-+			  char *const argv[])
-+{
-+	u32 count =3D 0;
-+	int ret;
-+	struct ffa_partition_desc *descs;
-+	u32 i;
-+	struct udevice *dev;
-+
-+	if (argc !=3D 2) {
-+		log_err("Missing argument\n");
-+		return CMD_RET_USAGE;
-+	}
-+
-+	ret =3D ffa_get_dev(&dev);
-+	if (ret)
-+		return CMD_RET_FAILURE;
-+
-+	/* Ask the driver to fill the buffer with the SPs info */
-+
-+	ret =3D ffa_partition_info_get(dev, argv[1], &count, &descs);
-+	if (ret) {
-+		log_err("Failure in querying partition(s) info (error code: %d)\n", r=
et);
-+		return CMD_RET_FAILURE;
-+	}
-+
-+	/* SPs found , show the partition information */
-+	for (i =3D 0; i < count ; i++) {
-+		log_info("Partition: id =3D %x , exec_ctxt %x , properties %x\n",
-+			 descs[i].info.id,
-+			 descs[i].info.exec_ctxt,
-+			 descs[i].info.properties);
-+	}
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+/**
-+ * do_ffa_ping() - implementation of the ping subcommand
-+ * @cmdtp:		Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * Send data to a secure partition. The secure partition UUID is provid=
ed
-+ * as an argument. Use the arm_ffa driver sync_send_receive operation
-+ * which implements FFA_MSG_SEND_DIRECT_{REQ,RESP} ABIs to send/receive=
 data.
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+static int do_ffa_ping(struct cmd_tbl *cmdtp, int flag, int argc, char =
*const argv[])
-+{
-+	struct ffa_send_direct_data msg =3D {
-+			.data0 =3D 0xaaaaaaaa,
-+			.data1 =3D 0xbbbbbbbb,
-+			.data2 =3D 0xcccccccc,
-+			.data3 =3D 0xdddddddd,
-+			.data4 =3D 0xeeeeeeee,
-+	};
-+	u16 part_id;
-+	int ret;
-+	struct udevice *dev;
-+
-+	if (argc !=3D 2) {
-+		log_err("Missing argument\n");
-+		return CMD_RET_USAGE;
-+	}
-+
-+	part_id =3D strtoul(argv[1], NULL, 16);
-+	if (!part_id) {
-+		log_err("Partition ID can not be 0\n");
-+		return CMD_RET_USAGE;
-+	}
-+
-+	ret =3D ffa_get_dev(&dev);
-+	if (ret)
-+		return CMD_RET_FAILURE;
-+
-+	ret =3D ffa_sync_send_receive(dev, part_id, &msg, 1);
-+	if (!ret) {
-+		u8 cnt;
-+
-+		log_info("SP response:\n[LSB]\n");
-+		for (cnt =3D 0;
-+		     cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64);
-+		     cnt++)
-+			log_info("%llx\n", ((u64 *)&msg)[cnt]);
-+		return CMD_RET_SUCCESS;
-+	}
-+
-+	log_err("Sending direct request error (%d)\n", ret);
-+	return CMD_RET_FAILURE;
-+}
-+
-+/**
-+ *do_ffa_devlist() - implementation of the devlist subcommand
-+ * @cmdtp: [in]		Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * Query the device belonging to the UCLASS_FFA
-+ * class.
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+static int do_ffa_devlist(struct cmd_tbl *cmdtp, int flag, int argc, ch=
ar *const argv[])
-+{
-+	struct udevice *dev;
-+	int ret;
-+
-+	ret =3D ffa_get_dev(&dev);
-+	if (ret)
-+		return CMD_RET_FAILURE;
-+
-+	log_info("device %s, addr " PHYS_ADDR_LN ", driver %s, ops " PHYS_ADDR=
_LN "\n",
-+		 dev->name,
-+		 map_to_sysmem(dev),
-+		 dev->driver->name,
-+		 map_to_sysmem(dev->driver->ops));
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static char armffa_help_text[] =3D
-+	"getpart <partition UUID>\n"
-+	"       - lists the partition(s) info\n"
-+	"ping <partition ID>\n"
-+	"       - sends a data pattern to the specified partition\n"
-+	"devlist\n"
-+	"       - displays information about the FF-A device/driver\n";
-+
-+U_BOOT_CMD_WITH_SUBCMDS(armffa, "Arm FF-A test command", armffa_help_te=
xt,
-+			U_BOOT_SUBCMD_MKENT(getpart, 2, 1, do_ffa_getpart),
-+			U_BOOT_SUBCMD_MKENT(ping, 2, 1, do_ffa_ping),
-+			U_BOOT_SUBCMD_MKENT(devlist, 1, 1, do_ffa_devlist));
-diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
-index 4f817f053c..aefd527447 100644
---- a/doc/arch/arm64.ffa.rst
-+++ b/doc/arch/arm64.ffa.rst
-@@ -205,6 +205,13 @@ The following features are provided:
-=20
- - FF-A bus can be compiled and used without EFI
-=20
-+The armffa command
-+-----------------------------------
-+
-+armffa is a command showcasing how to use the FF-A bus and how to invok=
e the driver operations.
-+
-+Please refer the command documentation at :doc:`../usage/cmd/armffa`
-+
- Example of boot logs with FF-A enabled
- --------------------------------------
-=20
-diff --git a/doc/usage/cmd/armffa.rst b/doc/usage/cmd/armffa.rst
-new file mode 100644
-index 0000000000..3d422686c1
---- /dev/null
-+++ b/doc/usage/cmd/armffa.rst
-@@ -0,0 +1,93 @@
-+.. SPDX-License-Identifier: GPL-2.0+:
-+
-+armffa command
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+Synopsis
-+--------
-+
-+::
-+
-+   armffa [sub-command] [arguments]
-+
-+   sub-commands:
-+
-+        getpart [partition UUID]
-+
-+            lists the partition(s) info
-+
-+        ping [partition ID]
-+
-+            sends a data pattern to the specified partition
-+
-+        devlist
-+
-+            displays information about the FF-A device/driver
-+
-+Description
-+-----------
-+
-+armffa is a command showcasing how to use the FF-A bus and how to invok=
e its operations.
-+
-+This provides a guidance to the client developers on how to call the FF=
-A bus interfaces.
-+
-+The command also allows to gather secure partitions information and pin=
g these  partitions.
-+
-+The command is also helpful in testing the communication with secure pa=
rtitions.
-+
-+Example
-+-------
-+
-+The following examples are run on Corstone-1000 platform.
-+
-+* ping
-+
-+::
-+
-+   corstone1000# armffa ping 0x8003
-+   SP response:
-+   [LSB]
-+   fffffffe
-+   0
-+   0
-+   0
-+   0
-+
-+* ping (failure case)
-+
-+::
-+
-+   corstone1000# armffa ping 0
-+   Sending direct request error (-22)
-+
-+* getpart
-+
-+::
-+
-+   corstone1000# armffa getpart 33d532ed-e699-0942-c09c-a798d9cd722d
-+   Partition: id =3D 8003 , exec_ctxt 1 , properties 3
-+
-+* getpart (failure case)
-+
-+::
-+
-+   corstone1000# armffa getpart 33d532ed-e699-0942-c09c-a798d9cd7221
-+   INVALID_PARAMETERS: Unrecognized UUID
-+   Failure in querying partitions count (error code: -22)
-+
-+* devlist
-+
-+::
-+
-+   corstone1000# armffa devlist
-+   device name arm_ffa, dev 00000000fdf41c30, driver name arm_ffa, ops =
00000000fffc0e98
-+
-+Configuration
-+-------------
-+
-+The command is available if CONFIG_CMD_ARMFFA=3Dy and CONFIG_ARM_FFA_TR=
ANSPORT=3Dy.
-+
-+Return value
-+------------
-+
-+The return value $? is 0 (true) on success, 1 (false) on failure.
-diff --git a/doc/usage/index.rst b/doc/usage/index.rst
-index 388e59f173..e462de2806 100644
---- a/doc/usage/index.rst
-+++ b/doc/usage/index.rst
-@@ -22,6 +22,7 @@ Shell commands
-=20
-    cmd/acpi
-    cmd/addrmap
-+   cmd/armffa
-    cmd/askenv
-    cmd/base
-    cmd/bdinfo
-diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index 9200c8028b..a7d5392859 100644
---- a/drivers/firmware/arm-ffa/Kconfig
-+++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -5,6 +5,7 @@ config ARM_FFA_TRANSPORT
- 	depends on DM && ARM64
- 	select ARM_SMCCC
- 	select ARM_SMCCC_FEATURES
-+	imply CMD_ARMFFA
- 	select LIB_UUID
- 	select DEVRES
- 	help
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm=
_ffa-sandbox-Improve-the-readability-of-clearing-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sandbox-Improve-the-rea=
dability-of-clearing-.patch
new file mode 100644
index 00000000..f3d4eefa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sa=
ndbox-Improve-the-readability-of-clearing-.patch
@@ -0,0 +1,128 @@
+From 20f7e4fcd4aec29729c7c3ab2e9dbfe69a04d167 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Tue, 11 Feb 2025 17:54:45 +0000
+Subject: [PATCH 05/36] arm_ffa: sandbox: Improve the readability of clea=
ring
+ the X registers
+
+Make clearing the must be zero registers more readable in the emulator
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ .../sandbox/include/asm/sandbox_arm_ffa_priv.h | 15 ++-------------
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c     | 18 +++++++++---------
+ 2 files changed, 11 insertions(+), 22 deletions(-)
+
+diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h b/arch/sand=
box/include/asm/sandbox_arm_ffa_priv.h
+index b0881822d78..5c46547beab 100644
+--- a/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
++++ b/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
+@@ -39,19 +39,8 @@
+ #define RXTX_BUFFERS_MIN_SIZE (RXTX_4K)
+ #define RXTX_BUFFERS_MIN_PAGES (1)
+=20
+-/* MBZ registers info */
+-
+-/* x1-x7 MBZ */
+-#define FFA_X1X7_MBZ_CNT (7)
+-#define FFA_X1X7_MBZ_REG_START (&res->a1)
+-
+-/* x4-x7 MBZ */
+-#define FFA_X4X7_MBZ_CNT (4)
+-#define FFA_X4X7_MBZ_REG_START (&res->a4)
+-
+-/* x3-x7 MBZ */
+-#define FFA_X3X7_MBZ_CNT (5)
+-#define FFA_X3_MBZ_REG_START (&res->a3)
++/* A helper macro used for clearing registers that Must Be Zero (MBZ) *=
/
++#define FFA_X_REG_SIZE_IN_BYTE sizeof((((ffa_value_t *)0)->a0))
+=20
+ /* number of emulated FF-A secure partitions (SPs) */
+ #define SANDBOX_PARTITIONS_CNT (4)
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+index d2f051f7e2a..dcf5bce9435 100644
+--- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -83,7 +83,7 @@ static int sandbox_ffa_version(struct udevice *emul, f=
fa_value_t *pargs, ffa_val
+ 	res->a0 =3D priv->fwk_version;
+=20
+ 	/* x1-x7 MBZ */
+-	memset(FFA_X1X7_MBZ_REG_START, 0, FFA_X1X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a1, 0, 7 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 	return 0;
+ }
+@@ -111,7 +111,7 @@ static int sandbox_ffa_id_get(struct udevice *emul, =
ffa_value_t *pargs, ffa_valu
+ 	res->a2 =3D priv->id;
+=20
+ 	/* x3-x7 MBZ */
+-	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 	return 0;
+ }
+@@ -136,14 +136,14 @@ static int sandbox_ffa_features(ffa_value_t *pargs=
, ffa_value_t *res)
+ 		res->a2 =3D RXTX_BUFFERS_MIN_SIZE;
+ 		res->a3 =3D 0;
+ 		/* x4-x7 MBZ */
+-		memset(FFA_X4X7_MBZ_REG_START, 0, FFA_X4X7_MBZ_CNT * sizeof(ulong));
++		memset(&res->a4, 0, 4 * FFA_X_REG_SIZE_IN_BYTE);
+ 		return 0;
+ 	}
+=20
+ 	res->a0 =3D FFA_SMC_32(FFA_ERROR);
+ 	res->a2 =3D -NOT_SUPPORTED;
+ 	/* x3-x7 MBZ */
+-	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+ 	log_err("FF-A interface %lx not implemented\n", pargs->a1);
+=20
+ 	return ffa_to_std_errmap[NOT_SUPPORTED];
+@@ -248,7 +248,7 @@ cleanup:
+ 	res->a1 =3D 0;
+=20
+ 	/* x3-x7 MBZ */
+-	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 	return ret;
+ }
+@@ -305,7 +305,7 @@ feedback:
+ 	res->a1 =3D 0;
+=20
+ 	/* x3-x7 MBZ */
+-	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 	return ret;
+ }
+@@ -352,7 +352,7 @@ feedback:
+ 	res->a1 =3D 0;
+=20
+ 	/* x3-x7 MBZ */
+-	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 	return ret;
+ }
+@@ -388,7 +388,7 @@ static int sandbox_ffa_rx_release(struct udevice *em=
ul, ffa_value_t *pargs, ffa_
+ 	res->a1 =3D 0;
+=20
+ 	/* x3-x7 MBZ */
+-	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 	return ret;
+ }
+@@ -448,7 +448,7 @@ static int sandbox_ffa_msg_send_direct_req(struct ud=
evice *emul,
+ 		res->a2 =3D -INVALID_PARAMETERS;
+=20
+ 		/* x3-x7 MBZ */
+-		memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++		memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
+=20
+ 		return ffa_to_std_errmap[INVALID_PARAMETERS];
+ 	}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-=
A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch b/meta-arm-bsp/recipes=
-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-arm_ffa-introduce-sandbox-F=
F-A-support.patch
deleted file mode 100644
index c0078b80..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-a=
rm_ffa-introduce-sandbox-FF-A-support.patch
+++ /dev/null
@@ -1,1311 +0,0 @@
-From b05ab0973850069d819872e26fae2aecbbf75f0e Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 17 Jul 2023 15:18:58 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: introduce sandbox FF-A support
-
-Emulate Secure World's FF-A ABIs and allow testing U-Boot FF-A support
-
-Features of the sandbox FF-A support:
-
-- Introduce an FF-A emulator
-- Introduce an FF-A device driver for FF-A comms with emulated Secure Wo=
rld
-- Provides test methods allowing to read the status of the inspected ABI=
s
-
-The sandbox FF-A emulator supports only 64-bit direct messaging.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- MAINTAINERS                                   |   3 +-
- arch/sandbox/dts/sandbox.dtsi                 |   9 +
- arch/sandbox/dts/test.dts                     |   9 +
- arch/sandbox/include/asm/sandbox_arm_ffa.h    |  72 ++
- .../include/asm/sandbox_arm_ffa_priv.h        | 121 +++
- configs/sandbox64_defconfig                   |   2 +
- configs/sandbox_defconfig                     |   2 +
- doc/arch/arm64.ffa.rst                        |  19 +-
- doc/arch/sandbox/sandbox.rst                  |   1 +
- drivers/firmware/arm-ffa/Kconfig              |  13 +-
- drivers/firmware/arm-ffa/Makefile             |  10 +-
- drivers/firmware/arm-ffa/ffa-emul-uclass.c    | 720 ++++++++++++++++++
- .../firmware/arm-ffa/sandbox_arm_ffa_priv.h   |  14 -
- drivers/firmware/arm-ffa/sandbox_ffa.c        | 110 +++
- include/dm/uclass-id.h                        |   1 +
- 15 files changed, 1084 insertions(+), 22 deletions(-)
- create mode 100644 arch/sandbox/include/asm/sandbox_arm_ffa.h
- create mode 100644 arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
- create mode 100644 drivers/firmware/arm-ffa/ffa-emul-uclass.c
- delete mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
- create mode 100644 drivers/firmware/arm-ffa/sandbox_ffa.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 4ae82229fc..679a3acdd8 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -269,12 +269,13 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
- ARM FF-A
- M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
- S:	Maintained
-+F:	arch/sandbox/include/asm/sandbox_arm_ffa.h
-+F:	arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
- F:	cmd/armffa.c
- F:	doc/arch/arm64.ffa.rst
- F:	doc/usage/cmd/armffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
--F:	include/sandbox_arm_ffa.h
-=20
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
-diff --git a/arch/sandbox/dts/sandbox.dtsi b/arch/sandbox/dts/sandbox.dt=
si
-index 30a305c4d2..94a08814b8 100644
---- a/arch/sandbox/dts/sandbox.dtsi
-+++ b/arch/sandbox/dts/sandbox.dtsi
-@@ -445,6 +445,15 @@
- 	thermal {
- 		compatible =3D "sandbox,thermal";
- 	};
-+
-+	arm-ffa-emul {
-+		compatible =3D "sandbox,arm-ffa-emul";
-+
-+		sandbox-arm-ffa {
-+				compatible =3D "sandbox,arm-ffa";
-+		};
-+	};
-+
- };
-=20
- &cros_ec {
-diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
-index ff9f9222e6..c6807ee031 100644
---- a/arch/sandbox/dts/test.dts
-+++ b/arch/sandbox/dts/test.dts
-@@ -1820,6 +1820,15 @@
- 	extcon {
- 		compatible =3D "sandbox,extcon";
- 	};
-+
-+	arm-ffa-emul {
-+		compatible =3D "sandbox,arm-ffa-emul";
-+
-+		sandbox-arm-ffa {
-+			compatible =3D "sandbox,arm-ffa";
-+		};
-+	};
-+
- };
-=20
- #include "sandbox_pmic.dtsi"
-diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa.h b/arch/sandbox/i=
nclude/asm/sandbox_arm_ffa.h
-new file mode 100644
-index 0000000000..be2790f496
---- /dev/null
-+++ b/arch/sandbox/include/asm/sandbox_arm_ffa.h
-@@ -0,0 +1,72 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __SANDBOX_ARM_FFA_H
-+#define __SANDBOX_ARM_FFA_H
-+
-+#include <arm_ffa.h>
-+
-+/*
-+ * This header provides public sandbox FF-A emulator declarations
-+ * and declarations needed by FF-A sandbox clients
-+ */
-+
-+/* UUIDs strings of the emulated services */
-+#define SANDBOX_SERVICE1_UUID	"ed32d533-4209-99e6-2d72-cdd998a79cc0"
-+#define SANDBOX_SERVICE2_UUID	"ed32d544-4209-99e6-2d72-cdd998a79cc0"
-+
-+/* IDs of the emulated secure partitions (SPs) */
-+#define SANDBOX_SP1_ID 0x1245
-+#define SANDBOX_SP2_ID 0x9836
-+#define SANDBOX_SP3_ID 0x6452
-+#define SANDBOX_SP4_ID 0x7814
-+
-+/* Invalid service UUID (no matching SP) */
-+#define SANDBOX_SERVICE3_UUID	"55d532ed-0942-e699-722d-c09ca798d9cd"
-+
-+/* Invalid service UUID (invalid UUID string format) */
-+#define SANDBOX_SERVICE4_UUID	"32ed-0942-e699-722d-c09ca798d9cd"
-+
-+/* Number of valid services */
-+#define SANDBOX_SP_COUNT_PER_VALID_SERVICE	2
-+
-+/**
-+ * struct ffa_sandbox_data - query ABI state data structure
-+ * @data0_size:	size of the first argument
-+ * @data0:	pointer to the first argument
-+ * @data1_size>:	size of the second argument
-+ * @data1:	pointer to the second argument
-+ *
-+ * Used to pass various types of data with different sizes between
-+ * the test cases and the sandbox emulator.
-+ * The data is for querying FF-A ABIs state.
-+ */
-+struct ffa_sandbox_data {
-+	u32 data0_size; /* size of the first argument */
-+	void *data0; /* pointer to the first argument */
-+	u32 data1_size; /* size of the second argument */
-+	void *data1; /* pointer to the second argument */
-+};
-+
-+/* The sandbox FF-A  emulator public functions */
-+
-+/**
-+ * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
-+ * @queried_func_id:	The FF-A function to be queried
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * Query the status of FF-A ABI specified in the input argument.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int sandbox_query_ffa_emul_state(u32 queried_func_id,
-+				 struct ffa_sandbox_data *func_data);
-+
-+#endif
-diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h b/arch/sand=
box/include/asm/sandbox_arm_ffa_priv.h
-new file mode 100644
-index 0000000000..b0881822d7
---- /dev/null
-+++ b/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
-@@ -0,0 +1,121 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __SANDBOX_ARM_FFA_PRV_H
-+#define __SANDBOX_ARM_FFA_PRV_H
-+
-+#include <arm_ffa_priv.h>
-+
-+/* This header is exclusively used by the Sandbox FF-A driver and emula=
tor */
-+
-+/* Non-secure physical FF-A instance */
-+#define NS_PHYS_ENDPOINT_ID (0)
-+
-+#define GET_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(31, 16)
-+#define GET_NS_PHYS_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_GET(GET_NS_PHYS_ENDPOINT_ID_MASK, (x))))
-+
-+/* Helper macro for reading the destination partition ID */
-+#define GET_DST_SP_ID_MASK		GENMASK(15, 0)
-+#define GET_DST_SP_ID(x)		\
-+			((u16)(FIELD_GET(GET_DST_SP_ID_MASK, (x))))
-+
-+/* Helper macro for setting the source partition ID */
-+#define PREP_SRC_SP_ID_MASK		GENMASK(31, 16)
-+#define PREP_SRC_SP_ID(x)		\
-+			(FIELD_PREP(PREP_SRC_SP_ID_MASK, (x)))
-+
-+/* Helper macro for setting the destination endpoint ID */
-+#define PREP_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define PREP_NS_PHYS_ENDPOINT_ID(x)		\
-+			(FIELD_PREP(PREP_NS_PHYS_ENDPOINT_ID_MASK, (x)))
-+
-+/*  RX/TX buffers minimum size */
-+#define RXTX_BUFFERS_MIN_SIZE (RXTX_4K)
-+#define RXTX_BUFFERS_MIN_PAGES (1)
-+
-+/* MBZ registers info */
-+
-+/* x1-x7 MBZ */
-+#define FFA_X1X7_MBZ_CNT (7)
-+#define FFA_X1X7_MBZ_REG_START (&res->a1)
-+
-+/* x4-x7 MBZ */
-+#define FFA_X4X7_MBZ_CNT (4)
-+#define FFA_X4X7_MBZ_REG_START (&res->a4)
-+
-+/* x3-x7 MBZ */
-+#define FFA_X3X7_MBZ_CNT (5)
-+#define FFA_X3_MBZ_REG_START (&res->a3)
-+
-+/* number of emulated FF-A secure partitions (SPs) */
-+#define SANDBOX_PARTITIONS_CNT (4)
-+
-+/* Binary data of the emulated services UUIDs */
-+
-+/* service 1  UUID binary data (little-endian format) */
-+#define SANDBOX_SERVICE1_UUID_A1	0xed32d533
-+#define SANDBOX_SERVICE1_UUID_A2	0x99e64209
-+#define SANDBOX_SERVICE1_UUID_A3	0x9cc02d72
-+#define SANDBOX_SERVICE1_UUID_A4	0xcdd998a7
-+
-+/* service 2  UUID binary data (little-endian format) */
-+#define SANDBOX_SERVICE2_UUID_A1	0xed32d544
-+#define SANDBOX_SERVICE2_UUID_A2	0x99e64209
-+#define SANDBOX_SERVICE2_UUID_A3	0x9cc02d72
-+#define SANDBOX_SERVICE2_UUID_A4	0xcdd998a7
-+
-+/**
-+ * struct ffa_rxtxpair_info - structure hosting the RX/TX buffers flags
-+ * @rxbuf_owned:	RX buffer ownership flag (the owner is non secure worl=
d)
-+ * @rxbuf_mapped:	RX buffer mapping flag
-+ * @txbuf_owned	TX buffer ownership flag
-+ * @txbuf_mapped:	TX buffer mapping flag
-+ * @rxtx_buf_size:	RX/TX buffers size
-+ *
-+ * Hosts the ownership/mapping flags of the RX/TX buffers
-+ * When a buffer is owned/mapped its corresponding flag is set to 1 oth=
erwise 0.
-+ */
-+struct ffa_rxtxpair_info {
-+	u8 rxbuf_owned;
-+	u8 rxbuf_mapped;
-+	u8 txbuf_owned;
-+	u8 txbuf_mapped;
-+	u32 rxtx_buf_size;
-+};
-+
-+/**
-+ * struct sandbox_ffa_emul - emulator data
-+ *
-+ * @fwk_version:	FF-A framework version
-+ * @id:	u-boot endpoint ID
-+ * @partitions:	The partitions descriptors structure
-+ * @pair:	The RX/TX buffers pair
-+ * @pair_info:	The RX/TX buffers pair flags and size
-+ * @test_ffa_data:	The data of the FF-A bus under test
-+ *
-+ * Hosts all the emulated secure world data.
-+ */
-+struct sandbox_ffa_emul {
-+	u32 fwk_version;
-+	u16 id;
-+	struct ffa_partitions partitions;
-+	struct ffa_rxtxpair pair;
-+	struct ffa_rxtxpair_info pair_info;
-+};
-+
-+/**
-+ * ffa_emul_find() - Finds the FF-A emulator
-+ * @dev:	the sandbox FF-A device (sandbox-arm-ffa)
-+ * @emulp:	the FF-A emulator device (sandbox-ffa-emul)
-+ * Return:
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_emul_find(struct udevice *dev, struct udevice **emulp);
-+
-+#endif
-diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
-index 98b3e0cda4..2db69b8e52 100644
---- a/configs/sandbox64_defconfig
-+++ b/configs/sandbox64_defconfig
-@@ -260,3 +260,5 @@ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
- CONFIG_UNIT_TEST=3Dy
- CONFIG_UT_TIME=3Dy
- CONFIG_UT_DM=3Dy
-+CONFIG_NVMXIP_QSPI=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
-diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index 1ec44d5b33..f77733377d 100644
---- a/configs/sandbox_defconfig
-+++ b/configs/sandbox_defconfig
-@@ -344,3 +344,5 @@ CONFIG_TEST_FDTDEC=3Dy
- CONFIG_UNIT_TEST=3Dy
- CONFIG_UT_TIME=3Dy
- CONFIG_UT_DM=3Dy
-+CONFIG_CMD_2048=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
-diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
-index aefd527447..b7c754fa3d 100644
---- a/doc/arch/arm64.ffa.rst
-+++ b/doc/arch/arm64.ffa.rst
-@@ -33,6 +33,10 @@ The U-Boot FF-A support provides the following parts:
-=20
- - A Uclass driver providing generic FF-A methods.
- - An Arm FF-A device driver providing Arm-specific methods and reusing =
the Uclass methods.
-+- A sandbox emulator for Arm FF-A, emulates the FF-A side of the Secure=
 World and provides
-+  FF-A ABIs inspection methods.
-+- An FF-A sandbox device driver for FF-A communication with the emulate=
d Secure World.
-+  The driver leverages the FF-A Uclass to establish FF-A communication.
-=20
- FF-A and SMC specifications
- -------------------------------------------
-@@ -62,6 +66,7 @@ CONFIG_ARM_FFA_TRANSPORT
-     Enables the FF-A support. Turn this on if you want to use FF-A
-     communication.
-     When using an Arm 64-bit platform, the Arm FF-A driver will be used=
.
-+    When using sandbox, the sandbox FF-A emulator and FF-A sandbox driv=
er will be used.
-=20
- FF-A ABIs under the hood
- ---------------------------------------
-@@ -98,10 +103,8 @@ architecture features including FF-A bus.
-=20
-     Class     Index  Probed  Driver                Name
-    -----------------------------------------------------------
--   ...
-     firmware      0  [ + ]   psci                      |-- psci
-     ffa                   0  [   ]   arm_ffa               |   `-- arm_=
ffa
--   ...
-=20
- The PSCI driver is bound to the PSCI device and when probed it tries to=
 discover
- the architecture features by calling a callback the features drivers pr=
ovide.
-@@ -205,6 +208,18 @@ The following features are provided:
-=20
- - FF-A bus can be compiled and used without EFI
-=20
-+Relationship between the sandbox emulator and the FF-A device
-+---------------------------------------------------------------
-+
-+::
-+
-+   =3D> dm tree
-+
-+    Class     Index  Probed  Driver                Name
-+   -----------------------------------------------------------
-+   ffa_emul      0  [ + ]   sandbox_ffa_emul      `-- arm-ffa-emul
-+    ffa                  0  [    ]   sandbox_arm_ffa               `-- =
sandbox-arm-ffa
-+
- The armffa command
- -----------------------------------
-=20
-diff --git a/doc/arch/sandbox/sandbox.rst b/doc/arch/sandbox/sandbox.rst
-index 77ca6bc4cc..a3631de749 100644
---- a/doc/arch/sandbox/sandbox.rst
-+++ b/doc/arch/sandbox/sandbox.rst
-@@ -200,6 +200,7 @@ Supported Drivers
-=20
- U-Boot sandbox supports these emulations:
-=20
-+- Arm FF-A
- - Block devices
- - Chrome OS EC
- - GPIO
-diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index a7d5392859..d75f8b53fd 100644
---- a/drivers/firmware/arm-ffa/Kconfig
-+++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -2,9 +2,9 @@
-=20
- config ARM_FFA_TRANSPORT
- 	bool "Enable Arm Firmware Framework for Armv8-A driver"
--	depends on DM && ARM64
--	select ARM_SMCCC
--	select ARM_SMCCC_FEATURES
-+	depends on DM && (ARM64 || SANDBOX)
-+	select ARM_SMCCC if !SANDBOX
-+	select ARM_SMCCC_FEATURES if !SANDBOX
- 	imply CMD_ARMFFA
- 	select LIB_UUID
- 	select DEVRES
-@@ -33,5 +33,10 @@ config ARM_FFA_TRANSPORT
- 	  Generic FF-A methods are implemented in the Uclass (arm-ffa-uclass.c=
).
- 	  Arm specific methods are implemented in the Arm driver (arm-ffa.c).
-=20
--	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
-+	  FF-A sandbox is provided to run FF-A under sandbox and allows to tes=
t the FF-A Uclass.
-+	  Sandbox support includes an emulator for Arm FF-A which emulates the=
 FF-A side of
-+	  the Secure World and provides FF-A ABIs inspection methods (ffa-emul=
-uclass.c).
-+	  An FF-A sandbox driver is also provided for FF-A communication with =
the emulated
-+	  Secure World (sandbox_ffa.c).
-=20
-+	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
-diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-index 11b1766285..318123a7f4 100644
---- a/drivers/firmware/arm-ffa/Makefile
-+++ b/drivers/firmware/arm-ffa/Makefile
-@@ -5,4 +5,12 @@
- # Authors:
- #   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-=20
--obj-y +=3D arm-ffa-uclass.o arm-ffa.o
-+# build the generic FF-A methods
-+obj-y +=3D arm-ffa-uclass.o
-+ifeq ($(CONFIG_SANDBOX),y)
-+# build the FF-A sandbox emulator and driver
-+obj-y +=3D ffa-emul-uclass.o sandbox_ffa.o
-+else
-+# build the Arm64 FF-A driver
-+obj-y +=3D arm-ffa.o
-+endif
-diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-new file mode 100644
-index 0000000000..5562bbaac3
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
-@@ -0,0 +1,720 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+#include <common.h>
-+#include <dm.h>
-+#include <mapmem.h>
-+#include <string.h>
-+#include <asm/global_data.h>
-+#include <asm/sandbox_arm_ffa.h>
-+#include <asm/sandbox_arm_ffa_priv.h>
-+#include <dm/device-internal.h>
-+#include <dm/lists.h>
-+#include <dm/root.h>
-+#include <linux/errno.h>
-+#include <linux/sizes.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/* The partitions (SPs) table */
-+static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_=
CNT] =3D {
-+	{
-+		.info =3D { .id =3D SANDBOX_SP1_ID, .exec_ctxt =3D 0x5687, .propertie=
s =3D 0x89325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
-+		}
-+	},
-+	{
-+		.info =3D { .id =3D SANDBOX_SP3_ID, .exec_ctxt =3D 0x7687, .propertie=
s =3D 0x23325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
-+		}
-+	},
-+	{
-+		.info =3D { .id =3D SANDBOX_SP2_ID, .exec_ctxt =3D 0x9587, .propertie=
s =3D 0x45325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
-+		}
-+	},
-+	{
-+		.info =3D { .id =3D SANDBOX_SP4_ID, .exec_ctxt =3D 0x1487, .propertie=
s =3D 0x70325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
-+		}
-+	}
-+
-+};
-+
-+/* The emulator functions */
-+
-+/**
-+ * sandbox_ffa_version() - Emulated FFA_VERSION handler function
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_VERSION FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+
-+static int sandbox_ffa_version(struct udevice *emul, ffa_value_t *pargs=
, ffa_value_t *res)
-+{
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	priv->fwk_version =3D FFA_VERSION_1_0;
-+	res->a0 =3D priv->fwk_version;
-+
-+	/* x1-x7 MBZ */
-+	memset(FFA_X1X7_MBZ_REG_START, 0, FFA_X1X7_MBZ_CNT * sizeof(ulong));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_id_get() - Emulated FFA_ID_GET handler function
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_ID_GET FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_id_get(struct udevice *emul, ffa_value_t *pargs,=
 ffa_value_t *res)
-+{
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+	res->a1 =3D 0;
-+
-+	priv->id =3D NS_PHYS_ENDPOINT_ID;
-+	res->a2 =3D priv->id;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_features() - Emulated FFA_FEATURES handler function
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_FEATURES FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_features(ffa_value_t *pargs, ffa_value_t *res)
-+{
-+	res->a1 =3D 0;
-+
-+	if (pargs->a1 =3D=3D FFA_SMC_64(FFA_RXTX_MAP)) {
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D RXTX_BUFFERS_MIN_SIZE;
-+		res->a3 =3D 0;
-+		/* x4-x7 MBZ */
-+		memset(FFA_X4X7_MBZ_REG_START, 0, FFA_X4X7_MBZ_CNT * sizeof(ulong));
-+		return 0;
-+	}
-+
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+	res->a2 =3D -NOT_SUPPORTED;
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+	log_err("FF-A interface %lx not implemented\n", pargs->a1);
-+
-+	return ffa_to_std_errmap[NOT_SUPPORTED];
-+}
-+
-+/**
-+ * sandbox_ffa_partition_info_get() - Emulated FFA_PARTITION_INFO_GET h=
andler
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_PARTITION_INFO_GET FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_partition_info_get(struct udevice *emul, ffa_val=
ue_t *pargs,
-+					  ffa_value_t *res)
-+{
-+	struct ffa_partition_info *rxbuf_desc_info =3D NULL;
-+	u32 descs_cnt;
-+	u32 descs_size_bytes;
-+	int ret;
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+
-+	if (!priv->pair.rxbuf) {
-+		res->a2 =3D -DENIED;
-+		ret =3D ffa_to_std_errmap[DENIED];
-+		goto cleanup;
-+	}
-+
-+	if (priv->pair_info.rxbuf_owned) {
-+		res->a2 =3D -BUSY;
-+		ret =3D ffa_to_std_errmap[BUSY];
-+		goto cleanup;
-+	}
-+
-+	if (!priv->partitions.descs) {
-+		priv->partitions.descs =3D sandbox_partitions;
-+		priv->partitions.count =3D SANDBOX_PARTITIONS_CNT;
-+	}
-+
-+	descs_size_bytes =3D SANDBOX_PARTITIONS_CNT *
-+		sizeof(struct ffa_partition_desc);
-+
-+	/* Abort if the RX buffer size is smaller than the descs buffer size *=
/
-+	if ((priv->pair_info.rxtx_buf_size * SZ_4K) < descs_size_bytes) {
-+		res->a2 =3D -NO_MEMORY;
-+		ret =3D ffa_to_std_errmap[NO_MEMORY];
-+		goto cleanup;
-+	}
-+
-+	rxbuf_desc_info =3D priv->pair.rxbuf;
-+
-+	/* No UUID specified. Return the information of all partitions */
-+	if (!pargs->a1 && !pargs->a2 && !pargs->a3 && !pargs->a4) {
-+		for (descs_cnt =3D 0; descs_cnt < SANDBOX_PARTITIONS_CNT; descs_cnt++=
)
-+			*(rxbuf_desc_info++) =3D priv->partitions.descs[descs_cnt].info;
-+
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D SANDBOX_PARTITIONS_CNT;
-+		/* Transfer ownership to the consumer: the non secure world */
-+		priv->pair_info.rxbuf_owned =3D 1;
-+		ret =3D 0;
-+
-+		goto cleanup;
-+	}
-+
-+	/* A UUID specified. Return the info of all SPs matching the UUID */
-+
-+	for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt+=
+)
-+		if (pargs->a1 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a1 &&
-+		    pargs->a2 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a2 &&
-+		    pargs->a3 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a3 &&
-+		    pargs->a4 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a4) {
-+			*(rxbuf_desc_info++) =3D priv->partitions.descs[descs_cnt].info;
-+		}
-+
-+	if (rxbuf_desc_info !=3D priv->pair.rxbuf) {
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		/* Store the partitions count */
-+		res->a2 =3D (ulong)
-+			(rxbuf_desc_info - (struct ffa_partition_info *)
-+			 priv->pair.rxbuf);
-+		ret =3D 0;
-+
-+		/* Transfer ownership to the consumer: the non secure world */
-+		priv->pair_info.rxbuf_owned =3D 1;
-+	} else {
-+		/* Unrecognized UUID */
-+		res->a2 =3D -INVALID_PARAMETERS;
-+		ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
-+	}
-+
-+cleanup:
-+
-+	log_err("FFA_PARTITION_INFO_GET (%ld)\n", res->a2);
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+
-+	return ret;
-+}
-+
-+/**
-+ * sandbox_ffa_rxtx_map() - Emulated FFA_RXTX_MAP handler
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_RXTX_MAP FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_rxtx_map(struct udevice *emul, ffa_value_t *parg=
s, ffa_value_t *res)
-+{
-+	int ret;
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+
-+	if (priv->pair.txbuf && priv->pair.rxbuf) {
-+		res->a2 =3D -DENIED;
-+		ret =3D ffa_to_std_errmap[DENIED];
-+		goto feedback;
-+	}
-+
-+	if (pargs->a3 >=3D RXTX_BUFFERS_MIN_PAGES && pargs->a1 && pargs->a2) {
-+		priv->pair.txbuf =3D map_sysmem(pargs->a1, 0);
-+		priv->pair.rxbuf =3D map_sysmem(pargs->a2, 0);
-+		priv->pair_info.rxtx_buf_size =3D pargs->a3;
-+		priv->pair_info.rxbuf_mapped =3D 1;
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D 0;
-+		ret =3D 0;
-+		goto feedback;
-+	}
-+
-+	if (!pargs->a1 || !pargs->a2) {
-+		res->a2 =3D -INVALID_PARAMETERS;
-+		ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
-+	} else {
-+		res->a2 =3D -NO_MEMORY;
-+		ret =3D ffa_to_std_errmap[NO_MEMORY];
-+	}
-+
-+	log_err("Error in FFA_RXTX_MAP arguments (%d)\n",
-+		(int)res->a2);
-+
-+feedback:
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+
-+	return ret;
-+}
-+
-+/**
-+ * sandbox_ffa_rxtx_unmap() - Emulated FFA_RXTX_UNMAP handler
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_RXTX_UNMAP FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_rxtx_unmap(struct udevice *emul, ffa_value_t *pa=
rgs, ffa_value_t *res)
-+{
-+	int ret;
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+	res->a2 =3D -INVALID_PARAMETERS;
-+	ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
-+
-+	if (GET_NS_PHYS_ENDPOINT_ID(pargs->a1) !=3D priv->id)
-+		goto feedback;
-+
-+	if (priv->pair.txbuf && priv->pair.rxbuf) {
-+		priv->pair.txbuf =3D 0;
-+		priv->pair.rxbuf =3D 0;
-+		priv->pair_info.rxtx_buf_size =3D 0;
-+		priv->pair_info.rxbuf_mapped =3D 0;
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D 0;
-+		ret =3D 0;
-+		goto feedback;
-+	}
-+
-+	log_err("No buffer pair registered on behalf of the caller\n");
-+
-+feedback:
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+
-+	return ret;
-+}
-+
-+/**
-+ * sandbox_ffa_rx_release() - Emulated FFA_RX_RELEASE handler
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_RX_RELEASE FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_rx_release(struct udevice *emul, ffa_value_t *pa=
rgs, ffa_value_t *res)
-+{
-+	int ret;
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	if (!priv->pair_info.rxbuf_owned) {
-+		res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+		res->a2 =3D -DENIED;
-+		ret =3D ffa_to_std_errmap[DENIED];
-+	} else {
-+		priv->pair_info.rxbuf_owned =3D 0;
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D 0;
-+		ret =3D 0;
-+	}
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+
-+	return ret;
-+}
-+
-+/**
-+ * sandbox_ffa_sp_valid() - Check SP validity
-+ * @emul: The sandbox FF-A emulator device
-+ * @part_id:	partition ID to check
-+ *
-+ * Search the input ID in the descriptors table.
-+ *
-+ * Return:
-+ *
-+ * 1 on success (Partition found). Otherwise, failure
-+ */
-+static int sandbox_ffa_sp_valid(struct udevice *emul, u16 part_id)
-+{
-+	u32 descs_cnt;
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt+=
+)
-+		if (priv->partitions.descs[descs_cnt].info.id =3D=3D part_id)
-+			return 1;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_msg_send_direct_req() - Emulated FFA_MSG_SEND_DIRECT_{RE=
Q,RESP} handler
-+ * @emul: The sandbox FF-A emulator device
-+ * @pargs: The SMC call input arguments a0-a7
-+ * @res:  The SMC return data
-+ *
-+ * Emulate FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A ABIs.
-+ * Only SMC 64-bit is supported in Sandbox.
-+ *
-+ * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT=
 are not
-+ * supported. In case of success FFA_MSG_SEND_DIRECT_RESP is returned w=
ith
-+ * default pattern data (0xff).
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_msg_send_direct_req(struct udevice *emul,
-+					   ffa_value_t *pargs, ffa_value_t *res)
-+{
-+	u16 part_id;
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	part_id =3D GET_DST_SP_ID(pargs->a1);
-+
-+	if (GET_NS_PHYS_ENDPOINT_ID(pargs->a1) !=3D priv->id ||
-+	    !sandbox_ffa_sp_valid(emul, part_id) || pargs->a2) {
-+		res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+		res->a1 =3D 0;
-+		res->a2 =3D -INVALID_PARAMETERS;
-+
-+		/* x3-x7 MBZ */
-+		memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
-+
-+		return ffa_to_std_errmap[INVALID_PARAMETERS];
-+	}
-+
-+	res->a0 =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
-+
-+	res->a1 =3D PREP_SRC_SP_ID(part_id) |
-+		PREP_NS_PHYS_ENDPOINT_ID(priv->id);
-+
-+	res->a2 =3D 0;
-+
-+	/* Return 0xff bytes as a response */
-+	res->a3 =3D -1UL;
-+	res->a4 =3D -1UL;
-+	res->a5 =3D -1UL;
-+	res->a6 =3D -1UL;
-+	res->a7 =3D -1UL;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_get_rxbuf_flags() - Read the mapping/ownership flags
-+ * @emul: The sandbox FF-A emulator device
-+ * @queried_func_id:	The FF-A function to be queried
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * Query the status flags of the following emulated
-+ * ABIs: FFA_RXTX_MAP, FFA_RXTX_UNMAP, FFA_RX_RELEASE.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_get_rxbuf_flags(struct udevice *emul, u32 querie=
d_func_id,
-+				       struct ffa_sandbox_data *func_data)
-+{
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	if (!func_data)
-+		return -EINVAL;
-+
-+	if (!func_data->data0 || func_data->data0_size !=3D sizeof(u8))
-+		return -EINVAL;
-+
-+	switch (queried_func_id) {
-+	case FFA_RXTX_MAP:
-+	case FFA_RXTX_UNMAP:
-+		*((u8 *)func_data->data0) =3D priv->pair_info.rxbuf_mapped;
-+		return 0;
-+	case FFA_RX_RELEASE:
-+		*((u8 *)func_data->data0) =3D priv->pair_info.rxbuf_owned;
-+		return 0;
-+	default:
-+		log_err("The querried FF-A interface flag (%d) undefined\n",
-+			queried_func_id);
-+		return -EINVAL;
-+	}
-+}
-+
-+/**
-+ * sandbox_ffa_get_fwk_version() - Return the FFA framework version
-+ * @emul: The sandbox FF-A emulator device
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * Return the FFA framework version read from the FF-A emulator data.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_get_fwk_version(struct udevice *emul, struct ffa=
_sandbox_data *func_data)
-+{
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	if (!func_data)
-+		return -EINVAL;
-+
-+	if (!func_data->data0 ||
-+	    func_data->data0_size !=3D sizeof(priv->fwk_version))
-+		return -EINVAL;
-+
-+	*((u32 *)func_data->data0) =3D priv->fwk_version;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_get_parts() - Return the address of partitions data
-+ * @emul: The sandbox FF-A emulator device
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * Return the address of partitions data read from the FF-A emulator da=
ta.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_get_parts(struct udevice *emul, struct ffa_sandb=
ox_data *func_data)
-+{
-+	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
-+
-+	if (!func_data)
-+		return -EINVAL;
-+
-+	if (!func_data->data0 ||
-+	    func_data->data0_size !=3D sizeof(struct ffa_partitions *))
-+		return -EINVAL;
-+
-+	*((struct ffa_partitions **)func_data->data0) =3D &priv->partitions;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
-+ * @queried_func_id:	The FF-A function to be queried
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * Query the status of FF-A ABI specified in the input argument.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int sandbox_query_ffa_emul_state(u32 queried_func_id,
-+				 struct ffa_sandbox_data *func_data)
-+{
-+	struct udevice *emul;
-+	int ret;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, &emul);
-+	if (ret) {
-+		log_err("Cannot find FF-A emulator during querying state\n");
-+		return ret;
-+	}
-+
-+	switch (queried_func_id) {
-+	case FFA_RXTX_MAP:
-+	case FFA_RXTX_UNMAP:
-+	case FFA_RX_RELEASE:
-+		return sandbox_ffa_get_rxbuf_flags(emul, queried_func_id, func_data);
-+	case FFA_VERSION:
-+		return sandbox_ffa_get_fwk_version(emul, func_data);
-+	case FFA_PARTITION_INFO_GET:
-+		return sandbox_ffa_get_parts(emul, func_data);
-+	default:
-+		log_err("Undefined FF-A interface (%d)\n",
-+			queried_func_id);
-+		return -EINVAL;
-+	}
-+}
-+
-+/**
-+ * sandbox_arm_ffa_smccc_smc() - FF-A SMC call emulation
-+ * @args:	the SMC call arguments
-+ * @res:	the SMC call returned data
-+ *
-+ * Emulate the FF-A ABIs SMC call.
-+ * The emulated FF-A ABI is identified and invoked.
-+ * FF-A emulation is based on the FF-A specification 1.0
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure.
-+ * FF-A protocol error codes are returned using the registers arguments=
 as
-+ * described by the specification
-+ */
-+void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ffa_value_t *res)
-+{
-+	int ret =3D 0;
-+	struct udevice *emul;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, &emul);
-+	if (ret) {
-+		log_err("Cannot find FF-A emulator during SMC emulation\n");
-+		return;
-+	}
-+
-+	switch (args->a0) {
-+	case FFA_SMC_32(FFA_VERSION):
-+		ret =3D sandbox_ffa_version(emul, args, res);
-+		break;
-+	case FFA_SMC_32(FFA_PARTITION_INFO_GET):
-+		ret =3D sandbox_ffa_partition_info_get(emul, args, res);
-+		break;
-+	case FFA_SMC_32(FFA_RXTX_UNMAP):
-+		ret =3D sandbox_ffa_rxtx_unmap(emul, args, res);
-+		break;
-+	case FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ):
-+		ret =3D sandbox_ffa_msg_send_direct_req(emul, args, res);
-+		break;
-+	case FFA_SMC_32(FFA_ID_GET):
-+		ret =3D sandbox_ffa_id_get(emul, args, res);
-+		break;
-+	case FFA_SMC_32(FFA_FEATURES):
-+		ret =3D sandbox_ffa_features(args, res);
-+		break;
-+	case FFA_SMC_64(FFA_RXTX_MAP):
-+		ret =3D sandbox_ffa_rxtx_map(emul, args, res);
-+		break;
-+	case FFA_SMC_32(FFA_RX_RELEASE):
-+		ret =3D sandbox_ffa_rx_release(emul, args, res);
-+		break;
-+	default:
-+		log_err("Undefined FF-A interface (%lx)\n",
-+			args->a0);
-+	}
-+
-+	if (ret !=3D 0)
-+		log_err("FF-A ABI internal failure (%d)\n", ret);
-+}
-+
-+/**
-+ * invoke_ffa_fn() - SMC wrapper
-+ * @args: FF-A ABI arguments to be copied to Xn registers
-+ * @res: FF-A ABI return data to be copied from Xn registers
-+ *
-+ * Calls the emulated SMC call.
-+ */
-+void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res)
-+{
-+	sandbox_arm_ffa_smccc_smc(&args, res);
-+}
-+
-+/**
-+ * ffa_emul_find() - Find the FF-A emulator
-+ * @dev:	the sandbox FF-A device (sandbox-arm-ffa)
-+ * @emulp:	the FF-A emulator device (sandbox-ffa-emul)
-+ *
-+ * Search for the FF-A emulator and returns its device pointer.
-+ *
-+ * Return:
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_emul_find(struct udevice *dev, struct udevice **emulp)
-+{
-+	int ret;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, emulp);
-+	if (ret) {
-+		log_err("Cannot find FF-A emulator\n");
-+		return ret;
-+	}
-+
-+	log_info("FF-A emulator ready to use\n");
-+
-+	return 0;
-+}
-+
-+UCLASS_DRIVER(ffa_emul) =3D {
-+	.name		=3D "ffa_emul",
-+	.id		=3D UCLASS_FFA_EMUL,
-+	.post_bind =3D dm_scan_fdt_dev,
-+};
-+
-+static const struct udevice_id sandbox_ffa_emul_ids[] =3D {
-+	{ .compatible =3D "sandbox,arm-ffa-emul" },
-+	{ }
-+};
-+
-+/* Declaring the sandbox FF-A emulator under UCLASS_FFA_EMUL */
-+U_BOOT_DRIVER(sandbox_ffa_emul) =3D {
-+	.name		=3D "sandbox_ffa_emul",
-+	.id		=3D UCLASS_FFA_EMUL,
-+	.of_match	=3D sandbox_ffa_emul_ids,
-+	.priv_auto	=3D sizeof(struct sandbox_ffa_emul),
-+};
-diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h b/drivers/f=
irmware/arm-ffa/sandbox_arm_ffa_priv.h
-deleted file mode 100644
-index 4338f9c9b1..0000000000
---- a/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
-+++ /dev/null
-@@ -1,14 +0,0 @@
--/* SPDX-License-Identifier: GPL-2.0+ */
--/*
-- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-- *
-- * Authors:
-- *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-- */
--
--#ifndef __SANDBOX_ARM_FFA_PRV_H
--#define __SANDBOX_ARM_FFA_PRV_H
--
--/* Future sandbox support private declarations */
--
--#endif
-diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/a=
rm-ffa/sandbox_ffa.c
-new file mode 100644
-index 0000000000..ef9491ccea
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
-@@ -0,0 +1,110 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+#include <common.h>
-+#include <arm_ffa.h>
-+#include <dm.h>
-+#include <log.h>
-+#include <asm/global_data.h>
-+#include <asm/sandbox_arm_ffa_priv.h>
-+#include <dm/device-internal.h>
-+#include <linux/errno.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/**
-+ * sandbox_ffa_discover() - perform sandbox FF-A discovery
-+ * @dev: The sandbox FF-A bus device
-+ * Try to discover the FF-A framework. Discovery is performed by
-+ * querying the FF-A framework version from secure world using the FFA_=
VERSION ABI.
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_discover(struct udevice *dev)
-+{
-+	int ret;
-+	struct udevice *emul;
-+
-+	log_info("Emulated FF-A framework discovery\n");
-+
-+	ret =3D ffa_emul_find(dev, &emul);
-+	if (ret) {
-+		log_err("Cannot find FF-A emulator\n");
-+		return ret;
-+	}
-+
-+	ret =3D ffa_get_version_hdlr(dev);
-+	if (ret)
-+		return ret;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_probe() - The sandbox FF-A driver probe function
-+ * @dev:	the sandbox-arm-ffa device
-+ * Save the emulator device in uc_priv.
-+ * Return:
-+ *
-+ * 0 on success.
-+ */
-+static int sandbox_ffa_probe(struct udevice *dev)
-+{
-+	int ret;
-+	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, &uc_priv->emul);
-+	if (ret) {
-+		log_err("Cannot find FF-A emulator\n");
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_bind() - The sandbox FF-A driver bind function
-+ * @dev:	the sandbox-arm-ffa device
-+ * Try to discover the emulated FF-A bus.
-+ * Return:
-+ *
-+ * 0 on success.
-+ */
-+static int sandbox_ffa_bind(struct udevice *dev)
-+{
-+	int ret;
-+
-+	ret =3D sandbox_ffa_discover(dev);
-+	if (ret)
-+		return ret;
-+
-+	return 0;
-+}
-+
-+/* Sandbox Arm FF-A emulator operations */
-+
-+static const struct ffa_bus_ops sandbox_ffa_ops =3D {
-+	.partition_info_get =3D ffa_get_partitions_info_hdlr,
-+	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
-+	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
-+};
-+
-+static const struct udevice_id sandbox_ffa_id[] =3D {
-+	{ "sandbox,arm-ffa", 0 },
-+	{ },
-+};
-+
-+/* Declaring the sandbox FF-A driver under UCLASS_FFA */
-+U_BOOT_DRIVER(sandbox_arm_ffa) =3D {
-+	.name		=3D "sandbox_arm_ffa",
-+	.of_match =3D sandbox_ffa_id,
-+	.id		=3D UCLASS_FFA,
-+	.bind		=3D sandbox_ffa_bind,
-+	.probe		=3D sandbox_ffa_probe,
-+	.ops		=3D &sandbox_ffa_ops,
-+};
-diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index 3c6af2e3d2..0432c95c9e 100644
---- a/include/dm/uclass-id.h
-+++ b/include/dm/uclass-id.h
-@@ -63,6 +63,7 @@ enum uclass_id {
- 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
- 	UCLASS_EXTCON,		/* External Connector Class */
- 	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
-+	UCLASS_FFA_EMUL,		/* sandbox FF-A device emulator */
- 	UCLASS_FIRMWARE,	/* Firmware */
- 	UCLASS_FPGA,		/* FPGA device */
- 	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
_ffa-sandbox-Add-FFA_MEM_SHARE-emulation.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0006-arm_ffa-sandbox-Add-FFA_MEM_SHARE-emulat=
ion.patch
new file mode 100644
index 00000000..1b42c684
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-emulation.patch
@@ -0,0 +1,129 @@
+From 8ba17011b310fee0741ef5c7ddd1a5b019428e4e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 16 Oct 2024 18:41:16 +0100
+Subject: [PATCH 06/36] arm_ffa: sandbox: Add FFA_MEM_SHARE emulation
+
+Add FFA_MEM_SHARE support to the FF-A emulator
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ .../include/asm/sandbox_arm_ffa_priv.h        |  6 ++-
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c    | 43 +++++++++++++++++++
+ drivers/firmware/arm-ffa/sandbox_ffa.c        |  3 +-
+ 3 files changed, 50 insertions(+), 2 deletions(-)
+
+diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h b/arch/sand=
box/include/asm/sandbox_arm_ffa_priv.h
+index 5c46547beab..fa09f9598ee 100644
+--- a/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
++++ b/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -38,6 +38,7 @@
+ /*  RX/TX buffers minimum size */
+ #define RXTX_BUFFERS_MIN_SIZE (RXTX_4K)
+ #define RXTX_BUFFERS_MIN_PAGES (1)
++#define RXTX_BUFFERS_MIN_PAGES_SIZE (RXTX_BUFFERS_MIN_PAGES * SZ_4K)
+=20
+ /* A helper macro used for clearing registers that Must Be Zero (MBZ) *=
/
+ #define FFA_X_REG_SIZE_IN_BYTE sizeof((((ffa_value_t *)0)->a0))
+@@ -59,6 +60,9 @@
+ #define SANDBOX_SERVICE2_UUID_A3	0x9cc02d72
+ #define SANDBOX_SERVICE2_UUID_A4	0xcdd998a7
+=20
++/* Globally unique Handle to identify the shared memory region */
++#define SANDBOX_MEM_HANDLE		0xffffffff
++
+ /**
+  * struct ffa_rxtxpair_info - structure hosting the RX/TX buffers flags
+  * @rxbuf_owned:	RX buffer ownership flag (the owner is non secure worl=
d)
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+index dcf5bce9435..4918404fb6d 100644
+--- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -563,6 +563,46 @@ static int sandbox_ffa_get_parts(struct udevice *em=
ul, struct ffa_sandbox_data *
+ 	return 0;
+ }
+=20
++/**
++ * sandbox_ffa_memory_share() - Emulated FFA_MEM_SHARE handler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_MEM_SHARE FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_memory_share(struct udevice *emul, ffa_value_t *=
pargs,
++				    ffa_value_t *res)
++{
++	int ret;
++
++	res->a1 =3D 0;
++
++	if (!pargs->a1 || pargs->a1 > RXTX_BUFFERS_MIN_PAGES_SIZE) {
++		/* FFA_ERROR encoding */
++		res->a0 =3D FFA_SMC_32(FFA_ERROR);
++		res->a2 =3D -INVALID_PARAMETERS;
++		ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
++		/* x3-x7 MBZ */
++		memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
++
++		return ret;
++	}
++
++	/* FFA_SUCCESS encoding */
++	res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++	res->a2 =3D SANDBOX_MEM_HANDLE;
++	res->a3 =3D SANDBOX_MEM_HANDLE;
++	/* x4-x7 MBZ */
++	memset(&res->a4, 0, 4 * FFA_X_REG_SIZE_IN_BYTE);
++
++	return 0;
++}
++
+ /**
+  * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
+  * @queried_func_id:	The FF-A function to be queried
+@@ -653,6 +693,9 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
+ 	case FFA_SMC_32(FFA_RX_RELEASE):
+ 		ret =3D sandbox_ffa_rx_release(emul, args, res);
+ 		break;
++	case FFA_SMC_32(FFA_MEM_SHARE):
++		ret =3D sandbox_ffa_memory_share(emul, args, res);
++		break;
+ 	default:
+ 		log_err("Undefined FF-A interface (%lx)\n",
+ 			args->a0);
+diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/a=
rm-ffa/sandbox_ffa.c
+index 44b32a829dd..8d85e660e2b 100644
+--- a/drivers/firmware/arm-ffa/sandbox_ffa.c
++++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -91,6 +91,7 @@ static const struct ffa_bus_ops sandbox_ffa_ops =3D {
+ 	.partition_info_get =3D ffa_get_partitions_info_hdlr,
+ 	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
+ 	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
++	.memory_share =3D ffa_memory_share_hdlr,
+ };
+=20
+ static const struct udevice_id sandbox_ffa_id[] =3D {
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-=
A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-arm_ffa-introduce-sand=
box-test-cases-for-UC.patch
deleted file mode 100644
index c61002d8..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-a=
rm_ffa-introduce-sandbox-test-cases-for-UC.patch
+++ /dev/null
@@ -1,338 +0,0 @@
-From effa8444b74e456f724146c2593991281f95762d Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 10 May 2023 17:34:55 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: introduce sandbox test cases for
- UCLASS_FFA
-
-Add functional test cases for the FF-A support
-
-These tests rely on the FF-A sandbox emulator and FF-A
-sandbox driver which help in inspecting the FF-A communication.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- MAINTAINERS            |   1 +
- doc/arch/arm64.ffa.rst |   1 +
- test/dm/Makefile       |   3 +-
- test/dm/ffa.c          | 261 +++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 265 insertions(+), 1 deletion(-)
- create mode 100644 test/dm/ffa.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 679a3acdd8..ccd7859c88 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -276,6 +276,7 @@ F:	doc/arch/arm64.ffa.rst
- F:	doc/usage/cmd/armffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
-+F:	test/dm/ffa.c
-=20
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
-diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
-index b7c754fa3d..325fb80346 100644
---- a/doc/arch/arm64.ffa.rst
-+++ b/doc/arch/arm64.ffa.rst
-@@ -37,6 +37,7 @@ The U-Boot FF-A support provides the following parts:
-   FF-A ABIs inspection methods.
- - An FF-A sandbox device driver for FF-A communication with the emulate=
d Secure World.
-   The driver leverages the FF-A Uclass to establish FF-A communication.
-+- Sandbox FF-A test cases.
-=20
- FF-A and SMC specifications
- -------------------------------------------
-diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 3799b1ae8f..7ed00733c1 100644
---- a/test/dm/Makefile
-+++ b/test/dm/Makefile
-@@ -1,7 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0+
- #
- # Copyright (c) 2013 Google, Inc
--# Copyright 2023 Arm Limited and/or its affiliates <open-source-office@=
arm.com>
-+# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
-=20
- obj-$(CONFIG_UT_DM) +=3D test-dm.o
-=20
-@@ -92,6 +92,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
- obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
- obj-$(CONFIG_DM_PMIC) +=3D pmic.o
- obj-$(CONFIG_DM_PWM) +=3D pwm.o
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa.o
- obj-$(CONFIG_QFW) +=3D qfw.o
- obj-$(CONFIG_RAM) +=3D ram.o
- obj-y +=3D regmap.o
-diff --git a/test/dm/ffa.c b/test/dm/ffa.c
-new file mode 100644
-index 0000000000..6912666bb4
---- /dev/null
-+++ b/test/dm/ffa.c
-@@ -0,0 +1,261 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Functional tests for UCLASS_FFA  class
-+ *
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <console.h>
-+#include <dm.h>
-+#include <asm/sandbox_arm_ffa.h>
-+#include <asm/sandbox_arm_ffa_priv.h>
-+#include <dm/test.h>
-+#include <test/test.h>
-+#include <test/ut.h>
-+
-+/* Functional tests for the UCLASS_FFA */
-+
-+static int check_fwk_version(struct ffa_priv *uc_priv, struct unit_test=
_state *uts)
-+{
-+	struct ffa_sandbox_data func_data;
-+	u32 fwk_version =3D 0;
-+
-+	func_data.data0 =3D &fwk_version;
-+	func_data.data0_size =3D sizeof(fwk_version);
-+	ut_assertok(sandbox_query_ffa_emul_state(FFA_VERSION, &func_data));
-+	ut_asserteq(uc_priv->fwk_version, fwk_version);
-+
-+	return 0;
-+}
-+
-+static int check_endpoint_id(struct ffa_priv *uc_priv, struct unit_test=
_state *uts)
-+{
-+	ut_asserteq(0, uc_priv->id);
-+
-+	return 0;
-+}
-+
-+static int check_rxtxbuf(struct ffa_priv *uc_priv, struct unit_test_sta=
te *uts)
-+{
-+	ut_assertnonnull(uc_priv->pair.rxbuf);
-+	ut_assertnonnull(uc_priv->pair.txbuf);
-+
-+	return 0;
-+}
-+
-+static int check_features(struct ffa_priv *uc_priv, struct unit_test_st=
ate *uts)
-+{
-+	ut_assert(uc_priv->pair.rxtx_min_pages =3D=3D RXTX_4K ||
-+		  uc_priv->pair.rxtx_min_pages =3D=3D RXTX_16K ||
-+		  uc_priv->pair.rxtx_min_pages =3D=3D RXTX_64K);
-+
-+	return 0;
-+}
-+
-+static int check_rxbuf_mapped_flag(u32 queried_func_id,
-+				   u8 rxbuf_mapped,
-+				   struct unit_test_state *uts)
-+{
-+	switch (queried_func_id) {
-+	case FFA_RXTX_MAP:
-+		ut_asserteq(1, rxbuf_mapped);
-+		break;
-+	case FFA_RXTX_UNMAP:
-+		ut_asserteq(0, rxbuf_mapped);
-+		break;
-+	default:
-+		ut_assert(false);
-+	}
-+
-+	return 0;
-+}
-+
-+static int check_rxbuf_release_flag(u8 rxbuf_owned, struct unit_test_st=
ate *uts)
-+{
-+	ut_asserteq(0, rxbuf_owned);
-+
-+	return 0;
-+}
-+
-+static int  test_ffa_msg_send_direct_req(u16 part_id, struct unit_test_=
state *uts)
-+{
-+	struct ffa_send_direct_data msg;
-+	u8 cnt;
-+	struct udevice *dev;
-+
-+	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
-+
-+	ut_assertok(ffa_sync_send_receive(dev, part_id, &msg, 1));
-+
-+	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
-+		ut_asserteq_64(-1UL, ((u64 *)&msg)[cnt]);
-+
-+	return 0;
-+}
-+
-+static int test_partitions_and_comms(const char *service_uuid,
-+				     struct unit_test_state *uts)
-+{
-+	struct ffa_partition_desc *descs;
-+	u32 count, i, j, valid_sps =3D 0;
-+	struct udevice *dev;
-+	struct ffa_sandbox_data func_data;
-+	struct ffa_partitions *partitions;
-+
-+	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
-+
-+	/* Get from the driver the count and information of the SPs matching t=
he UUID */
-+	ut_assertok(ffa_partition_info_get(dev, service_uuid, &count, &descs))=
;
-+
-+	/* Make sure the count is correct */
-+	ut_asserteq(SANDBOX_SP_COUNT_PER_VALID_SERVICE, count);
-+
-+	/* SPs found , verify the partitions information */
-+
-+	func_data.data0 =3D &partitions;
-+	func_data.data0_size =3D sizeof(struct ffa_partitions *);
-+	ut_assertok(sandbox_query_ffa_emul_state(FFA_PARTITION_INFO_GET, &func=
_data));
-+
-+	for (i =3D 0; i < count ; i++) {
-+		for (j =3D 0;
-+		     j < partitions->count;
-+		     j++) {
-+			if (descs[i].info.id =3D=3D
-+			   partitions->descs[j].info.id) {
-+				valid_sps++;
-+				ut_asserteq_mem(&descs[i],
-+						&partitions->descs[j],
-+						sizeof(struct ffa_partition_desc));
-+				/* Send and receive data from the current partition */
-+				test_ffa_msg_send_direct_req(descs[i].info.id, uts);
-+			}
-+		}
-+	}
-+
-+	/* Verify expected partitions found in the emulated secure world */
-+	ut_asserteq(SANDBOX_SP_COUNT_PER_VALID_SERVICE, valid_sps);
-+
-+	return 0;
-+}
-+
-+static int dm_test_ffa_ack(struct unit_test_state *uts)
-+{
-+	struct ffa_priv *uc_priv;
-+	struct ffa_sandbox_data func_data;
-+	u8 rxbuf_flag =3D 0;
-+	const char *svc1_uuid =3D SANDBOX_SERVICE1_UUID;
-+	const char *svc2_uuid =3D SANDBOX_SERVICE2_UUID;
-+	struct udevice *dev;
-+
-+	/* Test probing the sandbox FF-A bus */
-+	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
-+
-+	/* Get a pointer to the sandbox FF-A bus private data */
-+	uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	/* Make sure the private data pointer is retrieved */
-+	ut_assertnonnull(uc_priv);
-+
-+	/* Test FFA_VERSION */
-+	check_fwk_version(uc_priv, uts);
-+
-+	/* Test FFA_ID_GET */
-+	check_endpoint_id(uc_priv, uts);
-+
-+	/* Test FFA_FEATURES */
-+	check_features(uc_priv, uts);
-+
-+	/*  Test RX/TX buffers */
-+	check_rxtxbuf(uc_priv, uts);
-+
-+	/* Test FFA_RXTX_MAP */
-+	func_data.data0 =3D &rxbuf_flag;
-+	func_data.data0_size =3D sizeof(rxbuf_flag);
-+
-+	rxbuf_flag =3D 0;
-+	sandbox_query_ffa_emul_state(FFA_RXTX_MAP, &func_data);
-+	check_rxbuf_mapped_flag(FFA_RXTX_MAP, rxbuf_flag, uts);
-+
-+	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
-+	test_partitions_and_comms(svc1_uuid, uts);
-+
-+	/* Test FFA_RX_RELEASE */
-+	rxbuf_flag =3D 1;
-+	sandbox_query_ffa_emul_state(FFA_RX_RELEASE, &func_data);
-+	check_rxbuf_release_flag(rxbuf_flag, uts);
-+
-+	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
-+	test_partitions_and_comms(svc2_uuid, uts);
-+
-+	/* Test FFA_RX_RELEASE */
-+	rxbuf_flag =3D 1;
-+	ut_assertok(sandbox_query_ffa_emul_state(FFA_RX_RELEASE, &func_data));
-+	check_rxbuf_release_flag(rxbuf_flag, uts);
-+
-+	return 0;
-+}
-+
-+DM_TEST(dm_test_ffa_ack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
-+
-+static int dm_test_ffa_nack(struct unit_test_state *uts)
-+{
-+	struct ffa_priv *uc_priv;
-+	const char *valid_svc_uuid =3D SANDBOX_SERVICE1_UUID;
-+	const char *unvalid_svc_uuid =3D SANDBOX_SERVICE3_UUID;
-+	const char *unvalid_svc_uuid_str =3D SANDBOX_SERVICE4_UUID;
-+	struct ffa_send_direct_data msg;
-+	int ret;
-+	u32 count;
-+	u16 part_id =3D 0;
-+	struct udevice *dev;
-+	struct ffa_partition_desc *descs =3D NULL;
-+
-+	/* Test probing the sandbox FF-A bus */
-+	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
-+
-+	/* Get a pointer to the sandbox FF-A bus private data */
-+	uc_priv =3D dev_get_uclass_priv(dev);
-+
-+	/* Make sure the private data pointer is retrieved */
-+	ut_assertnonnull(uc_priv);
-+
-+	/* Query partitions count using  invalid arguments */
-+	ret =3D ffa_partition_info_get(dev, NULL, NULL, NULL);
-+	ut_asserteq(-EINVAL, ret);
-+	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid, NULL, NULL);
-+	ut_asserteq(-EINVAL, ret);
-+	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid, &count, NULL);
-+	ut_asserteq(-EINVAL, ret);
-+
-+	/* Query partitions count using an invalid UUID  string */
-+	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid_str, &count, &des=
cs);
-+	ut_asserteq(-EINVAL, ret);
-+
-+	/* Query partitions count using an invalid UUID (no matching SP) */
-+	count =3D 0;
-+	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid, &count, &descs);
-+	ut_asserteq(0, count);
-+
-+	/* Query partitions data using a valid UUID */
-+	count =3D 0;
-+	ut_assertok(ffa_partition_info_get(dev, valid_svc_uuid, &count, &descs=
));
-+	/* Make sure partitions are detected */
-+	ut_asserteq(SANDBOX_SP_COUNT_PER_VALID_SERVICE, count);
-+	ut_assertnonnull(descs);
-+
-+	/* Send data to an invalid partition */
-+	ret =3D ffa_sync_send_receive(dev, part_id, &msg, 1);
-+	ut_asserteq(-EINVAL, ret);
-+
-+	/* Send data to a valid partition */
-+	part_id =3D uc_priv->partitions.descs[0].info.id;
-+	ut_assertok(ffa_sync_send_receive(dev, part_id, &msg, 1));
-+
-+	return 0;
-+}
-+
-+DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm=
_ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0007-arm_ffa-sandbox-Add-FFA_MEM_SHARE-tests.patc=
h
new file mode 100644
index 00000000..fc425125
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-tests.patch
@@ -0,0 +1,101 @@
+From b5f99e6be813e8bba29f7379ae7395ed51a19967 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 17 Oct 2024 15:14:10 +0100
+Subject: [PATCH 07/36] arm_ffa: sandbox: Add FFA_MEM_SHARE tests
+
+Add positive and negative test cases
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ test/dm/ffa.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 45 insertions(+), 1 deletion(-)
+
+diff --git a/test/dm/ffa.c b/test/dm/ffa.c
+index 593b7177fce..59eea9a57cc 100644
+--- a/test/dm/ffa.c
++++ b/test/dm/ffa.c
+@@ -2,7 +2,7 @@
+ /*
+  * Functional tests for UCLASS_FFA  class
+  *
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -13,6 +13,7 @@
+ #include <asm/sandbox_arm_ffa.h>
+ #include <asm/sandbox_arm_ffa_priv.h>
+ #include <dm/test.h>
++#include <linux/sizes.h>
+ #include <test/test.h>
+ #include <test/ut.h>
+=20
+@@ -141,6 +142,43 @@ static int test_partitions_and_comms(const char *se=
rvice_uuid,
+ 	return 0;
+ }
+=20
++static int  test_ffa_memory_share(bool test_ack, struct unit_test_state=
 *uts)
++{
++	struct ffa_mem_ops_args args =3D {0};
++	struct ffa_mem_region_attributes attrs =3D {0};
++	static u8 buf[SZ_4K];
++	int ret;
++	struct udevice *dev;
++
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++
++	args.attrs =3D &attrs;
++	args.nattrs =3D 1;
++	args.address =3D buf;
++	args.pg_cnt =3D 1;
++
++	if (test_ack) {
++		args.use_txbuf =3D true;
++
++		ut_assertok(ffa_memory_share(dev, &args));
++		ut_asserteq(HANDLE_LOW(args.g_handle), SANDBOX_MEM_HANDLE);
++		ut_asserteq(HANDLE_HIGH(args.g_handle), SANDBOX_MEM_HANDLE);
++	} else {
++		/* Do not use the TX buffer as a transaction buffer */
++		args.use_txbuf =3D false;
++		ret =3D ffa_memory_share(dev, &args);
++		ut_asserteq(-EPROTONOSUPPORT, ret);
++
++		/* No memory region address given */
++		args.use_txbuf =3D true;
++		args.address =3D NULL;
++		ret =3D ffa_memory_share(dev, &args);
++		ut_asserteq(-EINVAL, ret);
++	}
++
++	return 0;
++}
++
+ static int dm_test_ffa_ack(struct unit_test_state *uts)
+ {
+ 	struct ffa_priv *uc_priv;
+@@ -195,6 +233,9 @@ static int dm_test_ffa_ack(struct unit_test_state *u=
ts)
+ 	ut_assertok(sandbox_query_ffa_emul_state(FFA_RX_RELEASE, &func_data));
+ 	check_rxbuf_release_flag(rxbuf_flag, uts);
+=20
++	/* Test FFA_MEM_SHARE */
++	test_ffa_memory_share(true, uts);
++
+ 	return 0;
+ }
+ DM_TEST(dm_test_ffa_ack, UTF_SCAN_FDT | UTF_CONSOLE);
+@@ -253,6 +294,9 @@ static int dm_test_ffa_nack(struct unit_test_state *=
uts)
+ 	part_id =3D uc_priv->partitions.descs[0].info.id;
+ 	ut_assertok(ffa_sync_send_receive(dev, part_id, &msg, 1));
+=20
++	/* Test FFA_MEM_SHARE */
++	test_ffa_memory_share(false, uts);
++
+ 	return 0;
+ }
+ DM_TEST(dm_test_ffa_nack, UTF_SCAN_FDT | UTF_CONSOLE);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-=
A-v15-arm_ffa-introduce-armffa-command-Sandbox-te.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-arm_ffa-introduce-armf=
fa-command-Sandbox-te.patch
deleted file mode 100644
index a1dc18ed..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-a=
rm_ffa-introduce-armffa-command-Sandbox-te.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From c95d1bd311b251e5dd6c6e53c2dc7977bdca7870 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 23 Jun 2023 13:44:10 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: introduce armffa command Sandbox tes=
t
-
-Add Sandbox test for the armffa command
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- MAINTAINERS       |  1 +
- test/cmd/Makefile |  2 ++
- test/cmd/armffa.c | 33 +++++++++++++++++++++++++++++++++
- 3 files changed, 36 insertions(+)
- create mode 100644 test/cmd/armffa.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index ccd7859c88..885d91fe5c 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -276,6 +276,7 @@ F:	doc/arch/arm64.ffa.rst
- F:	doc/usage/cmd/armffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
-+F:	test/cmd/armffa.c
- F:	test/dm/ffa.c
-=20
- ARM FREESCALE IMX
-diff --git a/test/cmd/Makefile b/test/cmd/Makefile
-index 055adc65a2..1d1dbb4fbc 100644
---- a/test/cmd/Makefile
-+++ b/test/cmd/Makefile
-@@ -1,6 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0+
- #
- # Copyright (c) 2013 Google, Inc
-+# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
-=20
- ifdef CONFIG_HUSH_PARSER
- obj-$(CONFIG_CONSOLE_RECORD) +=3D test_echo.o
-@@ -23,6 +24,7 @@ obj-$(CONFIG_CMD_SEAMA) +=3D seama.o
- ifdef CONFIG_SANDBOX
- obj-$(CONFIG_CMD_READ) +=3D rw.o
- obj-$(CONFIG_CMD_SETEXPR) +=3D setexpr.o
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D armffa.o
- endif
- obj-$(CONFIG_CMD_TEMPERATURE) +=3D temperature.o
- obj-$(CONFIG_CMD_WGET) +=3D wget.o
-diff --git a/test/cmd/armffa.c b/test/cmd/armffa.c
-new file mode 100644
-index 0000000000..9a44a397e8
---- /dev/null
-+++ b/test/cmd/armffa.c
-@@ -0,0 +1,33 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Test for armffa command
-+ *
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <string.h>
-+#include <asm/sandbox_arm_ffa.h>
-+#include <dm/test.h>
-+#include <test/test.h>
-+#include <test/ut.h>
-+
-+/* Basic test of 'armffa' command */
-+static int dm_test_armffa_cmd(struct unit_test_state *uts)
-+{
-+	/* armffa getpart <UUID> */
-+	ut_assertok(run_command("armffa getpart " SANDBOX_SERVICE1_UUID, 0));
-+
-+	/* armffa ping <ID> */
-+	ut_assertok(run_commandf("armffa ping 0x%x", SANDBOX_SP1_ID));
-+
-+	/* armffa devlist */
-+	ut_assertok(run_command("armffa devlist", 0));
-+
-+	return 0;
-+}
-+
-+DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm=
_ffa-sandbox-Add-FFA_MEM_RECLAIM-emulation.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-em=
ulation.patch
new file mode 100644
index 00000000..6b6f100d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-emulation.patch
@@ -0,0 +1,89 @@
+From 6c37c2ef7fd844083fddc4c819f3fd37f7f6abc4 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 17 Oct 2024 15:50:02 +0100
+Subject: [PATCH 08/36] arm_ffa: sandbox: Add FFA_MEM_RECLAIM emulation
+
+Add FFA_MEM_RECLAIM support to the FF-A emulator
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c | 42 ++++++++++++++++++++++
+ drivers/firmware/arm-ffa/sandbox_ffa.c     |  1 +
+ 2 files changed, 43 insertions(+)
+
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+index 4918404fb6d..a630392b6d1 100644
+--- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -603,6 +603,45 @@ static int sandbox_ffa_memory_share(struct udevice =
*emul, ffa_value_t *pargs,
+ 	return 0;
+ }
+=20
++/**
++ * sandbox_ffa_memory_reclaim() - Emulated FFA_MEM_RECLAIM handler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_MEM_RECLAIM FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_memory_reclaim(struct udevice *emul, ffa_value_t=
 *pargs,
++				      ffa_value_t *res)
++{
++	int ret;
++
++	res->a1 =3D 0;
++
++	if (pargs->a1 !=3D SANDBOX_MEM_HANDLE ||
++	    pargs->a2 !=3D SANDBOX_MEM_HANDLE) {
++		/* FFA_ERROR encoding */
++		res->a0 =3D FFA_SMC_32(FFA_ERROR);
++		res->a2 =3D -INVALID_PARAMETERS;
++		ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
++		/* x3-x7 MBZ */
++		memset(&res->a3, 0, 5 * FFA_X_REG_SIZE_IN_BYTE);
++
++		return ret;
++	}
++
++	/* FFA_SUCCESS encoding */
++	res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++	/* x2-x7 MBZ */
++	memset(&res->a2, 0, 6 * FFA_X_REG_SIZE_IN_BYTE);
++
++	return 0;
++}
++
+ /**
+  * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
+  * @queried_func_id:	The FF-A function to be queried
+@@ -696,6 +735,9 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
+ 	case FFA_SMC_32(FFA_MEM_SHARE):
+ 		ret =3D sandbox_ffa_memory_share(emul, args, res);
+ 		break;
++	case FFA_SMC_32(FFA_MEM_RECLAIM):
++		ret =3D sandbox_ffa_memory_reclaim(emul, args, res);
++		break;
+ 	default:
+ 		log_err("Undefined FF-A interface (%lx)\n",
+ 			args->a0);
+diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/a=
rm-ffa/sandbox_ffa.c
+index 8d85e660e2b..54c81d12f92 100644
+--- a/drivers/firmware/arm-ffa/sandbox_ffa.c
++++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
+@@ -92,6 +92,7 @@ static const struct ffa_bus_ops sandbox_ffa_ops =3D {
+ 	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
+ 	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
+ 	.memory_share =3D ffa_memory_share_hdlr,
++	.memory_reclaim =3D ffa_memory_reclaim_hdlr,
+ };
+=20
+ static const struct udevice_id sandbox_ffa_id[] =3D {
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-=
A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-arm_ffa-efi-introduce-=
FF-A-MM-communication.patch
deleted file mode 100644
index 4934a903..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-a=
rm_ffa-efi-introduce-FF-A-MM-communication.patch
+++ /dev/null
@@ -1,446 +0,0 @@
-From c40964dc6ba6baea0adf8f384e1e57fcd5ca18b0 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: efi: introduce FF-A MM communication
-
-Add MM communication support using FF-A transport
-
-This feature allows accessing MM partitions services through
-EFI MM communication protocol. MM partitions such as StandAlonneMM
-or smm-gateway secure partitions which reside in secure world.
-
-An MM shared buffer and a door bell event are used to exchange
-the data.
-
-The data is used by EFI services such as GetVariable()/SetVariable()
-and copied from the communication buffer to the MM shared buffer.
-
-The secure partition is notified about availability of data in the
-MM shared buffer by an FF-A message (door bell).
-
-On such event, MM SP can read the data and updates the MM shared
-buffer with the response data.
-
-The response data is copied back to the communication buffer and
-consumed by the EFI subsystem.
-
-MM communication protocol supports FF-A 64-bit direct messaging.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Tested-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- include/mm_communication.h        |  13 ++
- lib/efi_loader/Kconfig            |  46 +++++-
- lib/efi_loader/efi_variable_tee.c | 257 +++++++++++++++++++++++++++++-
- 3 files changed, 309 insertions(+), 7 deletions(-)
-
-diff --git a/include/mm_communication.h b/include/mm_communication.h
-index e65fbde60d..f17847583b 100644
---- a/include/mm_communication.h
-+++ b/include/mm_communication.h
-@@ -6,6 +6,9 @@
-  *  Copyright (c) 2017, Intel Corporation. All rights reserved.
-  *  Copyright (C) 2020 Linaro Ltd. <sughosh.ganu@linaro.org>
-  *  Copyright (C) 2020 Linaro Ltd. <ilias.apalodimas@linaro.org>
-+ *  Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-=
office@arm.com>
-+ *    Authors:
-+ *      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #ifndef _MM_COMMUNICATION_H_
-@@ -13,6 +16,9 @@
-=20
- #include <part_efi.h>
-=20
-+/* MM service UUID string (big-endian format). This UUID is  common acr=
oss all MM SPs */
-+#define MM_SP_UUID	"33d532ed-e699-0942-c09c-a798d9cd722d"
-+
- /*
-  * Interface to the pseudo Trusted Application (TA), which provides a
-  * communication channel with the Standalone MM (Management Mode)
-@@ -248,4 +254,11 @@ struct smm_variable_var_check_property {
- 	u16                       name[];
- };
-=20
-+/* supported MM transports */
-+enum mm_comms_select {
-+	MM_COMMS_UNDEFINED,
-+	MM_COMMS_FFA,
-+	MM_COMMS_OPTEE
-+};
-+
- #endif /* _MM_COMMUNICATION_H_ */
-diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index c5835e6ef6..553e6a30a2 100644
---- a/lib/efi_loader/Kconfig
-+++ b/lib/efi_loader/Kconfig
-@@ -55,13 +55,55 @@ config EFI_VARIABLE_FILE_STORE
- 	  stored as file /ubootefi.var on the EFI system partition.
-=20
- config EFI_MM_COMM_TEE
--	bool "UEFI variables storage service via OP-TEE"
--	depends on OPTEE
-+	bool "UEFI variables storage service via the trusted world"
-+	select ARM_FFA_TRANSPORT
-+	select TEE
-+	select OPTEE
- 	help
-+	  Allowing access to the MM SP services (SPs such as  StandAlonneMM, s=
mm-gateway).
-+	  When using the u-boot OP-TEE driver, StandAlonneMM is supported.
-+	  When using the u-boot FF-A  driver any MM SP is supported.
-+
- 	  If OP-TEE is present and running StandAloneMM, dispatch all UEFI
- 	  variable related operations to that. The application will verify,
- 	  authenticate and store the variables on an RPMB.
-=20
-+	  When ARM_FFA_TRANSPORT is used, dispatch all UEFI variable related
-+	  operations to the MM SP running in the secure world.
-+	  A door bell mechanism is used to notify the SP when there is data in=
 the shared
-+	  MM buffer. The data is copied by u-boot to the shared buffer before =
issuing
-+	  the door bell event.
-+
-+config FFA_SHARED_MM_BUF_SIZE
-+	int "Memory size of the shared MM communication buffer"
-+	default 0
-+	depends on EFI_MM_COMM_TEE
-+	help
-+	  This defines the size in bytes of the memory area reserved for the s=
hared
-+	  buffer used for communication between the MM feature in U-Boot and
-+	  the MM SP in secure world.
-+	  The size of the memory region must be a multiple of the size of the =
maximum
-+	  translation granule size that is specified in the ID_AA64MMFR0_EL1 S=
ystem register.
-+	  It is assumed that the MM SP knows the size of the shared MM communi=
cation buffer.
-+
-+config FFA_SHARED_MM_BUF_OFFSET
-+	int "Data offset in the shared MM communication buffer"
-+	default 0
-+	depends on EFI_MM_COMM_TEE
-+	help
-+	  This defines the offset in bytes of the data read or written to in t=
he shared
-+	  buffer by the MM SP.
-+
-+config FFA_SHARED_MM_BUF_ADDR
-+	hex "Define the address of the shared MM communication buffer"
-+	default 0x0
-+	depends on EFI_MM_COMM_TEE
-+	help
-+	  This defines the address of the shared MM communication buffer
-+	  used for communication between the MM feature in U-Boot and
-+	  the MM SP in secure world.
-+	  It is assumed that the MM SP knows the address of the shared MM comm=
unication buffer.
-+
- config EFI_VARIABLE_NO_STORE
- 	bool "Don't persist non-volatile UEFI variables"
- 	help
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
-index dfef18435d..5137b871ea 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -4,17 +4,34 @@
-  *
-  *  Copyright (C) 2019 Linaro Ltd. <sughosh.ganu@linaro.org>
-  *  Copyright (C) 2019 Linaro Ltd. <ilias.apalodimas@linaro.org>
-+ *  Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-=
office@arm.com>
-+ *
-+ *  Authors:
-+ *    Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #include <common.h>
-+#include <arm_ffa.h>
-+#include <cpu_func.h>
-+#include <dm.h>
- #include <efi.h>
- #include <efi_api.h>
- #include <efi_loader.h>
- #include <efi_variable.h>
--#include <tee.h>
- #include <malloc.h>
-+#include <mapmem.h>
- #include <mm_communication.h>
-+#include <tee.h>
-+
-+/* MM return codes */
-+#define MM_SUCCESS (0)
-+#define MM_NOT_SUPPORTED (-1)
-+#define MM_INVALID_PARAMETER (-2)
-+#define MM_DENIED (-3)
-+#define MM_NO_MEMORY (-5)
-=20
-+static const char *mm_sp_svc_uuid =3D MM_SP_UUID;
-+static u16 mm_sp_id;
- extern struct efi_var_file __efi_runtime_data *efi_var_buf;
- static efi_uintn_t max_buffer_size;	/* comm + var + func + data */
- static efi_uintn_t max_payload_size;	/* func + data */
-@@ -145,16 +162,241 @@ static efi_status_t optee_mm_communicate(void *co=
mm_buf, ulong dsize)
- }
-=20
- /**
-- * mm_communicate() - Adjust the cmonnucation buffer to StandAlonneMM a=
nd send
-+ * ffa_notify_mm_sp() - Announce there is data in the shared buffer
-+ *
-+ * Notify the MM partition in the trusted world that
-+ * data is available in the shared buffer.
-+ * This is a blocking call during which trusted world has exclusive acc=
ess
-+ * to the MM shared buffer.
-+ *
-+ * Return:
-+ *
-+ * 0 on success
-+ */
-+static int ffa_notify_mm_sp(void)
-+{
-+	struct ffa_send_direct_data msg =3D {0};
-+	int ret;
-+	int sp_event_ret;
-+	struct udevice *dev;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
-+	if (ret) {
-+		log_err("EFI: Cannot find FF-A bus device, notify MM SP failure\n");
-+		return ret;
-+	}
-+
-+	msg.data0 =3D CONFIG_FFA_SHARED_MM_BUF_OFFSET; /* x3 */
-+
-+	ret =3D ffa_sync_send_receive(dev, mm_sp_id, &msg, 1);
-+	if (ret)
-+		return ret;
-+
-+	sp_event_ret =3D msg.data0; /* x3 */
-+
-+	switch (sp_event_ret) {
-+	case MM_SUCCESS:
-+		ret =3D 0;
-+		break;
-+	case MM_NOT_SUPPORTED:
-+		ret =3D -EINVAL;
-+		break;
-+	case MM_INVALID_PARAMETER:
-+		ret =3D -EPERM;
-+		break;
-+	case MM_DENIED:
-+		ret =3D -EACCES;
-+		break;
-+	case MM_NO_MEMORY:
-+		ret =3D -EBUSY;
-+		break;
-+	default:
-+		ret =3D -EACCES;
-+	}
-+
-+	return ret;
-+}
-+
-+/**
-+ * ffa_discover_mm_sp_id() - Query the MM partition ID
-+ *
-+ * Use the FF-A driver to get the MM partition ID.
-+ * If multiple partitions are found, use the first one.
-+ * This is a boot time function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success
-+ */
-+static int ffa_discover_mm_sp_id(void)
-+{
-+	u32 count =3D 0;
-+	int ret;
-+	struct ffa_partition_desc *descs;
-+	struct udevice *dev;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
-+	if (ret) {
-+		log_err("EFI: Cannot find FF-A bus device, MM SP discovery failure\n"=
);
-+		return ret;
-+	}
-+
-+	/* Ask the driver to fill the buffer with the SPs info */
-+	ret =3D ffa_partition_info_get(dev, mm_sp_svc_uuid, &count, &descs);
-+	if (ret) {
-+		log_err("EFI: Failure in querying SPs info (%d), MM SP discovery fail=
ure\n", ret);
-+		return ret;
-+	}
-+
-+	/* MM SPs found , use the first one */
-+
-+	mm_sp_id =3D descs[0].info.id;
-+
-+	log_info("EFI: MM partition ID 0x%x\n", mm_sp_id);
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_mm_communicate() - Exchange EFI services data with  the MM parti=
tion using FF-A
-+ * @comm_buf:		locally allocated communication buffer used for rx/tx
-+ * @dsize:				communication buffer size
-+ *
-+ * Issue a door bell event to notify the MM partition (SP) running in O=
P-TEE
-+ * that there is data to read from the shared buffer.
-+ * Communication with the MM SP is performed using FF-A transport.
-+ * On the event, MM SP can read the data from the buffer and
-+ * update the MM shared buffer with response data.
-+ * The response data is copied back to the communication buffer.
-+ *
-+ * Return:
-+ *
-+ * EFI status code
-+ */
-+static efi_status_t ffa_mm_communicate(void *comm_buf, ulong comm_buf_s=
ize)
-+{
-+	ulong tx_data_size;
-+	int ffa_ret;
-+	efi_status_t efi_ret;
-+	struct efi_mm_communicate_header *mm_hdr;
-+	void *virt_shared_buf;
-+
-+	if (!comm_buf)
-+		return EFI_INVALID_PARAMETER;
-+
-+	/* Discover MM partition ID at boot time */
-+	if (!mm_sp_id && ffa_discover_mm_sp_id()) {
-+		log_err("EFI: Failure to discover MM SP ID at boot time, FF-A MM comm=
s failure\n");
-+		return EFI_UNSUPPORTED;
-+	}
-+
-+	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
-+	tx_data_size =3D mm_hdr->message_len + sizeof(efi_guid_t) + sizeof(siz=
e_t);
-+
-+	if (comm_buf_size !=3D tx_data_size || tx_data_size > CONFIG_FFA_SHARE=
D_MM_BUF_SIZE)
-+		return EFI_INVALID_PARAMETER;
-+
-+	/* Copy the data to the shared buffer */
-+
-+	virt_shared_buf =3D map_sysmem((phys_addr_t)CONFIG_FFA_SHARED_MM_BUF_A=
DDR, 0);
-+	memcpy(virt_shared_buf, comm_buf, tx_data_size);
-+
-+	/*
-+	 * The secure world might have cache disabled for
-+	 * the device region used for shared buffer (which is the case for Opt=
ee).
-+	 * In this case, the secure world reads the data from DRAM.
-+	 * Let's flush the cache so the DRAM is updated with the latest data.
-+	 */
-+#ifdef CONFIG_ARM64
-+	invalidate_dcache_all();
-+#endif
-+
-+	/* Announce there is data in the shared buffer */
-+
-+	ffa_ret =3D ffa_notify_mm_sp();
-+
-+	switch (ffa_ret) {
-+	case 0: {
-+		ulong rx_data_size;
-+		/* Copy the MM SP response from the shared buffer to the communicatio=
n buffer */
-+		rx_data_size =3D ((struct efi_mm_communicate_header *)virt_shared_buf=
)->message_len +
-+			sizeof(efi_guid_t) +
-+			sizeof(size_t);
-+
-+		if (rx_data_size > comm_buf_size) {
-+			efi_ret =3D EFI_OUT_OF_RESOURCES;
-+			break;
-+		}
-+
-+		memcpy(comm_buf, virt_shared_buf, rx_data_size);
-+		efi_ret =3D EFI_SUCCESS;
-+		break;
-+	}
-+	case -EINVAL:
-+		efi_ret =3D EFI_DEVICE_ERROR;
-+		break;
-+	case -EPERM:
-+		efi_ret =3D EFI_INVALID_PARAMETER;
-+		break;
-+	case -EACCES:
-+		efi_ret =3D EFI_ACCESS_DENIED;
-+		break;
-+	case -EBUSY:
-+		efi_ret =3D EFI_OUT_OF_RESOURCES;
-+		break;
-+	default:
-+		efi_ret =3D EFI_ACCESS_DENIED;
-+	}
-+
-+	unmap_sysmem(virt_shared_buf);
-+	return efi_ret;
-+}
-+
-+/**
-+ * get_mm_comms() - detect the available MM transport
-+ *
-+ * Make sure the FF-A bus is probed successfully
-+ * which means FF-A communication with secure world works and ready
-+ * for use.
-+ *
-+ * If FF-A bus is not ready, use OPTEE comms.
-+ *
-+ * Return:
-+ *
-+ * MM_COMMS_FFA or MM_COMMS_OPTEE
-+ */
-+static enum mm_comms_select get_mm_comms(void)
-+{
-+	struct udevice *dev;
-+	int ret;
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
-+	if (ret) {
-+		log_err("EFI: Cannot find FF-A bus device, trying Optee comms\n");
-+		return MM_COMMS_OPTEE;
-+	}
-+
-+	return MM_COMMS_FFA;
-+}
-+
-+/**
-+ * mm_communicate() - Adjust the communication buffer to the MM SP and =
send
-  * it to OP-TEE
-  *
-- * @comm_buf:		locally allocted communcation buffer
-+ * @comm_buf:		locally allocated communication buffer
-  * @dsize:		buffer size
-+ *
-+ * The SP (also called partition) can be any MM SP such as  StandAlonne=
MM or smm-gateway.
-+ * The comm_buf format is the same for both partitions.
-+ * When using the u-boot OP-TEE driver, StandAlonneMM is supported.
-+ * When using the u-boot FF-A  driver, any MM SP is supported.
-+ *
-  * Return:		status code
-  */
- static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
- {
- 	efi_status_t ret;
-+	enum mm_comms_select mm_comms;
- 	struct efi_mm_communicate_header *mm_hdr;
- 	struct smm_variable_communicate_header *var_hdr;
-=20
-@@ -162,7 +404,12 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
- 	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
- 	var_hdr =3D (struct smm_variable_communicate_header *)mm_hdr->data;
-=20
--	ret =3D optee_mm_communicate(comm_buf, dsize);
-+	mm_comms =3D get_mm_comms();
-+	if (mm_comms =3D=3D MM_COMMS_FFA)
-+		ret =3D ffa_mm_communicate(comm_buf, dsize);
-+	else
-+		ret =3D optee_mm_communicate(comm_buf, dsize);
-+
- 	if (ret !=3D EFI_SUCCESS) {
- 		log_err("%s failed!\n", __func__);
- 		return ret;
-@@ -697,7 +944,7 @@ void efi_variables_boot_exit_notify(void)
- 		ret =3D EFI_NOT_FOUND;
-=20
- 	if (ret !=3D EFI_SUCCESS)
--		log_err("Unable to notify StMM for ExitBootServices\n");
-+		log_err("Unable to notify the MM partition for ExitBootServices\n");
- 	free(comm_buf);
-=20
- 	/*
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm=
_ffa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0009-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-tests.=
patch
new file mode 100644
index 00000000..01f63df4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-tests.patch
@@ -0,0 +1,68 @@
+From a1242cf231ef4d0fc1da36420e2db8cb12f7aa26 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 17 Oct 2024 15:50:21 +0100
+Subject: [PATCH 09/36] arm_ffa: sandbox: Add FFA_MEM_RECLAIM tests
+
+Add FFA_MEM_RECLAIM positive and negative test cases
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ test/dm/ffa.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/test/dm/ffa.c b/test/dm/ffa.c
+index 59eea9a57cc..f4a6716cfd8 100644
+--- a/test/dm/ffa.c
++++ b/test/dm/ffa.c
+@@ -179,6 +179,27 @@ static int  test_ffa_memory_share(bool test_ack, st=
ruct unit_test_state *uts)
+ 	return 0;
+ }
+=20
++static int  test_ffa_memory_reclaim(bool test_ack, struct unit_test_sta=
te *uts)
++{
++	int ret;
++	u64 g_handle;
++	struct udevice *dev;
++
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++
++	if (test_ack) {
++		g_handle =3D PACK_HANDLE(SANDBOX_MEM_HANDLE, SANDBOX_MEM_HANDLE);
++		ut_assertok(ffa_memory_reclaim(dev, g_handle, 0));
++	} else {
++		/* Provide a wrong handle */
++		g_handle =3D PACK_HANDLE(SANDBOX_MEM_HANDLE, 0);
++		ret =3D ffa_memory_reclaim(dev, g_handle, 0);
++		ut_asserteq(-EINVAL, ret);
++	}
++
++	return 0;
++}
++
+ static int dm_test_ffa_ack(struct unit_test_state *uts)
+ {
+ 	struct ffa_priv *uc_priv;
+@@ -236,6 +257,9 @@ static int dm_test_ffa_ack(struct unit_test_state *u=
ts)
+ 	/* Test FFA_MEM_SHARE */
+ 	test_ffa_memory_share(true, uts);
+=20
++	/* Test FFA_MEM_RECLAIM */
++	test_ffa_memory_reclaim(true, uts);
++
+ 	return 0;
+ }
+ DM_TEST(dm_test_ffa_ack, UTF_SCAN_FDT | UTF_CONSOLE);
+@@ -297,6 +321,9 @@ static int dm_test_ffa_nack(struct unit_test_state *=
uts)
+ 	/* Test FFA_MEM_SHARE */
+ 	test_ffa_memory_share(false, uts);
+=20
++	/* Test FFA_MEM_RECLAIM */
++	test_ffa_memory_reclaim(false, uts);
++
+ 	return 0;
+ }
+ DM_TEST(dm_test_ffa_nack, UTF_SCAN_FDT | UTF_CONSOLE);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-=
A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-arm_ffa-efi-corstone10=
00-enable-MM-communic.patch
deleted file mode 100644
index b01d669e..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-a=
rm_ffa-efi-corstone1000-enable-MM-communic.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c27f5fe90433f8e1b6eaa84857171ea7fc26593a Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 17 Jul 2023 15:23:33 +0100
-Subject: [PATCH] FF-A v15: arm_ffa: efi: corstone1000: enable MM communi=
cation
-
-turn on EFI MM communication
-
-On corstone1000 platform MM communication between u-boot
-and the secure world (Optee) is done using the FF-A bus.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
----
- configs/corstone1000_defconfig | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 2d391048cd..ee5481b63c 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -53,3 +53,8 @@ CONFIG_DM_SERIAL=3Dy
- CONFIG_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
-+CONFIG_NVMXIP_QSPI=3Dy
-+CONFIG_EFI_MM_COMM_TEE=3Dy
-+CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
-+CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
-+CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu=
_arm_psa-Initialize-the-update-agent.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0010-fwu_arm_psa-Initialize-the-update-agent.patc=
h
new file mode 100644
index 00000000..e81ff633
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu_arm_ps=
a-Initialize-the-update-agent.patch
@@ -0,0 +1,439 @@
+From 716b0084511392055c3be8b0bb5f4f90f7c4fcd2 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 23 Oct 2024 17:45:32 +0100
+Subject: [PATCH 10/36] fwu_arm_psa: Initialize the update agent
+
+Add the initializations required for the update agent
+
+The aim is adding support for the Trusted Services (aka TS)
+Firmware Update API. This API allows the interaction with
+the FWU services provided by Secure world.
+At U-Boot level, we provide the PSA FWU ABI built on top of the
+FF-A bus to invoke the FWU services in Secure world.
+
+The design is based on the Platform Security Firmware Update
+for the A-profile Arm Architecture specification [1].
+
+In our design, the Secure world is the update agent. U-Boot
+is the update client.
+
+The update agent is initialized as follows:
+
+- Trusted Services FWU SP discovery
+- Setting up the shared buffer between the Normal world (U-Boot) and
+  Secure world (Trusted Services)
+- Notifying FWU SP about the shared buffer
+
+[1]: DEN0118, 1.0 A: https://developer.arm.com/documentation/den0118/lat=
est/
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Davidson kumaresan <davidson.kumaresan@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS                   |   7 +
+ include/fwu_arm_psa.h         |  58 ++++++++
+ lib/fwu_updates/Kconfig       |  18 +++
+ lib/fwu_updates/Makefile      |   1 +
+ lib/fwu_updates/fwu_arm_psa.c | 271 ++++++++++++++++++++++++++++++++++
+ 5 files changed, 355 insertions(+)
+ create mode 100644 include/fwu_arm_psa.h
+ create mode 100644 lib/fwu_updates/fwu_arm_psa.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 042d3f6160a..e7ed894441e 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1210,6 +1210,13 @@ T:	git https://source.denx.de/u-boot/custodians/u=
-boot-fsl-qoriq.git
+ F:	drivers/watchdog/sp805_wdt.c
+ F:	drivers/watchdog/sbsa_gwdt.c
+=20
++FWU ARM PSA
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++M:	Davidson kumaresan <davidson.kumaresan@arm.com>
++S:	Maintained
++F:	include/fwu_arm_psa.h
++F:	lib/fwu_updates/fwu_arm_psa.c
++
+ FWU Multi Bank Update
+ M:	Sughosh Ganu <sughosh.ganu@linaro.org>
+ S:	Maintained
+diff --git a/include/fwu_arm_psa.h b/include/fwu_arm_psa.h
+new file mode 100644
+index 00000000000..f1d42f9ef24
+--- /dev/null
++++ b/include/fwu_arm_psa.h
+@@ -0,0 +1,58 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ *   Davidson kumaresan <davidson.kumaresan@arm.com>
++ */
++
++#ifndef __FWU_ARM_PSA_H
++#define __FWU_ARM_PSA_H
++
++#include <linux/bitfield.h>
++#include <u-boot/uuid.h>
++
++#define FWU_BUFFER_PAGES		(1024)
++
++/* 4 MB buffer shared with secure world */
++#define FWU_BUFFER_SIZE			(FWU_BUFFER_PAGES * EFI_PAGE_SIZE)
++
++/* TS UUID string for detecting all SPs  (in big-endian format) */
++#define ALL_TS_SP_UUID			"d776cdbd-5e82-5147-3b96-ac4349f8d486"
++/* In little-endian equivalent to: bdcd76d7-825e-4751-963b-86d4f84943ac=
 */
++
++/* TS FWU service UUID string (in big-endian format) */
++#define TS_FWU_SERVICE_UUID		"38a82368-061b-0e47-7497-fd53fb8bce0c"
++/* In little-endian equivalent to:  6823a838-1b06-470e-9774-0cce8bfb53f=
d */
++
++#define TS_RPC_MEM_RETRIEVE		(0xff0001)
++#define TS_RPC_SERVICE_INFO_GET		(0xff0003)
++#define RPC_SUCCESS			(0)
++
++#define SVC_IFACE_ID_GET_MASK		GENMASK(7, 0)
++#define GET_SVC_IFACE_ID(x)		\
++			 ((u8)(FIELD_GET(SVC_IFACE_ID_GET_MASK, (x))))
++
++#define HANDLE_MSW_MASK			GENMASK(63, 32)
++#define HANDLE_LSW_MASK			GENMASK(31, 0)
++#define GET_FWU_BUF_MSW(x)		\
++				((u32)(FIELD_GET(HANDLE_MSW_MASK, (x))))
++#define GET_FWU_BUF_LSW(x)		\
++				((u32)(FIELD_GET(HANDLE_LSW_MASK, (x))))
++
++/**
++ * fwu_agent_init() - Setup the FWU agent
++ *
++ * Perform the initializations required to communicate
++ * and use the FWU agent in secure world.
++ * The frontend of the FWU agent is the Trusted Services (aka TS)
++ * FWU SP (aka Secure Partition).
++ *
++ * Return:
++ *
++ * 0 is returned on success. Otherwise, failure
++ */
++int fwu_agent_init(void);
++
++#endif
+diff --git a/lib/fwu_updates/Kconfig b/lib/fwu_updates/Kconfig
+index a722107c129..cdc96109f0a 100644
+--- a/lib/fwu_updates/Kconfig
++++ b/lib/fwu_updates/Kconfig
+@@ -46,4 +46,22 @@ config FWU_MDATA_V2
+ 	  metadata structure. This option enables support for FWU
+ 	  Metadata version 2 access.
+=20
++config FWU_ARM_PSA
++	bool "FMP driver for Arm PSA FWU specification"
++	depends on EFI_CAPSULE_FIRMWARE_MANAGEMENT && \
++		EFI_CAPSULE_FIRMWARE_RAW && \
++		ARM_FFA_TRANSPORT && (ARM64 || SANDBOX)
++	select EFI_CAPSULE_FIRMWARE
++	help
++	  Select this option if you want to enable firmware management protoco=
l
++	  driver that supports the Arm PSA firmware update specification as
++	  mentioned in https://developer.arm.com/documentation/den0118/a/
++
++config FWU_BUFFER_PAGES
++	int "Number of 4KB pages in the FWU shared buffer"
++	depends on FWU_ARM_PSA
++	default 1024
++	help
++	  This defines the size of the FWU shared buffer used for communicatio=
n.
++
+ endif
+diff --git a/lib/fwu_updates/Makefile b/lib/fwu_updates/Makefile
+index 3681bef46cd..498e2411091 100644
+--- a/lib/fwu_updates/Makefile
++++ b/lib/fwu_updates/Makefile
+@@ -8,3 +8,4 @@ obj-$(CONFIG_FWU_MDATA_GPT_BLK) +=3D fwu_gpt.o
+ obj-$(CONFIG_FWU_MDATA_MTD) +=3D fwu_mtd.o
+ obj-$(CONFIG_FWU_MDATA_V1) +=3D fwu_v1.o
+ obj-$(CONFIG_FWU_MDATA_V2) +=3D fwu_v2.o
++obj-$(CONFIG_FWU_ARM_PSA) +=3D fwu_arm_psa.o
+diff --git a/lib/fwu_updates/fwu_arm_psa.c b/lib/fwu_updates/fwu_arm_psa=
.c
+new file mode 100644
+index 00000000000..4a01c5ac672
+--- /dev/null
++++ b/lib/fwu_updates/fwu_arm_psa.c
+@@ -0,0 +1,271 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ *   Davidson kumaresan <davidson.kumaresan@arm.com>
++ */
++#include <arm_ffa.h>
++#include <dm.h>
++#include <fwu_arm_psa.h>
++#include <efi_loader.h>
++#include <fwu.h>
++#include <log.h>
++#include <malloc.h>
++#include <mapmem.h>
++#include <linux/errno.h>
++
++static void *g_fwu_buf;
++static u64 g_fwu_buf_handle;
++static u16 g_fwu_sp_id;
++static struct udevice *g_dev;
++static u16 g_svc_interface_id;
++static bool g_fwu_initialized;
++
++/**
++ * fwu_discover_ts_sp_id() - Query the FWU partition ID
++ *
++ * Use the FF-A driver to get the FWU partition ID.
++ * If multiple partitions are found, use the first one.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int fwu_discover_ts_sp_id(void)
++{
++	u32 count =3D 0;
++	int ret;
++	u32 i;
++	struct ffa_partition_desc *descs =3D NULL;
++	struct ffa_send_direct_data msg;
++	struct ffa_partition_uuid fwu_service_uuid =3D {0};
++
++	/* Ask the driver to fill the buffer with the SPs info */
++
++	ret =3D ffa_partition_info_get(g_dev, ALL_TS_SP_UUID, &count, &descs);
++	if (ret) {
++		log_err("FWU: Failure in querying partitions (err: %d)\n", ret);
++		return ret;
++	}
++
++	if (!count) {
++		log_err("FWU: No Trusted Service partition found\n");
++		return -ENODATA;
++	}
++
++	if (!descs) {
++		log_err("FWU: No partitions descriptors filled\n");
++		return -EINVAL;
++	}
++
++	if (uuid_str_to_le_bin(TS_FWU_SERVICE_UUID,
++			       (unsigned char *)&fwu_service_uuid)) {
++		log_err("FWU: invalid FWU SP  UUID\n");
++		return -EINVAL;
++	}
++
++	for (i =3D 0; i < count ; i++) {
++		log_debug("FWU: Enquiring service from SP 0x%x\n",
++			  descs[i].info.id);
++
++		msg.data0 =3D TS_RPC_SERVICE_INFO_GET;
++		msg.data1 =3D fwu_service_uuid.a1;
++		msg.data2 =3D fwu_service_uuid.a2;
++		msg.data3 =3D fwu_service_uuid.a3;
++		msg.data4 =3D fwu_service_uuid.a4;
++
++		ret =3D ffa_sync_send_receive(g_dev, descs[i].info.id, &msg, 0);
++		if (ret) {
++			log_err("FWU: FF-A error for SERVICE_INFO_GET (err: %d)\n",
++				ret);
++			return ret;
++		}
++
++		if (msg.data0 !=3D TS_RPC_SERVICE_INFO_GET) {
++			log_err("FWU: Wrong SERVICE_INFO_GET return: (%lx)\n",
++				msg.data0);
++			continue;
++		}
++
++		if (msg.data1 =3D=3D RPC_SUCCESS) {
++			g_svc_interface_id =3D GET_SVC_IFACE_ID(msg.data2);
++			g_fwu_sp_id =3D descs[i].info.id;
++			log_debug("FWU: Service interface ID 0x%x found\n",
++				  g_svc_interface_id);
++			return 0;
++		}
++
++		log_debug("FWU: service not found\n");
++	}
++
++	log_err("FWU: No SP provides the service\n");
++
++	return -ENOENT;
++}
++
++/**
++ * fwu_shared_buf_reclaim() - Reclaim the shared communication buffer
++ *
++ * In case of errors, this function can be called to retrieve
++ *  the FWU shared buffer.
++ *
++ * Return:
++ *
++ * 0 is returned on success. Otherwise, failure
++ */
++static int fwu_shared_buf_reclaim(void)
++{
++	int reclaim_ret;
++
++	reclaim_ret =3D ffa_memory_reclaim(g_dev, g_fwu_buf_handle, 0);
++	if (reclaim_ret)
++		log_err("FWU: FF-A memory reclaim failure (err: %d)\n",
++			reclaim_ret);
++	else
++		log_debug("FWU: Shared buffer reclaimed\n");
++
++	free(g_fwu_buf);
++	g_fwu_buf =3D NULL;
++
++	return reclaim_ret;
++}
++
++/**
++ * fwu_shared_buf_init() - Setup the FWU shared communication buffer
++ *
++ * The communication with the TS FWU SP is based on a buffer shared
++ * between U-Boot and TS FWU SP allocated in normal world and accessed
++ * by both sides. The buffer contains the data exchanged between both s=
ides
++ * such as the payloads data.
++ *
++ * Return:
++ *
++ * 0 is returned on success. Otherwise, failure
++ */
++static int fwu_shared_buf_init(void)
++{
++	struct ffa_mem_ops_args args =3D {0};
++	struct ffa_mem_region_attributes attrs =3D {0};
++	struct ffa_send_direct_data msg;
++	int ret;
++
++	g_fwu_buf =3D memalign(EFI_PAGE_SIZE, FWU_BUFFER_SIZE);
++	if (!g_fwu_buf) {
++		log_err("FWU: Failure to allocate the shared buffer\n");
++		return -ENOMEM;
++	}
++
++	/* Setting up user arguments */
++	args.use_txbuf =3D true;
++	args.address =3D g_fwu_buf;
++	args.pg_cnt =3D FWU_BUFFER_PAGES;
++	args.nattrs =3D 1;
++	attrs.receiver =3D g_fwu_sp_id;
++	attrs.attrs =3D FFA_MEM_RW;
++	args.attrs =3D &attrs;
++
++	/* Registering the shared buffer with secure world (Trusted Services) =
*/
++	ret =3D ffa_memory_share(g_dev, &args);
++	if (ret) {
++		free(g_fwu_buf);
++		g_fwu_buf =3D NULL;
++		log_err("FWU: Failure setting up the shared buffer (err: %d)\n",
++			ret);
++		return ret;
++	}
++
++	g_fwu_buf_handle =3D args.g_handle;
++
++	log_debug("FWU: shared buffer handle 0x%llx\n", g_fwu_buf_handle);
++
++	/* Inform the FWU SP know about the shared buffer */
++
++	msg.data0 =3D TS_RPC_MEM_RETRIEVE;
++	msg.data1 =3D GET_FWU_BUF_LSW(g_fwu_buf_handle);
++	msg.data2 =3D GET_FWU_BUF_MSW(g_fwu_buf_handle);
++
++	ret =3D ffa_sync_send_receive(g_dev, g_fwu_sp_id, &msg, 0);
++	if (ret) {
++		log_err("FWU: FF-A message error for MEM_RETRIEVE (err: %d)\n",
++			ret);
++		goto failure;
++	}
++
++	if (msg.data0 !=3D TS_RPC_MEM_RETRIEVE) {
++		log_err("FWU: Unexpected MEM_RETRIEVE return: (%lx)\n",
++			msg.data0);
++		ret =3D -EINVAL;
++		goto failure;
++	}
++
++	if (msg.data1 !=3D RPC_SUCCESS) {
++		log_err("FWU: MEM_RETRIEVE failed\n");
++		ret =3D -EOPNOTSUPP;
++		goto failure;
++	}
++
++	log_debug("FWU: MEM_RETRIEVE success for SP 0x%x\n", g_fwu_sp_id);
++
++	return 0;
++
++failure:
++	fwu_shared_buf_reclaim();
++	return ret;
++}
++
++/**
++ * fwu_agent_init() - Setup the FWU agent
++ *
++ * Perform the initializations required to communicate
++ * and use the FWU agent in secure world.
++ * The frontend of the FWU agent is the Trusted Services (aka TS)
++ * FWU SP (aka Secure Partition).
++ *
++ * Return:
++ *
++ * 0 is returned on success. Otherwise, failure
++ */
++int fwu_agent_init(void)
++{
++	int ret;
++	struct fwu_data *fwu_data;
++	u32 active_idx;
++
++	fwu_data =3D fwu_get_data();
++	if (!fwu_data) {
++		log_err("FWU: Cannot get FWU data\n");
++		return -EINVAL;
++	}
++
++	ret =3D fwu_get_active_index(&active_idx);
++	if (ret) {
++		log_err("FWU: Failed to read boot index, err (%d)\n",
++			ret);
++		return ret;
++	}
++
++	if (fwu_data->trial_state)
++		log_info("FWU: System booting in Trial State\n");
++	else
++		log_info("FWU: System booting in Regular State\n");
++
++	ret =3D uclass_first_device_err(UCLASS_FFA, &g_dev);
++	if (ret) {
++		log_err("FWU: Cannot find FF-A bus device, err (%d)\n", ret);
++		return ret;
++	}
++
++	ret =3D fwu_discover_ts_sp_id();
++	if (ret)
++		return ret;
++
++	ret =3D fwu_shared_buf_init();
++	if (ret)
++		return ret;
++
++	g_fwu_initialized =3D true;
++
++	return 0;
++}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi=
-corstone1000-fwu-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-fwu-introduce-EFI=
-capsule-update.patch
deleted file mode 100644
index 62fd6d5a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-fwu-introduce-EFI-capsule-update.patch
+++ /dev/null
@@ -1,406 +0,0 @@
-From 2a054e537037bb4f4f9e144ca69438abd9bb38ed Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 17 Jul 2023 15:56:18 +0100
-Subject: [PATCH] efi: corstone1000: fwu: introduce EFI capsule update
-
-This commit provides capsule update feature for Corstone1000.
-
-This feature is available before and after ExitBootServices().
-
-A platform specific capsule buffer is allocated. This buffer
-is physically contiguous and allocated at the start of the DDR
-memory after u-boot relocation to the end of DDR.
-
-The capsule buffer is shared between u-boot and the secure world.
-
-On UpdateCapsule() , capsule data is copied to the buffer and a buffer r=
eady event is generated using FF-A transport.
-
-On efi_init_capsule() in U-Boot, an EFI started event is sent to SE Prox=
y FW update service. This event is generated on each boot.
-
-Note: The SE proxy SP requires that the interface/event IDs are passed u=
sing register w4 for the buffer ready event and the EFI started event.
-
-    interface ID (31:16)
-    event ID (15:0)
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- board/armltd/corstone1000/corstone1000.c |   4 +
- configs/corstone1000_defconfig           |   3 +
- include/configs/corstone1000.h           |  24 ++++
- include/efi_loader.h                     |   4 +-
- lib/efi_loader/efi_boottime.c            |   7 ++
- lib/efi_loader/efi_capsule.c             | 136 ++++++++++++++++++++++-
- lib/efi_loader/efi_setup.c               |  64 +++++++++++
- 7 files changed, 238 insertions(+), 4 deletions(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 6ec8e6144f..c840290885 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -67,6 +67,10 @@ static struct mm_region corstone1000_mem_map[] =3D {
-=20
- struct mm_region *mem_map =3D corstone1000_mem_map;
-=20
-+void set_dfu_alt_info(char *interface, char *devstr)
-+{
-+}
-+
- int board_init(void)
- {
- 	return 0;
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index ee5481b63c..40ba415ecb 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -58,3 +58,6 @@ CONFIG_EFI_MM_COMM_TEE=3Dy
- CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
- CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
- CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
-+CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
-+CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
-+CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 3347c11792..8927b09499 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -14,6 +14,30 @@
-=20
- #include <linux/sizes.h>
-=20
-+/* The SE Proxy partition ID*/
-+#define CORSTONE1000_SEPROXY_PART_ID		(0x8002)
-+
-+/* Update service ID provided by  the SE Proxy secure partition*/
-+#define CORSTONE1000_SEPROXY_UPDATE_SVC_ID	(0x4)
-+
-+/* Notification events used with SE Proxy update service */
-+#define CORSTONE1000_BUFFER_READY_EVT		(0x1)
-+#define CORSTONE1000_UBOOT_EFI_STARTED_EVT	(0x2)
-+
-+#define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
-+#define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
-+
-+#define PREP_SEPROXY_EVT_MASK		GENMASK(15, 0)
-+#define PREP_SEPROXY_EVT(x)	(FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
-+
-+/* Size in 4KB pages of the EFI capsule buffer */
-+#define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
-+
-+/* Capsule GUID */
-+#define EFI_CORSTONE1000_CAPSULE_ID_GUID \
-+	EFI_GUID(0x3a770ddc, 0x409b, 0x48b2, 0x81, 0x41, \
-+		 0x93, 0xb7, 0xc6, 0x0b, 0x20, 0x9e)
-+
- #define V2M_BASE		0x80000000
-=20
- #define CFG_PL011_CLOCK	50000000
-diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 38d7f66bab..0a613ed51e 100644
---- a/include/efi_loader.h
-+++ b/include/efi_loader.h
-@@ -1036,11 +1036,11 @@ extern const struct efi_firmware_management_prot=
ocol efi_fmp_fit;
- extern const struct efi_firmware_management_protocol efi_fmp_raw;
-=20
- /* Capsule update */
--efi_status_t EFIAPI efi_update_capsule(
-+efi_status_t __efi_runtime EFIAPI efi_update_capsule(
- 		struct efi_capsule_header **capsule_header_array,
- 		efi_uintn_t capsule_count,
- 		u64 scatter_gather_list);
--efi_status_t EFIAPI efi_query_capsule_caps(
-+efi_status_t __efi_runtime EFIAPI efi_query_capsule_caps(
- 		struct efi_capsule_header **capsule_header_array,
- 		efi_uintn_t capsule_count,
- 		u64 *maximum_capsule_size,
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index d5065f296a..a5da77c36c 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -23,6 +23,13 @@
- #include <asm/setjmp.h>
- #include <linux/libfdt_env.h>
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+#include <arm_ffa.h>
-+#include <dm.h>
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+#endif
-+
- DECLARE_GLOBAL_DATA_PTR;
-=20
- /* Task priority level */
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 7a6f195cbc..ea084e4ed2 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -26,6 +26,17 @@
- #include <crypto/pkcs7_parser.h>
- #include <linux/err.h>
-=20
-+#ifdef CONFIG_TARGET_CORSTONE1000
-+#include <arm_ffa.h>
-+#include <cpu_func.h>
-+#include <dm.h>
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+
-+void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared bu=
ffer virtual address */
-+efi_guid_t corstone1000_capsule_guid =3D EFI_CORSTONE1000_CAPSULE_ID_GU=
ID;
-+#endif
-+
- DECLARE_GLOBAL_DATA_PTR;
-=20
- const efi_guid_t efi_guid_capsule_report =3D EFI_CAPSULE_REPORT_GUID;
-@@ -709,6 +720,87 @@ static efi_status_t efi_capsule_update_firmware(
- }
- #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_MANAGEMENT */
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+
-+/**
-+ * efi_corstone1000_alloc_capsule_shared_buf - allocate capsule shared =
buffer
-+ * @capsule_image_size:	The capsule data (header + payload)
-+ *
-+ * This function allocates the physically contiguous buffer shared betw=
een u-boot
-+ * and the secure world. On UpdateCapsule() capsule data is copied to t=
he buffer
-+ * and a door bell event is generated.
-+ * The buffer is allocated at the start of the DDR memory after u-boot =
has been relocated
-+ * to the end of DDR.
-+ *
-+ * Return:
-+ *
-+ * 0: on success, otherwise failure
-+ */
-+efi_status_t efi_corstone1000_alloc_capsule_shared_buf(void)
-+{
-+	efi_status_t efi_ret;
-+	u64 ram_base =3D CFG_SYS_SDRAM_BASE;
-+
-+	log_debug("[%s]\n", __func__);
-+
-+	efi_ret =3D efi_allocate_pages(EFI_ALLOCATE_ADDRESS,
-+				     EFI_RUNTIME_SERVICES_DATA,
-+				     CORSTONE1000_CAPSULE_BUFFER_SIZE,
-+				     &ram_base);
-+
-+	if (efi_ret !=3D EFI_SUCCESS) {
-+		corstone1000_capsule_buf =3D NULL;
-+		log_err("EFI: Corstone1000: Allocating capsule shared buffer error (%=
d)\n"
-+			, (int)efi_ret);
-+		return efi_ret;
-+	}
-+
-+	log_info("EFI: Corstone1000: Capsule shared buffer at 0x%x , size %d p=
ages\n"
-+		, (unsigned int)ram_base,
-+		CORSTONE1000_CAPSULE_BUFFER_SIZE);
-+
-+	corstone1000_capsule_buf =3D (void *)map_sysmem((phys_addr_t)ram_base,=
 0);
-+
-+	return EFI_SUCCESS;
-+}
-+
-+/**
-+ * efi_corstone1000_buffer_ready_event - issue door bell event
-+ * @capsule_image_size:	The capsule data (header + payload)
-+ *
-+ * This function notifies the SE Proxy update service that capsule data=
 is available
-+ * in the capsule shared buffer.
-+ *
-+ * Return:
-+ *
-+ * 0: on success, otherwise failure
-+ */
-+static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsul=
e_image_size)
-+{
-+	struct ffa_send_direct_data msg =3D {0};
-+	int ret;
-+	struct udevice *dev;
-+
-+	log_debug("[%s]\n", __func__);
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
-+	if (ret) {
-+		log_err("Cannot find FF-A bus device\n");
-+		return ret;
-+	}
-+
-+	/*
-+	 * setting the buffer ready event arguments in register w4:
-+	 * - capsule update interface ID (31:16)
-+	 * - the buffer ready event ID (15:0)
-+	 */
-+	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
-+
-+	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
-+}
-+#endif
-+
- /**
-  * efi_update_capsule() - process information from operating system
-  * @capsule_header_array:	Array of virtual address pointers
-@@ -722,7 +814,7 @@ static efi_status_t efi_capsule_update_firmware(
-  *
-  * Return:			status code
-  */
--efi_status_t EFIAPI efi_update_capsule(
-+efi_status_t __efi_runtime EFIAPI efi_update_capsule(
- 		struct efi_capsule_header **capsule_header_array,
- 		efi_uintn_t capsule_count,
- 		u64 scatter_gather_list)
-@@ -739,6 +831,13 @@ efi_status_t EFIAPI efi_update_capsule(
- 		goto out;
- 	}
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+		if (capsule_count !=3D 1 || !corstone1000_capsule_buf) {
-+			ret =3D EFI_INVALID_PARAMETER;
-+			goto out;
-+		}
-+#endif
-+
- 	ret =3D EFI_SUCCESS;
- 	for (i =3D 0, capsule =3D *capsule_header_array; i < capsule_count;
- 	     i++, capsule =3D *(++capsule_header_array)) {
-@@ -751,6 +850,39 @@ efi_status_t EFIAPI efi_update_capsule(
-=20
- 		log_debug("Capsule[%d] (guid:%pUs)\n",
- 			  i, &capsule->capsule_guid);
-+
-+#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
-+		if (guidcmp(&corstone1000_capsule_guid, &capsule->capsule_guid)) {
-+			ret =3D EFI_INVALID_PARAMETER;
-+			log_err("Corstone1000: Invalid capsule GUID\n");
-+			goto out;
-+		}
-+
-+		if (efi_size_in_pages(capsule->capsule_image_size) >
-+		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
-+			log_err("Corstone1000: Capsule data size exceeds the shared buffer s=
ize\n");
-+			ret =3D EFI_BUFFER_TOO_SMALL;
-+			goto out;
-+		}
-+
-+		/* copy the data to the contiguous buffer */
-+		efi_memcpy_runtime(corstone1000_capsule_buf, capsule, capsule->capsul=
e_image_size);
-+
-+		/* invalidate the data cache */
-+		invalidate_dcache_all();
-+
-+		/* issue buffer ready event */
-+		ret =3D efi_corstone1000_buffer_ready_event(capsule->capsule_image_si=
ze);
-+		if (ret) {
-+			log_err("EFI: Corstone1000: Buffer ready event error (%d)\n", (int)r=
et);
-+			ret =3D EFI_DEVICE_ERROR;
-+		} else {
-+			ret =3D EFI_SUCCESS;
-+		}
-+
-+		goto out;
-+#endif
-+
- 		if (!guidcmp(&capsule->capsule_guid,
- 			     &efi_guid_firmware_management_capsule_id)) {
- 			ret  =3D efi_capsule_update_firmware(capsule);
-@@ -789,7 +921,7 @@ out:
-  *
-  * Return:			status code
-  */
--efi_status_t EFIAPI efi_query_capsule_caps(
-+efi_status_t __efi_runtime EFIAPI efi_query_capsule_caps(
- 		struct efi_capsule_header **capsule_header_array,
- 		efi_uintn_t capsule_count,
- 		u64 *maximum_capsule_size,
-diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 58d4e13402..bf90a98b5a 100644
---- a/lib/efi_loader/efi_setup.c
-+++ b/lib/efi_loader/efi_setup.c
-@@ -17,6 +17,18 @@
-=20
- efi_status_t efi_obj_list_initialized =3D OBJ_LIST_NOT_INITIALIZED;
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+#include <arm_ffa.h>
-+#include <dm.h>
-+
-+/**
-+ * efi_corstone1000_alloc_capsule_shared_buf - allocate capsule shared =
buffer
-+ */
-+extern efi_status_t efi_corstone1000_alloc_capsule_shared_buf(void);
-+#endif
-+
- /*
-  * Allow unaligned memory access.
-  *
-@@ -120,6 +132,42 @@ static efi_status_t efi_init_secure_boot(void)
- }
- #endif /* CONFIG_EFI_SECURE_BOOT */
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+/**
-+ * efi_corstone1000_uboot-efi_started_event - notifies SE Proxy FW upda=
te service
-+ *
-+ * This function notifies the SE Proxy update service that uboot efi ha=
s already started
-+ *
-+ * Return:
-+ *
-+ * 0: on success, otherwise failure
-+ * */
-+static int efi_corstone1000_uboot_efi_started_event(void)
-+{
-+	struct ffa_send_direct_data msg =3D {0};
-+	int ret;
-+	struct udevice *dev;
-+
-+	log_debug("[%s]\n", __func__);
-+
-+	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
-+	if (ret) {
-+		log_err("Cannot find FF-A bus device\n");
-+		return ret;
-+	}
-+
-+	/*
-+	 * setting the kernel started  event arguments:
-+	 * setting capsule update interface ID(31:16)
-+	 * the kernel started event ID(15:0)
-+	 */
-+	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
-+
-+	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
-+}
-+#endif
-+
- /**
-  * efi_init_capsule - initialize capsule update state
-  *
-@@ -129,6 +177,22 @@ static efi_status_t efi_init_capsule(void)
- {
- 	efi_status_t ret =3D EFI_SUCCESS;
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+	int ffa_ret;
-+
-+	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
-+	if (ffa_ret)
-+		log_err("Failure to notify SE Proxy FW update service\n");
-+	else
-+		debug("SE Proxy FW update service notified\n");
-+
-+	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
-+	if (ret !=3D EFI_SUCCESS) {
-+		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
-+		return ret;
-+	}
-+#endif
-+
- 	if (IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)) {
- 		u16 var_name16[12];
-=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-fwu=
_arm_psa-Read-the-FWU-directory-through-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0011-fwu_arm_psa-Read-the-FWU-direct=
ory-through-get_image.patch
new file mode 100644
index 00000000..36d96652
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-fwu_arm_ps=
a-Read-the-FWU-directory-through-get_image.patch
@@ -0,0 +1,894 @@
+From 372b693b0d9778fc5696512f13d39d0090b9b0d9 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 15 Nov 2024 19:24:50 +0000
+Subject: [PATCH 11/36] fwu_arm_psa: Read the FWU directory through
+ get_image_info()
+
+Implement get_image_info()
+
+get_image_info() is implemented by fwu_arm_psa_get_image_info()
+which reads the images information from the cached directory in Secure
+world then populates the images descriptors.
+
+The FWU Arm PSA setup ABIs have been implemented to allow
+reading the directory data.
+
+The ABIs are specified by the Platform Security Firmware Update for
+the A-profile Arm Architecture specification [1].
+
+For more details about PSA please see [2].
+
+The implemented ABIs are as follows:
+
+FWU_DISCOVER
+FWU_OPEN
+FWU_READ_STREAM
+FWU_COMMIT
+
+[1]: DEN0118, 1.0 A: https://developer.arm.com/documentation/den0118/lat=
est/
+[2]: https://www.psacertified.org/
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Davidson kumaresan <davidson.kumaresan@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ include/fwu_arm_psa.h         | 206 ++++++++++++
+ lib/fwu_updates/fwu_arm_psa.c | 580 +++++++++++++++++++++++++++++++++-
+ 2 files changed, 785 insertions(+), 1 deletion(-)
+
+diff --git a/include/fwu_arm_psa.h b/include/fwu_arm_psa.h
+index f1d42f9ef24..ba294359b5e 100644
+--- a/include/fwu_arm_psa.h
++++ b/include/fwu_arm_psa.h
+@@ -10,9 +10,16 @@
+ #ifndef __FWU_ARM_PSA_H
+ #define __FWU_ARM_PSA_H
+=20
++#include <efi_loader.h>
+ #include <linux/bitfield.h>
+ #include <u-boot/uuid.h>
+=20
++#define DEFAULT_HW_INSTANCE		(1)
++
++/* Default values of the ESRT fields which are not supported at this st=
age */
++#define PACKAGE_VERSION_NOT_SUP		(0xffffffff)
++#define LAST_ATTEMPT_NOT_SUP		(0)
++
+ #define FWU_BUFFER_PAGES		(1024)
+=20
+ /* 4 MB buffer shared with secure world */
+@@ -26,6 +33,13 @@
+ #define TS_FWU_SERVICE_UUID		"38a82368-061b-0e47-7497-fd53fb8bce0c"
+ /* In little-endian equivalent to:  6823a838-1b06-470e-9774-0cce8bfb53f=
d */
+=20
++/* TS FWU directory UUID string (in big-endian format) */
++#define FWU_DIRECTORY_CANONICAL_UUID	"d958eede-4751-d34a-90a2-a541236e6=
677"
++/* In little-endian equivalent to:  deee58d9-5147-4ad3-a290-77666e2341a=
5 */
++
++/* The entries correspond to the payloads in the storage device and the=
 fake ESRT image */
++#define FWU_DIRECTORY_IMAGE_ENTRIES_COUNT (CONFIG_FWU_NUM_IMAGES_PER_BA=
NK + 1)
++
+ #define TS_RPC_MEM_RETRIEVE		(0xff0001)
+ #define TS_RPC_SERVICE_INFO_GET		(0xff0003)
+ #define RPC_SUCCESS			(0)
+@@ -34,6 +48,11 @@
+ #define GET_SVC_IFACE_ID(x)		\
+ 			 ((u8)(FIELD_GET(SVC_IFACE_ID_GET_MASK, (x))))
+=20
++#define SVC_ID_MASK			GENMASK(15, 0)
++#define SVC_IFACE_ID_SET_MASK		GENMASK(23, 16)
++#define PACK_SVC_IFACE_ID(svc, iface)	(FIELD_PREP(SVC_ID_MASK, (svc)) |=
 \
++					FIELD_PREP(SVC_IFACE_ID_SET_MASK, (iface)))
++
+ #define HANDLE_MSW_MASK			GENMASK(63, 32)
+ #define HANDLE_LSW_MASK			GENMASK(31, 0)
+ #define GET_FWU_BUF_MSW(x)		\
+@@ -41,6 +60,174 @@
+ #define GET_FWU_BUF_LSW(x)		\
+ 				((u32)(FIELD_GET(HANDLE_LSW_MASK, (x))))
+=20
++enum fwu_abis {
++	FWU_DISCOVER =3D 0,
++	FWU_OPEN =3D 19,
++	FWU_READ_STREAM =3D 21,
++	FWU_COMMIT =3D 22,
++	/* To be updated when adding new FWU IDs */
++	FWU_FIRST_ID =3D FWU_DISCOVER, /* Lowest number ID */
++	FWU_LAST_ID =3D FWU_COMMIT, /* Highest number ID */
++};
++
++enum fwu_abi_errcode {
++	FWU_UNKNOWN =3D 1,
++	FWU_BUSY,
++	FWU_OUT_OF_BOUNDS,
++	FWU_AUTH_FAIL,
++	FWU_NO_PERMISSION,
++	FWU_DENIED,
++	FWU_RESUME,
++	FWU_NOT_AVAILABLE,
++	MAX_NUMBER_FWU_ERR
++};
++
++/* Container structure and helper macros to map between an FF-A error a=
nd relevant error log */
++struct fwu_abi_errmap {
++	char *err_str[MAX_NUMBER_FWU_ERR];
++};
++
++#define FWU_ERRMAP_COUNT (FWU_LAST_ID - FWU_FIRST_ID + 1)
++#define FWU_ID_TO_ERRMAP_ID(fwu_id) ((fwu_id) - FWU_FIRST_ID)
++
++/*
++ * struct fwu_open_args - fwu_open ABI arguments
++ * @function_id: fwu_open service ID
++ * @image_type_guid: GUID of the image to be opened
++ * @op_type: The operation that the Client will perform on the image
++ */
++struct __packed fwu_open_args {
++	u32 function_id;
++	efi_guid_t image_type_guid;
++#define FWU_OP_TYPE_READ 0
++#define FWU_OP_TYPE_WRITE 1
++	u8  op_type;
++};
++
++/*
++ * struct fwu_open_resp - fwu_open ABI returns
++ * @status: The ABI return status
++ * @handle: Staging context identifier
++ */
++struct __packed fwu_open_resp {
++	int status;
++	u32  handle;
++};
++
++/*
++ * struct fwu_discover_args - fwu_discover ABI arguments
++ * @function_id: fwu_discover service ID
++ */
++struct __packed fwu_discover_args {
++	u32 function_id;
++};
++
++/*
++ * struct fwu_discover_resp - fwu_discover ABI returns
++ * @status: The ABI return status
++ * @service_status: the status of the service provider
++ * @version_major: the ABI major version
++ * @version_minor: the ABI minor version
++ * @off_function_presence: the offset (in bytes) of the function_presen=
ce array
++ *                         relative to the start of this data structure
++ * @num_func: the number of entries in the function_presence array
++ * @max_payload_size: the maximum number of bytes that a payload can co=
ntain
++ * @flags: flags listing the update capabilities
++ * @vendor_specific_flags: Vendor specific update capabilities flags
++ * @function_presence: array of bytes indicating functions that are imp=
lemented
++ */
++struct __packed fwu_discover_resp {
++	int status;
++	u16 service_status;
++	u8 version_major;
++	u8 version_minor;
++	u16 off_function_presence;
++	u16 num_func;
++	u64 max_payload_size;
++	u32 flags;
++	u32 vendor_specific_flags;
++	void *function_presence;
++};
++
++/*
++ * struct fwu_read_stream_args - fwu_read_stream ABI arguments
++ * @function_id: fwu_read_stream service ID
++ * @handle: The handle of the context being read from
++ */
++struct __packed fwu_read_stream_args {
++	u32 function_id;
++	u32  handle;
++};
++
++/*
++ * struct fwu_read_stream_resp - fwu_read_stream ABI returns
++ * @status: The ABI return status
++ * @read_bytes: Number of bytes read by the current ABI call
++ * @total_bytes: Total number of bytes that can be read
++ * @payload: The read data by the current ABI call
++ */
++struct __packed fwu_read_stream_resp {
++	int status;
++	u32  read_bytes;
++	u32  total_bytes;
++	u8  payload[];
++};
++
++/*
++ * struct fwu_commit_args - fwu_commit ABI arguments
++ * @function_id: fwu_commit service ID
++ * @handle: The handle of the context being closed
++ * @acceptance_req: If positive, the Client requests the image to be ma=
rked as
++ *                  unaccepted
++ * @max_atomic_len: Hint, maximum time (in ns) that the Update Agent ca=
n execute
++ *                  continuously without yielding back to the Client st=
ate
++ */
++struct __packed fwu_commit_args {
++	u32 function_id;
++	u32 handle;
++#define FWU_IMG_ACCEPTED 0
++#define FWU_IMG_NOT_ACCEPTED 1
++	u32 acceptance_req;
++	u32 max_atomic_len;
++};
++
++/*
++ * struct fwu_commit_resp - fwu_commit ABI returns
++ * @status: The ABI return status
++ * @progress: Units of work already completed by the Update Agent
++ * @total_work: Units of work the Update Agent must perform until fwu_c=
ommit
++ *              returns successfully
++ */
++struct __packed fwu_commit_resp {
++	int status;
++	u32 progress;
++	u32 total_work;
++};
++
++/*
++ * FWU directory information structures
++ */
++
++struct __packed fwu_image_info_entry {
++	efi_guid_t image_guid;
++	u32 client_permissions;
++	u32 img_max_size;
++	u32 lowest_acceptable_version;
++	u32 img_version;
++	u32 accepted;
++	u32 reserved;
++};
++
++struct __packed fwu_image_directory {
++	u32 directory_version;
++	u32 img_info_offset;
++	u32 num_images;
++	u32 correct_boot;
++	u32 img_info_size;
++	u32 reserved;
++	struct fwu_image_info_entry entries[FWU_DIRECTORY_IMAGE_ENTRIES_COUNT]=
;
++};
++
+ /**
+  * fwu_agent_init() - Setup the FWU agent
+  *
+@@ -55,4 +242,23 @@
+  */
+ int fwu_agent_init(void);
+=20
++/**
++ * fwu_arm_psa_get_image_info() - Arm PSA implementation for GetImageIn=
fo()
++ *
++ * Initialize the update agent in secure world if not initialized.
++ * Then, read the FWU directory information including the current
++ * images information. For more details refer to fwu_image_directory st=
ructure.
++ *
++ * Return:
++ *
++ * EFI_SUCCESS is returned on success. Otherwise, failure
++ */
++efi_status_t fwu_arm_psa_get_image_info(efi_uintn_t *image_info_size,
++					struct efi_firmware_image_descriptor *image_info,
++					u32 *descriptor_version,
++					u8 *descriptor_count,
++					efi_uintn_t *descriptor_size,
++					u32 *package_version,
++					u16 **package_version_name);
++
+ #endif
+diff --git a/lib/fwu_updates/fwu_arm_psa.c b/lib/fwu_updates/fwu_arm_psa=
.c
+index 4a01c5ac672..b42d9f90e1e 100644
+--- a/lib/fwu_updates/fwu_arm_psa.c
++++ b/lib/fwu_updates/fwu_arm_psa.c
+@@ -9,7 +9,6 @@
+ #include <arm_ffa.h>
+ #include <dm.h>
+ #include <fwu_arm_psa.h>
+-#include <efi_loader.h>
+ #include <fwu.h>
+ #include <log.h>
+ #include <malloc.h>
+@@ -21,7 +20,481 @@ static u64 g_fwu_buf_handle;
+ static u16 g_fwu_sp_id;
+ static struct udevice *g_dev;
+ static u16 g_svc_interface_id;
++static u64 g_max_payload_size;
++static u8 g_fwu_version_major;
++static u8 g_fwu_version_minor;
+ static bool g_fwu_initialized;
++struct fwu_image_directory g_fwu_cached_directory;
++
++/* Error mapping declarations */
++
++int fwu_to_std_errmap[MAX_NUMBER_FWU_ERR] =3D {
++	[FWU_UNKNOWN] =3D -EOPNOTSUPP,
++	[FWU_OUT_OF_BOUNDS] =3D -ERANGE,
++	[FWU_AUTH_FAIL] =3D -EFAULT,
++	[FWU_BUSY] =3D -EBUSY,
++	[FWU_NO_PERMISSION] =3D -EPERM,
++	[FWU_DENIED] =3D -EACCES,
++	[FWU_RESUME] =3D -EAGAIN,
++	[FWU_NOT_AVAILABLE] =3D -ENAVAIL,
++};
++
++static struct fwu_abi_errmap err_msg_map[FWU_ERRMAP_COUNT] =3D {
++	[FWU_ID_TO_ERRMAP_ID(FWU_OPEN)] =3D {
++		{
++			[FWU_UNKNOWN] =3D
++			"FWU_UNKNOWN: Image type with GUID=3Dimage_type_guid does not exist"=
,
++			[FWU_DENIED] =3D
++			"FWU_DENIED: An image cannot be opened for writing outside of this S=
taging state",
++			[FWU_NOT_AVAILABLE] =3D
++			"FWU_NOT_AVAILABLE: The Update Agent does not support the op_type fo=
r this image",
++		},
++	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_READ_STREAM)] =3D {
++		{
++			[FWU_UNKNOWN] =3D
++			"FWU_UNKNOWN: Handle is not recognized",
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The image cannot be temporarily read from",
++			[FWU_NO_PERMISSION] =3D
++			"FWU_NO_PERMISSION: The image cannot be read from",
++		},
++	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_COMMIT)] =3D {
++		{
++			[FWU_UNKNOWN] =3D
++			"FWU_UNKNOWN: Handle is not recognized",
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The image can only be accepted after activation",
++			[FWU_AUTH_FAIL] =3D
++			"FWU_AUTH_FAIL: Image closed, authentication failed",
++			[FWU_RESUME] =3D
++			"FWU_RESUME: The Update Agent yielded",
++		},
++	},
++};
++
++/**
++ * fwu_to_std_errno() - convert FWU error code to standard error code
++ * @fwu_errno:	Error code returned by the FWU ABI
++ *
++ * Map the given FWU error code as specified
++ * by the spec to a U-Boot standard error code.
++ *
++ * Return:
++ *
++ * The standard error code on success. . Otherwise, failure
++ */
++static int fwu_to_std_errno(int fwu_errno)
++{
++	int err_idx =3D -fwu_errno;
++
++	/* Map the FWU error code to the standard u-boot error code */
++	if (err_idx > 0 && err_idx < MAX_NUMBER_FWU_ERR)
++		return fwu_to_std_errmap[err_idx];
++	return -EINVAL;
++}
++
++/**
++ * fwu_print_error_log() - print the error log corresponding to the sel=
ected FWU ABI
++ * @fwu_id:	FWU ABI ID
++ * @fwu_errno:	Error code returned by the FWU ABI
++ *
++ * Map the FWU error code to the error log relevant to the
++ * selected FWU ABI. Then the error log is printed.
++ *
++ * Return:
++ *
++ * 0 on success. . Otherwise, failure
++ */
++static int fwu_print_error_log(u32 fwu_id, int fwu_errno)
++{
++	int err_idx =3D -fwu_errno, abi_idx =3D 0;
++
++	/* Map the FWU error code to the corresponding error log */
++
++	if (err_idx <=3D 0 || err_idx >=3D MAX_NUMBER_FWU_ERR)
++		return -EINVAL;
++
++	if (fwu_id < FWU_FIRST_ID || fwu_id > FWU_LAST_ID)
++		return -EINVAL;
++
++	abi_idx =3D FWU_ID_TO_ERRMAP_ID(fwu_id);
++
++	if (!err_msg_map[abi_idx].err_str[err_idx])
++		return -EINVAL;
++
++	log_err("%s\n", err_msg_map[abi_idx].err_str[err_idx]);
++
++	return 0;
++}
++
++/**
++ * fwu_invoke_svc() - FWU service call request
++ * @svc_id: FWU ABI function ID
++ * @svc_name: FWU ABI function name
++ * @req_args_sz: Size in bytes of the arguments of the FWU ABI function
++ * @expect_resp_sz: Size in bytes of the response of the FWU ABI functi=
on
++ * @extra_resp_bytes: Size in bytes of the extra response data
++ *
++ * Invoke a FWU ABI by issuing a TS service call request.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int fwu_invoke_svc(u32 svc_id, const char *svc_name,
++			  u32 req_args_sz, u32 expect_resp_sz,
++			  u32 *extra_resp_bytes)
++{
++	struct ffa_send_direct_data msg;
++	int ret;
++	int *svc_status_in_buf =3D g_fwu_buf, svc_status_in_reg;
++	u32 expect_total_resp_sz;
++
++	log_debug("FWU: Invoking %s\n", svc_name);
++
++	if (!expect_resp_sz || !svc_name || !req_args_sz) {
++		log_err("%s: Invalid invoke arguments\n", svc_name);
++		return -EINVAL;
++	}
++
++	msg.data0 =3D PACK_SVC_IFACE_ID(svc_id, g_svc_interface_id);
++	msg.data1 =3D GET_FWU_BUF_LSW(g_fwu_buf_handle);
++	msg.data2 =3D GET_FWU_BUF_MSW(g_fwu_buf_handle);
++	msg.data3 =3D req_args_sz;
++	msg.data4 =3D 0;
++
++	ret =3D ffa_sync_send_receive(g_dev, g_fwu_sp_id, &msg, 0);
++	if (ret) {
++		log_err("%s: FF-A error %d\n", svc_name, ret);
++		return ret;
++	}
++
++	if (msg.data0 !=3D PACK_SVC_IFACE_ID(svc_id, g_svc_interface_id)) {
++		log_err("%s: Unexpected service/interface ID 0x%lx\n",
++			svc_name, msg.data0);
++		return -EINVAL;
++	}
++
++	if (msg.data1 !=3D RPC_SUCCESS) {
++		log_err("%s: TS RPC error 0x%lx\n", svc_name, msg.data1);
++		return -ECOMM;
++	}
++
++	svc_status_in_reg =3D (int)msg.data2;
++	if (*svc_status_in_buf !=3D svc_status_in_reg) {
++		log_err("%s: Status mismatch (reg %d , buf %d)\n",
++			svc_name, svc_status_in_reg, *svc_status_in_buf);
++		return -EINVAL;
++	}
++
++	if (svc_status_in_reg < 0) {
++		fwu_print_error_log(svc_id, svc_status_in_reg);
++		if (svc_status_in_reg !=3D -FWU_RESUME)
++			return fwu_to_std_errno(svc_status_in_reg);
++	}
++
++	if (!extra_resp_bytes)
++		expect_total_resp_sz =3D expect_resp_sz;
++	else
++		expect_total_resp_sz =3D expect_resp_sz + *extra_resp_bytes;
++
++	if (msg.data3 !=3D expect_total_resp_sz) {
++		log_err("%s: Unexpected response size (%ld , %d)\n",
++			svc_name, msg.data3, expect_total_resp_sz);
++		return -EINVAL;
++	}
++
++	if (svc_status_in_reg =3D=3D -FWU_RESUME)
++		return fwu_to_std_errno(svc_status_in_reg);
++
++	return 0;
++}
++
++/**
++ * fwu_discover() -  fwu_discover ABI
++ *
++ * This call indicates the version of the ABI alongside a list of the
++ * implemented functions (aka services).
++ * Only max_payload_size is saved for future use.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_discover(void)
++{
++	int ret;
++	struct fwu_discover_args *args =3D g_fwu_buf;
++	struct fwu_discover_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_DISCOVER";
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_DISCOVER;
++
++	/* Executing the FWU ABI through the FF-A bus */
++	ret =3D fwu_invoke_svc(args->function_id, svc_name, sizeof(*args),
++			     sizeof(int), NULL);
++	if (ret) {
++		log_debug("FWU_DISCOVER: error %d\n", ret);
++		return ret;
++	}
++
++	g_max_payload_size =3D resp->max_payload_size;
++	g_fwu_version_major =3D resp->version_major;
++	g_fwu_version_minor =3D resp->version_minor;
++
++	log_debug("FWU: max_payload_size %llu\n", g_max_payload_size);
++	log_info("FWU: ABI version %d.%d detected\n", g_fwu_version_major,
++		 g_fwu_version_minor);
++
++	return 0;
++}
++
++/**
++ * fwu_open() -  fwu_open ABI
++ * @guid: GUID of the image to be opened
++ * @op_type: The operation that the Client will perform on the image
++ * @handle: Staging context identifier
++ *
++ * Returns a handle to the image with a given GUID.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_open(const efi_guid_t *guid, u8  op_type,
++		    u32 *handle)
++{
++	int ret;
++	struct fwu_open_args *args =3D g_fwu_buf;
++	struct fwu_open_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_OPEN";
++
++	if (!guid || !handle)
++		return -EINVAL;
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_OPEN;
++
++	guidcpy(&args->image_type_guid, guid);
++	args->op_type =3D op_type;
++
++	/* Executing the FWU ABI through the FF-A bus */
++	ret =3D fwu_invoke_svc(args->function_id, svc_name,
++			     sizeof(*args), sizeof(*resp), NULL);
++	if (ret)
++		return ret;
++
++	*handle =3D resp->handle;
++
++	return 0;
++}
++
++/**
++ * fwu_read_stream() -  fwu_read_stream ABI
++ * @handle: The handle of the context being read from
++ * @buffer: The destination buffer where the data will be copied to
++ * @buffer_size: The size of the destination buffer
++ *
++ * The call reads at most g_max_payload_size bytes from the Update Agen=
t
++ *  context pointed to by handle.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_read_stream(u32 handle, u8 *buffer, u32 buffer_size)
++{
++	int ret;
++	u32 curr_read_offset =3D 0, new_read_offset, fwu_buf_bytes_left;
++	struct fwu_read_stream_args *args =3D g_fwu_buf;
++	struct fwu_read_stream_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_READ_STREAM";
++
++	if (!buffer || !buffer_size)
++		return -EINVAL;
++
++	do {
++		/* Filling the arguments in the shared buffer */
++		args->function_id =3D FWU_READ_STREAM;
++		args->handle =3D handle;
++
++		/* Executing the FWU ABI through the FF-A bus */
++		ret =3D fwu_invoke_svc(args->function_id, svc_name, sizeof(*args),
++				     sizeof(*resp), &resp->read_bytes);
++		if (ret)
++			return ret;
++
++		if (resp->read_bytes > g_max_payload_size) {
++			log_err("%s: Bytes read > max_payload_size (%d , %llu)\n",
++				svc_name, resp->read_bytes,
++				g_max_payload_size);
++			return -EINVAL;
++		}
++
++		fwu_buf_bytes_left =3D FWU_BUFFER_SIZE - sizeof(*resp);
++
++		if (resp->read_bytes > fwu_buf_bytes_left) {
++			log_err("%s: Bytes read > shared buffer (%d , %d)\n",
++				svc_name, resp->read_bytes, fwu_buf_bytes_left);
++			return -EINVAL;
++		}
++
++		if (resp->total_bytes > buffer_size) {
++			log_err("%s: Total bytes > dest buffer (%d , %d)\n",
++				svc_name, resp->total_bytes, buffer_size);
++			return -EINVAL;
++		}
++
++		new_read_offset =3D resp->read_bytes + curr_read_offset;
++
++		if (new_read_offset > buffer_size) {
++			log_err("%s: Bytes read > dest buffer (%d , %d)\n",
++				svc_name, new_read_offset, buffer_size);
++			return -EINVAL;
++		}
++
++		memcpy(buffer + curr_read_offset, resp->payload,
++		       resp->read_bytes);
++
++		curr_read_offset =3D new_read_offset;
++
++		if (curr_read_offset > resp->total_bytes) {
++			log_err("%s: Offset bypassed total bytes (%d , %d)\n",
++				svc_name, curr_read_offset, resp->total_bytes);
++			return -EINVAL;
++		}
++
++	} while (curr_read_offset !=3D resp->total_bytes);
++
++	return ret;
++}
++
++/**
++ * fwu_commit() -  fwu_commit ABI
++ * @handle: The handle of the context being closed
++ * @acceptance_req: Acceptance status set by the Client
++ * @max_atomic_len: Hint, maximum time (in ns) that the Update Agent ca=
n execute
++ *                  continuously without yielding back to the Client st=
ate
++ *
++ * The call closes the image pointed to by handle. The image can be any=
 entity
++ * opened with fwu_open().
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_commit(u32 handle, u32 acceptance_req, u32 max_atomic_le=
n)
++{
++	struct fwu_commit_args *args =3D g_fwu_buf;
++	struct fwu_commit_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_COMMIT";
++	int ret;
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_COMMIT;
++	args->handle =3D handle;
++	args->acceptance_req =3D acceptance_req;
++	args->max_atomic_len =3D max_atomic_len;
++
++	/* Executing the FWU ABI through the FF-A bus */
++	ret =3D fwu_invoke_svc(args->function_id, svc_name,
++			     sizeof(*args), sizeof(*resp), NULL);
++
++	while (resp->status =3D=3D -FWU_RESUME)
++		ret =3D fwu_invoke_svc(args->function_id, svc_name, sizeof(*args),
++				     sizeof(*resp), NULL);
++
++	if (ret)
++		return ret;
++
++	log_debug("%s:  Progress %d/%d\n", svc_name, resp->progress,
++		  resp->total_work);
++
++	return 0;
++}
++
++/**
++ * fwu_read_directory() - Read FWU directory information
++ *
++ * Read FWU directory information.
++ * For more details see fwu_image_directory structure.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int fwu_read_directory(void)
++{
++	int ret, close_ret;
++	u32 handle =3D 0;
++	efi_guid_t dir_guid =3D {0};
++	char *uuid_str =3D FWU_DIRECTORY_CANONICAL_UUID;
++
++	if (!uuid_str) {
++		log_err("FWU: No directory UUID provided\n");
++		return -EINVAL;
++	}
++
++	if (uuid_str_to_le_bin(uuid_str, dir_guid.b)) {
++		log_err("FWU: Invalid directory UUID\n");
++		return -EINVAL;
++	}
++
++	ret =3D fwu_open(&dir_guid, FWU_OP_TYPE_READ, &handle);
++	if (ret) {
++		log_err("FWU: Open image directory failed (err: %d)\n",
++			ret);
++		return ret;
++	}
++
++	log_debug("FWU: Image directory handle (0x%x)\n", handle);
++
++	ret =3D fwu_read_stream(handle, (u8 *)&g_fwu_cached_directory,
++			      sizeof(g_fwu_cached_directory));
++	if (ret) {
++		log_err("FWU: Read image directory failed (err: %d)\n",
++			ret);
++		goto close_handle;
++	}
++
++	log_debug("FWU: directory_version (%d)\n",
++		  g_fwu_cached_directory.directory_version);
++
++	/*
++	 * Note: The expected images in the directory are:
++	 * - The images to be updated
++	 * - The ESRT image (an image containing ESRT data)
++	 * The ESRT image is not involved in the FWU.
++	 * It should be removed from the count.
++	 */
++	g_fwu_cached_directory.num_images -=3D 1;
++
++	if (g_fwu_cached_directory.num_images !=3D
++	    CONFIG_FWU_NUM_IMAGES_PER_BANK) {
++		log_err("FWU: Unexpected image count (%d , %d)\n",
++			g_fwu_cached_directory.num_images,
++			CONFIG_FWU_NUM_IMAGES_PER_BANK);
++		ret =3D -EINVAL;
++		goto close_handle;
++	}
++
++	log_debug("FWU: images to be updated (%d)\n",
++		  g_fwu_cached_directory.num_images);
++	log_debug("FWU: img_info_size (%d)\n",
++		  g_fwu_cached_directory.img_info_size);
++
++close_handle:
++	/* The Update Agent can execute for an unbounded time */
++	close_ret =3D fwu_commit(handle, FWU_IMG_NOT_ACCEPTED, 0);
++	if (close_ret)
++		log_err("FWU: Close image directory handle failed (err: %d)\n",
++			close_ret);
++
++	return ret;
++}
+=20
+ /**
+  * fwu_discover_ts_sp_id() - Query the FWU partition ID
+@@ -265,7 +738,112 @@ int fwu_agent_init(void)
+ 	if (ret)
+ 		return ret;
+=20
++	ret =3D fwu_discover();
++	if (ret)
++		goto failure;
++
+ 	g_fwu_initialized =3D true;
+=20
+ 	return 0;
++
++failure:
++	fwu_shared_buf_reclaim();
++	return ret;
++}
++
++/**
++ * fwu_arm_psa_get_image_info() - Arm PSA implementation for GetImageIn=
fo()
++ *
++ * Initialize the update agent in secure world if not initialized.
++ * Then, read the FWU directory information including the current
++ * images information. For more details refer to fwu_image_directory st=
ructure.
++ *
++ * Return:
++ *
++ * EFI_SUCCESS is returned on success. Otherwise, failure
++ */
++efi_status_t fwu_arm_psa_get_image_info(efi_uintn_t *image_info_size,
++					struct efi_firmware_image_descriptor *image_info,
++					u32 *descriptor_version,
++					u8 *descriptor_count,
++					efi_uintn_t *descriptor_size,
++					u32 *package_version,
++					u16 **package_version_name)
++{
++	int ret;
++	int required_image_info_size;
++	size_t image_info_desc_size =3D sizeof(*image_info);
++
++	if (!g_fwu_initialized) {
++		ret =3D fwu_agent_init();
++		if (ret) {
++			log_err("FWU: Update agent init failed, ret =3D %d\n",
++				ret);
++			return EFI_EXIT(EFI_DEVICE_ERROR);
++		}
++	}
++
++	ret =3D fwu_read_directory();
++	if (ret)
++		return EFI_NOT_READY;
++
++	required_image_info_size =3D g_fwu_cached_directory.num_images *
++		image_info_desc_size;
++
++	if (*image_info_size < required_image_info_size) {
++		*image_info_size =3D required_image_info_size;
++		return EFI_BUFFER_TOO_SMALL;
++	}
++
++	*descriptor_version =3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
++	*descriptor_count =3D g_fwu_cached_directory.num_images;
++	*descriptor_size =3D image_info_desc_size;
++	*package_version =3D PACKAGE_VERSION_NOT_SUP; /* Not supported */
++	*package_version_name =3D NULL; /* Not supported */
++
++	for (int i =3D 0; i < g_fwu_cached_directory.num_images; i++) {
++		/* Only image indexes starting from 1 are supported */
++		image_info[i].image_index =3D i + 1;
++
++		/* Corresponding ESRT field: FwClass */
++		guidcpy(&image_info[i].image_type_id,
++			&g_fwu_cached_directory.entries[i].image_guid);
++
++		image_info[i].image_id =3D image_info[i].image_index;
++		image_info[i].image_id_name =3D NULL; /* Not supported */
++
++		/* Corresponding ESRT field: FwVersion */
++		image_info[i].version =3D
++			g_fwu_cached_directory.entries[i].img_version;
++
++		image_info[i].version_name =3D NULL; /* Not supported */
++		image_info[i].size =3D
++			g_fwu_cached_directory.entries[i].img_max_size;
++
++		image_info[i].attributes_supported =3D
++			IMAGE_ATTRIBUTE_IMAGE_UPDATABLE |
++			IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
++		image_info[i].attributes_setting =3D
++				IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
++
++		/* Check if the capsule authentication is enabled */
++		if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE))
++			image_info[i].attributes_setting |=3D
++				IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
++
++		/* Corresponding ESRT field: LowestSupportedFwVersion */
++		image_info[i].lowest_supported_image_version =3D
++			g_fwu_cached_directory.entries[i].lowest_acceptable_version;
++
++		/* Corresponding ESRT field: LastAttemptVersion (not supported) */
++		image_info[i].last_attempt_version =3D LAST_ATTEMPT_NOT_SUP;
++
++		/* Corresponding ESRT field: LastAttemptStatus (not supported) */
++		image_info[i].last_attempt_status =3D LAST_ATTEMPT_NOT_SUP;
++
++		image_info[i].hardware_instance =3D DEFAULT_HW_INSTANCE;
++		image_info[i].dependencies =3D NULL; /* Not supported */
++	}
++
++	return EFI_SUCCESS;
+ }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
deleted file mode 100644
index 8055d88c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2351cdc3787cd8b06579dcb1986fe80a57dd2d6e Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH] arm: corstone1000: fix unrecognized filesystem type
-
-Some usb sticks are not recognized by usb, just add a
-delay before checking status.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- common/usb_storage.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/common/usb_storage.c b/common/usb_storage.c
-index ac64275773..1d2680c3cd 100644
---- a/common/usb_storage.c
-+++ b/common/usb_storage.c
-@@ -785,6 +785,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *s=
rb, struct us_data *us)
- st:
- 	retry =3D 0;
- again:
-+	if (srb->cmd[0] =3D=3D SCSI_TST_U_RDY)
-+		mdelay(100);
-+
- 	debug("STATUS phase\n");
- 	result =3D usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
- 				&actlen, USB_CNTL_TIMEOUT*5);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu=
_arm_psa-Add-staging-ABIs.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/=
corstone1000/0012-fwu_arm_psa-Add-staging-ABIs.patch
new file mode 100644
index 00000000..f29e8cc9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu_arm_ps=
a-Add-staging-ABIs.patch
@@ -0,0 +1,722 @@
+From 04274ddd1e05d9aed6130633a4cf712e1e5aafbb Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 6 Feb 2025 11:37:33 +0000
+Subject: [PATCH 12/36] fwu_arm_psa: Add staging ABIs
+
+Implement the ABIs and logic for updating images
+
+The staging process defined by the Platform Security Firmware
+Update for the A-profile Arm Architecture specification [1] is
+executed through the staging ABIs.
+
+The capsule should contain at least 3 payloads (2 dummy payloads
+to indicate the start and the end of the staging process. In addition, o=
ne
+or multiple payloads to write in the storage device).
+
+The implemented ABIs are as follows:
+
+FWU_BEGIN_STAGING
+FWU_END_STAGING
+FWU_CANCEL_STAGING
+FWU_WRITE_STREAM
+
+[1]: DEN0118, 1.0 A: https://developer.arm.com/documentation/den0118/lat=
est/
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Davidson kumaresan <davidson.kumaresan@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ include/efi_api.h             |   3 +
+ include/efi_loader.h          |   5 +
+ include/fwu_arm_psa.h         | 130 ++++++++++++
+ lib/efi_loader/efi_capsule.c  |  24 ++-
+ lib/fwu_updates/fwu_arm_psa.c | 363 ++++++++++++++++++++++++++++++++++
+ 5 files changed, 523 insertions(+), 2 deletions(-)
+
+diff --git a/include/efi_api.h b/include/efi_api.h
+index eb61eafa028..1465b98310d 100644
+--- a/include/efi_api.h
++++ b/include/efi_api.h
+@@ -25,6 +25,9 @@
+  */
+ #define EFI_SPECIFICATION_VERSION (2 << 16 | 110)
+=20
++#define EFI_FIRMWARE_MANAGEMENT_CAPSULE_HEADER_VERSION 0x00000001
++#define EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER_VERSION 0x00000003
++
+ /* Types and defines for EFI CreateEvent */
+ enum efi_timer_delay {
+ 	EFI_TIMER_STOP =3D 0,
+diff --git a/include/efi_loader.h b/include/efi_loader.h
+index 1d75d97ebbc..1899639450c 100644
+--- a/include/efi_loader.h
++++ b/include/efi_loader.h
+@@ -385,6 +385,11 @@ extern const efi_guid_t smbios3_guid;
+ extern const efi_guid_t efi_guid_text_input_protocol;
+ extern const efi_guid_t efi_guid_text_output_protocol;
+=20
++/*The current processed capsule */
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++extern struct efi_capsule_header *g_capsule_data;
++#endif
++
+ /**
+  * struct efi_open_protocol_info_item - open protocol info item
+  *
+diff --git a/include/fwu_arm_psa.h b/include/fwu_arm_psa.h
+index ba294359b5e..a8f0ff93d51 100644
+--- a/include/fwu_arm_psa.h
++++ b/include/fwu_arm_psa.h
+@@ -40,6 +40,21 @@
+ /* The entries correspond to the payloads in the storage device and the=
 fake ESRT image */
+ #define FWU_DIRECTORY_IMAGE_ENTRIES_COUNT (CONFIG_FWU_NUM_IMAGES_PER_BA=
NK + 1)
+=20
++/*
++ * GUIDs for dummy payloads
++ *
++ * The GUIDs are generated with the UUIDv5 format.
++ * Namespace: 7b5c472e-5671-4fb7-a824-36a8e86f05c1
++ * Names: DUMMY_START, DUMMY_END
++ */
++#define FWU_DUMMY_START_IMAGE_GUID \
++	EFI_GUID(0x6f784cbf, 0x7938, 0x5c23, 0x8d, 0x6e, \
++		0x24, 0xd2, 0xf1, 0x41, 0x0f, 0xa9)
++
++#define FWU_DUMMY_END_IMAGE_GUID \
++	EFI_GUID(0xb57e432b, 0xa250, 0x5c73, 0x93, 0xe3, \
++		0x90, 0x20, 0x5e, 0x64, 0xba, 0xba)
++
+ #define TS_RPC_MEM_RETRIEVE		(0xff0001)
+ #define TS_RPC_SERVICE_INFO_GET		(0xff0003)
+ #define RPC_SUCCESS			(0)
+@@ -62,7 +77,11 @@
+=20
+ enum fwu_abis {
+ 	FWU_DISCOVER =3D 0,
++	FWU_BEGIN_STAGING =3D 16,
++	FWU_END_STAGING =3D 17,
++	FWU_CANCEL_STAGING =3D 18,
+ 	FWU_OPEN =3D 19,
++	FWU_WRITE_STREAM =3D 20,
+ 	FWU_READ_STREAM =3D 21,
+ 	FWU_COMMIT =3D 22,
+ 	/* To be updated when adding new FWU IDs */
+@@ -82,6 +101,14 @@ enum fwu_abi_errcode {
+ 	MAX_NUMBER_FWU_ERR
+ };
+=20
++/* Enum to classify the possible type of payloads */
++typedef enum {
++	FWU_PAYLOAD_TYPE_REAL =3D 1,
++	FWU_PAYLOAD_TYPE_DUMMY_START,
++	FWU_PAYLOAD_TYPE_DUMMY_END,
++	FWU_PAYLOAD_TYPE_INVALID,
++} fwu_payload_type;
++
+ /* Container structure and helper macros to map between an FF-A error a=
nd relevant error log */
+ struct fwu_abi_errmap {
+ 	char *err_str[MAX_NUMBER_FWU_ERR];
+@@ -173,6 +200,64 @@ struct __packed fwu_read_stream_resp {
+ 	u8  payload[];
+ };
+=20
++/*
++ * struct fwu_begin_staging_args - fwu_begin_staging ABI arguments
++ * @function_id: fwu_begin_staging service ID
++ * @reserved: Reserved, must be zero
++ * @vendor_flags: Vendor specific staging flags
++ * @partial_update_count: The number of elements in the update_guid
++array
++ * @update_guid: An array of image type GUIDs that the update Client wi=
ll update
++ *               during the Staging state
++ */
++struct __packed fwu_begin_staging_args {
++	u32 function_id;
++	u32 reserved;
++	u32 vendor_flags;
++	u32 partial_update_count;
++	efi_guid_t update_guid[];
++};
++
++/*
++ * struct fwu_begin_staging_resp - fwu_begin_staging ABI returns
++ * @status: The ABI return status
++ */
++struct __packed fwu_begin_staging_resp {
++	int status;
++};
++
++/*
++ * struct fwu_end_staging_args - fwu_end_staging ABI arguments
++ * @function_id: fwu_end_staging service ID state
++ */
++struct __packed fwu_end_staging_args {
++	u32 function_id;
++};
++
++/*
++ * struct fwu_end_staging_resp - fwu_end_staging ABI returns
++ * @status: The ABI return status
++ */
++struct __packed fwu_end_staging_resp {
++	int status;
++};
++
++/*
++ * struct fwu_cancel_staging_args - fwu_cancel_staging ABI arguments
++ * @function_id: fwu_cancel_staging service ID state
++ */
++struct __packed fwu_cancel_staging_args {
++	u32 function_id;
++};
++
++/*
++ * struct fwu_cancel_staging_resp - fwu_cancel_staging ABI returns
++ * @status: The ABI return status
++ */
++struct __packed fwu_cancel_staging_resp {
++	int status;
++};
++
+ /*
+  * struct fwu_commit_args - fwu_commit ABI arguments
+  * @function_id: fwu_commit service ID
+@@ -204,6 +289,28 @@ struct __packed fwu_commit_resp {
+ 	u32 total_work;
+ };
+=20
++/*
++ * struct fwu_write_stream_args - fwu_write_stream ABI arguments
++ * @function_id: fwu_write_stream service ID
++ * @handle: The handle of the context being written to
++ * @data_len: Size of the data present in the payload
++ * @payload: The data to be transferred
++ */
++struct __packed fwu_write_stream_args {
++	u32 function_id;
++	u32  handle;
++	u32 data_len;
++	u8 payload[];
++};
++
++/*
++ * struct fwu_write_stream_resp - fwu_write_stream ABI returns
++ * @status: The ABI return status
++ */
++struct __packed fwu_write_stream_resp {
++	int status;
++};
++
+ /*
+  * FWU directory information structures
+  */
+@@ -261,4 +368,27 @@ efi_status_t fwu_arm_psa_get_image_info(efi_uintn_t=
 *image_info_size,
+ 					u32 *package_version,
+ 					u16 **package_version_name);
+=20
++/**
++ * fwu_update_image() - Update an image
++ *
++ * Perform staging.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++int fwu_update_image(const void *image, u8 image_index, u32 image_size)=
;
++
++/**
++ * fwu_is_dummy_payload() - Identifies a dummy payload
++ * @image_index:	The payload index
++ *
++ * Check whether the payload is dummy or not.
++ *
++ * Return:
++ *
++ * An enum value reflecting whether the payload is dummy or not.
++ */
++fwu_payload_type fwu_get_payload_type(u32 image_index);
++
+ #endif
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index f8a4a7c6ef4..66efb24abf2 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -14,6 +14,11 @@
+ #include <fdtdec.h>
+ #include <fs.h>
+ #include <fwu.h>
++
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++#include <fwu_arm_psa.h>
++#endif
++
+ #include <hang.h>
+ #include <malloc.h>
+ #include <mapmem.h>
+@@ -38,6 +43,10 @@ const efi_guid_t fwu_guid_os_request_fw_revert =3D
+ const efi_guid_t fwu_guid_os_request_fw_accept =3D
+ 		FWU_OS_REQUEST_FW_ACCEPT_GUID;
+=20
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++	struct efi_capsule_header *g_capsule_data;
++#endif
++
+ #define FW_ACCEPT_OS	(u32)0x8000
+=20
+ #ifdef CONFIG_EFI_CAPSULE_ON_DISK
+@@ -194,6 +203,12 @@ efi_fmp_find(efi_guid_t *image_type, u8 image_index=
, u64 instance,
+ 			continue;
+ 		fmp =3D fmp_handler->protocol_interface;
+=20
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++		if (fwu_get_payload_type(image_index) !=3D
++			FWU_PAYLOAD_TYPE_REAL)
++			return fmp;
++#endif
++
+ 		/* get device's image info */
+ 		info_size =3D 0;
+ 		image_info =3D NULL;
+@@ -604,7 +619,7 @@ static efi_status_t efi_capsule_update_firmware(
+ 	capsule_size =3D capsule_data->capsule_image_size
+ 			- capsule_data->header_size;
+=20
+-	if (capsule->version !=3D 0x00000001)
++	if (capsule->version !=3D EFI_FIRMWARE_MANAGEMENT_CAPSULE_HEADER_VERSI=
ON)
+ 		return EFI_UNSUPPORTED;
+=20
+ 	handles =3D NULL;
+@@ -615,6 +630,10 @@ static efi_status_t efi_capsule_update_firmware(
+ 	if (ret !=3D EFI_SUCCESS)
+ 		return EFI_UNSUPPORTED;
+=20
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++	g_capsule_data =3D capsule_data;
++#endif
++
+ 	/* Payload */
+ 	for (item =3D capsule->embedded_driver_count;
+ 	     item < capsule->embedded_driver_count
+@@ -629,7 +648,8 @@ static efi_status_t efi_capsule_update_firmware(
+=20
+ 		image =3D (void *)capsule + capsule->item_offset_list[item];
+=20
+-		if (image->version !=3D 0x00000003) {
++		if (image->version !=3D
++			EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER_VERSION) {
+ 			ret =3D EFI_UNSUPPORTED;
+ 			goto out;
+ 		}
+diff --git a/lib/fwu_updates/fwu_arm_psa.c b/lib/fwu_updates/fwu_arm_psa=
.c
+index b42d9f90e1e..042bf7a0898 100644
+--- a/lib/fwu_updates/fwu_arm_psa.c
++++ b/lib/fwu_updates/fwu_arm_psa.c
+@@ -25,6 +25,7 @@ static u8 g_fwu_version_major;
+ static u8 g_fwu_version_minor;
+ static bool g_fwu_initialized;
+ struct fwu_image_directory g_fwu_cached_directory;
++efi_guid_t g_update_guid[CONFIG_FWU_NUM_IMAGES_PER_BANK];
+=20
+ /* Error mapping declarations */
+=20
+@@ -60,6 +61,18 @@ static struct fwu_abi_errmap err_msg_map[FWU_ERRMAP_C=
OUNT] =3D {
+ 			"FWU_NO_PERMISSION: The image cannot be read from",
+ 		},
+ 	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_WRITE_STREAM)] =3D {
++		{
++			[FWU_UNKNOWN] =3D
++			"FWU_UNKNOWN: Unrecognized handle",
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The system is not in a Staging state",
++			[FWU_NO_PERMISSION] =3D
++			"FWU_NO_PERMISSION: The image cannot be written to",
++			[FWU_OUT_OF_BOUNDS] =3D
++			"FWU_OUT_OF_BOUNDS: less than data_len bytes available in the image"=
,
++		},
++	},
+ 	[FWU_ID_TO_ERRMAP_ID(FWU_COMMIT)] =3D {
+ 		{
+ 			[FWU_UNKNOWN] =3D
+@@ -72,6 +85,34 @@ static struct fwu_abi_errmap err_msg_map[FWU_ERRMAP_C=
OUNT] =3D {
+ 			"FWU_RESUME: The Update Agent yielded",
+ 		},
+ 	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_BEGIN_STAGING)] =3D {
++		{
++			[FWU_UNKNOWN] =3D
++			"FWU_UNKNOWN: One of more GUIDs in the update_guid field are unknown=
 to the Update Agent",
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The Firmware Store is in the Trial state or the platfor=
m did not boot correctly",
++			[FWU_BUSY] =3D
++			"FWU_BUSY: The Client is temporarily prevented from entering the Sta=
ging state",
++		},
++	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_END_STAGING)] =3D {
++		{
++			[FWU_BUSY] =3D
++			"FWU_BUSY: There are open image handles",
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The system is not in a Staging state",
++			[FWU_AUTH_FAIL] =3D
++			"FWU_AUTH_FAIL: At least one of the updated images fails to authenti=
cate",
++			[FWU_NOT_AVAILABLE] =3D
++			"FWU_NOT_AVAILABLE: The Update Agent does not support partial update=
s",
++		},
++	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_CANCEL_STAGING)] =3D {
++		{
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The system is not in a Staging state",
++		},
++	},
+ };
+=20
+ /**
+@@ -129,6 +170,111 @@ static int fwu_print_error_log(u32 fwu_id, int fwu=
_errno)
+ 	return 0;
+ }
+=20
++/**
++ * fwu_get_payload_type() - Identifies the payload type
++ * @image_index:	The payload index
++ *
++ * Identifies the FWU payload type based on the image index.
++ *
++ * Return:
++ *
++ * FWU_PAYLOAD_TYPE_REAL for a real payload
++ * FWU_PAYLOAD_TYPE_DUMMY_START for the start of a dummy payload
++ * FWU_PAYLOAD_TYPE_DUMMY_END for the end of a dummy payload
++ * FWU_PAYLOAD_TYPE_INVALID for an invalid image_index
++ *
++ */
++fwu_payload_type fwu_get_payload_type(u32 image_index)
++{
++	efi_guid_t *image_guid =3D NULL;
++	int i;
++	struct efi_fw_image *fw_array;
++
++	fw_array =3D update_info.images;
++	for (i =3D 0; i < update_info.num_images; i++) {
++		if (fw_array[i].image_index =3D=3D image_index) {
++			image_guid =3D &fw_array[i].image_type_id;
++			break;
++		}
++	}
++
++	if (!image_guid)
++		return FWU_PAYLOAD_TYPE_INVALID;
++
++	if (!guidcmp(image_guid,
++		     &((efi_guid_t)FWU_DUMMY_START_IMAGE_GUID)))
++		return FWU_PAYLOAD_TYPE_DUMMY_START;
++
++	if (!guidcmp(image_guid,
++		     &((efi_guid_t)FWU_DUMMY_END_IMAGE_GUID)))
++		return FWU_PAYLOAD_TYPE_DUMMY_END;
++
++	return FWU_PAYLOAD_TYPE_REAL;
++}
++
++/**
++ * fwu_get_capsule_guids() - Detect the payloads GUIDs in the caspsule
++ * @partial_update_count:	A pointer to the number of payloads to update
++ * @update_guid:	A pointer to a GUIDs array for the payloads to update
++ *
++ * Parse the current capsule and detect the payloads GUIDs.
++ *
++ * Return:
++ *
++ * EFI_SUCCESS is returned on success. Otherwise, failure
++ */
++static efi_status_t fwu_get_capsule_guids(u32 *partial_update_count,
++					  efi_guid_t saved_guids[])
++{
++	struct efi_firmware_management_capsule_header *capsule;
++	struct efi_firmware_management_capsule_image_header *image;
++	int item;
++	size_t capsule_size;
++	efi_status_t ret =3D EFI_SUCCESS;
++
++	if (!saved_guids || !partial_update_count)
++		return EFI_INVALID_PARAMETER;
++
++	*partial_update_count =3D 0;
++	capsule =3D (void *)g_capsule_data + g_capsule_data->header_size;
++	capsule_size =3D g_capsule_data->capsule_image_size
++		- g_capsule_data->header_size;
++
++	/* Payload */
++	for (item =3D capsule->embedded_driver_count;
++	     item < capsule->embedded_driver_count
++		     + capsule->payload_item_count; item++) {
++		/* sanity check */
++		if ((capsule->item_offset_list[item] + sizeof(*image)
++				>=3D capsule_size)) {
++			ret =3D EFI_INVALID_PARAMETER;
++			log_err("FWU: Insufficient data, err (0x%lx)\n", ret);
++			break;
++		}
++
++		image =3D (void *)capsule + capsule->item_offset_list[item];
++
++		if (image->version !=3D
++			EFI_FIRMWARE_MANAGEMENT_CAPSULE_IMAGE_HEADER_VERSION) {
++			ret =3D EFI_UNSUPPORTED;
++			log_err("FWU: Version check failed, err (0x%lx)\n",
++				ret);
++			break;
++		}
++
++		if (fwu_get_payload_type(image->update_image_index) !=3D
++					 FWU_PAYLOAD_TYPE_REAL)
++			continue;
++
++		guidcpy(&saved_guids[*partial_update_count],
++			&image->update_image_type_id);
++
++		(*partial_update_count)++;
++	}
++
++	return ret;
++}
++
+ /**
+  * fwu_invoke_svc() - FWU service call request
+  * @svc_id: FWU ABI function ID
+@@ -372,6 +518,92 @@ static int fwu_read_stream(u32 handle, u8 *buffer, =
u32 buffer_size)
+ 	return ret;
+ }
+=20
++/**
++ * fwu_begin_staging() -  fwu_begin_staging ABI
++ *
++ * This call indicates to the Update Agent that a new staging process
++ *  will commence.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_begin_staging(void)
++{
++	struct fwu_begin_staging_args *args =3D g_fwu_buf;
++	struct fwu_begin_staging_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_BEGIN_STAGING";
++	efi_status_t ret;
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_BEGIN_STAGING;
++
++	args->reserved =3D 0;
++	args->vendor_flags =3D 0;
++
++	ret =3D fwu_get_capsule_guids(&args->partial_update_count,
++				    args->update_guid);
++	if (ret) {
++		log_err("FWU: Failure to get the payloads GUIDs\n");
++		return -ENODATA;
++	}
++
++	log_info("FWU: Updating %d payload(s)\n", args->partial_update_count);
++
++	/* Executing the FWU ABI through the FF-A bus */
++	return fwu_invoke_svc(args->function_id, svc_name,
++			      sizeof(*args), sizeof(*resp), NULL);
++}
++
++/**
++ * fwu_end_staging() -  fwu_end_staging ABI
++ *
++ * The Client informs the Update Agent that all the images, meant to be=
 updated,
++ * have been transferred to the Update Agent and that the staging has
++ * terminated.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_end_staging(void)
++{
++	struct fwu_end_staging_args *args =3D g_fwu_buf;
++	struct fwu_end_staging_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_END_STAGING";
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_END_STAGING;
++
++	/* Executing the FWU ABI through the FF-A bus */
++	return fwu_invoke_svc(args->function_id, svc_name,
++			      sizeof(*args), sizeof(*resp), NULL);
++}
++
++/**
++ * fwu_cancel_staging() -  fwu_cancel_staging ABI
++ *
++ * The Client cancels the staging procedure and the system transitions =
back to
++ *  the Regular state.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_cancel_staging(void)
++{
++	struct fwu_cancel_staging_args *args =3D g_fwu_buf;
++	struct fwu_cancel_staging_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_CANCEL_STAGING";
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_CANCEL_STAGING;
++
++	/* Executing the FWU ABI through the FF-A bus */
++	return fwu_invoke_svc(args->function_id, svc_name,
++			      sizeof(*args), sizeof(*resp), NULL);
++}
++
+ /**
+  * fwu_commit() -  fwu_commit ABI
+  * @handle: The handle of the context being closed
+@@ -416,6 +648,137 @@ static int fwu_commit(u32 handle, u32 acceptance_r=
eq, u32 max_atomic_len)
+ 	return 0;
+ }
+=20
++/**
++ * fwu_write_stream() -  fwu_write_stream ABI
++ * @handle: The handle of the context being writen to
++ * @payload: The data to be transferred
++ * @payload_size: Size of the data present in the payload
++ *
++ *  The call writes at most max_payload_size bytes to the Update Agent =
context
++ *  pointed to by handle.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_write_stream(u32 handle, const u8 *payload, u32 payload_=
size)
++{
++	int ret;
++	u32 write_size, max_write_size, curr_write_offset =3D 0;
++	u32 payload_bytes_left =3D payload_size, fwu_buf_bytes_left;
++	struct fwu_write_stream_args *args =3D g_fwu_buf;
++	struct fwu_write_stream_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_WRITE_STREAM";
++
++	if (!payload || !payload_size)
++		return -EINVAL;
++
++	fwu_buf_bytes_left =3D FWU_BUFFER_SIZE - sizeof(*args);
++
++	if (g_max_payload_size <=3D fwu_buf_bytes_left)
++		max_write_size =3D g_max_payload_size;
++	else
++		max_write_size =3D fwu_buf_bytes_left;
++
++	while (curr_write_offset < payload_size) {
++		if (payload_bytes_left <=3D max_write_size)
++			write_size =3D payload_bytes_left;
++		else
++			write_size =3D max_write_size;
++
++		/* Filling the arguments in the shared buffer */
++		args->function_id =3D FWU_WRITE_STREAM;
++		args->handle =3D handle;
++		args->data_len =3D write_size;
++		memcpy(args->payload, payload + curr_write_offset, write_size);
++
++		/* Executing the FWU ABI through the FF-A bus */
++		ret =3D fwu_invoke_svc(args->function_id, svc_name, sizeof(*args),
++				     sizeof(*resp), NULL);
++		if (ret)
++			return ret;
++
++		curr_write_offset +=3D write_size;
++		payload_bytes_left -=3D write_size;
++
++		log_debug("%s:  %d bytes written, remaining %d bytes\n",
++			  svc_name, write_size, payload_bytes_left);
++	}
++
++	return ret;
++}
++
++/**
++ * fwu_update_image() - Update an image
++ *
++ * Perform staging with multiple payloads support.
++ * The capsule is expected to:
++ *     - Start with a dummy payload to mark the start of the payloads s=
equence
++ *     - One or more payloads to be written to the storage device
++ *     - End with a dummy payload to mark the end of the payloads seque=
nce
++ *
++ * The possible payloads in the capsule are described in the board file
++ * through struct efi_fw_image. This includes the dummy payloads.
++ * The dummy payloads image indexes must be >=3D CONFIG_FWU_NUM_IMAGES_=
PER_BANK
++ * The dummy payloads are not sent to the Secure world and are not writ=
ten to
++ * the storage device.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++int fwu_update_image(const void *image, u8 image_index, u32 image_size)
++{
++	int ret;
++	u32 handle;
++
++	if (!image)
++		return -EINVAL;
++
++	/* Only image indexes starting from 1 are supported */
++	if (!image_index || image_index > update_info.num_images)
++		return -EINVAL;
++
++	if (fwu_get_payload_type(image_index) =3D=3D
++		FWU_PAYLOAD_TYPE_DUMMY_START) {
++		return fwu_begin_staging();
++	}
++
++	if (fwu_get_payload_type(image_index) =3D=3D
++		FWU_PAYLOAD_TYPE_DUMMY_END) {
++		ret =3D fwu_end_staging();
++		if (ret)
++			goto cancel_staging;
++		return 0;
++	}
++
++	ret =3D fwu_open(&g_fwu_cached_directory.entries[image_index - 1].imag=
e_guid,
++		       FWU_OP_TYPE_WRITE, &handle);
++	if (ret)
++		goto cancel_staging;
++
++	ret =3D fwu_write_stream(handle, image, image_size);
++	if (ret)
++		goto cancel_staging;
++
++	/*
++	 * The Update Agent can execute for an unbounded time.
++	 * The image should be tried before being accepted.
++	 * So, we put the acceptance request as 'not accepted'.
++	 */
++	ret =3D fwu_commit(handle, FWU_IMG_NOT_ACCEPTED, 0);
++	if (ret)
++		goto cancel_staging;
++
++	log_debug("FWU: Image at index %d updated\n", image_index);
++
++	return 0;
++
++cancel_staging:
++
++	return fwu_cancel_staging();
++}
++
+ /**
+  * fwu_read_directory() - Read FWU directory information
+  *
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
deleted file mode 100644
index fed13c6a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 42d0694494fdc549a989ca5a3924fdc82a4647c1 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH] efi_loader: corstone1000: remove guid check from corsto=
ne1000
- config option
-
-Use generic fmp guid and no separte check is required for
-CORSTONE1000 target.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- lib/efi_loader/efi_capsule.c | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index ea084e4ed2..5314f529b4 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -852,12 +852,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
- 			  i, &capsule->capsule_guid);
-=20
- #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
--		if (guidcmp(&corstone1000_capsule_guid, &capsule->capsule_guid)) {
--			ret =3D EFI_INVALID_PARAMETER;
--			log_err("Corstone1000: Invalid capsule GUID\n");
--			goto out;
--		}
--
- 		if (efi_size_in_pages(capsule->capsule_image_size) >
- 		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
- 			log_err("Corstone1000: Capsule data size exceeds the shared buffer s=
ize\n");
-@@ -883,15 +877,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
- 		goto out;
- #endif
-=20
--		if (!guidcmp(&capsule->capsule_guid,
--			     &efi_guid_firmware_management_capsule_id)) {
--			ret  =3D efi_capsule_update_firmware(capsule);
--		} else {
--			log_err("Unsupported capsule type: %pUs\n",
--				&capsule->capsule_guid);
--			ret =3D EFI_UNSUPPORTED;
--		}
--
-+		ret  =3D efi_capsule_update_firmware(capsule);
- 		if (ret !=3D EFI_SUCCESS)
- 			goto out;
- 	}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_loader-fwu_arm_psa-Add-set_image-and-get_image_i.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-fwu_arm_psa-Add-set_=
image-and-get_image_i.patch
new file mode 100644
index 00000000..bb05a5cf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-fwu_arm_psa-Add-set_image-and-get_image_i.patch
@@ -0,0 +1,111 @@
+From c4cf3e3a2869502c9ffadaa2121ab5cd05f3712f Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 18 Dec 2024 15:14:24 +0000
+Subject: [PATCH 13/36] efi_loader: fwu_arm_psa: Add set_image and
+ get_image_info support
+
+Implement set_image and get_image_info through RAW functions
+
+The implementation is done using efi_firmware_raw_set_image()
+and efi_firmware_get_image_info()
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Davidson kumaresan <davidson.kumaresan@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ lib/efi_loader/efi_firmware.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
+index 5a754c9cd03..de2357acbd7 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -4,6 +4,12 @@
+  *
+  *  Copyright (c) 2020 Linaro Limited
+  *			Author: AKASHI Takahiro
++ *
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ *   Davidson kumaresan <davidson.kumaresan@arm.com>
+  */
+=20
+ #define LOG_CATEGORY LOGC_EFI
+@@ -13,6 +19,7 @@
+ #include <efi_loader.h>
+ #include <efi_variable.h>
+ #include <fwu.h>
++#include <fwu_arm_psa.h>
+ #include <image.h>
+ #include <signatures.h>
+=20
+@@ -194,6 +201,7 @@ static void efi_firmware_get_lsv_from_dtb(u8 image_i=
ndex,
+ 	}
+ }
+=20
++#if !CONFIG_IS_ENABLED(FWU_ARM_PSA)
+ /**
+  * efi_firmware_fill_version_info - fill the version information
+  * @image_info:		Image information
+@@ -375,6 +383,7 @@ static efi_status_t efi_fill_image_desc_array(
+=20
+ 	return EFI_SUCCESS;
+ }
++#endif
+=20
+ /**
+  * efi_firmware_capsule_authenticate - authenticate the capsule if enab=
led
+@@ -605,10 +614,17 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
+ 	     !descriptor_size || !package_version || !package_version_name))
+ 		return EFI_EXIT(EFI_INVALID_PARAMETER);
+=20
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++	ret =3D fwu_arm_psa_get_image_info(image_info_size, image_info,
++					 descriptor_version, descriptor_count,
++					 descriptor_size,
++					 package_version, package_version_name);
++#else
+ 	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
+ 					descriptor_version, descriptor_count,
+ 					descriptor_size, package_version,
+ 					package_version_name);
++#endif
+=20
+ 	return EFI_EXIT(ret);
+ }
+@@ -713,8 +729,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+ 	efi_status_t (*progress)(efi_uintn_t completion),
+ 	u16 **abort_reason)
+ {
++#if !CONFIG_IS_ENABLED(FWU_ARM_PSA)
+ 	int ret;
+ 	u8 dfu_alt_num;
++#endif
+ 	efi_status_t status;
+ 	struct fmp_state state =3D { 0 };
+=20
+@@ -729,6 +747,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+ 	if (status !=3D EFI_SUCCESS)
+ 		return EFI_EXIT(status);
+=20
++#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
++	if (fwu_update_image(image, image_index, image_size))
++		return EFI_EXIT(EFI_DEVICE_ERROR);
++#else
+ 	/*
+ 	 * dfu_alt_num is assigned from 0 while image_index starts from 1.
+ 	 * dfu_alt_num is calculated by (image_index - 1) when multi bank upda=
te
+@@ -751,6 +773,8 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+ 			     NULL, NULL))
+ 		return EFI_EXIT(EFI_DEVICE_ERROR);
+=20
++#endif
++
+ 	efi_firmware_set_fmp_state_var(&state, image_index);
+=20
+ 	return EFI_EXIT(EFI_SUCCESS);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_loader-fwu_arm_psa-Keep-the-FMP-payload-header.patch b/meta-arm-bsp/reci=
pes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-fwu_arm_psa-Keep-the-F=
MP-payload-header.patch
new file mode 100644
index 00000000..1b7a8297
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-fwu_arm_psa-Keep-the-FMP-payload-header.patch
@@ -0,0 +1,34 @@
+From e2b35f2520ba80c55c96b70bcc2a927cb0d20c75 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 24 Jan 2025 15:13:39 +0000
+Subject: [PATCH 14/36] efi_loader: fwu_arm_psa: Keep the FMP payload hea=
der
+
+Allow sending the payload with its FMP header
+
+The Secure world needs the data provided by the payload
+FMP header. So, let's keep it in case of FWU_ARM_PSA.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ lib/efi_loader/efi_firmware.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
+index de2357acbd7..d1ec7b9427b 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -523,8 +523,10 @@ static void efi_firmware_get_fw_version(const void =
**p_image,
+ 		/* FMP header is inserted above the capsule payload */
+ 		state->fw_version =3D header->fw_version;
+=20
++#if !CONFIG_IS_ENABLED(FWU_ARM_PSA)
+ 		*p_image +=3D header->header_size;
+ 		*p_image_size -=3D header->header_size;
++#endif
+ 	}
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
deleted file mode 100644
index 31c19e14..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a368e6a94382bb88f3603107d14ff3af0fb4eaa2 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH] efi_loader: populate ESRT table if EFI_ESRT config opti=
on is
- set
-
-This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
-is set. This will populte esrt table with firmware image info
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- lib/efi_loader/efi_capsule.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 5314f529b4..6a06605ad9 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -874,6 +874,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
- 			ret =3D EFI_SUCCESS;
- 		}
-=20
-+		if (IS_ENABLED(CONFIG_EFI_ESRT)) {
-+			/* Rebuild the ESRT to reflect any updated FW images. */
-+			ret =3D efi_esrt_populate();
-+	               if (ret !=3D EFI_SUCCESS)
-+				log_warning("EFI Capsule: failed to update ESRT\n");
-+	       }
-+
- 		goto out;
- #endif
-=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0015-efi_firmware-add-get_image_info-for=
-corstone1000.patch
deleted file mode 100644
index c7ecfe89..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 972ed0e27cce6d2822055f31e336213043bcb1f3 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH] efi_firmware: add get_image_info for corstone1000
-
-This change is to populate get_image_info which eventually
-will be populated in ESRT table
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- lib/efi_loader/efi_firmware.c | 72 ++++++++++++++++++++++++++++++++++-
- 1 file changed, 71 insertions(+), 1 deletion(-)
-
-diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 93e2b01c07..0a38a96351 100644
---- a/lib/efi_loader/efi_firmware.c
-+++ b/lib/efi_loader/efi_firmware.c
-@@ -18,11 +18,69 @@
-=20
- #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
-=20
-+#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
-+#define EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID \
-+	EFI_GUID(0xe2bb9c06, 0x70e9, 0x4b14, 0x97, 0xa3, \
-+		 0x5a, 0x79, 0x13, 0x17, 0x6e, 0x3f)
-+
-+ const efi_guid_t efi_firmware_image_type_uboot_raw =3D
-+				EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
-+
-+static efi_status_t efi_corstone1000_img_info_get (
-+	efi_uintn_t *image_info_size,
-+	struct efi_firmware_image_descriptor *image_info,
-+	u32 *descriptor_version,
-+	u8 *descriptor_count,
-+	efi_uintn_t *descriptor_size,
-+	u32 *package_version,
-+	u16 **package_version_name,
-+	const efi_guid_t *image_type)
-+{
-+	int i =3D 0;
-+
-+	*image_info_size =3D sizeof(*image_info);
-+	*descriptor_version =3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
-+	*descriptor_count =3D 1;//dfu_num;
-+	*descriptor_size =3D sizeof(*image_info);
-+	if (package_version)
-+		*package_version =3D 0xffffffff; /* not supported */
-+	if(package_version_name)
-+		*package_version_name =3D NULL; /* not supported */
-+
-+	if(image_info =3D=3D NULL) {
-+		log_warning("image_info is null\n");
-+		return EFI_BUFFER_TOO_SMALL;
-+	}
-+
-+	image_info[i].image_index =3D i;
-+	image_info[i].image_type_id =3D *image_type;
-+	image_info[i].image_id =3D 0;
-+	image_info[i].image_id_name =3D "wic";
-+	image_info[i].version =3D 1;
-+	image_info[i].version_name =3D NULL;
-+	image_info[i].size =3D 0x1000;
-+	image_info[i].attributes_supported =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE=
 |
-+					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
-+	image_info[i].attributes_setting =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
-+	/* Check if the capsule authentication is enabled */
-+	if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE))
-+		image_info[0].attributes_setting |=3D
-+			IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
-+	image_info[i].lowest_supported_image_version =3D 0;
-+	image_info[i].last_attempt_version =3D 0;
-+	image_info[i].last_attempt_status =3D LAST_ATTEMPT_STATUS_SUCCESS;
-+	image_info[i].hardware_instance =3D 1;
-+	image_info[i].dependencies =3D NULL;
-+
-+	return EFI_SUCCESS;
-+}
-+#endif
-+
- /**
-  * struct fmp_payload_header - EDK2 header for the FMP payload
-  *
-  * This structure describes the header which is preprended to the
-- * FMP payload by the edk2 capsule generation scripts.
-+ * FMP payload by the edk1 capsule generation scripts.
-  *
-  * @signature:			Header signature used to identify the header
-  * @header_size:		Size of the structure
-@@ -286,10 +344,18 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
- 	     !descriptor_size || !package_version || !package_version_name))
- 		return EFI_EXIT(EFI_INVALID_PARAMETER);
-=20
-+#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
-+	ret =3D efi_corstone1000_img_info_get(image_info_size, image_info,
-+			       descriptor_version, descriptor_count,
-+			       descriptor_size,
-+			       package_version, package_version_name,
-+			       &efi_firmware_image_type_uboot_raw);
-+#else
- 	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
- 					descriptor_version, descriptor_count,
- 					descriptor_size, package_version,
- 					package_version_name);
-+#endif
-=20
- 	return EFI_EXIT(ret);
- }
-@@ -415,6 +481,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
- 		}
- 	}
-=20
-+#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
-+	return EFI_EXIT(EFI_SUCCESS);
-+#endif
-+
- 	if (dfu_write_by_alt(image_index - 1, (void *)image, image_size,
- 			     NULL, NULL))
- 		return EFI_EXIT(EFI_DEVICE_ERROR);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_loader-fwu_arm_psa-Skip-accepting-the-payload-af.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader-fwu_arm_psa-Skip-acc=
epting-the-payload-af.patch
new file mode 100644
index 00000000..ee7cab83
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-fwu_arm_psa-Skip-accepting-the-payload-af.patch
@@ -0,0 +1,46 @@
+From 5b6c64f927e21bd9b77754e16e1976cab63831ff Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 24 Jan 2025 15:26:57 +0000
+Subject: [PATCH 15/36] efi_loader: fwu_arm_psa: Skip accepting the paylo=
ad
+ after set_image()
+
+Do not update the acceptance metadata bit after updating an image
+
+The update agent (secure world) is responsible of setting the acceptance
+bit in the metadata.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ lib/efi_loader/efi_capsule.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index 66efb24abf2..9221cafb844 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -4,6 +4,11 @@
+  *
+  *  Copyright (c) 2018 Linaro Limited
+  *			Author: AKASHI Takahiro
++ *
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Author:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #define LOG_CATEGORY LOGC_EFI
+@@ -701,7 +706,8 @@ static efi_status_t efi_capsule_update_firmware(
+ 			goto out;
+ 		}
+=20
+-		if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE)) {
++		if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE) &&
++		    !IS_ENABLED(CONFIG_FWU_ARM_PSA)) {
+ 			image_type_id =3D &image->update_image_type_id;
+ 			if (!fw_accept_os) {
+ 				/*
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
deleted file mode 100644
index 694d8534..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 75ace03c24d92a206957a1a2392eab3c892cf960 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH] efi_loader: fix null pointer exception with get_image_i=
nfo
-
-get_img_info API implemented for corstone1000 target does not
-check the input attributes and as a result uboot crash's with
-null pointer access. This change is to fix the null pointer
-exception.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- lib/efi_loader/efi_firmware.c | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 0a38a96351..c883e2ff0a 100644
---- a/lib/efi_loader/efi_firmware.c
-+++ b/lib/efi_loader/efi_firmware.c
-@@ -39,26 +39,29 @@ static efi_status_t efi_corstone1000_img_info_get (
- 	int i =3D 0;
-=20
- 	*image_info_size =3D sizeof(*image_info);
--	*descriptor_version =3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
--	*descriptor_count =3D 1;//dfu_num;
--	*descriptor_size =3D sizeof(*image_info);
-+	if(descriptor_version)
-+	    *descriptor_version =3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
-+	if(descriptor_count)
-+	    *descriptor_count =3D 1;
-+	if(descriptor_size)
-+	    *descriptor_size =3D sizeof(*image_info);
- 	if (package_version)
- 		*package_version =3D 0xffffffff; /* not supported */
- 	if(package_version_name)
- 		*package_version_name =3D NULL; /* not supported */
-=20
- 	if(image_info =3D=3D NULL) {
--		log_warning("image_info is null\n");
-+		log_debug("image_info is null\n");
- 		return EFI_BUFFER_TOO_SMALL;
- 	}
-=20
--	image_info[i].image_index =3D i;
-+	image_info[i].image_index =3D 1;
- 	image_info[i].image_type_id =3D *image_type;
- 	image_info[i].image_id =3D 0;
--	image_info[i].image_id_name =3D "wic";
--	image_info[i].version =3D 1;
-+	image_info[i].image_id_name =3D L"wic image";
-+	image_info[i].version =3D 0;
- 	image_info[i].version_name =3D NULL;
--	image_info[i].size =3D 0x1000;
-+	image_info[i].size =3D 0;
- 	image_info[i].attributes_supported =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE=
 |
- 					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
- 	image_info[i].attributes_setting =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-fwu-fwu_arm_psa-Disable-trial-state-handl.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fwu-fwu_arm_psa-Disa=
ble-trial-state-handl.patch
new file mode 100644
index 00000000..26263f33
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fwu-fwu_arm_psa-Disable-trial-state-handl.patch
@@ -0,0 +1,71 @@
+From 9b381a19ec3437d4bdc3fd922084a39331f29a3d Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 20 Mar 2025 15:05:08 +0000
+Subject: [PATCH 16/36] efi_loader: fwu: fwu_arm_psa: Disable trial state
+ handling
+
+No need for trial state handling in U-Boot for FWU Arm PSA
+
+In FWU Arm PSA mode, trial state is handled by Secure world.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ lib/efi_loader/efi_capsule.c | 7 +++++--
+ lib/fwu_updates/fwu.c        | 8 +++++++-
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index 9221cafb844..e01f2a5f8a8 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -586,7 +586,9 @@ static efi_status_t efi_capsule_update_firmware(
+ 	if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE)) {
+ 		if (fwu_empty_capsule(capsule_data)) {
+ 			if (fwu_empty_capsule_checks_pass()) {
+-				return fwu_empty_capsule_process(capsule_data);
++				return !IS_ENABLED(CONFIG_FWU_ARM_PSA) ?
++					fwu_empty_capsule_process(capsule_data) :
++					0;
+ 			} else {
+ 				log_err("FWU empty capsule checks failed. Cannot start update\n");
+ 				return EFI_INVALID_PARAMETER;
+@@ -1399,7 +1401,8 @@ efi_status_t efi_launch_capsules(void)
+=20
+ 	efi_capsule_scan_done();
+=20
+-	if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE)) {
++	if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE) &&
++	    !IS_ENABLED(CONFIG_FWU_ARM_PSA)) {
+ 		if (capsule_update =3D=3D true && update_status =3D=3D true) {
+ 			ret =3D fwu_post_update_process(fw_accept_os);
+ 		} else if (capsule_update =3D=3D true && update_status =3D=3D false) =
{
+diff --git a/lib/fwu_updates/fwu.c b/lib/fwu_updates/fwu.c
+index 7f085a0211f..9e6511b4da0 100644
+--- a/lib/fwu_updates/fwu.c
++++ b/lib/fwu_updates/fwu.c
+@@ -340,6 +340,11 @@ int fwu_get_mdata(struct fwu_mdata *mdata)
+ 		if (parts_ok[i])
+ 			continue;
+=20
++		if (IS_ENABLED(CONFIG_FWU_ARM_PSA)) {
++			log_err("FWU metadata copy %d invalid\n", i);
++			return -ENOTSYNC;
++		}
++
+ 		memcpy(parts_mdata[i], parts_mdata[1 - i], mdata_size);
+ 		err =3D fwu_sync_mdata(parts_mdata[i], i ? SECONDARY_PART : PRIMARY_P=
ART);
+ 		if (err) {
+@@ -765,7 +770,8 @@ static int fwu_boottime_checks(void)
+=20
+ 	in_trial =3D in_trial_state();
+=20
+-	ret =3D in_trial ? fwu_trial_count_update() : trial_counter_update(NUL=
L);
++	ret =3D (in_trial && !IS_ENABLED(CONFIG_FWU_ARM_PSA)) ?
++	       fwu_trial_count_update() : trial_counter_update(NULL);
+=20
+ 	if (!ret)
+ 		boottime_check =3D 1;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0017-arm-corstone1000-add-mmc-for-fvp.patch
deleted file mode 100644
index 1326e7c9..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7dec0707573062aba859e4cd3be073c24b112efa Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Mon, 17 Jul 2023 16:50:53 +0100
-Subject: [PATCH] arm:corstone1000: add mmc for fvp
-
-Enable support mmc/sdcard for the corstone1000 FVP.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- board/armltd/corstone1000/corstone1000.c | 28 +++++++++++++++++++-----
- configs/corstone1000_defconfig           |  9 ++++++--
- include/configs/corstone1000.h           |  4 +++-
- 3 files changed, 32 insertions(+), 9 deletions(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index c840290885..ecfd8366df 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -39,19 +39,35 @@ static struct mm_region corstone1000_mem_map[] =3D {
- 	}, {
- 		/* USB */
- 		.virt =3D 0x40200000UL,
--		.phys =3D 0x40200000UL,
-+			.phys =3D 0x40200000UL,
-+			.size =3D 0x00100000UL,
-+			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				PTE_BLOCK_NON_SHARE |
-+				PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+		/* MMC0 */
-+		.virt =3D 0x40300000UL,
-+		.phys =3D 0x40300000UL,
- 		.size =3D 0x00100000UL,
- 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
--			PTE_BLOCK_NON_SHARE |
--			PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+				 PTE_BLOCK_NON_SHARE |
-+				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
- 	}, {
- 		/* ethernet */
- 		.virt =3D 0x40100000UL,
--		.phys =3D 0x40100000UL,
-+			.phys =3D 0x40100000UL,
-+			.size =3D 0x00100000UL,
-+			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				PTE_BLOCK_NON_SHARE |
-+				PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+		/* MMC1 */
-+		.virt =3D 0x50000000UL,
-+		.phys =3D 0x50000000UL,
- 		.size =3D 0x00100000UL,
- 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
--			PTE_BLOCK_NON_SHARE |
--			PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+				 PTE_BLOCK_NON_SHARE |
-+				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
- 	}, {
- 		/* OCVM */
- 		.virt =3D 0x80000000UL,
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 40ba415ecb..76158fc37d 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -40,8 +40,13 @@ CONFIG_VERSION_VARIABLE=3Dy
- CONFIG_NET_RANDOM_ETHADDR=3Dy
- CONFIG_REGMAP=3Dy
- CONFIG_MISC=3Dy
--# CONFIG_MMC is not set
--CONFIG_NVMXIP_QSPI=3Dy
-+CONFIG_CLK=3Dy
-+CONFIG_CMD_MMC=3Dy
-+CONFIG_DM_MMC=3Dy
-+CONFIG_ARM_PL180_MMCI=3Dy
-+CONFIG_MMC_SDHCI_ADMA_HELPERS=3Dy
-+CONFIG_MMC_WRITE=3Dy
-+CONFIG_DM_GPIO=3Dy
- CONFIG_PHYLIB=3Dy
- CONFIG_PHY_SMSC=3Dy
- CONFIG_SMC911X=3Dy
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 8927b09499..1466507f80 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -49,7 +49,9 @@
- #define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
-=20
- #define BOOT_TARGET_DEVICES(func) \
--	func(USB, usb, 0)
-+	func(USB, usb, 0) \
-+	func(MMC, mmc, 0) \
-+	func(MMC, mmc, 1)
-=20
- #include <config_distro_bootcmd.h>
-=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu=
_arm_psa-Add-FWU-acceptance-mechanism.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0017-fwu_arm_psa-Add-FWU-acceptance-mechanism.pa=
tch
new file mode 100644
index 00000000..9fdcd1a6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu_arm_ps=
a-Add-FWU-acceptance-mechanism.patch
@@ -0,0 +1,310 @@
+From c7df14add690e18645fdfea2c7e8ee5f2b8239c1 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 20 Mar 2025 15:09:27 +0000
+Subject: [PATCH 17/36] fwu_arm_psa: Add FWU acceptance mechanism
+
+Accept the FWU at ExitBootServices()
+
+Provide the FWU_ACCEPT_IMAGE ABI and setup an event triggered
+on ExitBootServices().
+This mechanism notifies Secure world that the system booted
+successfully by accepting the images in trial state.
+
+Also, add FWU_ARM_PSA_ACCEPT_IMAGES config
+to allow platforms to switch off image acceptance
+in ExitBootServices().
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ include/fwu_arm_psa.h         |  22 +++-
+ lib/fwu_updates/Kconfig       |   8 ++
+ lib/fwu_updates/fwu_arm_psa.c | 183 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 212 insertions(+), 1 deletion(-)
+
+diff --git a/include/fwu_arm_psa.h b/include/fwu_arm_psa.h
+index a8f0ff93d51..451d8b614e3 100644
+--- a/include/fwu_arm_psa.h
++++ b/include/fwu_arm_psa.h
+@@ -84,9 +84,10 @@ enum fwu_abis {
+ 	FWU_WRITE_STREAM =3D 20,
+ 	FWU_READ_STREAM =3D 21,
+ 	FWU_COMMIT =3D 22,
++	FWU_ACCEPT_IMAGE =3D 23,
+ 	/* To be updated when adding new FWU IDs */
+ 	FWU_FIRST_ID =3D FWU_DISCOVER, /* Lowest number ID */
+-	FWU_LAST_ID =3D FWU_COMMIT, /* Highest number ID */
++	FWU_LAST_ID =3D FWU_ACCEPT_IMAGE, /* Highest number ID */
+ };
+=20
+ enum fwu_abi_errcode {
+@@ -311,6 +312,25 @@ struct __packed fwu_write_stream_resp {
+ 	int status;
+ };
+=20
++/*
++ * struct fwu_accept_image_args - fwu_accept_image ABI arguments
++ * @function_id: fwu_accept_image service ID
++ * @image_type_guid: GUID of the image to be accepted
++ */
++struct __packed fwu_accept_image_args {
++	u32 function_id;
++	u32 reserved;
++	efi_guid_t image_type_guid;
++};
++
++/*
++ * struct fwu_accept_image_resp - fwu_accept_image ABI returns
++ * @status: The ABI return status
++ */
++struct __packed fwu_accept_image_resp {
++	int status;
++};
++
+ /*
+  * FWU directory information structures
+  */
+diff --git a/lib/fwu_updates/Kconfig b/lib/fwu_updates/Kconfig
+index cdc96109f0a..958e54dec37 100644
+--- a/lib/fwu_updates/Kconfig
++++ b/lib/fwu_updates/Kconfig
+@@ -57,6 +57,14 @@ config FWU_ARM_PSA
+ 	  driver that supports the Arm PSA firmware update specification as
+ 	  mentioned in https://developer.arm.com/documentation/den0118/a/
+=20
++config FWU_ARM_PSA_ACCEPT_IMAGES
++	bool "Accept images at EFI ExitBootServices() level"
++	depends on FWU_ARM_PSA
++	default y
++	help
++	  Select this option if reaching ExitBootServices() level means the bo=
ot succeeded
++	  This option will add a callback at ExitBootServices() that accepts a=
ll the images.
++
+ config FWU_BUFFER_PAGES
+ 	int "Number of 4KB pages in the FWU shared buffer"
+ 	depends on FWU_ARM_PSA
+diff --git a/lib/fwu_updates/fwu_arm_psa.c b/lib/fwu_updates/fwu_arm_psa=
.c
+index 042bf7a0898..40746eee6ce 100644
+--- a/lib/fwu_updates/fwu_arm_psa.c
++++ b/lib/fwu_updates/fwu_arm_psa.c
+@@ -8,6 +8,7 @@
+  */
+ #include <arm_ffa.h>
+ #include <dm.h>
++#include <fwu.h>
+ #include <fwu_arm_psa.h>
+ #include <fwu.h>
+ #include <log.h>
+@@ -113,6 +114,14 @@ static struct fwu_abi_errmap err_msg_map[FWU_ERRMAP=
_COUNT] =3D {
+ 			"FWU_DENIED: The system is not in a Staging state",
+ 		},
+ 	},
++	[FWU_ID_TO_ERRMAP_ID(FWU_ACCEPT_IMAGE)] =3D {
++		{
++			[FWU_UNKNOWN] =3D
++			"FWU_UNKNOWN: Image with type=3Dimage_type_guid is not managed by th=
e Update Agent",
++			[FWU_DENIED] =3D
++			"FWU_DENIED: The system has not booted with the active bank, or the =
image cannot be accepted before being activated",
++		},
++	},
+ };
+=20
+ /**
+@@ -708,6 +717,36 @@ static int fwu_write_stream(u32 handle, const u8 *p=
ayload, u32 payload_size)
+ 	return ret;
+ }
+=20
++/**
++ * fwu_accept() -  fwu_accept_image ABI
++ * @guid: GUID of the image to be accepted
++ *
++ * Sets the status of the firmware image, with a given GUID
++ * to "accepted" in the active firmware bank.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int fwu_accept(const efi_guid_t *guid)
++{
++	struct fwu_accept_image_args *args =3D g_fwu_buf;
++	struct fwu_accept_image_resp *resp =3D g_fwu_buf;
++	char *svc_name =3D "FWU_ACCEPT_IMAGE";
++
++	if (!guid)
++		return -EINVAL;
++
++	/* Filling the arguments in the shared buffer */
++	args->function_id =3D FWU_ACCEPT_IMAGE;
++
++	guidcpy(&args->image_type_guid, guid);
++
++	/* Executing the FWU ABI through the FF-A bus */
++	return fwu_invoke_svc(args->function_id, svc_name,
++			     sizeof(*args), sizeof(*resp), NULL);
++}
++
+ /**
+  * fwu_update_image() - Update an image
+  *
+@@ -1051,6 +1090,144 @@ failure:
+ 	return ret;
+ }
+=20
++/**
++ * fwu_one_image_accepted() - Accept one image in trial state
++ * @img_entry: Pointer to the image entry.
++ * @active_idx: Active bank index.
++ * @image_number: Image number for logging purposes.
++ *
++ * Invoke FWU accept image ABI to accept the image.
++ *
++ * Return:
++ *
++ * true is returned on success, false on failure.
++ */
++static bool fwu_one_image_accepted(const struct fwu_image_entry *img_en=
try,
++				   u32 active_idx,
++				   u32 image_number)
++{
++	const struct fwu_image_bank_info *bank_info =3D
++		&img_entry->img_bank_info[active_idx];
++	int fwu_ret;
++
++	if (!bank_info->accepted) {
++		fwu_ret =3D fwu_accept(&bank_info->image_guid);
++		if (fwu_ret) {
++			log_err("FWU: Failed to accept image #%d\n",
++				image_number + 1);
++			return false;
++		}
++		log_debug("FWU: Image #%d accepted\n", image_number + 1);
++	}
++
++	return true;
++}
++
++/**
++ * fwu_all_images_accepted() - Accept any pending firmware update image=
s
++ * @fwu_data: Pointer to FWU data structure
++ *
++ * Read from the metadata the acceptance state of each image.
++ * Then, accept the images which are not accepted yet.
++ *
++ * Return:
++ *
++ * true is returned on success, false on failure.
++ */
++static bool fwu_all_images_accepted(const struct fwu_data *fwu_data)
++{
++	int fwu_ret;
++	u32 active_idx;
++	u32 i;
++	bool accepted;
++
++	fwu_ret =3D fwu_get_active_index(&active_idx);
++	if (fwu_ret) {
++		log_err("FWU: Failed to read boot index, err (%d)\n",
++			fwu_ret);
++		return false;
++	}
++
++	for (i =3D 0 ; i < CONFIG_FWU_NUM_IMAGES_PER_BANK ; i++) {
++		accepted =3D fwu_one_image_accepted(&fwu_data->fwu_images[i], active_=
idx, i);
++		if (!accepted)
++			return false;
++	}
++
++	return true;
++}
++
++/**
++ * fwu_accept_notify_exit_boot_services() - ExitBootServices callback
++ *
++ * @event:	callback event
++ * @context:	callback context
++ *
++ * Reaching ExitBootServices() level means the boot succeeded.
++ * So, accept all the images.
++ *
++ * Return:
++ *
++ * EFI_SUCCESS on success. Otherwise, failure
++ */
++static void EFIAPI fwu_accept_notify_exit_boot_services(struct efi_even=
t *event,
++							void *context)
++{
++	efi_status_t efi_ret =3D EFI_SUCCESS;
++	bool all_accepted;
++	struct fwu_data *fwu_data;
++
++	EFI_ENTRY("%p, %p", event, context);
++
++	fwu_data =3D fwu_get_data();
++	if (!fwu_data) {
++		log_err("FWU: Cannot get FWU data\n");
++		efi_ret =3D EFI_INVALID_PARAMETER;
++		goto out;
++	}
++
++	if (fwu_data->trial_state) {
++		all_accepted =3D fwu_all_images_accepted(fwu_data);
++		if (!all_accepted) {
++			efi_ret =3D EFI_ACCESS_DENIED;
++			goto out;
++		}
++
++	} else {
++		log_info("FWU: ExitBootServices: Booting in regular state\n");
++	}
++
++out:
++	EFI_EXIT(efi_ret);
++}
++
++/**
++ * fwu_setup_accept_event() - Setup the FWU accept event
++ *
++ * Create a FWU accept event triggered on ExitBootServices().
++ *
++ * Return:
++ *
++ * 0 is returned on success. Otherwise, failure
++ */
++static int fwu_setup_accept_event(void)
++{
++	efi_status_t efi_ret;
++	struct efi_event *evt =3D NULL;
++
++	efi_ret =3D efi_create_event(EVT_SIGNAL_EXIT_BOOT_SERVICES, TPL_CALLBA=
CK,
++				   fwu_accept_notify_exit_boot_services, NULL,
++				   &efi_guid_event_group_exit_boot_services,
++				   &evt);
++	if (efi_ret !=3D EFI_SUCCESS) {
++		log_err("FWU: Cannot install accept event %p, err (%lu)\n", evt,
++			efi_ret);
++		return -EPERM;
++	}
++
++	return 0;
++}
++
+ /**
+  * fwu_agent_init() - Setup the FWU agent
+  *
+@@ -1105,6 +1282,12 @@ int fwu_agent_init(void)
+ 	if (ret)
+ 		goto failure;
+=20
++	if (IS_ENABLED(CONFIG_FWU_ARM_PSA_ACCEPT_IMAGES)) {
++		ret =3D fwu_setup_accept_event();
++		if (ret)
++			goto failure;
++	}
++
+ 	g_fwu_initialized =3D true;
+=20
+ 	return 0;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0018-corstone1000-add-compressed-kernel-suppor=
t.patch
deleted file mode 100644
index af87a4a5..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corstone10=
00-add-compressed-kernel-support.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 67f9f4dbb58a9213232523a433cd6d7c50eeadc7 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 30 Nov 2022 18:59:59 +0000
-Subject: [PATCH] corstone1000: add compressed kernel support
-
-The corstone1000 kernel has become too large to fit in the available
-storage.  Swtiching to a compressed kernel avoids the problem, but
-requires uncompressing it.  Add this decompression to the default boot
-instructions.
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- configs/corstone1000_defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 76158fc37d..a92668389a 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
- CONFIG_BOOTDELAY=3D3
- CONFIG_USE_BOOTARGS=3Dy
- CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
--CONFIG_BOOTCOMMAND=3D"run retrieve_kernel_load_addr; echo Loading kerne=
l from $kernel_addr to memory ... ; loadm $kernel_addr $kernel_addr_r 0xc=
00000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $=
fdtcontroladdr;"
-+CONFIG_BOOTCOMMAND=3D"run retrieve_kernel_load_addr; echo Loading kerne=
l from $kernel_addr to memory ... ; unzip $kernel_addr 0x90000000; loadm =
0x90000000 $kernel_addr_r 0xf00000; usb start; usb reset; run distro_boot=
cmd; bootefi $kernel_addr_r $fdtcontroladdr;"
- CONFIG_CONSOLE_RECORD=3Dy
- CONFIG_LOGLEVEL=3D7
- # CONFIG_DISPLAY_CPUINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-fwu=
_arm_psa-Add-ESRT-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/=
corstone1000/0018-fwu_arm_psa-Add-ESRT-support.patch
new file mode 100644
index 00000000..40af11ee
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-fwu_arm_ps=
a-Add-ESRT-support.patch
@@ -0,0 +1,219 @@
+From f248f22667df72143938bd2175f0ac49b98d1c3c Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 13 Feb 2025 17:31:48 +0000
+Subject: [PATCH 18/36] fwu_arm_psa: Add ESRT support
+
+Read ESRT data from Secure world in GetImageInfo()
+
+Use FWU_READ_STREAM ABI to read ESRT data from Secure world.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ include/fwu_arm_psa.h         |  13 ++++
+ lib/fwu_updates/fwu_arm_psa.c | 116 +++++++++++++++++++++++++++++++---
+ 2 files changed, 119 insertions(+), 10 deletions(-)
+
+diff --git a/include/fwu_arm_psa.h b/include/fwu_arm_psa.h
+index 451d8b614e3..e29c0b2c05d 100644
+--- a/include/fwu_arm_psa.h
++++ b/include/fwu_arm_psa.h
+@@ -16,6 +16,9 @@
+=20
+ #define DEFAULT_HW_INSTANCE		(1)
+=20
++/* The minimum supported ESRT version */
++#define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION		(1)
++
+ /* Default values of the ESRT fields which are not supported at this st=
age */
+ #define PACKAGE_VERSION_NOT_SUP		(0xffffffff)
+ #define LAST_ATTEMPT_NOT_SUP		(0)
+@@ -355,6 +358,16 @@ struct __packed fwu_image_directory {
+ 	struct fwu_image_info_entry entries[FWU_DIRECTORY_IMAGE_ENTRIES_COUNT]=
;
+ };
+=20
++/*
++ * struct fwu_esrt_data_wrapper - Wrapper for the ESRT data
++ * @data: The ESRT data read from secure world
++ * @entries: The ESRT entries
++ */
++struct __packed fwu_esrt_data_wrapper {
++	struct efi_system_resource_table  data;
++	struct efi_system_resource_entry entries[CONFIG_FWU_NUM_IMAGES_PER_BAN=
K];
++};
++
+ /**
+  * fwu_agent_init() - Setup the FWU agent
+  *
+diff --git a/lib/fwu_updates/fwu_arm_psa.c b/lib/fwu_updates/fwu_arm_psa=
.c
+index 40746eee6ce..7297e724569 100644
+--- a/lib/fwu_updates/fwu_arm_psa.c
++++ b/lib/fwu_updates/fwu_arm_psa.c
+@@ -27,6 +27,7 @@ static u8 g_fwu_version_minor;
+ static bool g_fwu_initialized;
+ struct fwu_image_directory g_fwu_cached_directory;
+ efi_guid_t g_update_guid[CONFIG_FWU_NUM_IMAGES_PER_BANK];
++struct fwu_esrt_data_wrapper g_esrt_data;
+=20
+ /* Error mapping declarations */
+=20
+@@ -898,6 +899,100 @@ close_handle:
+ 	return ret;
+ }
+=20
++/**
++ * fwu_esrt_sanity_check() - Verify ESRT data
++ *
++ * Make sure the ESRT data matches the directory data.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int fwu_esrt_sanity_check(void)
++{
++	int i;
++
++	log_debug("FWU: ESRT data check ...\n");
++
++	if (g_esrt_data.data.fw_resource_count !=3D
++	    CONFIG_FWU_NUM_IMAGES_PER_BANK) {
++		log_err("FWU: Unexpected ESRT entries count (%d , %d)\n",
++			g_esrt_data.data.fw_resource_count,
++			CONFIG_FWU_NUM_IMAGES_PER_BANK);
++		return -EINVAL;
++	}
++
++	if (g_esrt_data.data.fw_resource_version <
++		EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION) {
++		log_err("FWU: Secure world ESRT version %llu not supported\n",
++			g_esrt_data.data.fw_resource_version);
++		return -EINVAL;
++	}
++
++	for (i =3D 0; i < g_fwu_cached_directory.num_images; i++) {
++		if (guidcmp(&g_fwu_cached_directory.entries[i].image_guid,
++			    &g_esrt_data.data.entries[i].fw_class)) {
++			log_err("FWU: GUID mismatch for image %d\n", i + 1);
++			return -EINVAL;
++		}
++	}
++
++	log_debug("FWU: ESRT data check passed\n");
++
++	return 0;
++}
++
++/**
++ * fwu_read_esrt() - Read the ESRT data
++ *
++ * Read the ESRT data from the Secure world.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int fwu_read_esrt(void)
++{
++	int ret, close_ret;
++	u32 handle =3D 0;
++	efi_guid_t esrt_guid =3D EFI_SYSTEM_RESOURCE_TABLE_GUID;
++	u32 esrt_data_size;
++
++	ret =3D fwu_open(&esrt_guid, FWU_OP_TYPE_READ, &handle);
++	if (ret) {
++		log_err("FWU: Open ESRT image failed (err: %d)\n",
++			ret);
++		return ret;
++	}
++
++	log_debug("FWU: ESRT image handle (0x%x)\n", handle);
++
++	esrt_data_size =3D sizeof(g_esrt_data);
++
++	ret =3D fwu_read_stream(handle, (u8 *)&g_esrt_data, esrt_data_size);
++	if (ret) {
++		log_err("FWU: Read ESRT image failed (err: %d)\n",
++			ret);
++		goto close_handle;
++	}
++
++	ret =3D fwu_esrt_sanity_check();
++	if (ret)
++		goto close_handle;
++
++	log_debug("FWU: ESRT version supported by Secure world (%llu)\n",
++		  g_esrt_data.data.fw_resource_version);
++
++close_handle:
++	/* The Update Agent can execute for an unbounded time */
++	close_ret =3D fwu_commit(handle, FWU_IMG_NOT_ACCEPTED, 0);
++	if (close_ret)
++		log_err("FWU: Close ESRT image handle failed (err: %d)\n",
++			close_ret);
++
++	return ret;
++}
++
+ /**
+  * fwu_discover_ts_sp_id() - Query the FWU partition ID
+  *
+@@ -1192,7 +1287,6 @@ static void EFIAPI fwu_accept_notify_exit_boot_ser=
vices(struct efi_event *event,
+ 			efi_ret =3D EFI_ACCESS_DENIED;
+ 			goto out;
+ 		}
+-
+ 	} else {
+ 		log_info("FWU: ExitBootServices: Booting in regular state\n");
+ 	}
+@@ -1333,6 +1427,10 @@ efi_status_t fwu_arm_psa_get_image_info(efi_uintn=
_t *image_info_size,
+ 	if (ret)
+ 		return EFI_NOT_READY;
+=20
++	ret =3D fwu_read_esrt();
++	if (ret)
++		return EFI_NOT_READY;
++
+ 	required_image_info_size =3D g_fwu_cached_directory.num_images *
+ 		image_info_desc_size;
+=20
+@@ -1352,15 +1450,13 @@ efi_status_t fwu_arm_psa_get_image_info(efi_uint=
n_t *image_info_size,
+ 		image_info[i].image_index =3D i + 1;
+=20
+ 		/* Corresponding ESRT field: FwClass */
+-		guidcpy(&image_info[i].image_type_id,
+-			&g_fwu_cached_directory.entries[i].image_guid);
++		guidcpy(&image_info[i].image_type_id, &g_esrt_data.entries[i].fw_clas=
s);
+=20
+ 		image_info[i].image_id =3D image_info[i].image_index;
+ 		image_info[i].image_id_name =3D NULL; /* Not supported */
+=20
+ 		/* Corresponding ESRT field: FwVersion */
+-		image_info[i].version =3D
+-			g_fwu_cached_directory.entries[i].img_version;
++		image_info[i].version =3D g_esrt_data.entries[i].fw_version;
+=20
+ 		image_info[i].version_name =3D NULL; /* Not supported */
+ 		image_info[i].size =3D
+@@ -1379,13 +1475,13 @@ efi_status_t fwu_arm_psa_get_image_info(efi_uint=
n_t *image_info_size,
+=20
+ 		/* Corresponding ESRT field: LowestSupportedFwVersion */
+ 		image_info[i].lowest_supported_image_version =3D
+-			g_fwu_cached_directory.entries[i].lowest_acceptable_version;
++			g_esrt_data.entries[i].lowest_supported_fw_version;
+=20
+-		/* Corresponding ESRT field: LastAttemptVersion (not supported) */
+-		image_info[i].last_attempt_version =3D LAST_ATTEMPT_NOT_SUP;
++		/* Corresponding ESRT field: LastAttemptVersion */
++		image_info[i].last_attempt_version =3D g_esrt_data.entries[i].last_at=
tempt_version;
+=20
+-		/* Corresponding ESRT field: LastAttemptStatus (not supported) */
+-		image_info[i].last_attempt_status =3D LAST_ATTEMPT_NOT_SUP;
++		/* Corresponding ESRT field: LastAttemptStatus */
++		image_info[i].last_attempt_status =3D g_esrt_data.entries[i].last_att=
empt_status;
+=20
+ 		image_info[i].hardware_instance =3D DEFAULT_HW_INSTANCE;
+ 		image_info[i].dependencies =3D NULL; /* Not supported */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0019-arm-corstone1000-esrt-support.patch
deleted file mode 100644
index 0781e374..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-corsto=
ne1000-esrt-support.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-From 47479f96cb3b3646d298c39216b2c960940476bd Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Wed, 30 Nov 2022 19:11:43 +0000
-Subject: [PATCH] arm/corstone1000: esrt support
-
-The implementation is platform specific and would require
-change in future.
-
-The patch should not be upstreamed as it is to the u-boot.
-Redesign of FMP protocol for ESRT and Capsule Update interface
-is to be considered in the future.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Upstream-Status: Inappropriate [Redesign of FMP protocol for ESRT and Ca=
psule update interface is required]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- include/efi_api.h             |   2 +-
- lib/efi_loader/efi_firmware.c | 133 ++++++++++++++++++++++++++++++++++
- lib/efi_loader/efi_setup.c    |  17 +++--
- 3 files changed, 143 insertions(+), 9 deletions(-)
-
-diff --git a/include/efi_api.h b/include/efi_api.h
-index 55a4c989fc..f267ab5110 100644
---- a/include/efi_api.h
-+++ b/include/efi_api.h
-@@ -2086,7 +2086,7 @@ struct efi_firmware_image_descriptor {
- 	u32 last_attempt_status;
- 	u64 hardware_instance;
- 	efi_firmware_image_dep_t *dependencies;
--};
-+} __packed;
-=20
- struct efi_firmware_management_protocol {
- 	efi_status_t (EFIAPI *get_image_info)(
-diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index c883e2ff0a..c6ab6e2182 100644
---- a/lib/efi_loader/efi_firmware.c
-+++ b/lib/efi_loader/efi_firmware.c
-@@ -15,6 +15,7 @@
- #include <signatures.h>
-=20
- #include <linux/list.h>
-+#include <efi_variable.h>
-=20
- #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
-=20
-@@ -417,8 +418,140 @@ efi_status_t EFIAPI efi_firmware_fit_set_image(
- 	return EFI_EXIT(EFI_SUCCESS);
- }
-=20
-+#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
-+
-+/**
-+ * efi_firmware_corstone1000_get_image_info - return information about =
the current
-+                                    firmware image
-+ * @this:                      Protocol instance
-+ * @image_info_size:           Size of @image_info
-+ * @image_info:                        Image information
-+ * @descriptor_version:                Pointer to version number
-+ * @descriptor_count:          Pointer to number of descriptors
-+ * @descriptor_size:           Pointer to descriptor size
-+ * package_version:            Package version
-+ * package_version_name:       Package version's name
-+ *
-+ * Return information bout the current firmware image in @image_info.
-+ * @image_info will consist of a number of descriptors.
-+ * Each descriptor will be created based on efi fetched variable.
-+ *
-+ * Return              status code
-+ */
-+static
-+efi_status_t EFIAPI efi_firmware_corstone1000_get_image_info(
-+       struct efi_firmware_management_protocol *this,
-+       efi_uintn_t *image_info_size,
-+       struct efi_firmware_image_descriptor *image_info,
-+       u32 *descriptor_version,
-+       u8 *descriptor_count,
-+       efi_uintn_t *descriptor_size,
-+       u32 *package_version,
-+       u16 **package_version_name)
-+{
-+	efi_uintn_t var_size;
-+	efi_status_t ret =3D EFI_SUCCESS;
-+	efi_uintn_t image_info_size_var =3D 0;
-+	efi_uintn_t image_info_name_size_var;
-+	efi_uintn_t image_info_version_size_var;
-+	u8 *runner =3D (u8 *)image_info;
-+	u16 fmp_image_name[14] =3D {'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'N=
', 'a', 'm', 'e', '1', '\0'};
-+	u16 fmp_version_name[16] =3D {'F', 'm', 'p', 'V', 'e', 'r', 's', 'i', =
'o', 'n', 'N', 'a', 'm', 'e', '1', '\0'};
-+
-+	EFI_ENTRY("%p %p %p %p %p %p %p %p\n", this,
-+	          image_info_size, image_info,
-+	          descriptor_version, descriptor_count, descriptor_size,
-+	          package_version, package_version_name);
-+
-+	if (!image_info_size)
-+	        return EFI_EXIT(EFI_INVALID_PARAMETER);
-+
-+	if (*image_info_size &&
-+	    (!image_info || !descriptor_version || !descriptor_count ||
-+	     !descriptor_size || !package_version || !package_version_name))
-+	        return EFI_EXIT(EFI_INVALID_PARAMETER);
-+
-+	var_size =3D sizeof(*descriptor_version);
-+	ret =3D efi_get_variable(u"FmpDescriptorVersion",
-+	                           &efi_guid_firmware_management_protocol, NUL=
L,
-+	                           &var_size, descriptor_version);
-+	if (ret !=3D EFI_SUCCESS)
-+	        return EFI_EXIT(ret);
-+
-+	if (*descriptor_version !=3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION)
-+	        return EFI_EXIT(EFI_UNSUPPORTED);
-+
-+	var_size =3D sizeof(image_info_size_var);
-+	ret =3D efi_get_variable(u"FmpImageInfoSize",
-+	                           &efi_guid_firmware_management_protocol, NUL=
L,
-+	                           &var_size, &image_info_size_var);
-+	if (ret !=3D EFI_SUCCESS)
-+	        return EFI_EXIT(ret);
-+
-+	if (*image_info_size < image_info_size_var) {
-+	        *image_info_size =3D image_info_size_var;
-+	        return EFI_EXIT(EFI_BUFFER_TOO_SMALL);
-+	}
-+
-+	image_info_name_size_var =3D image_info_size_var;
-+
-+	var_size =3D sizeof(*descriptor_count);
-+	ret =3D efi_get_variable(u"FmpDescriptorCount",
-+	                           &efi_guid_firmware_management_protocol, NUL=
L,
-+	                           &var_size, descriptor_count);
-+	if (ret !=3D EFI_SUCCESS) {
-+	        return EFI_EXIT(ret);
-+	}
-+
-+	ret =3D efi_get_variable(u"FmpImageInfo",
-+	                           &efi_guid_firmware_management_protocol, NUL=
L,
-+	                           &image_info_size_var, image_info);
-+	if (ret !=3D EFI_SUCCESS)
-+	        return EFI_EXIT(ret);
-+
-+	runner +=3D image_info_size_var;
-+
-+	image_info_name_size_var -=3D image_info_size_var;
-+	image_info_version_size_var =3D image_info_name_size_var;
-+
-+        /* Consider changing the string modfication logic */
-+	fmp_image_name[12] =3D '0' + (u16)image_info->image_id;
-+	ret =3D efi_get_variable(fmp_image_name,
-+	                      &efi_guid_firmware_management_protocol, NULL,
-+	                      &image_info_name_size_var, runner);
-+	if (ret !=3D EFI_SUCCESS)
-+	       return EFI_EXIT(ret);
-+
-+	image_info_version_size_var -=3D image_info_name_size_var;
-+	image_info->image_id_name =3D (u16*)runner;
-+	runner +=3D image_info_name_size_var;
-+
-+        /* Consider changing the string modfication logic */
-+	fmp_version_name[14] =3D '0' + (u16)image_info->image_id;
-+	ret =3D efi_get_variable(fmp_version_name,
-+	                       &efi_guid_firmware_management_protocol, NULL,
-+	                       &image_info_version_size_var, runner);
-+	if (ret !=3D EFI_SUCCESS)
-+	        return EFI_EXIT(ret);
-+
-+	image_info->version_name =3D (u16*)runner;
-+
-+	*image_info_size =3D image_info_size_var;
-+
-+	*package_version =3D 0xffffffff; /* not supported */
-+	*package_version_name =3D NULL; /* not supported */
-+
-+	return EFI_EXIT(ret);
-+}
-+
-+#endif
-+
- const struct efi_firmware_management_protocol efi_fmp_fit =3D {
-+#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
-+	.get_image_info =3D efi_firmware_corstone1000_get_image_info,
-+#else
- 	.get_image_info =3D efi_firmware_get_image_info,
-+#endif
- 	.get_image =3D efi_firmware_get_image_unsupported,
- 	.set_image =3D efi_firmware_fit_set_image,
- 	.check_image =3D efi_firmware_check_image_unsupported,
-diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index bf90a98b5a..d20568c1c8 100644
---- a/lib/efi_loader/efi_setup.c
-+++ b/lib/efi_loader/efi_setup.c
-@@ -178,14 +178,6 @@ static efi_status_t efi_init_capsule(void)
- 	efi_status_t ret =3D EFI_SUCCESS;
-=20
- #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
--	int ffa_ret;
--
--	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
--	if (ffa_ret)
--		log_err("Failure to notify SE Proxy FW update service\n");
--	else
--		debug("SE Proxy FW update service notified\n");
--
- 	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
- 	if (ret !=3D EFI_SUCCESS) {
- 		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
-@@ -304,6 +296,15 @@ efi_status_t efi_init_obj_list(void)
- 	if (ret !=3D EFI_SUCCESS)
- 		goto out;
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+		int ffa_ret;
-+		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
-+		if (ffa_ret)
-+			log_err("Failure to notify SE Proxy FW update service\n");
-+		else
-+			debug("SE Proxy FW update service notified\n");
-+#endif
-+
- 	/* Initialize variable services */
- 	ret =3D efi_init_variables();
- 	if (ret !=3D EFI_SUCCESS)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-fwu=
_arm_psa-Add-ExitBootService-notification-handler.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0019-fwu_arm_psa-Add-ExitBootService=
-notification-handler.patch
new file mode 100644
index 00000000..dda06828
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-fwu_arm_ps=
a-Add-ExitBootService-notification-handler.patch
@@ -0,0 +1,54 @@
+From bf2211397fc79bcc29cf58389392042f2d0101c4 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 10 Mar 2025 16:33:06 +0000
+Subject: [PATCH 19/36] fwu_arm_psa: Add ExitBootService() notification h=
andler
+
+Provide a weak function that can be overridden
+
+Some boards need to perform custom actions on ExitBootService()
+related to FWU. This function can be overridden by the board.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ lib/fwu_updates/fwu_arm_psa.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/fwu_updates/fwu_arm_psa.c b/lib/fwu_updates/fwu_arm_psa=
.c
+index 7297e724569..6a829c631b0 100644
+--- a/lib/fwu_updates/fwu_arm_psa.c
++++ b/lib/fwu_updates/fwu_arm_psa.c
+@@ -1252,6 +1252,21 @@ static bool fwu_all_images_accepted(const struct =
fwu_data *fwu_data)
+ 	return true;
+ }
+=20
++/**
++ * fwu_notify_exit_boot_services() - FWU notification handler
++ *
++ * Some boards need to perform custom actions on ExitBootService()
++ * related to FWU. This function can be overridden by the board.
++ *
++ * Return:
++ *
++ * EFI_SUCCESS on success. Otherwise, failure
++ */
++efi_status_t __weak fwu_notify_exit_boot_services(void)
++{
++	return EFI_SUCCESS;
++}
++
+ /**
+  * fwu_accept_notify_exit_boot_services() - ExitBootServices callback
+  *
+@@ -1292,6 +1307,8 @@ static void EFIAPI fwu_accept_notify_exit_boot_ser=
vices(struct efi_event *event,
+ 	}
+=20
+ out:
++	fwu_notify_exit_boot_services();
++
+ 	EFI_EXIT(efi_ret);
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0020-corstone1000-enable-distro-booting-comman=
d.patch
deleted file mode 100644
index 8ee8343a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-corstone10=
00-enable-distro-booting-command.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c95dbed049801401ac98afc8ef53e917b69f9a62 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH] corstone1000: enable distro booting command
-
-enable distro_bootcmd
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- include/configs/corstone1000.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 1466507f80..8622565a87 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -55,5 +55,6 @@
-=20
- #include <config_distro_bootcmd.h>
-=20
-+#define CFG_EXTRA_ENV_SETTINGS BOOTENV
-=20
- #endif
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi=
_loader-capsule-Add-runtime-capsule-flags-checks.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-capsule-Add-runtime-c=
apsule-flags-checks.patch
new file mode 100644
index 00000000..951607a9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader=
-capsule-Add-runtime-capsule-flags-checks.patch
@@ -0,0 +1,67 @@
+From 898008bd55b0de115f62254be8fbc8a5d43894ba Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Fri, 21 Mar 2025 15:34:44 +0000
+Subject: [PATCH 20/36] efi_loader: capsule: Add runtime capsule flags ch=
ecks
+
+Add missing checks according to the UEFI specification [1]
+
+checks added for these capsule flags:
+
+CAPSULE_FLAGS_PERSIST_ACROSS_RESET
+CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE
+CAPSULE_FLAGS_INITIATE_RESET
+
+[1]: Table 8.8 Flag Firmware Behavior,
+        https://uefi.org/specs/UEFI/2.10/08_Services_Runtime_Services.ht=
ml
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ lib/efi_loader/efi_capsule.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index e01f2a5f8a8..aeb05a00a0f 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -791,6 +791,36 @@ efi_status_t EFIAPI efi_update_capsule(
+ 			continue;
+ 		}
+=20
++		/*
++		 * ScatterGatherList must point to a list when the
++		 * CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag is set.
++		 */
++		if ((capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET) &&
++		    !scatter_gather_list) {
++			ret =3D EFI_INVALID_PARAMETER;
++			goto out;
++		}
++
++		/*
++		 * The CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag must be set
++		 * along with the CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE flag.
++		 */
++		if ((capsule->flags & CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE) &&
++		    !(capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET)) {
++			ret =3D EFI_INVALID_PARAMETER;
++			goto out;
++		}
++
++		/*
++		 * The CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag must be set
++		 * along with the CAPSULE_FLAGS_INITIATE_RESET flag.
++		 */
++		if ((capsule->flags & CAPSULE_FLAGS_INITIATE_RESET) &&
++		    !(capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET)) {
++			ret =3D EFI_INVALID_PARAMETER;
++			goto out;
++		}
++
+ 		log_debug("Capsule[%d] (guid:%pUs)\n",
+ 			  i, &capsule->capsule_guid);
+ 		ret  =3D efi_capsule_update_firmware(capsule);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cor=
stone1000-add-fwu-metadata-store-info.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0021-corstone1000-add-fwu-metadata-store-info.pa=
tch
deleted file mode 100644
index c58f7b57..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-fwu-metadata-store-info.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c250b6b896facee9ef42f88f5c76f055dbcfc708 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 15:58:07 +0000
-Subject: [PATCH] corstone1000: add fwu-metadata store info
-
-Add fwu-mdata node and handle for the reference
-nvmxip-qspi.
-
-Upstream-Status: Submitted
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/dts/corstone1000.dtsi | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 533dfdf8e1..1e0ec075e4 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -38,7 +38,7 @@
- 		reg =3D <0x88200000 0x77e00000>;
- 	};
-=20
--	nvmxip-qspi@08000000 {
-+	nvmxip: nvmxip-qspi@08000000 {
- 		compatible =3D "nvmxip,qspi";
- 		reg =3D <0x08000000 0x2000000>;
- 		lba_shift =3D <9>;
-@@ -106,6 +106,11 @@
- 		method =3D "smc";
- 	};
-=20
-+	fwu-mdata {
-+		compatible =3D "u-boot,fwu-mdata-gpt";
-+		fwu-mdata-store =3D <&nvmxip>;
-+	};
-+
- 	soc {
- 		compatible =3D "simple-bus";
- 		#address-cells =3D <1>;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu=
_arm_psa-corstone1000-Enable-FWU-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0021-fwu_arm_psa-corstone1000-Enable-FWU-supp=
ort.patch
new file mode 100644
index 00000000..14424124
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu_arm_ps=
a-corstone1000-Enable-FWU-support.patch
@@ -0,0 +1,228 @@
+From 7aa05114f04ec5792d7948153baf0633f5ca8bcb Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 20 Mar 2025 14:41:41 +0000
+Subject: [PATCH 21/36] fwu_arm_psa: corstone1000: Enable FWU support
+
+Provide the update_info structure and FWU configs for Corstone-1000
+
+update_info defines the image to be used for FWU.
+The FWU configs enabled are the FWU Arm PSA configs.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ board/armltd/corstone1000/corstone1000.c | 138 ++++++++++++++++++++++-
+ configs/corstone1000_defconfig           |  10 +-
+ 2 files changed, 146 insertions(+), 2 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 3ad77f51949..d2176b9174d 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * (C) Copyright 2022 ARM Limited
++ * (C) Copyright 2022, 2025 Arm Limited
+  * (C) Copyright 2022 Linaro
+  * Rui Miguel Silva <rui.silva@linaro.org>
+  */
+@@ -8,8 +8,11 @@
+ #include <blk.h>
+ #include <cpu_func.h>
+ #include <dm.h>
++#include <generated/dt.h>
+ #include <env.h>
++#include <efi_loader.h>
+ #include <fwu.h>
++#include <fwu_arm_psa.h>
+ #include <netdev.h>
+ #include <nvmxip.h>
+ #include <part.h>
+@@ -21,6 +24,133 @@
+ #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
+ #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
+=20
++#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
++
++/* The total number of upgradable images including the start and end du=
mmy payloads */
++#define CAPSULE_PAYLOADS_MAX_COUNT (CONFIG_FWU_NUM_IMAGES_PER_BANK + 2)
++
++/*
++ * GUIDs for capsule updatable firmware images
++ *
++ * The GUIDs are generating with the UUIDv5 format.
++ * Namespace used for FVP GUIDs: 989f3a4e-46e0-4cd0-9877-a25c70c01329
++ * Namespace used for MPS3 GUIDs: df1865d1-90fb-4d59-9c38-c9f2c1bba8cc
++ * Names: the image names stated in the fw_name field
++ */
++
++#define FWU_FVP_BL2_IMAGE_GUID \
++	EFI_GUID(0xf1d883f9, 0xdfeb, 0x5363, 0x98, 0xd8,	\
++		0x68, 0x6e, 0xe3, 0xb6, 0x9f, 0x4f)
++
++#define FWU_MPS3_BL2_IMAGE_GUID \
++	EFI_GUID(0xfbfbefaa, 0x0a56, 0x50d5, 0xb6, 0x51,	\
++		0x74, 0x09, 0x1d, 0x3d, 0x62, 0xcf)
++
++#define FWU_FVP_TFM_S_IMAGE_GUID \
++	EFI_GUID(0x7fad470e, 0x5ec5, 0x5c03, 0xa2, 0xc1,	\
++		0x47, 0x56, 0xb4, 0x95, 0xde, 0x61)
++
++#define FWU_MPS3_TFM_S_IMAGE_GUID \
++	EFI_GUID(0xaf4cc7ad, 0xee2e, 0x5a39, 0xaa, 0xd5,	\
++		0xfa, 0xc8, 0xa1, 0xe6, 0x17, 0x3c)
++
++#define FWU_FVP_FIP_IMAGE_GUID \
++	EFI_GUID(0xf1933675, 0x5a8c, 0x5b6d, 0x9e, 0xf4,	\
++		0x84, 0x67, 0x39, 0xe8, 0x9b, 0xc8)
++
++#define FWU_MPS3_FIP_IMAGE_GUID \
++	EFI_GUID(0x55302f96, 0xc4f0, 0x5cf9, 0x86, 0x24,	\
++		0xe7, 0xcc, 0x38, 0x8f, 0x2b, 0x68)
++
++#define FWU_FVP_INITRAMFS_IMAGE_GUID \
++	EFI_GUID(0xf771aff9, 0xc7e9, 0x5f99, 0x9e, 0xda,	\
++		0x23, 0x69, 0xdd, 0x69, 0x4f, 0x61)
++
++#define FWU_MPS3_INITRAMFS_IMAGE_GUID \
++	EFI_GUID(0x3e8ac972, 0xc33c, 0x5cc9, 0x90, 0xa0,	\
++		0xcd, 0xd3, 0x15, 0x96, 0x83, 0xea)
++
++enum fw_image_index {
++	FW_IMAGE_INDEX_BL2 =3D 1,
++	FW_IMAGE_INDEX_TFM_S,
++	FW_IMAGE_INDEX_FIP,
++	FW_IMAGE_INDEX_INITRAMFS,
++	FW_IMAGE_INDEX_DUMMY_START,
++	FW_IMAGE_INDEX_DUMMY_END
++};
++
++struct efi_fw_image fw_mps3_images[] =3D {
++	{
++		.image_type_id =3D FWU_MPS3_BL2_IMAGE_GUID,
++		.fw_name =3D u"BL2",
++		.image_index =3D FW_IMAGE_INDEX_BL2,
++	},
++	{
++		.image_type_id =3D FWU_MPS3_TFM_S_IMAGE_GUID,
++		.fw_name =3D u"TFM_S",
++		.image_index =3D FW_IMAGE_INDEX_TFM_S,
++	},
++	{
++		.image_type_id =3D FWU_MPS3_FIP_IMAGE_GUID,
++		.fw_name =3D u"FIP",
++		.image_index =3D FW_IMAGE_INDEX_FIP,
++	},
++	{
++		.image_type_id =3D FWU_MPS3_INITRAMFS_IMAGE_GUID,
++		.fw_name =3D u"INITRAMFS",
++		.image_index =3D FW_IMAGE_INDEX_INITRAMFS,
++	},
++	{
++		.image_type_id =3D FWU_DUMMY_START_IMAGE_GUID,
++		.fw_name =3D u"DUMMY_START",
++		.image_index =3D FW_IMAGE_INDEX_DUMMY_START,
++	},
++	{
++		.image_type_id =3D FWU_DUMMY_END_IMAGE_GUID,
++		.fw_name =3D u"DUMMY_END",
++		.image_index =3D FW_IMAGE_INDEX_DUMMY_END,
++	},
++};
++
++struct efi_fw_image fw_fvp_images[] =3D {
++	{
++		.image_type_id =3D FWU_FVP_BL2_IMAGE_GUID,
++		.fw_name =3D u"BL2",
++		.image_index =3D FW_IMAGE_INDEX_BL2,
++	},
++	{
++		.image_type_id =3D FWU_FVP_TFM_S_IMAGE_GUID,
++		.fw_name =3D u"TFM_S",
++		.image_index =3D FW_IMAGE_INDEX_TFM_S,
++	},
++	{
++		.image_type_id =3D FWU_FVP_FIP_IMAGE_GUID,
++		.fw_name =3D u"FIP",
++		.image_index =3D FW_IMAGE_INDEX_FIP,
++	},
++	{
++		.image_type_id =3D FWU_FVP_INITRAMFS_IMAGE_GUID,
++		.fw_name =3D u"INITRAMFS",
++		.image_index =3D FW_IMAGE_INDEX_INITRAMFS,
++	},
++	{
++		.image_type_id =3D FWU_DUMMY_START_IMAGE_GUID,
++		.fw_name =3D u"DUMMY_START",
++		.image_index =3D FW_IMAGE_INDEX_DUMMY_START,
++	},
++	{
++		.image_type_id =3D FWU_DUMMY_END_IMAGE_GUID,
++		.fw_name =3D u"DUMMY_END",
++		.image_index =3D FW_IMAGE_INDEX_DUMMY_END,
++	},
++};
++
++struct efi_capsule_update_info update_info =3D {
++	.num_images =3D CAPSULE_PAYLOADS_MAX_COUNT,
++};
++
++#endif /* EFI_HAVE_CAPSULE_SUPPORT */
++
+ static int corstone1000_boot_idx;
+=20
+ static struct mm_region corstone1000_mem_map[] =3D {
+@@ -79,6 +209,12 @@ struct mm_region *mem_map =3D corstone1000_mem_map;
+=20
+ int board_init(void)
+ {
++#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
++	if (!strcmp(DEVICE_TREE, "corstone1000-fvp"))
++		update_info.images =3D fw_fvp_images;
++	else
++		update_info.images =3D fw_mps3_images;
++#endif
+ 	return 0;
+ }
+=20
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 80163580f85..5b10e3f7484 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -10,11 +10,16 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
+ CONFIG_SYS_BOOTM_LEN=3D0x800000
+ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+ CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
++CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+ CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
++CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
+ CONFIG_EFI_CAPSULE_ON_DISK=3Dy
++CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
++CONFIG_EFI_CAPSULE_AUTHENTICATE=3Dy
++CONFIG_EFI_CAPSULE_CRT_FILE=3D"CRT.crt"
+ CONFIG_FIT=3Dy
+ CONFIG_DISTRO_DEFAULTS=3Dy
+ CONFIG_BOOTDELAY=3D3
+@@ -38,6 +43,7 @@ CONFIG_CMD_LOADM=3Dy
+ CONFIG_CMD_USB=3Dy
+ # CONFIG_CMD_SETEXPR is not set
+ CONFIG_CMD_CACHE=3Dy
++CONFIG_CMD_EFIDEBUG=3Dy
+ CONFIG_CMD_RTC=3Dy
+ CONFIG_CMD_TIME=3Dy
+ CONFIG_CMD_GETTIME=3Dy
+@@ -67,4 +73,6 @@ CONFIG_USB_ISP1760=3Dy
+ # CONFIG_RANDOM_UUID is not set
+ CONFIG_ERRNO_STR=3Dy
+ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
+-CONFIG_FWU_MDATA_V1=3Dy
++CONFIG_FWU_MDATA_V2=3Dy
++CONFIG_FWU_ARM_PSA=3Dy
++# CONFIG_TOOLS_MKEFICAPSULE is not set
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu=
_arm_psa-corstone1000-Perform-bank-logic-when-rea.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_psa-corstone1000-Perfor=
m-bank-logic-when-rea.patch
new file mode 100644
index 00000000..1fe95f11
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_ps=
a-corstone1000-Perform-bank-logic-when-rea.patch
@@ -0,0 +1,143 @@
+From e3e4f4adae7bdf580490bd82013760e4f603022e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 5 Mar 2025 19:09:20 +0000
+Subject: [PATCH 22/36] fwu_arm_psa: corstone1000: Perform bank logic whe=
n
+ reading boot index
+
+Move bank logic from board_late_init to fwu_plat_get_bootidx
+
+board_late_init is called very early before the FWU subsystem is setup.
+So, the metadata is still not initialized at that level. Reading the boo=
t
+index at that level returns an invalid value.
+Moving the bank logic to fwu_plat_get_bootidx guarantees the returned
+boot index is reflecting the value read from the metadata.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ board/armltd/corstone1000/corstone1000.c | 63 +++++++++++-------------
+ configs/corstone1000_defconfig           |  1 -
+ 2 files changed, 29 insertions(+), 35 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index d2176b9174d..2ccf851e6c5 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -151,8 +151,6 @@ struct efi_capsule_update_info update_info =3D {
+=20
+ #endif /* EFI_HAVE_CAPSULE_SUPPORT */
+=20
+-static int corstone1000_boot_idx;
+-
+ static struct mm_region corstone1000_mem_map[] =3D {
+ 	{
+ 		/* CVM */
+@@ -234,45 +232,37 @@ int dram_init_banksize(void)
+ }
+=20
+ void fwu_plat_get_bootidx(uint *boot_idx)
+-{
+-	int ret;
+-
+-	/*
+-	 * in our platform, the Secure Enclave is the one who controls
+-	 * all the boot tries and status, so, every time we get here
+-	 * we know that the we are booting from the active index
+-	 */
+-	ret =3D fwu_get_active_index(boot_idx);
+-	if (ret < 0) {
+-		*boot_idx =3D CONFIG_FWU_NUM_BANKS;
+-		log_err("corstone1000: failed to read active index\n");
+-	}
+-}
+-
+-int board_late_init(void)
+ {
+ 	struct disk_partition part_info;
+ 	struct udevice *dev, *bdev;
+ 	struct nvmxip_plat *plat;
+ 	struct blk_desc *desc;
+ 	int ret;
++	bool kernel_addr_set, kernel_size_set;
+=20
+ 	ret =3D uclass_first_device_err(UCLASS_NVMXIP, &dev);
+ 	if (ret < 0) {
+-		log_err("Cannot find kernel device\n");
+-		return ret;
++		log_err("Cannot find kernel device, err (%d)\n", ret);
++		return;
+ 	}
+=20
+ 	plat =3D dev_get_plat(dev);
+ 	device_find_first_child(dev, &bdev);
+ 	desc =3D dev_get_uclass_plat(bdev);
+-	ret =3D fwu_get_active_index(&corstone1000_boot_idx);
++	ret =3D fwu_get_active_index(boot_idx);
+ 	if (ret < 0) {
++		*boot_idx =3D CONFIG_FWU_NUM_BANKS;
+ 		log_err("corstone1000: failed to read boot index\n");
+-		return ret;
++		return;
+ 	}
+=20
+-	if (!corstone1000_boot_idx)
++	kernel_addr_set =3D env_get_hex("kernel_addr", 0) ? true : false;
++	kernel_size_set =3D env_get_hex("kernel_size", 0) ? true : false;
++
++	if (kernel_addr_set && kernel_size_set)
++		return;
++
++	if (!(*boot_idx))
+ 		ret =3D part_get_info_by_name(desc, CORSTONE1000_KERNEL_PRIMARY,
+ 					    &part_info);
+ 	else
+@@ -281,18 +271,23 @@ int board_late_init(void)
+=20
+ 	if (ret < 0) {
+ 		log_err("failed to fetch kernel partition index: %d\n",
+-			corstone1000_boot_idx);
+-		return ret;
++			*boot_idx);
++		return;
+ 	}
+=20
+-	ret =3D 0;
+-
+-	ret |=3D env_set_hex("kernel_addr", plat->phys_base +
+-			   (part_info.start * part_info.blksz));
+-	ret |=3D env_set_hex("kernel_size", part_info.size * part_info.blksz);
+-
+-	if (ret < 0)
+-		log_err("failed to setup kernel addr and size\n");
++	if (!kernel_addr_set) {
++		ret =3D env_set_hex("kernel_addr", plat->phys_base +
++				(part_info.start * part_info.blksz));
++		if (ret)
++			log_err("cannot set kernel_addr variable, err (%d)\n",
++				ret);
++	}
+=20
+-	return ret;
++	if (!kernel_size_set) {
++		ret =3D env_set_hex("kernel_size",
++				  part_info.size * part_info.blksz);
++		if (ret)
++			log_err("cannot set kernel_size variable, err (%d)\n",
++				ret);
++	}
+ }
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 5b10e3f7484..d52d39a0b36 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -31,7 +31,6 @@ CONFIG_SYS_CBSIZE=3D512
+ CONFIG_LOGLEVEL=3D7
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+-CONFIG_BOARD_LATE_INIT=3Dy
+ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_FWU_METADATA=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu=
_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0022-fwu_metadata-make-sure-structures-are-p=
acked.patch
deleted file mode 100644
index e556cabe..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_metada=
ta-make-sure-structures-are-packed.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b1445e50c1f260e3454bc4946ea1009ff3e0dda6 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 16:13:24 +0000
-Subject: [PATCH] fwu_metadata: make sure structures are packed
-
-The fwu metadata in the metadata partitions
-should/are packed to guarantee that the info is
-correct in all platforms. Also the size of them
-are used to calculate the crc32 and that is important
-to get it right.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- include/fwu_mdata.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/fwu_mdata.h b/include/fwu_mdata.h
-index 8fda4f4ac2..c61221a917 100644
---- a/include/fwu_mdata.h
-+++ b/include/fwu_mdata.h
-@@ -22,7 +22,7 @@ struct fwu_image_bank_info {
- 	efi_guid_t  image_uuid;
- 	uint32_t accepted;
- 	uint32_t reserved;
--};
-+} __packed;
-=20
- /**
-  * struct fwu_image_entry - information for a particular type of image
-@@ -38,7 +38,7 @@ struct fwu_image_entry {
- 	efi_guid_t image_type_uuid;
- 	efi_guid_t location_uuid;
- 	struct fwu_image_bank_info img_bank_info[CONFIG_FWU_NUM_BANKS];
--};
-+} __packed;
-=20
- /**
-  * struct fwu_mdata - FWU metadata structure for multi-bank updates
-@@ -62,6 +62,6 @@ struct fwu_mdata {
- 	uint32_t previous_active_index;
-=20
- 	struct fwu_image_entry img_entry[CONFIG_FWU_NUM_IMAGES_PER_BANK];
--};
-+} __packed;
-=20
- #endif /* _FWU_MDATA_H_ */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0023-corstone1000-add-boot-index.patch
deleted file mode 100644
index 4fc5de73..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corstone10=
00-add-boot-index.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7a71000da87c4b48c6c42043924863c2933d8bdf Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Mon, 17 Jul 2023 17:04:10 +0100
-Subject: [PATCH] corstone1000: add boot index
-
-it is expected that the firmware that runs before
-u-boot somehow provide the information of the bank
-(index) of it is booting.
-We will need to extend tf-a to pass that info,
-meanwhile just set it to the default bank.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- board/armltd/corstone1000/corstone1000.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index ecfd8366df..ba6d024b80 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -8,6 +8,7 @@
- #include <common.h>
- #include <cpu_func.h>
- #include <dm.h>
-+#include <fwu.h>
- #include <netdev.h>
- #include <dm/platform_data/serial_pl01x.h>
- #include <asm/armv8/mmu.h>
-@@ -107,6 +108,7 @@ int dram_init_banksize(void)
- 	return 0;
- }
-=20
--void reset_cpu(void)
-+void fwu_plat_get_bootidx(uint *boot_idx)
- {
-+	*boot_idx =3D 0;
- }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-fwu=
_arm_psa-corstone1000-Notify-SE-Proxy-SP-on-ExitB.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0023-fwu_arm_psa-corstone1000-Notify=
-SE-Proxy-SP-on-ExitB.patch
new file mode 100644
index 00000000..5317984f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-fwu_arm_ps=
a-corstone1000-Notify-SE-Proxy-SP-on-ExitB.patch
@@ -0,0 +1,104 @@
+From fe7e49ae4fdf07aab3d882adcde94097b3dead82 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 20 Mar 2025 15:27:27 +0000
+Subject: [PATCH 23/36] fwu_arm_psa: corstone1000: Notify SE Proxy SP on
+ ExitBootService()
+
+Implement the notification in fwu_notify_exit_boot_services()
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ board/armltd/corstone1000/corstone1000.c | 60 ++++++++++++++++++++++++
+ 1 file changed, 60 insertions(+)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 2ccf851e6c5..2532c5f10fa 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -5,6 +5,7 @@
+  * Rui Miguel Silva <rui.silva@linaro.org>
+  */
+=20
++#include <arm_ffa.h>
+ #include <blk.h>
+ #include <cpu_func.h>
+ #include <dm.h>
+@@ -19,11 +20,28 @@
+ #include <dm/platform_data/serial_pl01x.h>
+ #include <asm/armv8/mmu.h>
+ #include <asm/global_data.h>
++#include <linux/bitfield.h>
+=20
+ #define CORSTONE1000_KERNEL_PARTS 2
+ #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
+ #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
+=20
++/* The SE Proxy partition ID*/
++#define CORSTONE1000_SEPROXY_PART_ID (0x8002)
++
++/* Update service ID provided by  the SE Proxy SP*/
++#define CORSTONE1000_SEPROXY_UPDATE_SVC_ID (0x4)
++#define PREP_SEPROXY_SVC_ID_MASK GENMASK(31, 16)
++#define PREP_SEPROXY_SVC_ID(x)  (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
++
++/* Notification event used with SE Proxy SP */
++#define CORSTONE1000_UBOOT_EFI_STARTED_EVT (0x3)
++#define PREP_SEPROXY_EVT_MASK GENMASK(15, 0)
++#define PREP_SEPROXY_EVT(x) (FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
++
++/* Signal that there is no shared memory used when notifying SE Proxy S=
P */
++#define FFA_MEM_HANDLE_INVALID (0xffffffff)
++
+ #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
+=20
+ /* The total number of upgradable images including the start and end du=
mmy payloads */
+@@ -291,3 +309,45 @@ void fwu_plat_get_bootidx(uint *boot_idx)
+ 				ret);
+ 	}
+ }
++
++/**
++ * fwu_notify_exit_boot_services() - ExitBootService event handler
++ *
++ * Notify SE Proxy SP when reaching ExitBootService().
++ *
++ * Return:
++ *
++ * EFI_SUCCESS on success. Otherwise, failure
++ */
++efi_status_t fwu_notify_exit_boot_services(void)
++{
++	efi_status_t efi_ret =3D EFI_SUCCESS;
++	int ffa_ret;
++	struct ffa_send_direct_data msg =3D {0};
++	struct udevice *dev;
++
++	ffa_ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
++	if (ffa_ret) {
++		log_err("Cannot find FF-A bus device, err (%d)\n", ffa_ret);
++		efi_ret =3D EFI_DEVICE_ERROR;
++		goto out;
++	}
++
++	msg.data0 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
++					PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT);
++
++	msg.data1 =3D FFA_MEM_HANDLE_INVALID;
++	msg.data2 =3D FFA_MEM_HANDLE_INVALID;
++
++	ffa_ret =3D ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &=
msg, 0);
++	if (ffa_ret) {
++		log_err("Cannot notify SE Proxy SP, err (%d)\n", ffa_ret);
++		efi_ret =3D EFI_NO_RESPONSE;
++		goto out;
++	}
++
++	log_debug("SE Proxy SP notified\n");
++
++out:
++	return efi_ret;
++}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-cor=
stone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-boot-bank-and-=
kernel-location.patch
deleted file mode 100644
index 66c6c665..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b15518faa5eba9ffb9da4d6e17d8ab4bb8e69f27 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 16:17:21 +0000
-Subject: [PATCH] corstone1000: adjust boot bank and kernel location
-
-Adjust in the env boot script the address of the
-bootbank with the new gpt layout, and also the
-kernel partition address. Please be aware that
-this is hack and needs a proper fix, since the
-offset of the kernel partition is not fixed,
-but for the propose of PoC it is enough for testing.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- board/armltd/corstone1000/corstone1000.env | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/c=
orstone1000/corstone1000.env
-index b24ff07fc6..a6ee496221 100644
---- a/board/armltd/corstone1000/corstone1000.env
-+++ b/board/armltd/corstone1000/corstone1000.env
-@@ -1,8 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0+ */
-=20
- usb_pgood_delay=3D250
--boot_bank_flag=3D0x08002000
--kernel_addr_bank_0=3D0x083EE000
-+boot_bank_flag=3D0x08005006
-+kernel_addr_bank_0=3D0x08280000
- kernel_addr_bank_1=3D0x0936E000
- retrieve_kernel_load_addr=3D
- 	if itest.l *${boot_bank_flag} =3D=3D 0; then
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu=
_arm_psa-corstone1000-Set-Boot0001-for-on-disk-FW.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_psa-corstone1000-Set-Bo=
ot0001-for-on-disk-FW.patch
new file mode 100644
index 00000000..2584183a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_ps=
a-corstone1000-Set-Boot0001-for-on-disk-FW.patch
@@ -0,0 +1,59 @@
+From 259e9c11412c89a528a18d7ae34f770914c122a4 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 2 May 2025 15:42:56 +0100
+Subject: [PATCH 24/36] fwu_arm_psa: corstone1000: Set Boot0001 for on-di=
sk FWU
+
+Set Boot0001 to point to the ESP partition path
+
+On-disk FWU requires setting the boot option to where the
+EFI System Partition (ESP) is so U-Boot's capsule driver
+can detect the ESP partition and start the FWU.
+
+Corstone-1000 supports on-disk FWU on FVP.
+The ESP partition is at mmc 1:1 and is accessible with boot option 1.
+
+To avoid setting manually Boot0001 at factory level, Boot0001 is
+set in the bootcmd. So, before starting the on-disk FWU, the bootcmd
+will be executed and Boot0001 will be set automatically.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
+---
+ board/armltd/corstone1000/corstone1000.env | 8 ++++++++
+ configs/corstone1000_defconfig             | 2 +-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/c=
orstone1000/corstone1000.env
+index ee318b1b1c3..6e631b12bc2 100644
+--- a/board/armltd/corstone1000/corstone1000.env
++++ b/board/armltd/corstone1000/corstone1000.env
+@@ -1,5 +1,13 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+=20
++/*
++ * Copyright 2023, 2025 Arm Limited and/or its affiliates <open-source-=
office@arm.com>
++ */
++
+ usb_pgood_delay=3D250
+ boot_bank_flag=3D0x08005006
+ kernel_addr_r=3D0x88200000
++prepare_ondisk_fwu=3D
++	if mmc dev 1; then
++		efidebug boot add -B 1 OnDiskFWU mmc 1:1 / ;
++	fi;
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index d52d39a0b36..e02fb7cca67 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -25,7 +25,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
+ CONFIG_BOOTDELAY=3D3
+ CONFIG_USE_BOOTARGS=3Dy
+ CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
+-CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r $file=
size; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $f=
dtcontroladdr;"
++CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r $file=
size; usb start; usb reset; run prepare_ondisk_fwu ; run distro_bootcmd; =
bootefi $kernel_addr_r $fdtcontroladdr;"
+ CONFIG_CONSOLE_RECORD=3Dy
+ CONFIG_SYS_CBSIZE=3D512
+ CONFIG_LOGLEVEL=3D7
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-add-nvmxip-fwu-mdata-=
and-gpt-options.patch
deleted file mode 100644
index c9e050a4..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 085b51e1545e905b4ba87c529954f31067032eaa Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Mon, 17 Jul 2023 17:33:52 +0100
-Subject: [PATCH] corstone1000: add nvmxip, fwu-mdata and gpt options
-
-Enable the newest features: nvmxip, fwu-metadata and
-gpt. Commands to print the partition info, gpt info
-and fwu metadata will be available.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- configs/corstone1000_defconfig | 21 ++++++++++++++-------
- 1 file changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index a92668389a..4c75a01818 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
- CONFIG_BOOTDELAY=3D3
- CONFIG_USE_BOOTARGS=3Dy
- CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
--CONFIG_BOOTCOMMAND=3D"run retrieve_kernel_load_addr; echo Loading kerne=
l from $kernel_addr to memory ... ; unzip $kernel_addr 0x90000000; loadm =
0x90000000 $kernel_addr_r 0xf00000; usb start; usb reset; run distro_boot=
cmd; bootefi $kernel_addr_r $fdtcontroladdr;"
-+CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xf00=
000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fd=
tcontroladdr;"
- CONFIG_CONSOLE_RECORD=3Dy
- CONFIG_LOGLEVEL=3D7
- # CONFIG_DISPLAY_CPUINFO is not set
-@@ -23,11 +23,15 @@ CONFIG_LOGLEVEL=3D7
- CONFIG_SYS_MAXARGS=3D64
- CONFIG_SYS_CBSIZE=3D512
- # CONFIG_CMD_CONSOLE is not set
-+CONFIG_CMD_FWU_METADATA=3Dy
- CONFIG_CMD_BOOTZ=3Dy
- CONFIG_SYS_BOOTM_LEN=3D0x800000
- # CONFIG_CMD_XIMG is not set
-+CONFIG_CMD_GPT=3Dy
-+# CONFIG_RANDOM_UUID is not set
- CONFIG_CMD_LOADM=3Dy
- # CONFIG_CMD_LOADS is not set
-+CONFIG_CMD_MMC=3Dy
- CONFIG_CMD_USB=3Dy
- # CONFIG_CMD_SETEXPR is not set
- # CONFIG_CMD_NFS is not set
-@@ -41,12 +45,7 @@ CONFIG_NET_RANDOM_ETHADDR=3Dy
- CONFIG_REGMAP=3Dy
- CONFIG_MISC=3Dy
- CONFIG_CLK=3Dy
--CONFIG_CMD_MMC=3Dy
--CONFIG_DM_MMC=3Dy
- CONFIG_ARM_PL180_MMCI=3Dy
--CONFIG_MMC_SDHCI_ADMA_HELPERS=3Dy
--CONFIG_MMC_WRITE=3Dy
--CONFIG_DM_GPIO=3Dy
- CONFIG_PHYLIB=3Dy
- CONFIG_PHY_SMSC=3Dy
- CONFIG_SMC911X=3Dy
-@@ -65,4 +64,12 @@ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
- CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
- CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
- CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
--CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
-+CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
-+CONFIG_FWU_MDATA=3Dy
-+CONFIG_FWU_MDATA_GPT_BLK=3Dy
-+CONFIG_SYSRESET=3Dy
-+CONFIG_EFI_CAPSULE_ON_DISK=3Dy
-+CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
-+CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
-+# CONFIG_TOOLS_MKEFICAPSULE is not set
-+CONFIG_DM_GPIO=3Dy
-\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvm=
xip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0026-nvmxip-move-header-to-include.patch
deleted file mode 100644
index 46734385..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvmxip-mov=
e-header-to-include.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e7db287eb8bda80465d0c11cbb41acc798bb9fc6 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 9 Jun 2023 13:31:53 +0100
-Subject: [PATCH] nvmxip: move header to include
-
-Move header to include to allow external code
-to get the internal bdev structures to access
-block device operations.
-
-as at it, just add the UCLASS_NVMXIP string
-so we get the correct output in partitions
-listing.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- disk/part.c                              | 3 +++
- {drivers/mtd/nvmxip =3D> include}/nvmxip.h | 0
- 2 files changed, 3 insertions(+)
- rename {drivers/mtd/nvmxip =3D> include}/nvmxip.h (100%)
-
-diff --git a/disk/part.c b/disk/part.c
-index 35300df590..f57dce7a29 100644
---- a/disk/part.c
-+++ b/disk/part.c
-@@ -271,6 +271,9 @@ static void print_part_header(const char *type, stru=
ct blk_desc *dev_desc)
- 	case UCLASS_NVME:
- 		puts ("NVMe");
- 		break;
-+	case UCLASS_NVMXIP:
-+		puts ("NVMXIP");
-+		break;
- 	case UCLASS_PVBLOCK:
- 		puts("PV BLOCK");
- 		break;
-diff --git a/drivers/mtd/nvmxip/nvmxip.h b/include/nvmxip.h
-similarity index 100%
-rename from drivers/mtd/nvmxip/nvmxip.h
-rename to include/nvmxip.h
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0027-corstone1000-set-kernel_addr-based-on=
-boot_idx.patch
deleted file mode 100644
index 352873f9..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From ae098fd5c47f6d805b356c892558a85d571bed67 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 18 Jul 2023 12:14:47 +0100
-Subject: [PATCH] corstone1000: set kernel_addr based on boot_idx
-
-We need to distinguish between boot banks and from which
-partition to load the kernel+initramfs to memory.
-
-For that, fetch the boot index, fetch the correspondent
-partition, calculate the correct kernel address and
-then set the env variable kernel_addr with that value.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- board/armltd/corstone1000/corstone1000.c   | 58 +++++++++++++++++++++-
- board/armltd/corstone1000/corstone1000.env |  8 ---
- configs/corstone1000_defconfig             |  1 +
- 3 files changed, 58 insertions(+), 9 deletions(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index ba6d024b80..a045262ebb 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -5,15 +5,25 @@
-  * Rui Miguel Silva <rui.silva@linaro.org>
-  */
-=20
-+#include <blk.h>
- #include <common.h>
- #include <cpu_func.h>
- #include <dm.h>
-+#include <env.h>
- #include <fwu.h>
- #include <netdev.h>
-+#include <nvmxip.h>
-+#include <part.h>
- #include <dm/platform_data/serial_pl01x.h>
- #include <asm/armv8/mmu.h>
- #include <asm/global_data.h>
-=20
-+#define CORSTONE1000_KERNEL_PARTS 2
-+#define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
-+#define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
-+
-+static int corstone1000_boot_idx;
-+
- static struct mm_region corstone1000_mem_map[] =3D {
- 	{
- 		/* CVM */
-@@ -110,5 +120,51 @@ int dram_init_banksize(void)
-=20
- void fwu_plat_get_bootidx(uint *boot_idx)
- {
--	*boot_idx =3D 0;
-+	*boot_idx =3D corstone1000_boot_idx;
-+}
-+
-+int board_late_init(void)
-+{
-+	struct disk_partition part_info;
-+	struct udevice *dev, *bdev;
-+	struct nvmxip_plat *plat;
-+	struct blk_desc *desc;
-+	int ret;
-+
-+	ret =3D uclass_first_device_err(UCLASS_NVMXIP, &dev);
-+	if (ret < 0) {
-+		log_err("Cannot find kernel device\n");
-+		return ret;
-+	}
-+
-+	plat =3D dev_get_plat(dev);
-+	device_find_first_child(dev, &bdev);
-+	desc =3D dev_get_uclass_plat(bdev);
-+	ret =3D fwu_get_active_index(&corstone1000_boot_idx);
-+	if (ret < 0)
-+		log_err("corstone1000: failed to read boot index\n");
-+
-+	if (!corstone1000_boot_idx)
-+		ret =3D part_get_info_by_name(desc, CORSTONE1000_KERNEL_PRIMARY,
-+					    &part_info);
-+	else
-+		ret =3D part_get_info_by_name(desc, CORSTONE1000_KERNEL_SECONDARY,
-+					    &part_info);
-+
-+	if (ret < 0) {
-+		log_err("failed to fetch kernel partition index: %d\n",
-+			corstone1000_boot_idx);
-+		return ret;
-+	}
-+
-+	ret =3D 0;
-+
-+	ret |=3D env_set_hex("kernel_addr", plat->phys_base +
-+			   (part_info.start * part_info.blksz));
-+	ret |=3D env_set_hex("kernel_size", part_info.size * part_info.blksz);
-+
-+	if (ret < 0)
-+		log_err("failed to setup kernel addr and size\n");
-+
-+	return ret;
- }
-diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/c=
orstone1000/corstone1000.env
-index a6ee496221..ee318b1b1c 100644
---- a/board/armltd/corstone1000/corstone1000.env
-+++ b/board/armltd/corstone1000/corstone1000.env
-@@ -2,12 +2,4 @@
-=20
- usb_pgood_delay=3D250
- boot_bank_flag=3D0x08005006
--kernel_addr_bank_0=3D0x08280000
--kernel_addr_bank_1=3D0x0936E000
--retrieve_kernel_load_addr=3D
--	if itest.l *${boot_bank_flag} =3D=3D 0; then
--		setenv kernel_addr $kernel_addr_bank_0;
--	else
--		setenv kernel_addr $kernel_addr_bank_1;
--	fi;
- kernel_addr_r=3D0x88200000
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 4c75a01818..0232131a11 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -20,6 +20,7 @@ CONFIG_CONSOLE_RECORD=3Dy
- CONFIG_LOGLEVEL=3D7
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_BOARD_LATE_INIT=3Dy
- CONFIG_SYS_MAXARGS=3D64
- CONFIG_SYS_CBSIZE=3D512
- # CONFIG_CMD_CONSOLE is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-cor=
stone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0028-corstone1000-boot-index-from-active.patch
deleted file mode 100644
index fee77974..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-boot-index-from-active.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 67c439b974da80208962c1c7f0a1291908e23a30 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Mon, 27 Feb 2023 14:40:13 +0000
-Subject: [PATCH] corstone1000: boot index from active
-
-In our platform, the Secure Enclave is the one who control
-all the boot tries and status, so, every time we get here
-we know that the we are booting from the active index.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- board/armltd/corstone1000/corstone1000.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index a045262ebb..53c65506d5 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -120,7 +120,16 @@ int dram_init_banksize(void)
-=20
- void fwu_plat_get_bootidx(uint *boot_idx)
- {
--	*boot_idx =3D corstone1000_boot_idx;
-+	int ret;
-+
-+	/*
-+	 * in our platform, the Secure Enclave is the one who control
-+	 * all the boot tries and status, so, every time we get here
-+	 * we know that the we are booting from the active index
-+	 */
-+	ret =3D fwu_get_active_index(boot_idx);
-+	if (ret < 0)
-+		log_err("corstone1000: failed to read active index err %d\n", ret);
- }
-=20
- int board_late_init(void)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cor=
stone1000-enable-PSCI-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0029-corstone1000-enable-PSCI-reset.patch
deleted file mode 100644
index f722f81c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-enable-PSCI-reset.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8b7260db2b0c560b430657f801dd102fb2b141de Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Tue, 18 Jul 2023 12:19:17 +0100
-Subject: [PATCH] corstone1000: enable PSCI reset
-
-Even though corstone1000 does not implement entire PSCI APIs,it relies o=
n
-PSCI reset interface for the system reset. U-boot change the config name=
, so we
-need to enable it again.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- configs/corstone1000_defconfig | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 0232131a11..ccd558cfce 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -73,4 +73,5 @@ CONFIG_EFI_CAPSULE_ON_DISK=3Dy
- CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
- CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
- # CONFIG_TOOLS_MKEFICAPSULE is not set
--CONFIG_DM_GPIO=3Dy
-\ No newline at end of file
-+CONFIG_DM_GPIO=3Dy
-+CONFIG_SYSRESET_PSCI=3Dy
-\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Ena=
ble-EFI-set-get-time-services.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0030-Enable-EFI-set-get-time-services.patch
deleted file mode 100644
index 015ed439..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Enable-EFI=
-set-get-time-services.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 03f53356a5b8b30b981ab7a16c6f48ca7fffe489 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Tue, 18 Jul 2023 12:21:39 +0100
-Subject: [PATCH] Enable EFI set/get time services
-
-SetTime_Conf and SetTime_Func tests in UEFI SCT test suite of ACS
-fails with unsupported return value. CONFIG_EFI_SET_TIME and
-CONFIG_EFI_GET_TIME config values are added to enable these EFI
-services.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- configs/corstone1000_defconfig | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index ccd558cfce..a0af413de8 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -74,4 +74,6 @@ CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
- CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
- # CONFIG_TOOLS_MKEFICAPSULE is not set
- CONFIG_DM_GPIO=3Dy
--CONFIG_SYSRESET_PSCI=3Dy
-\ No newline at end of file
-+CONFIG_SYSRESET_PSCI=3Dy
-+CONFIG_EFI_SET_TIME=3Dy
-+CONFIG_EFI_GET_TIME=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-cor=
stone1000-detect-inflated-kernel-size.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0031-corstone1000-detect-inflated-kernel-size.pa=
tch
deleted file mode 100644
index 8ee20aaa..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-detect-inflated-kernel-size.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From affde70e4ba728b0ce855f53501bdb5caa8afa6d Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 11 Aug 2023 10:41:19 +0100
-Subject: [PATCH] corstone1000: detect inflated kernel size
-
-use filesize variable set by unzip command
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- configs/corstone1000_defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index a0af413de8..5b0b2ac3bf 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
- CONFIG_BOOTDELAY=3D3
- CONFIG_USE_BOOTARGS=3Dy
- CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
--CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xf00=
000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fd=
tcontroladdr;"
-+CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r $file=
size; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $f=
dtcontroladdr;"
- CONFIG_CONSOLE_RECORD=3Dy
- CONFIG_LOGLEVEL=3D7
- # CONFIG_DISPLAY_CPUINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-cor=
stone1000-ESRT-add-unique-firmware-GUID.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0032-corstone1000-ESRT-add-unique-firmware-GUI=
D.patch
deleted file mode 100644
index 1c34f338..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-ESRT-add-unique-firmware-GUID.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1f1e0c35c9a11e956a8dc10002d17a497de947e3 Mon Sep 17 00:00:00 2001
-From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
-Date: Tue, 8 Aug 2023 10:24:39 +0000
-Subject: [PATCH] corstone1000: ESRT: add unique firmware GUID
-
-Add unique Corstone-1000 firmware GUID
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
----
- lib/efi_loader/efi_firmware.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index c6ab6e2182..7792a6aa83 100644
---- a/lib/efi_loader/efi_firmware.c
-+++ b/lib/efi_loader/efi_firmware.c
-@@ -20,12 +20,12 @@
- #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
-=20
- #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
--#define EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID \
--	EFI_GUID(0xe2bb9c06, 0x70e9, 0x4b14, 0x97, 0xa3, \
--		 0x5a, 0x79, 0x13, 0x17, 0x6e, 0x3f)
-+/* Firmware GUID */
-+#define EFI_CORSTONE1000_FIRMWARE_GUID \
-+	EFI_GUID(0x989f3a4e, 0x46e0, 0x4cd0, 0x98, 0x77, \
-+		 0xa2, 0x5c, 0x70, 0xc0, 0x13, 0x29)
-=20
-- const efi_guid_t efi_firmware_image_type_uboot_raw =3D
--				EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
-+efi_guid_t corstone1000_firmware_guid =3D EFI_CORSTONE1000_FIRMWARE_GUI=
D;
-=20
- static efi_status_t efi_corstone1000_img_info_get (
- 	efi_uintn_t *image_info_size,
-@@ -353,7 +353,7 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
- 			       descriptor_version, descriptor_count,
- 			       descriptor_size,
- 			       package_version, package_version_name,
--			       &efi_firmware_image_type_uboot_raw);
-+			       &corstone1000_firmware_guid);
- #else
- 	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
- 					descriptor_version, descriptor_count,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
deleted file mode 100644
index ecc35675..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From f098724d2a59bf5c265a81c5b8767563c6c2d8de Mon Sep 17 00:00:00 2001
-From: Sughosh Ganu <sughosh.ganu@linaro.org>
-Date: Thu, 21 Sep 2023 14:13:42 +0100
-Subject: [PATCH] dt: Provide a way to remove non-compliant nodes and
- properties
-
-Add a function which is registered to spy for a EVT_FT_FIXUP event,
-and removes the non upstreamed nodes and properties from the
-devicetree before it gets passed to the OS.
-
-This allows removing entire nodes, or specific properties under nodes
-from the devicetree. The required nodes and properties can be
-registered for removal through the DT_NON_COMPLIANT_PURGE and
-DT_NON_COMPLIANT_PURGE_LIST macros.
-
-Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
-Upstream-Status: Submitted [RFC: https://lore.kernel.org/u-boot/aca7e6fa=
-2dec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a267=
38bb66d]
----
- include/dt-structs.h | 11 +++++++
- lib/Makefile         |  1 +
- lib/dt_purge.c       | 73 ++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 85 insertions(+)
- create mode 100644 lib/dt_purge.c
-
-diff --git a/include/dt-structs.h b/include/dt-structs.h
-index fa1622cb1d..f535c60471 100644
---- a/include/dt-structs.h
-+++ b/include/dt-structs.h
-@@ -57,3 +57,14 @@ struct phandle_2_arg {
- #endif
-=20
- #endif
-+
-+struct dt_non_compliant_purge {
-+	const char *node_path;
-+	const char *prop;
-+};
-+
-+#define DT_NON_COMPLIANT_PURGE(__name)	\
-+	ll_entry_declare(struct dt_non_compliant_purge, __name, dt_purge)
-+
-+#define DT_NON_COMPLIANT_PURGE_LIST(__name)	\
-+	ll_entry_declare_list(struct dt_non_compliant_purge, __name, dt_purge)
-diff --git a/lib/Makefile b/lib/Makefile
-index 8d8ccc8bbc..82a906daa0 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -37,6 +37,7 @@ endif
- obj-y +=3D crc8.o
- obj-y +=3D crc16.o
- obj-y +=3D crc16-ccitt.o
-+obj-y +=3D dt_purge.o
- obj-$(CONFIG_ERRNO_STR) +=3D errno_str.o
- obj-$(CONFIG_FIT) +=3D fdtdec_common.o
- obj-$(CONFIG_TEST_FDTDEC) +=3D fdtdec_test.o
-diff --git a/lib/dt_purge.c b/lib/dt_purge.c
-new file mode 100644
-index 0000000000..f893ba9796
---- /dev/null
-+++ b/lib/dt_purge.c
-@@ -0,0 +1,73 @@
-+// SPDX-License-Identifier: GPL-2.0-or-later
-+/*
-+ * Copyright (c) 2023, Linaro Limited
-+ */
-+
-+#include <dt-structs.h>
-+#include <event.h>
-+#include <linker_lists.h>
-+
-+#include <linux/libfdt.h>
-+
-+/**
-+ * dt_non_compliant_purge() -	Remove non-upstreamed nodes and propertie=
s
-+ *				from the DT
-+ * @ctx: Context for event
-+ * @event: Event to process
-+ *
-+ * Iterate through an array of DT nodes and properties, and remove them
-+ * from the device-tree before the DT gets handed over to the kernel.
-+ * These are nodes and properties which do not have upstream bindings
-+ * and need to be purged before being handed over to the kernel.
-+ *
-+ * If both the node and property are specified, delete the property. If
-+ * only the node is specified, delete the entire node, including it's
-+ * subnodes, if any.
-+ *
-+ * Return: 0 if OK, -ve on error
-+ */
-+static int dt_non_compliant_purge(void *ctx, struct event *event)
-+{
-+	int nodeoff =3D 0;
-+	int err =3D 0;
-+	void *fdt;
-+	const struct event_ft_fixup *fixup =3D &event->data.ft_fixup;
-+	struct dt_non_compliant_purge *purge_entry;
-+	struct dt_non_compliant_purge *purge_start =3D
-+		ll_entry_start(struct dt_non_compliant_purge, dt_purge);
-+	int nentries =3D ll_entry_count(struct dt_non_compliant_purge, dt_purg=
e);
-+
-+	if (fixup->images)
-+		return 0;
-+
-+	fdt =3D fixup->tree.fdt;
-+	for (purge_entry =3D purge_start; purge_entry !=3D purge_start + nentr=
ies;
-+	     purge_entry++) {
-+		nodeoff =3D fdt_path_offset(fdt, purge_entry->node_path);
-+		if (nodeoff < 0) {
-+			log_debug("Error (%d) getting node offset for %s\n",
-+				  nodeoff, purge_entry->node_path);
-+			continue;
-+		}
-+
-+		if (purge_entry->prop) {
-+			err =3D fdt_delprop(fdt, nodeoff, purge_entry->prop);
-+			if (err < 0 && err !=3D -FDT_ERR_NOTFOUND) {
-+				log_debug("Error (%d) deleting %s\n",
-+					  err, purge_entry->prop);
-+				goto out;
-+			}
-+		} else {
-+			err =3D fdt_del_node(fdt, nodeoff);
-+			if (err) {
-+				log_debug("Error (%d) trying to delete node %s\n",
-+					  err, purge_entry->node_path);
-+				goto out;
-+			}
-+		}
-+	}
-+
-+out:
-+	return err;
-+}
-+EVENT_SPY(EVT_FT_FIXUP, dt_non_compliant_purge);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0034-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
deleted file mode 100644
index 54363e99..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ff83070da7d1f547fc640e8446251f8e1e4ffc33 Mon Sep 17 00:00:00 2001
-From: Sughosh Ganu <sughosh.ganu@linaro.org>
-Date: Thu, 21 Sep 2023 14:15:13 +0100
-Subject: [PATCH] bootefi: Call the EVT_FT_FIXUP event handler
-
-The bootefi command passes the devicetree to the kernel through the
-EFI config table. Call the event handlers for fixing the devicetree
-before jumping into the kernel. This removes any devicetree nodes
-and/or properties that are specific only to U-Boot, and are not to be
-passed to the OS.
-
-Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
-Upstream-Status: Submitted [RFC: https://lore.kernel.org/u-boot/aca7e6fa=
-2dec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a267=
38bb66d]
----
- cmd/bootefi.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index 5c0afec154..f9588b66c7 100644
---- a/cmd/bootefi.c
-+++ b/cmd/bootefi.c
-@@ -237,6 +237,23 @@ static void *get_config_table(const efi_guid_t *gui=
d)
- 	return NULL;
- }
-=20
-+/**
-+ * event_notify_dt_fixup() - call ft_fixup event
-+ *
-+ * @fdt:	address of the device tree to be passed to the kernel
-+ *		through the configuration table
-+ * Return:	None
-+ */
-+static void event_notify_dt_fixup(void *fdt)
-+{
-+	int ret;
-+	struct event_ft_fixup fixup =3D {0};
-+
-+	fixup.tree.fdt =3D fdt;
-+	ret =3D event_notify(EVT_FT_FIXUP, &fixup, sizeof(fixup));
-+	if (ret)
-+		printf("Error: %d: FDT Fixup event failed\n", ret);
-+}
- #endif /* !CONFIG_IS_ENABLED(GENERATE_ACPI_TABLE) */
-=20
- /**
-@@ -318,6 +335,7 @@ efi_status_t efi_install_fdt(void *fdt)
- 	efi_carve_out_dt_rsv(fdt);
-=20
- 	efi_try_purge_kaslr_seed(fdt);
-+	event_notify_dt_fixup(fdt);
-=20
- 	if (CONFIG_IS_ENABLED(EFI_TCG2_PROTOCOL_MEASURE_DTB)) {
- 		ret =3D efi_tcg2_measure_dtb(fdt);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-cor=
stone1000-purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-corstone1000-purge-U-Boot-specific-DT-no=
des.patch
deleted file mode 100644
index 090f32c5..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corstone10=
00-purge-U-Boot-specific-DT-nodes.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 49e3463a397b61e859df5e1a383f82d64c1e4f3f Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 21 Sep 2023 15:24:34 +0100
-Subject: [PATCH] corstone1000: purge U-Boot specific DT nodes
-
-Remove U-Boot specific DT nodes before passing the DT to Linux
-
-This is needed to pass SystemReady IR 2.0 dt-schema tests
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2=
dec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738=
bb66d]
----
- board/armltd/corstone1000/corstone1000.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 53c65506d5..e3c0e5bf50 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -9,6 +9,7 @@
- #include <common.h>
- #include <cpu_func.h>
- #include <dm.h>
-+#include <dt-structs.h>
- #include <env.h>
- #include <fwu.h>
- #include <netdev.h>
-@@ -18,6 +19,20 @@
- #include <asm/armv8/mmu.h>
- #include <asm/global_data.h>
-=20
-+/* remove the DT nodes not needed in Linux */
-+DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
-+	{ .node_path =3D "/fwu-mdata" },
-+	{ .node_path =3D "/nvmxip-qspi@08000000" },
-+	{ .node_path =3D "/soc/mailbox@1b820000" },
-+	{ .node_path =3D "/soc/mailbox@1b830000" },
-+	{ .node_path =3D "/soc/mhu@1b000000" },
-+	{ .node_path =3D "/soc/mhu@1b010000" },
-+	{ .node_path =3D "/soc/mhu@1b020000" },
-+	{ .node_path =3D "/soc/mhu@1b030000" },
-+	{ .node_path =3D "/soc/client" },
-+	{ .node_path =3D "/soc/extsys@1A010310" },
-+};
-+
- #define CORSTONE1000_KERNEL_PARTS 2
- #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
- #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-add-signature-device-tree-overlay.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0036-corstone1000-add-signature-device-tre=
e-overlay.patch
deleted file mode 100644
index 62713abf..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-add-signature-device-tree-overlay.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 57e2230470c32bf2c6206813bcdfc9ce30b70c1d Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 13 Sep 2023 13:20:15 +0100
-Subject: [PATCH] corstone1000: add signature device tree overlay
-
-Adds signature device tree overlay.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- arch/arm/dts/corstone1000.dtsi | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 1e0ec075e4..077673dd44 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -111,6 +111,10 @@
- 		fwu-mdata-store =3D <&nvmxip>;
- 	};
-=20
-+	signature {
-+		capsule-key =3D /incbin/("../../../CRT.esl");
-+	};
-+
- 	soc {
- 		compatible =3D "simple-bus";
- 		#address-cells =3D <1>;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-enable-authenticated-capsule-config.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-authenticated-c=
apsule-config.patch
deleted file mode 100644
index 65d5e151..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-authenticated-capsule-config.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 509645079f3dbb6b14e920102bea75c2f408d195 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 13 Sep 2023 13:52:02 +0100
-Subject: [PATCH] corstone1000: enable authenticated capsule config
-
-Enables authenticated capsule update config for corstone1000.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- configs/corstone1000_defconfig | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 5b0b2ac3bf..2de3f5d7b3 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -70,6 +70,7 @@ CONFIG_FWU_MDATA=3Dy
- CONFIG_FWU_MDATA_GPT_BLK=3Dy
- CONFIG_SYSRESET=3Dy
- CONFIG_EFI_CAPSULE_ON_DISK=3Dy
-+CONFIG_EFI_CAPSULE_AUTHENTICATE=3Dy
- CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
- CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
- # CONFIG_TOOLS_MKEFICAPSULE is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-introduce-EFI-authenticated-capsule-upd.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-introduce-EFI-auth=
enticated-capsule-upd.patch
deleted file mode 100644
index ae409321..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-introduce-EFI-authenticated-capsule-upd.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 3f06f148656fbe238ed8bd93f9631a95668f9406 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 13 Sep 2023 13:55:08 +0100
-Subject: [PATCH] corstone1000: introduce EFI authenticated capsule updat=
e
-
-Introduces EFI authenticated capsule update for corstone1000. Corstone10=
00
-implements platform-specific capsule update mechanism in u-bootdue to th=
e SoC
-design. This patch add authenticated capsule update mechanism to the
-platform-specific firmware-update routine.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
----
- lib/efi_loader/efi_capsule.c | 39 ++++++++++++++++++++++++++++++++++++
- 1 file changed, 39 insertions(+)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 6a06605ad9..e1c78d8c1c 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -820,6 +820,12 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
- 		u64 scatter_gather_list)
- {
- 	struct efi_capsule_header *capsule;
-+	struct efi_firmware_management_capsule_header *capsule_header;
-+	struct efi_firmware_management_capsule_image_header *image;
-+	size_t image_binary_size;
-+	size_t tmp_capsule_payload_size=3D0;
-+	void *tmp_capsule_payload=3DNULL;
-+	void *image_binary;
- 	unsigned int i;
- 	efi_status_t ret;
-=20
-@@ -859,6 +865,39 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
- 			goto out;
- 		}
-=20
-+		capsule_header =3D (void *)capsule + capsule->header_size;
-+		image =3D (void *)capsule_header + capsule_header->item_offset_list[0=
];
-+		if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE) &&
-+			!(image->image_capsule_support &
-+			CAPSULE_SUPPORT_AUTHENTICATION)) {
-+			/* no signature */
-+			log_err("Corstone1000: Capsule authentication flag check failed. Abo=
rting update\n");
-+			ret =3D EFI_SECURITY_VIOLATION;
-+			goto out;
-+		}
-+
-+		image_binary =3D (void *)image + sizeof(*image);
-+		image_binary_size =3D image->update_image_size;
-+		if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE) &&
-+		    (image->image_capsule_support &
-+			CAPSULE_SUPPORT_AUTHENTICATION)){
-+			ret =3D efi_capsule_authenticate(image_binary, image_binary_size,
-+						  &tmp_capsule_payload,
-+						  &tmp_capsule_payload_size);
-+
-+			if (ret =3D=3D EFI_SECURITY_VIOLATION) {
-+				log_err("Corstone1000: Capsule authentication check failed. Abortin=
g update\n");
-+				goto out;
-+			} else if (ret !=3D EFI_SUCCESS) {
-+				goto out;
-+			}
-+
-+			log_debug("Corstone1000: Capsule authentication successful\n");
-+		} else {
-+			log_debug("Corstone1000: Capsule authentication disabled. ");
-+			log_debug("Corstone1000: Updating capsule without authenticating.\n"=
);
-+		}
-+
- 		/* copy the data to the contiguous buffer */
- 		efi_memcpy_runtime(corstone1000_capsule_buf, capsule, capsule->capsul=
e_image_size);
-=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-ena=
bles-ondisk-capsule-update-feature.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/corstone1000/0039-enables-ondisk-capsule-update-feature.patch
deleted file mode 100644
index cd002aca..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-enables-on=
disk-capsule-update-feature.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e5057a10641a7c84186bcbbcd12ee904300ebc53 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Fri, 13 Oct 2023 15:19:32 +0100
-Subject: [PATCH] Enables on-disk capsule update feature
-
-Enables on-disk capsule update feature for corstone1000.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
----
- lib/efi_loader/efi_capsule.c | 5 ++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index e1c78d8c1c..63e4c06e58 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -1499,7 +1499,12 @@ efi_status_t efi_launch_capsules(void)
-			index =3D 0;
-		ret =3D efi_capsule_read_file(files[i], &capsule);
-		if (ret =3D=3D EFI_SUCCESS) {
-+			#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+			/* capsule update only supports 1 image and no scatter gather list f=
or corstone1000 */
-+			efi_update_capsule(&capsule, 1, 0);
-+			#elif
-			ret =3D efi_capsule_update_firmware(capsule);
-+			#endif
-			if (ret !=3D EFI_SUCCESS) {
-				log_err("Applying capsule %ls failed.\n",
-					files[i]);
---
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-fix=
-runtime-capsule-update-flags-checks.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0040-fix-runtime-capsule-update-flags-checks.patc=
h
deleted file mode 100644
index b1d400d7..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-fix-runtim=
e-capsule-update-flags-checks.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From a83aa9e1b8f6e312da82e54614fbca498493c34d Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Thu, 19 Oct 2023 14:56:55 +0100
-Subject: [PATCH] fix runtime capsule update flags checks for corstone100=
0
-
-Fixes capsule update flags checks in capsule update as these checks are =
missing
-in the platform-specific capsule-update implementation in corstone1000.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
----
- lib/efi_loader/efi_capsule.c | 28 ++++++++++++++++++++++++++++
- 1 file changed, 28 insertions(+)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 307bcfd73c..34507482b7 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -854,6 +854,34 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
-			continue;
-		}
-
-+		/* According to UEFI specs when the flag is CAPSULE_FLAGS_PERSIST_ACR=
OSS_RESET,
-+		ScatterGatherList can't be NULL.*/
-+		if ((capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET) &&
-+		    scatter_gather_list =3D=3D 0){
-+			ret =3D EFI_INVALID_PARAMETER;
-+			goto out;
-+		}
-+
-+		/*According to UEFI specs a capsule which has the CAPSULE_FLAGS_POPUL=
ATE_SYSTEM_TABLE
-+		 * flag must have CAPSULE_FLAGS_PERSIST_ACROSS_RESET set in its
-+		 * header as well.*/
-+		if (capsule->flags & CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE){
-+			if(!(capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET)){
-+				ret =3D EFI_INVALID_PARAMETER;
-+				goto out;
-+			}
-+		}
-+
-+		/* According to UEFI specs, a capsule which has the CAPSULE_FLAGS_INI=
TIATE_RESET
-+		 * Flag must have  CAPSULE_FLAGS_PERSIST_ACROSS_RESET set in its
-+		 * header as well.*/
-+		if (capsule->flags & CAPSULE_FLAGS_INITIATE_RESET){
-+			if(!(capsule->flags & CAPSULE_FLAGS_PERSIST_ACROSS_RESET)){
-+				ret =3D EFI_INVALID_PARAMETER;
-+				goto out;
-+			}
-+		}
-+
-		log_debug("Capsule[%d] (guid:%pUs)\n",
-			  i, &capsule->capsule_guid);
-
---
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-sca=
tter-gather-flag-workaround.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0041-scatter-gather-flag-workaround.patch
deleted file mode 100644
index 8ce82a75..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-scatter-ga=
ther-flag-workaround.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From abc3b43996198012498abe5777cfeedde4538a90 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 6 Nov 2023 14:52:05 +0000
-Subject: [PATCH] workaround for scatter gather flag check for corstone10=
00
-
-This workaround passes 1 as scatter_gather_list value to pass the NULL c=
hecks
-for scatter_gather_list while CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag is=
 set
-(which is introduced lately to align with UEFI specs). Since these flag =
checks
-are not implemented in u-boot properly and corstone1000 does not support
-scatter_gather_list during capsule update, this patch will skip the chec=
k only
-for on-disk capsule update.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
----
- lib/efi_loader/efi_capsule.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index a7d70acf2a..efbedce460 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -1530,8 +1530,11 @@ efi_status_t efi_launch_capsules(void)
-		ret =3D efi_capsule_read_file(files[i], &capsule);
-		if (ret =3D=3D EFI_SUCCESS) {
-			#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
--			/* capsule update only supports 1 image and no scatter gather list f=
or corstone1000 */
--			efi_update_capsule(&capsule, 1, 0);
-+			/* capsule update only supports 1 image and use of scatter_gather_li=
st
-+			 * is not implemented for corstone1000 passing 1 to pass
-+			 * the NULL flag checks. This should will be fixed with
-+			 * new capsule update design*/
-+			ret =3D efi_update_capsule(&capsule, 1, 1);
-			#elif
-			ret =3D efi_capsule_update_firmware(capsule);
-			#endif
---
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cor=
stone1000-enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0042-corstone1000-enable-virtio-net-support.patch
deleted file mode 100644
index 58b21a9c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone10=
00-enable-virtio-net-support.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 46a1faf3687764ddf1567455de39482b72e50725 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 15 Nov 2023 16:04:06 +0000
-Subject: [PATCH] corstone1000: enable virtio-net support
-
-Adds virtio-net support in corstone1000-fvp.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- arch/arm/dts/corstone1000-fvp.dts        |  6 ++++++
- board/armltd/corstone1000/corstone1000.c | 24 +++++++++++++++++++++++-
- configs/corstone1000_defconfig           |  2 ++
- 3 files changed, 31 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
-index 26b0f1b3ce..8e54a40113 100644
---- a/arch/arm/dts/corstone1000-fvp.dts
-+++ b/arch/arm/dts/corstone1000-fvp.dts
-@@ -21,6 +21,12 @@
- 		reg-io-width =3D <2>;
- 	};
-=20
-+	virtio: virtio-net@40400000 {
-+		compatible =3D "virtio,mmio";
-+		reg =3D <0x40400000 0x10000>;
-+		interrupts =3D <145>;
-+	};
-+
- 	vmmc_v3_3d: fixed_v3_3d {
- 		compatible =3D "regulator-fixed";
- 		regulator-name =3D "vmmc_supply";
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index e3c0e5bf50..ef74dc9032 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -18,6 +18,7 @@
- #include <dm/platform_data/serial_pl01x.h>
- #include <asm/armv8/mmu.h>
- #include <asm/global_data.h>
-+#include <generated/dt.h>
-=20
- /* remove the DT nodes not needed in Linux */
- DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
-@@ -101,6 +102,14 @@ static struct mm_region corstone1000_mem_map[] =3D =
{
- 		.size =3D 0x80000000UL,
- 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
- 			PTE_BLOCK_INNER_SHARE
-+	}, {
-+		/* ethernet */
-+		.virt =3D 0x40400000UL,
-+			.phys =3D 0x40400000UL,
-+			.size =3D 0x00100000UL,
-+			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				PTE_BLOCK_NON_SHARE |
-+				PTE_BLOCK_PXN | PTE_BLOCK_UXN
- 	}, {
- 		/* List terminator */
- 		0,
-@@ -150,10 +159,23 @@ void fwu_plat_get_bootidx(uint *boot_idx)
- int board_late_init(void)
- {
- 	struct disk_partition part_info;
--	struct udevice *dev, *bdev;
-+	struct udevice *dev, *bdev,*virtio_bus, *virtio_child;;
- 	struct nvmxip_plat *plat;
- 	struct blk_desc *desc;
- 	int ret;
-+	const char *cmp_dtb =3D DEVICE_TREE;
-+
-+	if (!strcmp(cmp_dtb, "corstone1000-fvp")) {
-+		ret =3D uclass_first_device_err(UCLASS_VIRTIO, &virtio_bus);
-+		if (!virtio_bus){
-+			log_err("Cannot find virtio device\n");
-+			return ret;
-+		}
-+		while (virtio_bus) {
-+			device_foreach_child_probe(virtio_child, virtio_bus);
-+			uclass_next_device(&virtio_bus);
-+		}
-+	}
-=20
- 	ret =3D uclass_first_device_err(UCLASS_NVMXIP, &dev);
- 	if (ret < 0) {
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 2de3f5d7b3..8770b474e2 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -78,3 +78,5 @@ CONFIG_DM_GPIO=3Dy
- CONFIG_SYSRESET_PSCI=3Dy
- CONFIG_EFI_SET_TIME=3Dy
- CONFIG_EFI_GET_TIME=3Dy
-+CONFIG_VIRTIO_NET=3Dy
-+CONFIG_VIRTIO_MMIO=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-fir=
mware-psci-Fix-bind_smccc_features-psci-check.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0043-firmware-psci-Fix-bind_smccc_featur=
es-psci-check.patch
deleted file mode 100644
index 946caa24..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-firmware-p=
sci-Fix-bind_smccc_features-psci-check.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fda3d08d17050a8b338ef4288d20389788b5b7e6 Mon Sep 17 00:00:00 2001
-From: Weizhao Ouyang <o451686892@gmail.com>
-Date: Mon, 4 Mar 2024 14:42:40 +0000
-Subject: [PATCH] firmware: psci: Fix bind_smccc_features psci check
-
-Message-ID: <20240304144242.11666-2-o451686892@gmail.com> (raw)
-In-Reply-To: <20240304144242.11666-1-o451686892@gmail.com>
-
-According to PSCI specification DEN0022F, PSCI_FEATURES is used to check
-whether the SMCCC is implemented by discovering SMCCC_VERSION.
-
-Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://lore.kernel.org/all/20240304144242.1=
1666-2-o451686892@gmail.com/]
----
- drivers/firmware/psci.c   | 5 ++++-
- include/linux/arm-smccc.h | 6 ++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
-index c6b9efab41..03544d76ed 100644
---- a/drivers/firmware/psci.c
-+++ b/drivers/firmware/psci.c
-@@ -135,10 +135,13 @@ static int bind_smccc_features(struct udevice *dev=
, int psci_method)
- 	    PSCI_VERSION_MAJOR(psci_0_2_get_version()) =3D=3D 0)
- 		return 0;
-=20
--	if (request_psci_features(ARM_SMCCC_ARCH_FEATURES) =3D=3D
-+	if (request_psci_features(ARM_SMCCC_VERSION) =3D=3D
- 	    PSCI_RET_NOT_SUPPORTED)
- 		return 0;
-=20
-+	if (invoke_psci_fn(ARM_SMCCC_VERSION, 0, 0, 0) < ARM_SMCCC_VERSION_1_1=
)
-+		return 0;
-+
- 	if (psci_method =3D=3D PSCI_METHOD_HVC)
- 		pdata->invoke_fn =3D smccc_invoke_hvc;
- 	else
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index f44e9e8f93..da3d29aabe 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -55,8 +55,14 @@
- #define ARM_SMCCC_QUIRK_NONE		0
- #define ARM_SMCCC_QUIRK_QCOM_A6		1 /* Save/restore register a6 */
-=20
-+#define ARM_SMCCC_VERSION		0x80000000
- #define ARM_SMCCC_ARCH_FEATURES		0x80000001
-=20
-+#define ARM_SMCCC_VERSION_1_0		0x10000
-+#define ARM_SMCCC_VERSION_1_1		0x10001
-+#define ARM_SMCCC_VERSION_1_2		0x10002
-+#define ARM_SMCCC_VERSION_1_3		0x10003
-+
- #define ARM_SMCCC_RET_NOT_SUPPORTED	((unsigned long)-1)
-=20
- #ifndef __ASSEMBLY__
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-cor=
stone1000-set-unique-GUID-for-fvp-and-mps3.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0044-corstone1000-set-unique-GUID-for-fvp-a=
nd-mps3.patch
deleted file mode 100644
index 86b1071c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone10=
00-set-unique-GUID-for-fvp-and-mps3.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 6dc17c01df592f685636e34ad8bb0a6ecb994e15 Mon Sep 17 00:00:00 2001
-From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
-Date: Thu, 21 Mar 2024 20:34:46 +0000
-Subject: [PATCH] corstone1000: set unique GUID for fvp and mps3
-
-This patch sets unique GUID for Corstone1000 FVP and MPS3
-
-Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
-Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
----
- lib/efi_loader/efi_firmware.c | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 7792a6aa83..1e49f79864 100644
---- a/lib/efi_loader/efi_firmware.c
-+++ b/lib/efi_loader/efi_firmware.c
-@@ -16,16 +16,19 @@
-=20
- #include <linux/list.h>
- #include <efi_variable.h>
-+#include <generated/dt.h>
-=20
- #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
-=20
- #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
- /* Firmware GUID */
--#define EFI_CORSTONE1000_FIRMWARE_GUID \
-+#define EFI_CORSTONE1000_FIRMWARE_GUID_FVP \
- 	EFI_GUID(0x989f3a4e, 0x46e0, 0x4cd0, 0x98, 0x77, \
- 		 0xa2, 0x5c, 0x70, 0xc0, 0x13, 0x29)
-=20
--efi_guid_t corstone1000_firmware_guid =3D EFI_CORSTONE1000_FIRMWARE_GUI=
D;
-+#define EFI_CORSTONE1000_FIRMWARE_GUID_MPS3 \
-+	EFI_GUID(0xdf1865d1, 0x90fb, 0x4d59, 0x9c, 0x38, \
-+		 0xc9, 0xf2, 0xc1, 0xbb, 0xa8, 0xcc)
-=20
- static efi_status_t efi_corstone1000_img_info_get (
- 	efi_uintn_t *image_info_size,
-@@ -334,6 +337,14 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
- 	u16 **package_version_name)
- {
- 	efi_status_t ret;
-+	efi_guid_t corstone1000_firmware_guid;
-+	const char *cmp_dtb =3D DEVICE_TREE;
-+=09
-+	if (!strcmp(cmp_dtb, "corstone1000-fvp")) {
-+		corstone1000_firmware_guid =3D (efi_guid_t)EFI_CORSTONE1000_FIRMWARE_=
GUID_FVP;
-+	} else {
-+		corstone1000_firmware_guid =3D (efi_guid_t)EFI_CORSTONE1000_FIRMWARE_=
GUID_MPS3;
-+	}
-=20
- 	EFI_ENTRY("%p %p %p %p %p %p %p %p\n", this,
- 		  image_info_size, image_info,
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi=
-corstone1000-fwu-update-RPC-ABI.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0045-efi-corstone1000-fwu-update-RPC-ABI.patch
deleted file mode 100644
index 00fc1f07..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi-corsto=
ne1000-fwu-update-RPC-ABI.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 7c25404d64ef8efec63c154ce38b0bb38845680f Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Tue, 5 Dec 2023 20:23:55 +0100
-Subject: [PATCH] efi: corstone1000: fwu: update RPC ABI
-
-The Trusted Services RPC protocol format changed: the
-data has to be placed in w3 and the memory handle has
-to be placed in w4-w5.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- lib/efi_loader/efi_capsule.c | 14 +++++++++++---
- lib/efi_loader/efi_setup.c   | 14 +++++++++++---
- 2 files changed, 22 insertions(+), 6 deletions(-)
-
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index f3326b1f67..1d966e3f26 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -790,12 +790,20 @@ static int __efi_runtime efi_corstone1000_buffer_r=
eady_event(u32 capsule_image_s
- 	}
-=20
- 	/*
--	 * setting the buffer ready event arguments in register w4:
-+	 * setting the buffer ready event arguments in register w3:
- 	 * - capsule update interface ID (31:16)
- 	 * - the buffer ready event ID (15:0)
- 	 */
--	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
--		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
-+	msg.data0 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w3 */
-+
-+	/*
-+	 * setting the memory handle fields to
-+	 * FFA_MEM_HANDLE_INVALID (0xFFFF_FFFF_FFFF_FFFF)
-+	 * to signal that there is no shared memory used
-+	*/
-+	msg.data1 =3D 0xFFFFFFFF;	/* w4 */
-+	msg.data2 =3D 0xFFFFFFFF; /* w5 */
-=20
- 	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
- }
-diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index d20568c1c8..c31e74532f 100644
---- a/lib/efi_loader/efi_setup.c
-+++ b/lib/efi_loader/efi_setup.c
-@@ -157,12 +157,20 @@ static int efi_corstone1000_uboot_efi_started_even=
t(void)
- 	}
-=20
- 	/*
--	 * setting the kernel started  event arguments:
-+	 * setting the kernel started  event arguments in register w3::
- 	 * setting capsule update interface ID(31:16)
- 	 * the kernel started event ID(15:0)
- 	 */
--	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
--			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
-+	msg.data0 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w3 */
-+
-+	/*
-+	 * setting the memory handle fields to
-+	 * FFA_MEM_HANDLE_INVALID (0xFFFF_FFFF_FFFF_FFFF)
-+	 * to signal that there is no shared memory used
-+	*/
-+	msg.data1 =3D 0xFFFFFFFF;	/* w4 */
-+	msg.data2 =3D 0xFFFFFFFF; /* w5 */
-=20
- 	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-Cor=
stone1000-Change-MMCOMM-buffer-location.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0046-Corstone1000-Change-MMCOMM-buffer-locatio=
n.patch
deleted file mode 100644
index 500db81e..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-Corstone10=
00-Change-MMCOMM-buffer-location.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7721d33dfc87b40db72cefa399c46b25b1255247 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 3 Apr 2024 14:02:42 +0100
-Subject: [PATCH] Corstone1000: Change MMCOMM buffer location
-
-MM Communicate buffer is accessed by normal world but at the moment
-it's allocated in the secure ram. This moves mm communicate buffer
-to the DDR and also fixes the capsule buffer size since it cannot be
-more than the bank size.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- configs/corstone1000_defconfig | 2 +-
- include/configs/corstone1000.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 8770b474e2..ae164be030 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -62,7 +62,7 @@ CONFIG_NVMXIP_QSPI=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
- CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
--CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
-+CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x81FFF000
- CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
- CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
- CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 8622565a87..fe5b064c85 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -31,7 +31,7 @@
- #define PREP_SEPROXY_EVT(x)	(FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
-=20
- /* Size in 4KB pages of the EFI capsule buffer */
--#define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
-+#define CORSTONE1000_CAPSULE_BUFFER_SIZE	(4096) /* 16 MB */
-=20
- /* Capsule GUID */
- #define EFI_CORSTONE1000_CAPSULE_ID_GUID \
---=20
-2.25.1
-
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-cor=
stone1000-dts-add-external-system-node.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0047-corstone1000-dts-add-external-system-node.=
patch
deleted file mode 100644
index 1c873001..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-corstone10=
00-dts-add-external-system-node.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 03df80671f1f2102b04baa810b59ffb6edaece0b Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 18 Mar 2024 17:00:56 +0000
-Subject: [PATCH] corstone1000: dts: add external system node
-
-add the external system node
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- arch/arm/dts/corstone1000.dtsi | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 077673dd44..5cc4c26bac 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -122,6 +122,13 @@
- 		interrupt-parent =3D <&gic>;
- 		ranges;
-=20
-+		extsys0: remoteproc@1a010310 {
-+			compatible =3D "arm,corstone1000-extsys";
-+			reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
-+			reg-names =3D "reset-control", "reset-status";
-+			firmware-name =3D "es_flashfw.elf";
-+		};
-+
- 		timer@1a220000 {
- 			compatible =3D "arm,armv7-timer-mem";
- 			reg =3D <0x1a220000 0x1000>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-cor=
stone1000-Enable-UEFI-Secure-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0048-corstone1000-Enable-UEFI-Secure-boot.patch
deleted file mode 100644
index 1e91249a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone10=
00-Enable-UEFI-Secure-boot.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b2ef7318686d13cfa2ac76d6f2d69c17135328df Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 11 Apr 2024 13:35:54 +0000
-Subject: [PATCH] corstone1000: Enable UEFI Secure boot
-
-Enable secure boot and related configurations for corstone1000
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- configs/corstone1000_defconfig | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 8770b474e2..0ecba096d5 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -80,3 +80,7 @@ CONFIG_EFI_SET_TIME=3Dy
- CONFIG_EFI_GET_TIME=3Dy
- CONFIG_VIRTIO_NET=3Dy
- CONFIG_VIRTIO_MMIO=3Dy
-+CONFIG_EFI_SECURE_BOOT=3Dy
-+CONFIG_FIT_SIGNATURE=3Dy
-+CONFIG_EFI_LOADER=3Dy
-+CONFIG_CMD_NVEDIT_EFI=3Dy
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-cor=
stone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch b/meta-arm-bsp/reci=
pes-bsp/u-boot/u-boot/corstone1000/0049-corstone1000-Add-secondary-cores-=
cpu-nodes-for-FVP.patch
deleted file mode 100644
index 0e90f577..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-corstone10=
00-Add-secondary-cores-cpu-nodes-for-FVP.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 68708d6b4953f58a0484b9a83efa8318747cea80 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 9 May 2024 14:16:55 +0000
-Subject: [PATCH] arm: dts: corstone1000: enable secondary cores for FVP
-
-Add the secondary cores nodes in the dts file
-
-Upstream-Status: Submitted [https://lore.kernel.org/all/20240612100421.4=
7938-1-harsimransingh.tungal@arm.com/]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- arch/arm/dts/corstone1000-fvp.dts | 25 +++++++++++++++++++++++++
- arch/arm/dts/corstone1000.dtsi    |  2 +-
- 2 files changed, 26 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
-index 26b0f1b3ce..3076fb9f34 100644
---- a/arch/arm/dts/corstone1000-fvp.dts
-+++ b/arch/arm/dts/corstone1000-fvp.dts
-@@ -49,3 +49,28 @@
- 		clock-names =3D "smclk", "apb_pclk";
- 	};
- };
-+
-+&cpus {
-+	cpu1: cpu@1 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35";
-+		reg =3D <0x1>;
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+	cpu2: cpu@2 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35";
-+		reg =3D <0x2>;
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+	cpu3: cpu@3 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35";
-+		reg =3D <0x3>;
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+};
-+
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 1e0ec075e4..5d9d95b21c 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -21,7 +21,7 @@
- 		stdout-path =3D "serial0:115200n8";
- 	};
-=20
--	cpus {
-+	cpus: cpus {
- 		#address-cells =3D <1>;
- 		#size-cells =3D <0>;
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-fwu=
-Use-metadata-v2.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1=
000/0050-fwu-Use-metadata-v2.patch
deleted file mode 100644
index 4388db44..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-fwu-Use-me=
tadata-v2.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 54b407fc74c9989c72ab7a571395d8793b409514 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 3 Jul 2024 16:38:22 +0200
-Subject: [PATCH] fwu: Use metadata v2
-
-The mdata structure was modified to use the v2 and did the minimal
-necessarry changes to make it build without errors. This way the=20
-U-Boot metadata is aligned with the TF-A and TF-M structs.
-
-Upstream-Status: Inappropriate
-[This is done correctly upstream but using the upstream patches would
-require too many backported patches. The merge commit of the upstream
-changes is 7e52d6ccfb76e2afc2d183b357abe2a2e2f948cf.]
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- cmd/fwu_mdata.c       |  2 +-
- include/fwu_mdata.h   | 17 ++++++++++++++++-
- lib/fwu_updates/fwu.c |  8 ++++----
- 3 files changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/cmd/fwu_mdata.c b/cmd/fwu_mdata.c
-index f04af27de6..73374dca8b 100644
---- a/cmd/fwu_mdata.c
-+++ b/cmd/fwu_mdata.c
-@@ -27,7 +27,7 @@ static void print_mdata(struct fwu_mdata *mdata)
-=20
- 	printf("\tImage Info\n");
- 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
--		img_entry =3D &mdata->img_entry[i];
-+		img_entry =3D &mdata->fw_desc.img_entry[i];
- 		printf("\nImage Type Guid: %pUL\n",
- 		       &img_entry->image_type_uuid);
- 		printf("Location Guid: %pUL\n", &img_entry->location_uuid);
-diff --git a/include/fwu_mdata.h b/include/fwu_mdata.h
-index c61221a917..6a0eb7dce9 100644
---- a/include/fwu_mdata.h
-+++ b/include/fwu_mdata.h
-@@ -40,6 +40,16 @@ struct fwu_image_entry {
- 	struct fwu_image_bank_info img_bank_info[CONFIG_FWU_NUM_BANKS];
- } __packed;
-=20
-+struct fwu_fw_store_desc {
-+	uint8_t  num_banks;
-+	uint8_t  reserved;
-+	uint16_t num_images;
-+	uint16_t img_entry_size;
-+	uint16_t bank_info_entry_size;
-+
-+	struct fwu_image_entry img_entry[CONFIG_FWU_NUM_IMAGES_PER_BANK];
-+} __packed;
-+
- /**
-  * struct fwu_mdata - FWU metadata structure for multi-bank updates
-  * @crc32: crc32 value for the FWU metadata
-@@ -60,8 +70,13 @@ struct fwu_mdata {
- 	uint32_t version;
- 	uint32_t active_index;
- 	uint32_t previous_active_index;
-+	uint32_t metadata_size;
-+	uint16_t desc_offset;
-+	uint16_t reserved1;
-+	uint8_t  bank_state[4];
-+	uint32_t reserved2;
-=20
--	struct fwu_image_entry img_entry[CONFIG_FWU_NUM_IMAGES_PER_BANK];
-+	struct fwu_fw_store_desc fw_desc;
- } __packed;
-=20
- #endif /* _FWU_MDATA_H_ */
-diff --git a/lib/fwu_updates/fwu.c b/lib/fwu_updates/fwu.c
-index 5313d07302..488c9cc661 100644
---- a/lib/fwu_updates/fwu.c
-+++ b/lib/fwu_updates/fwu.c
-@@ -131,7 +131,7 @@ static int in_trial_state(struct fwu_mdata *mdata)
- 	struct fwu_image_bank_info *img_bank_info;
-=20
- 	active_bank =3D mdata->active_index;
--	img_entry =3D &mdata->img_entry[0];
-+	img_entry =3D &mdata->fw_desc.img_entry[0];
- 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
- 		img_bank_info =3D &img_entry[i].img_bank_info[active_bank];
- 		if (!img_bank_info->accepted) {
-@@ -418,8 +418,8 @@ int fwu_get_image_index(u8 *image_index)
- 	 */
- 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
- 		if (!guidcmp(&image_type_id,
--			     &mdata.img_entry[i].image_type_uuid)) {
--			img_entry =3D &mdata.img_entry[i];
-+			     &mdata.fw_desc.img_entry[i].image_type_uuid)) {
-+			img_entry =3D &mdata.fw_desc.img_entry[i];
- 			img_bank_info =3D &img_entry->img_bank_info[update_bank];
- 			image_guid =3D &img_bank_info->image_uuid;
- 			ret =3D fwu_plat_get_alt_num(dev, image_guid, &alt_num);
-@@ -512,7 +512,7 @@ static int fwu_clrset_image_accept(efi_guid_t *img_t=
ype_id, u32 bank, u8 action)
- 	if (ret)
- 		return ret;
-=20
--	img_entry =3D &mdata.img_entry[0];
-+	img_entry =3D &mdata.fw_desc.img_entry[0];
- 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
- 		if (!guidcmp(&img_entry[i].image_type_uuid, img_type_id)) {
- 			img_bank_info =3D &img_entry[i].img_bank_info[bank];
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-cor=
stone1000-purge-remoteproc-dts-node.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0051-corstone1000-purge-remoteproc-dts-node.patch
deleted file mode 100644
index 3b0430c8..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-corstone10=
00-purge-remoteproc-dts-node.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4e0ab7af882fcf498fd8beb4024ea024e6464cef Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Wed, 14 Aug 2024 14:33:50 +0000
-Subject: [PATCH] corstone1000: purge remoteproc DTS node
-
-Purge remoteproc DTS node
-This is done to remove the remote proc node from the DTS passed
-to Linux from U-Boot because the device tree binding for remoteproc
-has not been upstreamed yet. Existence of remoteproc DTS node in Linux=20
-is causing dt-schema test for SystemReady-IR v2.0 certification to fail.
-
-Upstream-Status: Pending
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- board/armltd/corstone1000/corstone1000.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index ef74dc9032..d474fce1b2 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -30,8 +30,7 @@ DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
- 	{ .node_path =3D "/soc/mhu@1b010000" },
- 	{ .node_path =3D "/soc/mhu@1b020000" },
- 	{ .node_path =3D "/soc/mhu@1b030000" },
--	{ .node_path =3D "/soc/client" },
--	{ .node_path =3D "/soc/extsys@1A010310" },
-+	{ .node_path =3D "/soc/remoteproc@1a010310" },
- };
-=20
- #define CORSTONE1000_KERNEL_PARTS 2
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-res=
erve-memory-for-se-comm.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/co=
rstone1000/0052-reserve-memory-for-se-comm.patch
deleted file mode 100644
index 73fdc4bd..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-reserve-me=
mory-for-se-comm.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 8fdd91630f335b71e55e570a011f07b083c47dd6 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 10 Jul 2023 19:00:43 +0100
-Subject: [PATCH] arm-bsp/u-boot: Reserve memory for RSS comm pointer acc=
ess protocol
-
-This memory was used by OpenAMP to establish communication between
-the Secure Enclave and Trusted Services. After transitioning from
-OpenAMP to RSE_COMMS, this shared memory is now configured for the
-pointer access protocol in RSE_COMMS.
-
-Since this memory may be still used by a user-space application
-in linux as U-Boot is passing an EFI memory map starting from
-0x80000000, this memory range should be reserved as the
-pointer access protocol may be enabled on corstone1000 in the future.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
----
- arch/arm/dts/corstone1000.dtsi | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 0f8ad255ce..a71b89c025 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -45,6 +45,17 @@
- 		lba =3D <65536>;
- 	};
-=20
-+	reserved-memory {
-+		#address-cells =3D <2>;
-+		#size-cells =3D <2>;
-+		ranges;
-+
-+		smem_mem: smem_region@88000000 {
-+			reg =3D <0x0 0x88000000 0x0 0x100000>;
-+			no-map;
-+		};
-+	};
-+
- 	gic: interrupt-controller@1c000000 {
- 		compatible =3D "arm,gic-400";
- 		#interrupt-cells =3D <3>;
---=20
-2.17.1

