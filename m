Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E19C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:52:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12542.1647359558591710850
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Mar 2022 08:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E03081474;
	Tue, 15 Mar 2022 08:52:36 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.44.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BDF63F766;
	Tue, 15 Mar 2022 08:52:34 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/1] *** meta-arm/classes: Create wic_nopt class ***
Date: Tue, 15 Mar 2022 15:52:20 +0000
Message-Id: <20220315155221.530910-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:52:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3173

From: Emekcan Aras <Emekcan.Aras@arm.com>

Corstone500 and Corstone1000 use wic_nopt.bbclass. This commit creates
this class for Corstone500 and Corstone1000 in meta-arm classes to remove
the need for meta-arm-image repo.
   =20
Signed-off-by: Emekcan Aras emekcan.aras@arm.com

Emekcan Aras (1):
  meta-arm/classes: Create wic_nopt class

 meta-arm-bsp/classes/wic_nopt.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm-bsp/classes/wic_nopt.bbclass

--=20
2.25.1


