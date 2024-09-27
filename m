Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B38DCDD1C1
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:49:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.72321.1727452172107001354
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFE114BF;
	Fri, 27 Sep 2024 08:50:01 -0700 (PDT)
Received: from PW05BKJD.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17BBA3F6A8;
	Fri, 27 Sep 2024 08:49:30 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 0/1] arm-bsp/optee: corstone1000: Update upstream status
Date: Fri, 27 Sep 2024 16:49:15 +0100
Message-Id: <20240927154916.13427-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:49:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6130

From: Ali Can Ozaslan <ali.oezaslan@arm.com>=0D

This MR just changes the upstream status for OP-TEE patch.=0D
=0D
Ali Can Ozaslan (1):=0D
  arm-bsp/optee: corstone1000: Update upstream status=0D
=0D
 .../files/optee-os/corstone1000/0002-increase-tzdram-size.patch | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

