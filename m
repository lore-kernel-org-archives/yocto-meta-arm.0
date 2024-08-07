Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC995C52D7E
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31264.1723030280824658240
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 04:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D42FAFEC;
	Wed,  7 Aug 2024 04:31:45 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44FD53F5A1;
	Wed,  7 Aug 2024 04:31:19 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/3] Update TF-M version for Corstone-1000 to TFMv2.1
Date: Wed,  7 Aug 2024 13:31:05 +0200
Message-Id: <20240807113108.58898-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Aug 2024 11:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5953

From: Bence Balogh <bence.balogh@arm.com>

The commits contain:
  * Updating the TFM version for Corstone-1000
  * Rebasing the Corstone-1000 TFM patches
  * Add patch to trusted-services to make it work with the newer TFM
    version
  * Remove the TFMv2.0 recipes that are no longer used

Bence Balogh (3):
  arm-bsp/trusted-firmware-m: corstone1000: upgrade  to TF-M v2.1.x
  arm-bsp/trusted-services: corstone1000: align PSA crypto structs with
    TF-M
  arm-bsp/trusted-firmware-m: Remove TF-M v2.0 recipe

 .../conf/machine/include/corstone1000.inc     |    2 +-
 ...orstone1000-Update-MPU-configuration.patch |  274 --
 ...ne1000-align-capsule-update-structs.patch} |   24 +-
 ...stone1000-skip-the-first-nv-counter.patch} |   10 +-
 ...m-corstone1000-Cover-S_DATA-with-MPU.patch |   76 -
 ...rstone1000-add-unique-guid-for-mps3.patch} |    8 +-
 ...one1000-Enable-host-firewall-in-FVP.patch} |   11 +-
 ...one1000-Increase-ITS-max-asset-size.patch} |    7 +-
 ...1000-Increase-RSE_COMMS-buffer-size.patch} |   11 +-
 ...f-cc312-differences-between-fvp-and.patch} |   14 +-
 ...S1000-Replace-OpenAMP-with-RSE_COMMS.patch | 3620 -----------------
 ...e1000-Increase-buffers-for-EFI-vars.patch} |    4 +-
 ...0-Remove-reset-after-capsule-update.patch} |    4 +-
 ...S1000-Add-multicore-support-for-FVP.patch} |   14 +-
 ...-Corstone1000-switch-to-metadata-v2.patch} |    0
 ...one1000-Increase-flash-PS-area-size.patch} |    0
 .../trusted-firmware-m-2.0.0-src.inc          |   46 -
 .../trusted-firmware-m-corstone1000.inc       |   27 +-
 ...trusted-firmware-m-scripts-native_2.0.0.bb |    2 -
 .../trusted-firmware-m_2.0.0.bb               |    2 -
 ...ign-PSA-Crypto-structs-with-TF-Mv2.1.patch |  300 ++
 .../trusted-services/ts-arm-platforms.inc     |    1 +
 22 files changed, 368 insertions(+), 4089 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-platform-corstone1000-Update-MPU-configuration.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
003-platform-corstone1000-align-capsule-update-structs.patch =3D> 0001-pl=
atform-corstone1000-align-capsule-update-structs.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Platform-Corstone1000-skip-the-first-nv-counter.patch =3D> 0002-Platf=
orm-Corstone1000-skip-the-first-nv-counter.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
005-platform-corstone1000-add-unique-guid-for-mps3.patch =3D> 0003-platfo=
rm-corstone1000-add-unique-guid-for-mps3.patch} (88%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
006-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =3D> 0004-Pla=
tform-Corstone1000-Enable-host-firewall-in-FVP.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
007-platform-corstone1000-Increase-ITS-max-asset-size.patch =3D> 0005-pla=
tform-corstone1000-Increase-ITS-max-asset-size.patch} (86%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch =3D> 0006-=
platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch} (71%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
010-CC312-alignment-of-cc312-differences-between-fvp-and.patch =3D> 0007-=
CC312-alignment-of-cc312-differences-between-fvp-and.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch =3D> 0008-P=
latform-corstone1000-Increase-buffers-for-EFI-vars.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-corstone1000-Remove-reset-after-capsule-update.patch =3D> 0009-corsto=
ne1000-Remove-reset-after-capsule-update.patch} (88%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-platform-CS1000-Add-multicore-support-for-FVP.patch =3D> 0010-platfor=
m-CS1000-Add-multicore-support-for-FVP.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-Platform-Corstone1000-switch-to-metadata-v2.patch =3D> 0011-Platform-=
Corstone1000-switch-to-metadata-v2.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-platform-corstone1000-Increase-flash-PS-area-size.patch =3D> 0012-pla=
tform-corstone1000-Increase-flash-PS-area-size.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-2.0.0-src.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-scripts-native_2.0.0.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_2.0.0.bb
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch

--
2.25.1


