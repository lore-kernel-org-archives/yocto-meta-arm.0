Return-Path: <Ahmed.Gomaa@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295D8C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:53:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3490.1790157209070697683
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 02:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ELqzFiUt;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ahmed.gomaa@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0162E152B;
	Wed, 23 Sep 2026 02:53:25 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081C53F86F;
	Wed, 23 Sep 2026 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790157208; bh=9CfiPK1lMlLpswDSyL6mpCirGPXyeVxZuRnzjPMcmjo=;
	h=From:To:Cc:Subject:Date:From;
	b=ELqzFiUtfZ5FWgwSfh5nnfIK2nKegCFFK9q+u9jDF8GfoNZU9svdRYBua+A7ayJoR
	 HPVbeBhHAD8ilbil2nGvXx+7J/DyDvciCS+LRwBSuz9RNu6P4zs+JnIFpmc+dUVn8c
	 occPYCjhiAtNhhv7Oy7snBUGO/zXEXcFUAtq7Y0M=
From: Ahmed Gomaa <ahmed.gomaa@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ahmed Gomaa <ahmed.gomaa@arm.com>
Subject: [PATCH 0/3] corstone1000: bump Trusted Firmware-M to 2.3.0
Date: Wed, 23 Sep 2026 10:53:11 +0100
Message-ID: <20260923095314.382668-1-ahmed.gomaa@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7170

This series updates Corstone-1000 and Corstone-1000-A320 to
Trusted Firmware-M 2.3.0.

It updates the native signing tools and image-signing class for
TF-M 2.3's Python packaging and PSA key-ID requirements, removes
obsolete downstream patches, and refreshes the retained patches.

It also adds a Secure Debug workaround to avoid the provisioning
reset after ADAC authentication, together with documentation updates.
The workaround is enabled only for Secure Debug builds.

Testing:
- CI was run for Corstone-1000 FVP, A320 FVP, and MPS3 and passed
- On MPS3 hardware, ADAC authentication succeeded and boot
  continued in CM. Both Cortex-M0+ and Cortex-A35 cores could
  be halted and resumed.

Ahmed Gomaa (3):
  arm/trusted-firmware-m: add TF-M 2.3 signing support
  arm-bsp/trusted-firmware-m: corstone1000: bump to 2.3.0
  arm-bsp/trusted-firmware-m: corstone1000: avoid provisioning reset

 .../conf/machine/include/corstone1000.inc     |    4 +-
 .../corstone1000-a320/topics/user-guide.md    |    2 +-
 .../documentation/corstone1000/user-guide.rst |  143 +-
 .../corstone1000-flash-firmware-image.bb      |    1 +
 ...f-cc312-differences-between-fvp-and.patch} |    0
 ...ware-m-disable-address-warnings-into.patch |   25 -
 ...nable-different-DRBG-configurations.patch} |    0
 ...tform-CS1000-Remove-unused-BL1-files.patch |  449 --
 ...e1000-Fix-BL1-compiler-switch-and-re.patch |   43 -
 ...-1000-secure-debug-waiting-in-CM-LCS.patch |   90 +
 ...004-Workaround-compile-errors-in-AES.patch |   30 +
 ...rm-Corstone1000-Enable-FWU-partition.patch |   33 -
 ...-plat-cs1k-Removed-unused-variables.patch} |   13 +-
 ...e1000-Implement-Bootloader-Abstracti.patch | 5067 -----------------
 ...nt-of-GUIDs-in-unittests-more-clear.patch} |    0
 ...m-Corstone1000-Increase-buffer-sizes.patch |   46 -
 ...rovide-macro-identifying-free-space.patch} |    0
 ...e1000-Remove-duplicate-configuration.patch |   31 -
 ...-Add-operation-to-duplicate-entries.patch} |    0
 ...vely-erase-blocks-when-moving-parti.patch} |    0
 ...0-Add-support-for-Cortex-A320-varian.patch |  487 --
 ... 0010-lib-gpt-Clarify-API-operation.patch} |    0
 ...0-Remove-psa_adac_to_tfm_apply_permi.patch |   48 -
 ...pt-Add-metadata-only-API-operations.patch} |    0
 ...-1000-secure-debug-waiting-in-CM-LCS.patch |   53 -
 ...lat-cs1k-Add-flash-erase-protection.patch} |    0
 ...adjust-CS1000-platform-for-GCC-v14.2.patch |  147 -
 ...unused-FWU-partitions-upon-version-.patch} |    0
 ...014-Workaround-compile-errors-in-AES.patch |   48 -
 ...at-cs1k-Duplicate-old-images-in-FWU.patch} |    0
 ...d-barrier-before-first-AO-lock-write.patch |   41 -
 ...one1000-Increase-FIP-partition-size.patch} |    0
 ...ke-mutlicore-support-platform-generi.patch |   90 -
 ...one1000-Optionally-skip-provisioning.patch |   68 +
 ...-lib-efi_guid-Added-EFI-GUID-library.patch |  217 -
 ...b-efi_soft_crc-Added-EFI-CRC-library.patch |  136 -
 ...emented-generic-GPT-parser-for-flash.patch | 1495 -----
 ...-how-GPT-partition-can-be-identified.patch |  308 -
 ...dded-operations-to-modify-partitions.patch |  961 ----
 ...ib-gpt-Added-operation-to-move-entry.patch |  374 --
 ...ility-to-create-and-remove-partition.patch |  713 ---
 ...pt-Added-table-validation-operations.patch |  412 --
 ...-gpt-Added-defragmentation-operation.patch |  280 -
 .../0026-lib-GPT-Fix-cppcheck-warnings.patch  |   74 -
 ...uid-Remove-unecessary-include-folder.patch |   28 -
 ...lib-efi_guid-Correct-included-folder.patch |   28 -
 ...i_soft_crc-Correct-include-directory.patch |   25 -
 ...030-lib-gpt-Add-missing-link-library.patch |   27 -
 ...1-lib-gpt-Correct-variable-name-used.patch |   24 -
 ...32-lib-gpt-Correct-include-directory.patch |   27 -
 ...t-Move-contents-of-CMake-config-file.patch |   51 -
 ...34-plat-cs1k-Fixed-formatting-errors.patch |  261 -
 ...plat-cs1k-Fixed-bad-function-returns.patch |   40 -
 ...at-cs1k-Improved-logging-in-function.patch |   48 -
 ...038-plat-cs1k-Remove-unused-function.patch |   93 -
 ...039-plat-cs1k-Reduce-BL1-binary-size.patch |  464 --
 ...-plat-cs1k-Update-license-identifier.patch |   35 -
 ...-cs1k-Changed-to-use-new-GPT-library.patch | 4536 ---------------
 ...s1k-Move-variable-from-stack-to-data.patch |   55 -
 ...eate-and-remove-FWU-image-partitions.patch |  521 --
 ...ive-host-base-addresses-from-offsets.patch |  111 -
 ...NPU-via-external-system-reset-contro.patch |   75 -
 ...pt-Fix-final-entry-not-being-removed.patch |  114 -
 ...lib-gpt-Replace-warnings-with-errors.patch |   37 -
 ...-gpt-Enforce-entry-size-of-128-bytes.patch |  268 -
 ...Ensure-block-size-complies-with-spec.patch |   38 -
 ...0050-lib-gpt-Expand-table-validation.patch |  352 --
 .../0001-Build-Fix-compiler-warnings.patch    |  151 -
 ...-Fix-psa_key_handle_t-initialization.patch |   32 -
 ...te-psa_adac_psa_crypto-dependencies.patch} |    0
 .../trusted-firmware-m-corstone1000.inc       |   84 +-
 meta-arm/classes/tfm_sign_image.bbclass       |   18 +-
 ...trusted-firmware-m-scripts-native_2.3.0.bb |   21 +
 73 files changed, 360 insertions(+), 19133 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-CC312-alignment-of-cc312-differences-between-fvp-and.patch =3D> 0001-=
CC312-alignment-of-cc312-differences-between-fvp-and.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-arm-trusted-firmware-m-disable-address-warnings-into.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
010-Corstone-1000-Enable-different-DRBG-configurations.patch =3D> 0002-Co=
rstone-1000-Enable-different-DRBG-configurations.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-CS1000-Remove-unused-BL1-files.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-Workaround-compile-errors-in-AES.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-Corstone1000-Enable-FWU-partition.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
035-plat-cs1k-Removed-unused-variables.patch =3D> 0005-plat-cs1k-Removed-=
unused-variables.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
051-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch =3D> 0006-=
lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-Platform-Corstone1000-Increase-buffer-sizes.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
052-lib-gpt-Provide-macro-identifying-free-space.patch =3D> 0007-lib-gpt-=
Provide-macro-identifying-free-space.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-Corstone1000-Remove-duplicate-configuration.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
053-lib-gpt-Add-operation-to-duplicate-entries.patch =3D> 0008-lib-gpt-Ad=
d-operation-to-duplicate-entries.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
054-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch =3D> 0009-=
lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
055-lib-gpt-Clarify-API-operation.patch =3D> 0010-lib-gpt-Clarify-API-ope=
ration.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
056-lib-gpt-Add-metadata-only-API-operations.patch =3D> 0011-lib-gpt-Add-=
metadata-only-API-operations.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
057-plat-cs1k-Add-flash-erase-protection.patch =3D> 0012-plat-cs1k-Add-fl=
ash-erase-protection.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-Build-adjust-CS1000-platform-for-GCC-v14.2.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
058-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch =3D> 0013-=
plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-Workaround-compile-errors-in-AES.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
059-plat-cs1k-Duplicate-old-images-in-FWU.patch =3D> 0014-plat-cs1k-Dupli=
cate-old-images-in-FWU.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-CC312-Add-barrier-before-first-AO-lock-write.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
060-platform-corstone1000-Increase-FIP-partition-size.patch =3D> 0015-pla=
tform-corstone1000-Increase-FIP-partition-size.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-Platform-CS1K-make-mutlicore-support-platform-generi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-platform-corstone1000-Optionally-skip-provisioning.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-lib-efi_guid-Added-EFI-GUID-library.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-lib-efi_soft_crc-Added-EFI-CRC-library.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0019-lib-gpt-Implemented-generic-GPT-parser-for-flash.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0020-lib-gpt-Expanded-how-GPT-partition-can-be-identified.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0021-lib-gpt-Added-operations-to-modify-partitions.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0022-lib-gpt-Added-operation-to-move-entry.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0023-lib-gpt-Added-ability-to-create-and-remove-partition.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0024-lib-gpt-Added-table-validation-operations.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0025-lib-gpt-Added-defragmentation-operation.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0026-lib-GPT-Fix-cppcheck-warnings.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0027-lib-efi_guid-Remove-unecessary-include-folder.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0028-lib-efi_guid-Correct-included-folder.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0029-lib-efi_soft_crc-Correct-include-directory.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0030-lib-gpt-Add-missing-link-library.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0031-lib-gpt-Correct-variable-name-used.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0032-lib-gpt-Correct-include-directory.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0033-lib-gpt-Move-contents-of-CMake-config-file.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0034-plat-cs1k-Fixed-formatting-errors.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0036-plat-cs1k-Fixed-bad-function-returns.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0037-plat-cs1k-Improved-logging-in-function.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0038-plat-cs1k-Remove-unused-function.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0039-plat-cs1k-Reduce-BL1-binary-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0040-plat-cs1k-Update-license-identifier.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0041-plat-cs1k-Changed-to-use-new-GPT-library.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0042-plat-cs1k-Move-variable-from-stack-to-data.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0043-plat-cs1k-Create-and-remove-FWU-image-partitions.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0044-plat-cs1k-Derive-host-base-addresses-from-offsets.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0045-plat-cs1k-Drive-NPU-via-external-system-reset-contro.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0046-lib-gpt-Fix-final-entry-not-being-removed.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0047-lib-gpt-Replace-warnings-with-errors.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0048-lib-gpt-Enforce-entry-size-of-128-bytes.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0049-lib-gpt-Ensure-block-size-complies-with-spec.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0050-lib-gpt-Expand-table-validation.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0001-Build-Fix-compiler-warnings.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0002-Fix-psa_key_handle_t-initialization.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/ps=
a-adac/{0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch =3D> 000=
2-cmake-Update-psa_adac_psa_crypto-dependencies.patch} (100%)

