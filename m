Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5568EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:42:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25753.1688654548268738060
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 07:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A13BD75;
	Thu,  6 Jul 2023 07:43:10 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.27.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BE293F762;
	Thu,  6 Jul 2023 07:42:27 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH mickledore 0/2] arm-bsp/documentation: corstone1000: update documentation
Date: Thu,  6 Jul 2023 15:42:15 +0100
Message-Id: <20230706144217.70023-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 14:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4861

From: Emekcan Aras <Emekcan.Aras@arm.com>

Updates corstone1000 documentation and release notes.

Abdellatif El Khlifi (2):
  arm-bsp/documentation: corstone1000: update the release note
  arm-bsp/documentation: corstone1000: update user guide

 .../corstone1000/release-notes.rst            |  2 +-
 .../documentation/corstone1000/user-guide.rst | 58 +++++++++++++++----
 2 files changed, 47 insertions(+), 13 deletions(-)

--=20
2.25.1


