Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC22C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 16:27:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.105389.1701793630214674738
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 08:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A87B139F;
	Tue,  5 Dec 2023 08:27:56 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.36.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6A53F6C4;
	Tue,  5 Dec 2023 08:27:08 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH nanbield 0/1] arm-bsp/documentation: corstone1000: fix the steps in the user guide and instructions
Date: Tue,  5 Dec 2023 16:26:50 +0000
Message-Id: <20231205162651.200648-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Dec 2023 16:27:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5292

From: Emekcan Aras <Emekcan.Aras@arm.com>

Provide updates and fixes in the user guide identified during testing.

Emekcan Aras (1):
  arm-bsp/documentation: corstone1000: fix the steps in the user guide
    and instructions

 .../corstone1000/software-architecture.rst    |  2 +-
 .../documentation/corstone1000/user-guide.rst | 97 +++++++++++++------
 2 files changed, 67 insertions(+), 32 deletions(-)

--=20
2.25.1


