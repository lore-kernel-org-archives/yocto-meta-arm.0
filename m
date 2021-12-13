Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5DBC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:26:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13260.1639412789607709651
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E3351FB;
	Mon, 13 Dec 2021 08:26:22 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FA5F3F73B;
	Mon, 13 Dec 2021 08:26:21 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/6] corstone1000: psa-arch-tests 
Date: Mon, 13 Dec 2021 16:26:04 +0000
Message-Id: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2645

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

- psa-arch-tests support
- Fixes on kas, TF-M and secure-partitions

Abdellatif El Khlifi (5):
  arm/secure-partitions: remove the use of EXTRA_OEMAKE
  arm/psa-arch-tests: introduce the recipe
  kas: corstone1000: update meta-arm-image SHA
  kas: corstone1000: update for new Kas include semantics in kas folder
  arm-bsp/trusted-firmware-m: corstone1000: set SRCREV_FORMAT

Emekcan Aras (1):
  arm-bsp/psa-arch-tests: corstone1000: build the test applications

 kas/corstone1000-base.yml                     |  4 +-
 kas/corstone1000-fvp.yml                      |  4 +-
 kas/corstone1000-mps3.yml                     |  4 +-
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 .../psa-arch-tests-corstone1000.inc           | 43 ++++++++++++
 ...arch-test-sysroot_compiler_flags_fix.patch | 68 +++++++++++++++++++
 .../psa-arch-tests_%.bbappend                 |  6 ++
 .../trusted-services/psa-arch-tests_git.bb    | 26 +++++++
 .../trusted-services/secure-partitions.inc    |  3 -
 9 files changed, 150 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb

-- 
2.17.1


