Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB77C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:14:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1066.1642443260323277193
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FFD76D;
	Mon, 17 Jan 2022 10:14:19 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE6663F774;
	Mon, 17 Jan 2022 10:14:18 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 0/2] arm-bsp/tf-m: fix capsule instability
Date: Mon, 17 Jan 2022 18:14:03 +0000
Message-Id: <20220117181405.28504-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2842

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to upgrade TF-M to latest git hash which contains
fix for capsule instability issue for corstone1000 platform.

Latest TF-M would also require v3.1 mbedtls. Also updated git hash
for mbedtls repo.

Vishnu Banavath (2):
  arm-bsp/tf-m: fix capsule instability issue for corstone1000
  arm-bsp/uboot: fix null pointer exception for get_image_info

 .../trusted-firmware-m-corstone1000.inc       | 14 ++---
 ...ull-pointer-exception-with-get_image.patch | 60 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 3 files changed, 66 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader-fix-null-pointer-exception-with-get_image.patch

-- 
2.17.1


