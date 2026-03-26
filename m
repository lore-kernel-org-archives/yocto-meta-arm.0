Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84DF10A62CF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:29:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47419.1774531754152408808
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 06:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VUJ6Ued5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3D0175A;
	Thu, 26 Mar 2026 06:29:07 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.12.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38DE3F836;
	Thu, 26 Mar 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774531753; bh=kmFAyXhVsDVp7LSP5iz/2eo9YNoiOe++qJiPxp9j7H4=;
	h=From:To:Cc:Subject:Date:From;
	b=VUJ6Ued5ul4x88UfhFeQg30q53ix6A7M9yA06KYNuKy44xR+3Qm3jNbUDM3bPUTb/
	 o00R2Bq9Dnt+GkjIG9MuajDCIXkzwjV+DPVI/ERiDIEpbdce2gEQfK6S+489L2tYaU
	 JJtqOM1FwEIbTTX55mpBr5dbDG+XyYX2326DWDzs=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 0/2] Corstone1000 GPT Library
Date: Thu, 26 Mar 2026 13:28:38 +0000
Message-ID: <20260326132857.1590256-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Mar 2026 13:29:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6973

Adds to Corstone1000 the GPT library from TF-M. This is used to
dynamically provision partitions, and remove them, during a firmware
update. This way, there is no need to provision the second bank at build
time.

All patches added in these commits are either submitted or backports,
and can be removed when Corstone1000 upgrades to a version of TF-M that
contains them.

Frazer Carsley (2):
  arm-bsp/tf-m:cs1k: Add GPT library
  arm-bsp/tf-m:cs1k: modified mcuboot to use GPT library

 .../conf/machine/corstone1000-fvp.conf        |    2 +
 .../conf/machine/corstone1000-mps3.conf       |    2 +
 .../conf/machine/include/corstone1000.inc     |    1 -
 ...-lib-efi_guid-Added-EFI-GUID-library.patch |  217 +
 ...b-efi_soft_crc-Added-EFI-CRC-library.patch |  136 +
 ...emented-generic-GPT-parser-for-flash.patch | 1495 ++++++
 ...-how-GPT-partition-can-be-identified.patch |  308 ++
 ...dded-operations-to-modify-partitions.patch |  961 ++++
 ...ib-gpt-Added-operation-to-move-entry.patch |  374 ++
 ...ility-to-create-and-remove-partition.patch |  713 +++
 ...pt-Added-table-validation-operations.patch |  412 ++
 ...-gpt-Added-defragmentation-operation.patch |  280 +
 .../0026-lib-GPT-Fix-cppcheck-warnings.patch  |   74 +
 ...uid-Remove-unecessary-include-folder.patch |   28 +
 ...lib-efi_guid-Correct-included-folder.patch |   28 +
 ...i_soft_crc-Correct-include-directory.patch |   25 +
 ...030-lib-gpt-Add-missing-link-library.patch |   27 +
 ...1-lib-gpt-Correct-variable-name-used.patch |   24 +
 ...32-lib-gpt-Correct-include-directory.patch |   27 +
 ...t-Move-contents-of-CMake-config-file.patch |   51 +
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
 .../trusted-firmware-m-corstone1000.inc       |   31 +-
 ...=3D> corstone1000-flash-firmware-fvp.wks.in} |   22 +-
 .../corstone1000-flash-firmware-mps3.wks.in   |   34 +
 33 files changed, 11351 insertions(+), 17 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-lib-efi_guid-Added-EFI-GUID-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-lib-efi_soft_crc-Added-EFI-CRC-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0019-lib-gpt-Implemented-generic-GPT-parser-for-flash.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0020-lib-gpt-Expanded-how-GPT-partition-can-be-identified.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0021-lib-gpt-Added-operations-to-modify-partitions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0022-lib-gpt-Added-operation-to-move-entry.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0023-lib-gpt-Added-ability-to-create-and-remove-partition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0024-lib-gpt-Added-table-validation-operations.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0025-lib-gpt-Added-defragmentation-operation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0026-lib-GPT-Fix-cppcheck-warnings.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0027-lib-efi_guid-Remove-unecessary-include-folder.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0028-lib-efi_guid-Correct-included-folder.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0029-lib-efi_soft_crc-Correct-include-directory.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0030-lib-gpt-Add-missing-link-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0031-lib-gpt-Correct-variable-name-used.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0032-lib-gpt-Correct-include-directory.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0033-lib-gpt-Move-contents-of-CMake-config-file.patch
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


