Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9A9C3A59F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 13:33:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19977.1669210378254202649
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 05:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 568B11FB;
	Wed, 23 Nov 2022 05:33:04 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.38.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6637D3F73D;
	Wed, 23 Nov 2022 05:32:56 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH langdale 0/2] arm-bsp: Corstone1000 update user guide and documentation 
Date: Wed, 23 Nov 2022 13:32:46 +0000
Message-Id: <20221123133248.558581-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 13:33:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4158

From: Emekcan Aras <Emekcan.Aras@arm.com>

This patchset updates the Corstone1000 documentation and upgrades the FVP=
 to the latest release version. Backporting these patches to langdale for=
 the upcoming release.

Emekcan (1):
  arm/fvp: Upgrade Corstone1000 FVP

Emekcan Aras (1):
  arm-bsp/documentation: corstone1000: update the user guide

 .../documentation/corstone1000/change-log.rst |  2 +-
 .../corstone1000/release-notes.rst            | 22 ++++-
 .../documentation/corstone1000/user-guide.rst | 82 ++++++++++++-------
 .../recipes-devtools/fvp/fvp-corstone1000.bb  |  8 +-
 4 files changed, 79 insertions(+), 35 deletions(-)

--=20
2.25.1


