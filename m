Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECA7C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 14:03:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14859.1715868219797437495
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 07:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA9EDA7;
	Thu, 16 May 2024 07:04:03 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.32.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 998B23F7A6;
	Thu, 16 May 2024 07:03:38 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: corstone1000: fix reset sequence
Date: Thu, 16 May 2024 15:03:23 +0100
Message-Id: <20240516140324.67124-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 14:03:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5717

From: Emekcan Aras <Emekcan.Aras@arm.com>

Corstone1000 does not properly clean the cache and disable gic interrupts
before the reset. This causes a race condition especially in FVP after re=
set.
This adds proper sequence before resetting the platform.

Emekcan Aras (1):
  arm-bsp/trusted-firmware-a: corstone1000: fix reset sequence

 ...-clean-the-cache-and-disable-interru.patch | 46 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch

--=20
2.25.1


