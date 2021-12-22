Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99A4C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 13:37:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.19163.1640180226142158029
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Dec 2021 05:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B251CD6E;
	Wed, 22 Dec 2021 05:37:05 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F408A3F5A1;
	Wed, 22 Dec 2021 05:37:04 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/u-boot: add ethernet device and enable
 configs for SCT
Date: Wed, 22 Dec 2021 13:36:55 +0000
Message-Id: <20211222133656.1110-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Dec 2021 13:37:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2760

From: Xueliang Zhong <xueliang.zhong@arm.com>

These changes are to add
* ethernet device SMC911x device and this is required to support
* bootfromnetwork SCT
* also enabled other config options to fix SCT issues

Vishnu Banavath (1):
  arm-bsp/u-boot: add ethernet device and enable configs for SCT

 ...-corstone1000-enable-ethernet-device.patch | 83 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone1000-enable-ethernet-device.patch

-- 
2.17.1


