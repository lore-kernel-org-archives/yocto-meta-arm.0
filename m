Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA62C4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 16:04:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.125586.1699545843705400678
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 08:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEAA612FC;
	Thu,  9 Nov 2023 08:04:47 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 666DC3F64C;
	Thu,  9 Nov 2023 08:04:02 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-services: enable signaled handling interrupts for SPs
Date: Thu,  9 Nov 2023 16:03:56 +0000
Message-Id: <20231109160357.1580350-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Nov 2023 16:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5222

From: Emekcan Aras <emekcan.aras@arm.com>

Changes ns-interrupt-action for corstone1000. This will enable
preemption in the SPs which is the default way to handle interrupts in
trusted-firmware and optee documentation.


Emekcan Aras (1):
  arm-bsp/trusted-services: enable signaled handling interrupts for SPs

 ...stone1000-change-ns-interrupt-action.patch | 31 -------------------
 .../trusted-services/ts-arm-platforms.inc     |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-plat-corstone1000-change-ns-interrupt-action.patch

--=20
2.25.1


