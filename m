Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618B6C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 15:08:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.138895.1700838481061013222
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 07:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E951063;
	Fri, 24 Nov 2023 07:08:46 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.35.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2FE23F73F;
	Fri, 24 Nov 2023 07:07:58 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/3] arm-bsp/corstone1000: Fixing documentation and pinning SHAs
Date: Fri, 24 Nov 2023 15:07:47 +0000
Message-Id: <20231124150750.81497-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 15:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5275

From: Emekcan Aras <Emekcan.Aras@arm.com>

This patchset fixes various documentation issues and pins the SHAs in kas=
=20
files for upcoming Corstone-1000 release.

Abdellatif El Khlifi (1):
  kas: corstone1000: pin the SHAs

Emekcan Aras (2):
  arm-bsp/documentation: corstone1000: Add EFI system partition section
  arm-bsp/documentation: corstone1000: add a note and fix instructions

 kas/corstone1000-base.yml                     |  11 +-
 kas/corstone1000-fvp.yml                      |   2 +-
 kas/corstone1000-mps3.yml                     |   2 +-
 .../documentation/corstone1000/user-guide.rst | 148 +++++++++++++++---
 4 files changed, 137 insertions(+), 26 deletions(-)

--=20
2.25.1


