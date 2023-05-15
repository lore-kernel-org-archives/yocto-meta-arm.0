Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF09C7EE23
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 16:02:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.92637.1684166543163854323
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 May 2023 09:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25D122F4;
	Mon, 15 May 2023 09:03:07 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E0893F663;
	Mon, 15 May 2023 09:02:21 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/2] arm-bsp: corstone1000: Fix Capsule Update
Date: Mon, 15 May 2023 17:02:15 +0100
Message-Id: <20230515160217.54867-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 16:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4648

From: Emekcan Aras <emekcan.aras@arm.com>

Fixes issues on capsule update feature for corstone1000 platform after GPT and 
BL1 changes.

Emekcan Aras (2):
  arm-bsp/trusted-firmware-m: Align Capsule Update with GPT changes
  arm-bsp/wic: corstone1000: Fix and limit the partition size for
    corstone1000

 ...e1000-Increase-BL2-size-in-flash-lay.patch | 29 ++++++++
 ...-Corstone1000-Increase-BL2_DATA_SIZE.patch | 33 +++++++++
 ...e1000-Calculate-the-new-CRC32-value-.patch | 71 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  3 +
 .../wic/corstone1000-image.corstone1000.wks   | 18 ++---
 5 files changed, 146 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch

-- 
2.17.1


