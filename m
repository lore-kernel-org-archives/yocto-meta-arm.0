Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2F2C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 14:42:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24995.1677595335460855999
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 06:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10BD6C14;
	Tue, 28 Feb 2023 06:42:58 -0800 (PST)
Received: from e126345.cambridge.arm.com (e126345.cambridge.arm.com [10.1.32.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA3A23F67D;
	Tue, 28 Feb 2023 06:42:13 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH langdale 0/6] Add UEFI capsule generation support
Date: Tue, 28 Feb 2023 14:41:46 +0000
Message-Id: <20230228144152.17041-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Feb 2023 14:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4458

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The following patches adds a class for UEFI capsule generation,
a recipe for installing edk2 base tools in the sysroot and
configures the corstone1000 recipe to build a UEFI capsule.

Gowtham Suresh Kumar (6):
  arm/edk2-basetools: Add edk2 base tool native recipe
  arm-bsp/uefi_capsule: Add UEFI capsule generation class
  arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000
    platform
  arm/edk2-basetools: Convert edk2 basetools recipes to native only
  arm-bsp/uefi_capsule: Use json file to pass capsule config
  arm-bsp/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR

 .../recipes-bsp/images/corstone1000-image.bb  |  7 ++-
 ...rstone1000-image-capsule-update-image.json | 11 ++++
 meta-arm/classes/uefi_capsule.bbclass         | 55 +++++++++++++++++++
 .../edk2-basetools-native_202211.bb           | 24 ++++++++
 4 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
 create mode 100644 meta-arm/classes/uefi_capsule.bbclass
 create mode 100644 meta-arm/recipes-devtools/edk2-basetools/edk2-basetools-native_202211.bb

--
2.17.1


