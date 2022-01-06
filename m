Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BEDC433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 13:47:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8800.1641476859103300180
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 05:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53D213A1;
	Thu,  6 Jan 2022 05:47:38 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11283F5A1;
	Thu,  6 Jan 2022 05:47:37 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/uboot: send bootcomplete event to secure
 enclave
Date: Thu,  6 Jan 2022 13:47:29 +0000
Message-Id: <20220106134730.10276-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jan 2022 13:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2806

From: Xueliang Zhong <xueliang.zhong@arm.com>

On corstone1000 platform, Secure Enclave will be expecting an event from uboot
when it performs capsule update. Previously, an event is sent at exitbootservice
level. This will create a problem when user wants to interrupt at UEFI shell,
hence, it is required to send an uboot efi initialized event at efi sub-system
initialization stage.

Vishnu Banavath (1):
  arm-bsp/uboot: send bootcomplete event to secure enclave

 ...bootcomplete-message-to-secure-encla.patch | 186 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 187 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch

-- 
2.17.1


