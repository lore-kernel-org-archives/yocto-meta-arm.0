Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C4FC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 17:48:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.35905.1640281723141823384
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Dec 2021 09:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46C01FB;
	Thu, 23 Dec 2021 09:48:41 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 140C83F774;
	Thu, 23 Dec 2021 09:48:40 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/u-boot: fix EFI image load alignment
Date: Thu, 23 Dec 2021 17:48:29 +0000
Message-Id: <20211223174830.51167-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Dec 2021 17:48:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2768

From: Vishnu Banavath <vishnu.banavath@arm.com>

This patch is cherry-picked from upstream to fix misalignment
of efi load image

Vishnu Banavath (1):
  arm-bsp/u-boot: fix EFI image load alignment

 ...fi_loader-Fix-loaded-image-alignment.patch | 134 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-efi_loader-Fix-loaded-image-alignment.patch

-- 
2.17.1


