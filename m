Return-Path: <delane.brandy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC662C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 10:50:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9180.1709722245511061580
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 02:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: delane.brandy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A19C1FB;
	Wed,  6 Mar 2024 02:51:22 -0800 (PST)
Received: from e127094.cambridge.arm.com (e127094.arm.com [10.1.39.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 339EE3F738;
	Wed,  6 Mar 2024 02:50:44 -0800 (PST)
From: delane.brandy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH 0/2] Upgrade corstone1000 to TF-A v2.10 
Date: Wed,  6 Mar 2024 10:50:13 +0000
Message-Id: <20240306105015.2630056-1-delane.brandy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Mar 2024 10:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5412

From: Delane Brandy <delane.brandy@arm.com>

Upgrade corstone1000 to TF-A v2.10, removing stale =20
Corstone-1000 patches from TF-A, add fixes to boot TF-A 2.10.

Delane Brandy (1):
  arm/trusted-firmware-a: fix mbedTLS version

Emekcan Aras (1):
  arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.10

 .../conf/machine/include/corstone1000.inc     |   2 +-
 ...1000-bl2-loads-fip-based-on-metadata.patch | 162 ------------------
 ...RES-discovery-through-PSCI_FEATURES.patch} |   0
 ...stone1000-pass-spsr-value-explicitly.patch |  31 ++++
 ...rstone1000-add-cpuhelper-to-makefile.patch |  28 ---
 ...md-remove-EL3-interrupt-registration.patch |  54 ++++++
 .../trusted-firmware-a-corstone1000.inc       |   7 +-
 .../trusted-firmware-a_2.10.0.bb              |   6 +-
 8 files changed, 93 insertions(+), 197 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch =3D> 0=
002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch} (100%=
)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-fix-corstone1000-pass-spsr-value-explicitly.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-spmd-remove-EL3-interrupt-registration.patch

--=20
2.34.1


