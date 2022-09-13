Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C2EC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:57:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4235.1663073843429652646
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 05:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 433A91063;
	Tue, 13 Sep 2022 05:57:29 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B3B23F73D;
	Tue, 13 Sep 2022 05:57:22 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/2] Add external system driver
Date: Tue, 13 Sep 2022 13:57:09 +0100
Message-Id: <20220913125711.26811-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Sep 2022 12:57:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3773

From: Emekcan <emekcan.aras@arm.com>

Corstone1000 needs a kernel driver to control the
external system (turn on/off, reset). This commit
adds the external system driver binding 
to the u-boot device tree and enables communication
with external system for corstone1000.

Emekcan (2):
  arm-bsp/u-boot: Add external system driver to u-boot device tree
  arm-bsp/kernel: Add external device driver

 ...e-external-sys-driver-to-device-tree.patch |  37 +++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 .../0002-Add-external-system-driver.patch     | 223 ++++++++++++++++++
 .../linux/files/corstone1000/defconfig        |   1 +
 .../linux/linux-arm-platforms.inc             |   1 +
 5 files changed, 263 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-external-system-driver.patch

-- 
2.17.1


