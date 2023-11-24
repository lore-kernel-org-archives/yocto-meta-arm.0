Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0CBC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 16:30:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.140493.1700843414191127896
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 08:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10AE51063;
	Fri, 24 Nov 2023 08:31:00 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.35.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE9A93F73F;
	Fri, 24 Nov 2023 08:30:12 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/documentation: corstone1000: add readthedocs.yaml file
Date: Fri, 24 Nov 2023 16:30:04 +0000
Message-Id: <20231124163005.96856-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 16:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5279

From: Emekcan Aras <Emekcan.Aras@arm.com>

Migrate Corstone-1000 documentation to .readthedocs.yaml configuration fi=
le v2.
=20
Emekcan Aras (1):
  arm-bsp/documentation: corstone1000: add readthedocs.yaml file

 .../documentation/corstone1000/.readthedocs.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/.readthedocs.=
yaml

--=20
2.25.1


