Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5669CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:51:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16969.1757508692518002255
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 05:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3C5516F8;
	Wed, 10 Sep 2025 05:51:23 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EB6E3F694;
	Wed, 10 Sep 2025 05:51:30 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/3] Add new recipe for Trusted-Firmware-M v2.2.1 and upgrade Trusted-Firmware-M version to 2.2.1 for Corstone-1000
Date: Wed, 10 Sep 2025 13:51:09 +0100
Message-Id: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 12:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6695

This merge request include changes to add new recipe for Trusted-Firmware=
-M v2.2.1 in
meta-arm and upgrade Trusted-Firmware-M version to 2.2.1 for Corstone-100=
0.
The move to Trusted-Firmware-M v2.2.1 makes the BL1 code larger, while th=
e provisioning
bundle can be trimmed. At the same time BL2 and TF-M binary addresses now=
 need to begin on
a 0x100-byte boundary for Cortex-M0+ based platforms.

Key changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Add new recipe for Trusted-Firmware-M v2.2.1
- Include patch to add relevant checks in GCC linker scripts to validate =
if the
  BL2 and Trusted-Firmware-M binary addresses are aligned to 0x100 byte b=
oundary
  for Cortex-M0+ based platforms.
- Upgrade Trusted-Firmware-M v2.2.1 for Corstone-1000
  - Rebase patches
  - Add new patch to address the following changes for v2.2.1
    * Increase `BL1_1_CODE_SIZE` to 58KB to accommodate the v2.21 binarie=
s.
    * Reduce `PROVISIONINGDATA_SIZE` to 6KB.
    * `BL2_CODE_START` and `S_CODE_START` are aligned to 0x100 byte bound=
ary so both start addresses are an exact multiple of 0x100.


Harsimran Singh Tungal (3):
  arm/trusted-firmware-m: Add new recipe for Trusted-Firmware-M v2.2.1
  arm/trusted-firmware-m: Add alignment checks for Cortex-M0+ based
    platform binaries
  arm-bsp: corstone1000: Upgrade Trusted-Firmware-M v2.2.1

 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../corstone1000-flash-firmware-image.bb      |   2 +-
 ...form-CS1000-Remove-unused-BL1-files.patch} |  21 +-
 ...-Corstone1000-Enable-firewall-in-FVP.patch | 177 -------
 ...m-CS1000-Increase-ITS-max-asset-size.patch |  41 --
 ...e1000-Fix-BL1-compiler-switch-and-re.patch |  46 ++
 ...f-cc312-differences-between-fvp-and.patch} |   8 +-
 ...S1000-Increase-RSE_COMMS-buffer-size.patch |  38 --
 ...CS1000-Increase-buffers-for-EFI-vars.patch |  42 --
 ...m-Corstone1000-Enable-FWU-partition.patch} |  16 +-
 ...m-CS1000-Increase-flash-PS-area-size.patch |  37 --
 ...1000-Implement-Bootloader-Abstracti.patch} | 455 ++++++++++--------
 ...-Corstone1000-Increase-buffer-sizes.patch} |  27 +-
 ...CS1000-Add-multicore-support-for-FVP.patch | 119 -----
 ...007-Platform-CS1000-Fix-Bank-offsets.patch |  36 --
 ...1000-Remove-duplicate-configuration.patch} |  22 +-
 ...m-CS1000-Increase-BL2-partition-size.patch | 111 -----
 ...e1000-Increase-BL1-size-and-align-bi.patch |  93 ++++
 ...-Add-PSA_WANT_ALG_SHA_256-definition.patch |  42 --
 ...apt-ADAC-enabled-build-to-the-new-BL.patch |  45 ++
 ...m-CS1000-Add-crypto-configs-for-ADAC.patch |  41 --
 ...orm-CS1000-Fix-platform-name-in-logs.patch |  27 --
 ...rm-CS1000-Fix-compiler-switch-in-BL1.patch | 193 --------
 ...one1000-Allow-FWU-calls-in-RSE-COMMS.patch |  60 ---
 ...m-specific-TFM_FWU_BOOTLOADER_LIB-se.patch |  73 ---
 .../trusted-firmware-m-corstone1000.inc       |  36 +-
 ...L2-and-TF-M-binary-address-alignment.patch | 134 ++++++
 .../trusted-firmware-m-2.2.1-src.inc          |  80 +++
 .../trusted-firmware-m_2.2.1.bb               |   2 +
 29 files changed, 720 insertions(+), 1306 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-Platform-CS1000-Remove-unused-BL1-files.patch =3D> 0001-Platform-CS10=
00-Remove-unused-BL1-files.patch} (97%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-Corstone1000-Enable-firewall-in-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-CS1000-Increase-ITS-max-asset-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-CC312-alignment-of-cc312-differences.patch =3D> 0003-CC312-alignment-=
of-cc312-differences-between-fvp-and.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
017-Platform-CS1000-Enable-FWU-partition.patch =3D> 0004-Platform-Corston=
e1000-Enable-FWU-partition.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-CS1000-Increase-flash-PS-area-size.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch =3D> 0005-=
Platform-Corstone1000-Implement-Bootloader-Abstracti.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
019-Platform-Corstone1000-Increase-buffer-sizes.patch =3D> 0006-Platform-=
Corstone1000-Increase-buffer-sizes.patch} (64%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-platform-CS1000-Add-multicore-support-for-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-Platform-CS1000-Fix-Bank-offsets.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch =3D> =
0007-Platform-Corstone1000-Remove-duplicate-configuration.patch} (60%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-CS1000-Increase-BL2-partition-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-Platform-CS1000-Fix-platform-name-in-logs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Ad=
d-checks-for-BL2-and-TF-M-binary-address-alignment.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.2.1-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.2.1.bb


