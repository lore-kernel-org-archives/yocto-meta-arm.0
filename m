Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E079DC3271E
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 16:06:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20410.1720195594016891160
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jul 2024 09:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79D48367;
	Fri,  5 Jul 2024 09:06:58 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.75.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33F1E3F766;
	Fri,  5 Jul 2024 09:06:31 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/3] Upgrade Corstone1000 to TF-A v2.11 and use metadata v2
Date: Fri,  5 Jul 2024 18:06:19 +0200
Message-Id: <20240705160622.583987-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jul 2024 16:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5864

From: Bence Balogh <bence.balogh@arm.com>

The TF-A v2.11 supports only the metadata v2. Because of this, the TF-M
and U-Boot metadata structs also had to be updated.

Bence Balogh (2):
  arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.11
  arm-bsp/u-boot: corstone1000: use mdata v2

Emekcan Aras (1):
  arm-bsp/trusted-firmware-m: corstone1000: Switch to metadata v2

 .../conf/machine/include/corstone1000.inc     |   2 +-
 ...-remove-unused-NS_SHARED_RAM-region.patch} |   0
 ...md-remove-EL3-interrupt-registration.patch |  54 ----
 ...clean-the-cache-and-disable-interru.patch} |   0
 ...-Add-multicore-support-for-FVP-plat.patch} |  33 ++-
 ...ne1000-include-platform-header-file.patch} |   0
 .../trusted-firmware-a-corstone1000.inc       |  17 +-
 ...m-Corstone1000-switch-to-metadata-v2.patch | 235 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 .../u-boot/u-boot-corstone1000.inc            |   1 +
 .../0050-fwu-Use-metadata-v2.patch            | 105 ++++++++
 11 files changed, 367 insertions(+), 81 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch =3D> 0003-f=
ix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-fix-spmd-remove-EL3-interrupt-registration.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
005-fix-corstone1000-clean-the-cache-and-disable-interru.patch =3D> 0004-=
fix-corstone1000-clean-the-cache-and-disable-interru.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =3D> 0005-=
feat-corstone1000-Add-multicore-support-for-FVP-plat.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
007-feat-corstone1000-include-platform-header-file.patch =3D> 0006-feat-c=
orstone1000-include-platform-header-file.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-Platform-Corstone1000-switch-to-metadata-v2.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
050-fwu-Use-metadata-v2.patch

--
2.25.1


