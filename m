Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C368DC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 17:07:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9581.1641316040900549289
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 09:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBC3313A1;
	Tue,  4 Jan 2022 09:07:19 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.35.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B3453F774;
	Tue,  4 Jan 2022 09:07:18 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 0/1] arm-bsp/u-boot: corstone1000: Disable mm_communicate
 failure log
Date: Tue,  4 Jan 2022 17:06:50 +0000
Message-Id: <20220104170651.15240-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 17:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2782

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

When a getVariable() call is made with data size set to 0,
mm_communicate should return EFI_BUFFER_TOO_SMALL. This is
an expected behavior. There should not be any failure logs
in this case. So the error log is commented here.

Gowtham Suresh Kumar (1):
  arm-bsp/u-boot: corstone1000: Disable mm_communicate failure log

 ...0-Comment-mm_communicate-failure-log.patch | 35 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-Comment-mm_communicate-failure-log.patch

-- 
2.17.1


