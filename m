Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C816C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:31:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7794.1749130282836688766
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 06:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7599168F;
	Thu,  5 Jun 2025 06:31:04 -0700 (PDT)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.124.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA5AC3F5A1;
	Thu,  5 Jun 2025 06:31:21 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [meta-arm] [PATCH 0/3] corstone1000: upgrade TF-A 2.12.1
Date: Thu,  5 Jun 2025 15:31:05 +0200
Message-Id: <20250605133108.35177-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Jun 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6529

Upgrade Corstone-1000 to TF-A 2.12.1
Remove TF-A 2.11.0 recipes

Clement Faure (3):
  arm/tf-a-tests: fix header guard compilation warning
  arm-bsp/trusted-firmware-a: corstone1000: Upgrade TF-A to 2.12.1
  arm-bsp/trusted-firmware-a: corstone1000: remove TF-A 2.11.0 recipe

 .../conf/machine/include/corstone1000.inc     |   4 +-
 ...stone1000-pass-spsr-value-explicitly.patch |  32 --
 ...0-remove-unused-NS_SHARED_RAM-region.patch |  92 ---
 ...-clean-the-cache-and-disable-interru.patch |  46 --
 ...0-Add-multicore-support-for-FVP-plat.patch | 161 ------
 ...one1000-include-platform-header-file.patch |  28 -
 .../trusted-firmware-a-corstone1000.inc       |  11 +-
 .../trusted-firmware-a_2.11.0.bb              |  20 -
 ...-make-PCIe-tests-default-for-testing.patch | 531 ++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_2.12.0.bb   |   1 +
 10 files changed, 540 insertions(+), 386 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-fix-corstone1000-pass-spsr-value-explicitly.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0005-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0006-feat-corstone1000-include-platform-header-file.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.11.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fi=
x-realm-make-PCIe-tests-default-for-testing.patch


