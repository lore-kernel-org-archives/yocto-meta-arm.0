Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABE6C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 13:08:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12190.1708607295174962644
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 05:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB62DA7;
	Thu, 22 Feb 2024 05:08:53 -0800 (PST)
Received: from e126523.arm.com (unknown [10.57.65.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 009123F762;
	Thu, 22 Feb 2024 05:08:12 -0800 (PST)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/1] Disable libmetal doc generation for CS1000 in TFM
Date: Thu, 22 Feb 2024 14:08:12 +0100
Message-Id: <20240222130813.380961-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Feb 2024 13:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5396

From: Bence Balogh <bence.balogh@arm.com>

This is a workaround to prevent configuration errors in TFM if doxygen
is found.

Bence Balogh (1):
  arm-bsp/trusted-firmware-m: disable libmetal doc generation

 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 ++
 1 file changed, 2 insertions(+)

--
2.25.1


