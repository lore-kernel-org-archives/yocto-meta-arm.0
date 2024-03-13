Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4840C54E60
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:13:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6163.1710360821402785161
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 13:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CFA71007;
	Wed, 13 Mar 2024 13:14:17 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44B33F64C;
	Wed, 13 Mar 2024 13:13:39 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 0/3] arm-bsp/trusted-firmware-m:corstone1000: update to 2.0
Date: Wed, 13 Mar 2024 20:13:22 +0000
Message-Id: <20240313201325.27043-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 20:13:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5433

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

This change upgrades the trusted-firmware-m version to 2.0
for Corstone-1000. Due to the changes in TF-M 2.0,=20
psa services requires a seperate client_id.
GNU Arm compiler version is bumped in tusted-firmware-m.

Ali Can Ozaslan (3):
  arm-bsp/trusted-firmware-m: corstone1000: update to 2.0
  arm-bsp/trusted-services: corstone1000: Client Id adjustments after
    TF-M 2.0
  arm/trusted-firmware-m: Change GNU Arm compiler version for TF-M 2.0

 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../corstone1000/images/ExternalFlash.png     | Bin 40835 -> 54896 bytes
 ...ware-m-disable-address-warnings-into.patch |  26 ++
 ...e1000-Increase-BL2-size-in-flash-lay.patch |  27 --
 ...orstone1000-Update-MPU-configuration.patch | 274 ++++++++++++++++++
 ...-Corstone1000-Increase-BL2_DATA_SIZE.patch |  31 --
 ...m-corstone1000-Cover-S_DATA-with-MPU.patch |  76 +++++
 ...e1000-Calculate-the-new-CRC32-value-.patch |  69 -----
 ...e1000-Fix-issues-due-to-adjustment-M.patch |  76 +++++
 ...ed-firmware-m-disable-fatal-warnings.patch |  24 --
 ...ne1000-align-capsule-update-structs.patch} |   0
 ...orstone1000-add-unique-firmware-GUID.patch |  35 ---
 ...1000-fix-synchronization-issue-on-o.patch} |   0
 ...m-Corstone1000-Enable-Signed-Capsule.patch | 102 -------
 ...rstone1000-skip-the-first-nv-counter.patch |  33 +++
 ...tone1000-increase-ITS-max-asset-size.patch |  29 --
 .../trusted-firmware-m-1.8.1-src.inc          |  46 ---
 .../trusted-firmware-m-corstone1000.inc       |  26 +-
 ...trusted-firmware-m-scripts-native_1.8.1.bb |   2 -
 .../trusted-firmware-m_1.8.1.bb               |   2 -
 ...0009-plat-corstone1000-fmp-client-id.patch |  45 +++
 .../trusted-services/ts-arm-platforms.inc     |   1 +
 .../wic/corstone1000-flash-firmware.wks.in    |   6 +-
 .../trusted-firmware-m/trusted-firmware-m.inc |   6 +-
 24 files changed, 550 insertions(+), 388 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/000=
2-arm-trusted-firmware-m-disable-address-warnings-into.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-platform-corstone1000-Update-MPU-configuration.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-corstone1000-Fix-issues-due-to-adjustment-M.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-arm-trusted-firmware-m-disable-fatal-warnings.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
008-platform-corstone1000-align-capsule-update-structs.patch =3D> 0004-pl=
atform-corstone1000-align-capsule-update-structs.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-corstone1000-add-unique-firmware-GUID.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
009-platform-corstone1000-fix-synchronization-issue-on-o.patch =3D> 0005-=
platform-corstone1000-fix-synchronization-issue-on-o.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-skip-the-first-nv-counter.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-platform-corstone1000-increase-ITS-max-asset-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-1.8.1-src.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-scripts-native_1.8.1.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_1.8.1.bb
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-plat-corstone1000-fmp-client-id.patch

--=20
2.34.1


