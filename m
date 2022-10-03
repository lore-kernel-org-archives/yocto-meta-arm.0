Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9293FC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51.1664802066229384133
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F2CE16F8;
	Mon,  3 Oct 2022 06:01:12 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62FD53F73B;
	Mon,  3 Oct 2022 06:01:04 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 00/12] corstone1000: upgrades for FF-A, Optee, TS
Date: Mon,  3 Oct 2022 14:00:39 +0100
Message-Id: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3894

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This patchset provides the followig new features:

- The latest FF-A u-boot driver patchset sent to the u-boot mailing list
- Optee v3.18
- Use the new Trusted Services design
- Dropping secure partitions recipe

Cheers,
Abdellatif

Abdellatif El Khlifi (12):
  arm-bsp/u-boot: corstone1000: update initramfs bundle size
  arm-bsp/u-boot: corstone1000: upgrade FF-A support
  arm-bsp/optee-os: corstone1000: upgrade to v3.18
  arm-bsp/optee-spdevkit: corstone1000: drop the support
  arm-bsp/corstone1000-initramfs-image: remove obsolete packages
  arm-bsp/trusted-services: corstone1000: add secure partitions support
  arm-bsp/machine: corstone1000: disable pulling the kernel into the
    initramfs
  arm-bsp/trusted-services: corstone1000: add MHU-driver
  arm-bsp/corstone1000-initramfs-image: add TS PSA API tests packages
  arm-bsp/linux: corstone1000: use arm-ffa machine feature
  arm/secure-partitions: drop use of the recipe
  arm/ffa-debugfs: drop use of the kernel module

 .../conf/machine/include/corstone1000.inc     |   17 +-
 .../images/corstone1000-initramfs-image.bb    |    9 +-
 ...d-add-load-command-for-memory-mapped.patch |   19 +-
 ...add-support-to-corstone1000-platform.patch |   29 +-
 ...3-usb-common-move-urb-code-to-common.patch |   27 +-
 .../0004-usb-add-isp1760-family-driver.patch  |   33 +-
 ...ne1000-enable-isp1763-usb-controller.patch |   11 +-
 ...support-for-SMCCCv1.2-x0-x17-registe.patch |  204 ++
 ...ntroducing-Arm-FF-A-low-level-driver.patch | 2610 -----------------
 ...ear-the-Xn-registers-after-SMC-calls.patch |   59 +
 ...troducing-MM-communication-with-FF-A.patch |  383 ---
 ...oduce-be_uuid_str_to_le_bin-function.patch |  127 +
 ...-introduce-Arm-FF-A-low-level-driver.patch | 2245 ++++++++++++++
 ...troducing-test-module-for-UCLASS_FFA.patch |  132 -
 ...10-arm_ffa-introduce-armffa-command.patch} |  158 +-
 ...fa-introduce-the-FF-A-Sandbox-driver.patch | 1185 ++++++++
 ...ce-Sandbox-test-cases-for-UCLASS_FFA.patch |  455 +++
 ...ntroduce-armffa-command-Sandbox-test.patch |   94 +
 ...e-sure-shared-buffer-contents-are-no.patch |   52 -
 ..._ffa-introduce-FF-A-MM-communication.patch |  540 ++++
 ...tone1000-enable-FF-A-and-MM-support.patch} |   32 +-
 ...ne1000-introduce-EFI-capsule-update.patch} |   83 +-
 ...00-Update-FFA-shared-buffer-address.patch} |   17 +-
 ...00-fix-unrecognized-filesystem-type.patch} |    9 +-
 ...-the-cast-when-using-binary-OR-on-FI.patch |   40 -
 .../0019-Use-correct-buffer-size.patch        |   40 -
 ...one1000-pass-interface-id-and-buffe.patch} |   31 +-
 ...tone1000-pass-interface-id-and-kern.patch} |   27 +-
 ...ne1000-remove-guid-check-from-corst.patch} |   13 +-
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |   11 +-
 ...add-get_image_info-for-corstone1000.patch} |   12 +-
 ...ootcomplete-message-to-secure-encla.patch} |   88 +-
 ...ll-pointer-exception-with-get_image.patch} |    9 +-
 ...26-arm-corstone1000-add-mmc-for-fvp.patch} |   17 +-
 ...orstone1000-use-a-compressed-kernel.patch} |   18 +-
 ...-external-sys-driver-to-device-tree.patch} |    4 +-
 ...-rpmsg-client-to-u-boot-device-tree.patch} |    4 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   58 +-
 .../linux/files/corstone1000/defconfig        |    1 -
 .../linux/linux-arm-platforms.inc             |    1 +
 ...rstone1000-add-corstone1000-platform.patch |  209 --
 ...000-reserve-3MB-CVM-memory-for-optee.patch |   31 -
 ...0-add-a-rule-in-Makefile-to-SP_MAKEF.patch |   39 -
 ...ne1000-increase-OPTEE-core-heap-size.patch |   30 -
 ...d-missing-error-check-during-SP-init.patch |   41 -
 ...ow-setting-sysroot-for-libgcc-lookup.patch |   35 -
 ...0007-allow-setting-sysroot-for-clang.patch |   30 -
 .../0008-no-warn-rwx-segments.patch           |   65 -
 .../corstone1000/sp_manifest_combined_se.dts  |   62 -
 .../optee/optee-os-corstone1000-common.inc    |   24 +-
 .../optee/optee-os-corstone1000.inc           |   20 -
 .../optee/optee-os_3.10.0.bbappend            |    6 -
 .../optee/optee-os_3.18.0.bbappend            |    1 +
 .../optee/optee-spdevkit-corstone1000.inc     |    1 -
 .../optee/optee-spdevkit_3.10.0.bbappend      |    1 -
 ...corstone1000-platform-to-drivers-arm.patch |   36 +
 .../0027-Add-MHU-driver.patch}                |   74 +-
 ...on-applying-lowercase-project-conven.patch |   33 -
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch |   32 -
 ...0003-corstone1000-port-crypto-config.patch |  234 --
 ...proxy-dts-add-se-proxy-as-child-node.patch |   46 -
 ...te-mm-comm-buffer-region-in-dts-file.patch |   59 -
 .../0005-Configure-NV-storage-macro.patch     |   26 -
 .../corstone1000/0006-Use-device-region.patch |   53 -
 ...7-Add-openamp-to-SE-proxy-deployment.patch |  259 --
 .../0009-Add-openamp-rpc-caller.patch         | 1197 --------
 ...-add-psa-client-definitions-for-ff-m.patch |  299 --
 ...mon-service-component-to-ipc-support.patch |  295 --
 .../0012-Add-secure-storage-ipc-backend.patch |  523 ----
 ...storage-ipc-and-openamp-for-se_proxy.patch |   63 -
 ...d-uefi-variable-append-write-support.patch | 1162 --------
 ...riable-support-for-QueryVariableInfo.patch |  830 ------
 .../0016-Add-uefi-test-deployment.patch       |  248 --
 ...-parameter-setting-in-sp-ffarpc_call.patch |   33 -
 ...-call-requests-with-no-shared-buffer.patch |  109 -
 .../corstone1000/0019-Run-psa-arch-test.patch |   86 -
 ...0020-Use-address-instead-of-pointers.patch |  169 --
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  267 --
 ...d-as-openamp-rpc-using-secure-storag.patch |  164 --
 .../0023-add-psa-ipc-crypto-backend.patch     | 2586 ----------------
 ...MM-gateway-UEFI-variable-macro-value.patch |   34 -
 ...ub-capsule-update-service-components.patch |  436 ---
 ...-logs-to-functions-in-SMM-gateway-SP.patch |  248 --
 .../0027-Configure-storage-size.patch         |   41 -
 ...d-uefi-variable-append-write-support.patch | 1219 --------
 ...-Change-UID-of-variable-index-in-SMM.patch |   31 -
 ...-Add-missing-features-to-setVariable.patch |   73 -
 ...rameter-check-in-getNextVariableName.patch |   55 -
 ...teway-add-checks-for-null-attributes.patch |   81 -
 .../0033-Enhance-mbedtls-fetch-process.patch  |  258 --
 ...x-format-specifier-in-logging_caller.patch |   41 -
 ...for-mbedtls-and-psa-arch-tests-for-v.patch |   64 -
 ...n-verify-message-and-hash-operations.patch | 1080 -------
 ...nst-uninitialised-multi-part-transac.patch |  123 -
 ...038-Integrate-AEAD-operation-support.patch |  521 ----
 ...eration-to-one-shot-cipher-operation.patch |   96 -
 ...-Fix-multi-part-termination-on-error.patch |  241 --
 ...tion-if-client-provided-buffer-is-to.patch |   49 -
 ...g-to-updated-t_cose-version-fc3a4b2c.patch |   94 -
 .../0043-pass-sysroot_yocto.patch             |  110 -
 ...face-structure-aligned-with-tf-m-cha.patch |   29 -
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ----
 ...et_key_usage_flags-definition-to-the.patch |   40 -
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  120 -
 ...-UEFI-get_variable-with-small-buffer.patch |  407 ---
 ...mic-outline-to-fix-build-for-opemamp.patch |   44 -
 .../trusted-services/ts-corstone1000.inc      |  131 +-
 ...s_%.bbappend => ts-sp-se-proxy_%.bbappend} |    0
 .../ts-sp-smm-gateway_%.bbappend              |    4 +
 .../ffa-debugfs/ffa-debugfs-mod_2.1.0.bb      |   41 -
 .../files/0001-build-add-Yocto-support.patch  |   79 -
 ...-loading-the-driver-in-a-generic-way.patch |   46 -
 .../trusted-services/secure-partitions.inc    |   27 -
 .../trusted-services/secure-partitions_git.bb |   74 -
 114 files changed, 5346 insertions(+), 19467 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-introducing-MM-communication-with-FF-A.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0007-arm_ffa-introducing-armffa-command.patch => 0010-arm_ffa-introduce-armffa-command.patch} (72%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_ffa-introduce-FF-A-MM-communication.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0010-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch => 0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch} (65%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0011-efi-corstone1000-introduce-EFI-capsule-update.patch => 0016-efi-corstone1000-introduce-EFI-capsule-update.patch} (82%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0012-corstone1000-Update-FFA-shared-buffer-address.patch => 0017-corstone1000-Update-FFA-shared-buffer-address.patch} (72%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0014-arm-corstone1000-fix-unrecognized-filesystem-type.patch => 0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch} (76%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0015-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch => 0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch} (73%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch => 0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch} (65%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch => 0021-efi_loader-corstone1000-remove-guid-check-from-corst.patch} (79%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch => 0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch} (75%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0021-efi_firmware-add-get_image_info-for-corstone1000.patch => 0023-efi_firmware-add-get_image_info-for-corstone1000.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch => 0024-efi_loader-send-bootcomplete-message-to-secure-encla.patch} (69%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-efi_loader-fix-null-pointer-exception-with-get_image.patch => 0025-efi_loader-fix-null-pointer-exception-with-get_image.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0024-arm-corstone1000-add-mmc-for-fvp.patch => 0026-arm-corstone1000-add-mmc-for-fvp.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0025-corstone1000-use-a-compressed-kernel.patch => 0027-corstone1000-use-a-compressed-kernel.patch} (66%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-Introduce-external-sys-driver-to-device-tree.patch => 0028-Introduce-external-sys-driver-to-device-tree.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch => 0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch} (97%)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch
 rename meta-arm-bsp/recipes-security/trusted-services/{secure-partitions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch => corstone1000/0027-Add-MHU-driver.patch} (94%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-conven.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0005-Configure-NV-storage-macro.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0006-Use-device-region.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0009-Add-openamp-rpc-caller.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0011-Add-common-service-component-to-ipc-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0012-Add-secure-storage-ipc-backend.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0014-Add-uefi-variable-append-write-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0016-Add-uefi-test-deployment.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0019-Run-psa-arch-test.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0020-Use-address-instead-of-pointers.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0023-add-psa-ipc-crypto-backend.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0025-Add-stub-capsule-update-service-components.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0027-Configure-storage-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0030-Add-missing-features-to-setVariable.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_yocto.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0048-Fix-UEFI-get_variable-with-small-buffer.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch
 rename meta-arm-bsp/recipes-security/trusted-services/{secure-partitions_%.bbappend => ts-sp-se-proxy_%.bbappend} (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
 delete mode 100644 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
 delete mode 100644 meta-arm/recipes-kernel/ffa-debugfs/files/0001-build-add-Yocto-support.patch
 delete mode 100644 meta-arm/recipes-kernel/ffa-debugfs/files/0002-script-loading-the-driver-in-a-generic-way.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions.inc
 delete mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions_git.bb

-- 
2.17.1


