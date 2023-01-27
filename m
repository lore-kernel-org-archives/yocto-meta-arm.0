Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9FAC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 19:21:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.111616.1674847303245812371
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 11:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C85452B;
	Fri, 27 Jan 2023 11:22:24 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.11.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD0AB3F71E;
	Fri, 27 Jan 2023 11:21:41 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 0/3] Add UEFI capsule generation support
Date: Fri, 27 Jan 2023 19:21:19 +0000
Message-Id: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 19:21:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4333

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The following patches adds a class for UEFI capsule generation,
a recipe for installing edk2 base tools in the sysroot and
configures the corstone1000 recipe to build a UEFI capsule.


Gowtham Suresh Kumar (3):
  arm/edk2-basetools: Add edk2 base tool native recipe
  arm-bsp/uefi_capsule: Add UEFI capsule generation class
  arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000
    platform

 .../recipes-bsp/images/corstone1000-image.bb  |  9 +++-
 meta-arm/classes/uefi_capsule.bbclass         | 46 +++++++++++++++++++
 .../edk2-basetools/edk2-basetools_202211.bb   | 24 ++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/classes/uefi_capsule.bbclass
 create mode 100644 meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb

--
2.17.1


