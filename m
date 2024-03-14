Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7841C54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 11:05:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9853.1710414306419949492
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 04:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BCD5DA7;
	Thu, 14 Mar 2024 04:05:42 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.81.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC87B3F73F;
	Thu, 14 Mar 2024 04:05:04 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH v2 0/2]
Date: Thu, 14 Mar 2024 12:04:55 +0100
Message-Id: <20240314110457.230569-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Mar 2024 11:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5438

From: Bence Balogh <bence.balogh@arm.com>

Changelog :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v2:

* Apply 0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch
  only to CS1K, instead of to all platforms.


Bence Balogh (2):
  arm-bsp/u-boot: corstone1000: fix SMCCC_ARCH_FEATURES detection in the
    PSCI driver
  arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES
    discovery workaround

 ...tone1000-pass-spsr-value-explicitly.patch} |  0
 ...URES-discovery-through-PSCI_FEATURES.patch | 29 ---------
 ...d-remove-EL3-interrupt-registration.patch} |  0
 .../trusted-firmware-a-corstone1000.inc       |  5 +-
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...i-Fix-bind_smccc_features-psci-check.patch | 60 +++++++++++++++++++
 6 files changed, 63 insertions(+), 32 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
003-fix-corstone1000-pass-spsr-value-explicitly.patch =3D> 0002-fix-corst=
one1000-pass-spsr-value-explicitly.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.p=
atch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
004-fix-spmd-remove-EL3-interrupt-registration.patch =3D> 0003-fix-spmd-r=
emove-EL3-interrupt-registration.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-firmware-psci-Fix-bind_smccc_features-psci-check.patch

--
2.25.1


