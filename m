Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8145C19F4F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 15:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.460.1714144823912208013
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 08:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C5DF2F4;
	Fri, 26 Apr 2024 08:20:51 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.64.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A65793F73F;
	Fri, 26 Apr 2024 08:20:22 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/3] arm-bsp/corstone1000: add external system control support
Date: Fri, 26 Apr 2024 16:20:11 +0100
Message-Id: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 15:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5614

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

add support for controlling  the external system core using Linux remotep=
roc subsystem

Abdellatif El Khlifi (3):
  arm-bsp/external-system: costone1000: install the firmware in the
    filesystem
  arm-bsp/u-boot: corstone1000: add external system DTS node
  arm-bsp/linux-yocto: corstone1000: add external system control support

 kas/corstone1000-image-configuration.yml      |   3 +
 .../external-system/external-system_0.1.0.bb  |  13 +-
 .../u-boot/u-boot-corstone1000.inc            |   5 +-
 ...efi-corstone1000-fwu-update-RPC-ABI.patch} |   0
 ...e1000-Change-MMCOMM-buffer-location.patch} |   0
 ...one1000-dts-add-external-system-node.patch |  34 ++
 ...remoteproc-Add-Arm-remoteproc-driver.patch | 488 ++++++++++++++++++
 ...rstone1000-external-system-device-no.patch |  42 ++
 ...ndings-remoteproc-Add-Arm-remoteproc.patch | 105 ++++
 .../linux/files/corstone1000/extsys.cfg       |   2 +
 .../linux/linux-arm-platforms.inc             |   7 +
 11 files changed, 693 insertions(+), 6 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0044-efi-cor=
stone1000-fwu-update-RPC-ABI.patch =3D> 0045-efi-corstone1000-fwu-update-=
RPC-ABI.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0045-Corston=
e1000-Change-MMCOMM-buffer-location.patch =3D> 0046-Corstone1000-Change-M=
MCOMM-buffer-location.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
047-corstone1000-dts-add-external-system-node.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-remoteproc-Add-Arm-remoteproc-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-arm64-dts-Add-corstone1000-external-system-device-no.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0003-dt-bindings-remoteproc-Add-Arm-remoteproc.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
extsys.cfg

--=20
2.25.1


