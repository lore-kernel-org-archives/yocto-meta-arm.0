Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20229C6379F
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 10:42:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12152.1676457772735081998
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 02:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E15281042;
	Wed, 15 Feb 2023 02:43:34 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.46.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35E4E3F663;
	Wed, 15 Feb 2023 02:42:51 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 0/2] Update UEFI capsule generation to use json config file
Date: Wed, 15 Feb 2023 10:42:34 +0000
Message-Id: <20230215104236.24484-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 10:42:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4389

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The UEFI capsule parameters can be passed to the script using a json file
which is easily scalable when generating multiple capsules. Also the edk2
base tools recipe is made native only.

Gowtham Suresh Kumar (2):
  arm/edk2-basetools: Convert edk2 basetools recipes to native only
  arm-bsp/uefi_capsule: Use json file to pass capsule config

 .../recipes-bsp/images/corstone1000-image.bb  |  8 +++---
 ...rstone1000-image-capsule-update-image.json | 11 ++++++++
 meta-arm/classes/uefi_capsule.bbclass         | 27 ++++++++++++-------
 ...211.bb => edk2-basetools-native_202211.bb} |  6 ++---
 4 files changed, 35 insertions(+), 17 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
 rename meta-arm/recipes-devtools/edk2-basetools/{edk2-basetools_202211.bb => edk2-basetools-native_202211.bb} (92%)

--
2.17.1


