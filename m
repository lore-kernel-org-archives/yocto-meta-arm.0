Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F54C4167D
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 13:37:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20078.1669210641899352462
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 05:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087311FB;
	Wed, 23 Nov 2022 05:37:28 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.38.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30EC23F73D;
	Wed, 23 Nov 2022 05:37:20 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH langdale 0/1] kas/corstone1000-base.yml:set refspec for
Date: Wed, 23 Nov 2022 13:37:12 +0000
Message-Id: <20221123133713.561237-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 13:37:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4161

From: Emekcan Aras <Emekcan.Aras@arm.com>

Sets refspec for meta-openembedded and poky for upcoming
Corstone1000 release. These SHAs are tested.

Emekcan Aras (1):
  kas/corstone1000-base.yml: set refspec for Corstone1000 release

 kas/corstone1000-base.yml | 2 ++
 1 file changed, 2 insertions(+)

--=20
2.25.1


