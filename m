Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB69C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 17:58:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.22527.1640195927961490581
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Dec 2021 09:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 122481FB;
	Wed, 22 Dec 2021 09:58:47 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53DF53F5A1;
	Wed, 22 Dec 2021 09:58:46 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH honister 0/1] corstone1000:
 efi_loader-Fix-loaded-image-alignment
Date: Wed, 22 Dec 2021 17:58:39 +0000
Message-Id: <20211222175840.2797-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Dec 2021 17:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2764

From: Xueliang Zhong <xueliang.zhong@arm.com>

This patchset is cherry-picked from upstream to fix misalignment
of efi load image

Vishnu Banavath (1):
  corstone1000:efi_loader-Fix-loaded-image-alignment

 ...fi_loader-Fix-loaded-image-alignment.patch | 132 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-efi_loader-Fix-loaded-image-alignment.patch

-- 
2.17.1


