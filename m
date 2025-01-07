Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98161E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:35:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20240.1736256909272280225
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 05:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5230D143D;
	Tue,  7 Jan 2025 05:35:36 -0800 (PST)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.38.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 726963F673;
	Tue,  7 Jan 2025 05:35:07 -0800 (PST)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux-yocto: corstone1000: Update to version 6.12
Date: Tue,  7 Jan 2025 13:34:53 +0000
Message-Id: <20250107133454.29502-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Jan 2025 13:35:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6311

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Set Linux kernel preferred version for Corstone-1000 to 6.12

Ali Can Ozaslan (1):
  arm-bsp/linux-yocto: corstone1000: Update to version 6.12

 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../documentation/corstone1000/user-guide.rst |  2 +-
 .../recipes-kernel/linux/linux-yocto_6.10.bb  | 42 -------------------
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.10.bb

--=20
2.34.1


