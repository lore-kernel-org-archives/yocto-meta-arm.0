Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13412C6FA86
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:15:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.27906.1664194533371266480
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 05:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 559E61063;
	Mon, 26 Sep 2022 05:15:39 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC76D3F73B;
	Mon, 26 Sep 2022 05:15:31 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/2] Adding a test application for external system
Date: Mon, 26 Sep 2022 13:15:19 +0100
Message-Id: <20220926121521.35674-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 12:15:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3835

From: Emekcan <emekcan.aras@arm.com>

Adds a linux userspace test application and a recipe to test 
external system in corstone1000 platform.

Emekcan (2):
  arm-bsp/test: Adding a test app for external system
  arm-bsp/images: Adding external system test to initramfs image

 .../images/corstone1000-initramfs-image.bb    |  3 +++
 .../corstone1000-external-sys-tests_1.0.bb    | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb

-- 
2.17.1


