Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74286C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:49:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.60586.1638190168918718546
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 04:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BBAB1042;
	Mon, 29 Nov 2021 04:49:28 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2A8A3F766;
	Mon, 29 Nov 2021 04:49:26 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	"Arpita S . K" <Arpita.S.K@arm.com>
Subject: [PATCH][HONISTER 0/5] Backport corstone1000 mps3 patches to honister
Date: Mon, 29 Nov 2021 12:49:10 +0000
Message-Id: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 12:49:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2465

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding Corstone-1000 to honister stable branch.

Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>

Abdellatif El Khlifi (3):
  arm/optee-spdevkit: introducing the recipe
  arm/secure-partitions: introducing the recipe
  meta-arm-bsp/security: corstone1000: add trusted services support

Arpita S.K (2):
  arm-bsp/machine: introducing corstone1000 MPS3 machine
  arm-bsp/u-boot: introducing corstone1000 MPS3 machine

 .gitlab-ci.yml                                |   3 +
 ci/corstone1000-mps3.yml                      |  12 ++
 kas/corstone1000-mps3.yml                     |   6 +
 meta-arm-bsp/conf/layer.conf                  |   2 +-
 .../conf/machine/corstone1000-mps3.conf       |   9 ++
 .../conf/machine/include/corstone1000.inc     |   3 +
 .../trusted-firmware-m-corstone1000.inc       |   9 +-
 ...initial-devicetree-corstone1000-mps3.patch |  64 ++++++++++
 ...one1000-adding-PSCI-device-tree-node.patch |  34 ++++++
 ...-amend-kernel-bootargs-with-ip-dhcp-.patch |  32 +++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   5 +-
 .../optee/optee-os_corstone1000.inc           |  32 ++---
 .../optee/optee-os_corstone1000_common.inc    |  27 +++++
 .../optee/optee-spdevkit_corstone1000.inc     |   1 +
 .../optee/optee-spdevkit_git.bbappend         |   6 +
 ...pplying-lowercase-project-convention.patch |  33 ++++++
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch |  31 +++++
 ...proxy-dts-add-se-proxy-as-child-node.patch |  45 +++++++
 .../secure-partitions_%.bbappend              |   4 +
 .../trusted-services/ts-corstone1000.inc      |  17 +++
 .../optee/optee-spdevkit_git.bb               | 111 ++++++++++++++++++
 .../trusted-services/secure-partitions_git.bb |  91 ++++++++++++++
 22 files changed, 545 insertions(+), 32 deletions(-)
 create mode 100644 ci/corstone1000-mps3.yml
 create mode 100644 kas/corstone1000-mps3.yml
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-mps3.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm-dts-add-initial-devicetree-corstone1000-mps3.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-arm-corstone1000-adding-PSCI-device-tree-node.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corstone1000-amend-kernel-bootargs-with-ip-dhcp-.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
 create mode 100644 meta-arm/recipes-security/optee/optee-spdevkit_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions_git.bb

-- 
2.17.1


