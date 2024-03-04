Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5694C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 10:47:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.95472.1709549248139856889
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 02:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 623FF1FB;
	Mon,  4 Mar 2024 02:48:04 -0800 (PST)
Received: from e126523.arm.com (unknown [10.57.68.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02F8C3F738;
	Mon,  4 Mar 2024 02:47:26 -0800 (PST)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/2] Add fix for the uboot PSCI driver and remove TF-A workaround patch
Date: Mon,  4 Mar 2024 11:47:13 +0100
Message-Id: <20240304104715.228979-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 10:47:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5407

From: Bence Balogh <bence.balogh@arm.com>

Bence Balogh (2):
  arm-bsp/u-boot: corstone1000: fix SMCCC_ARCH_FEATURES detection in the
    PSCI driver
  arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES
    discovery workaround

 ...stone1000-add-cpuhelper-to-makefile.patch} |  0
 ...URES-discovery-through-PSCI_FEATURES.patch | 29 ----------
 .../trusted-firmware-a-corstone1000.inc       |  3 +-
 ...i-Fix-bind_smccc_features-psci-check.patch | 56 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 ++
 5 files changed, 61 insertions(+), 31 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
004-fix-corstone1000-add-cpuhelper-to-makefile.patch =3D> 0003-fix-corsto=
ne1000-add-cpuhelper-to-makefile.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.p=
atch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/0001-firmware-=
psci-Fix-bind_smccc_features-psci-check.patch

--
2.25.1


