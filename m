Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59182C63682
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9947.1650641145290729444
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 08:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BCF01596;
	Fri, 22 Apr 2022 08:25:44 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com
 [10.1.25.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3BF63F5A1;
	Fri, 22 Apr 2022 08:25:43 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/trusted-firmware-a: corstone1000: update
 Tfa SHA
Date: Fri, 22 Apr 2022 16:25:36 +0100
Message-Id: <20220422152537.230848-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3284

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit updates Tfa SHA to remove the patches from the
recipe since all of them are upstreamed now.

Emekcan Aras (1):
  arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA

 .../trusted-firmware-a-corstone1000.inc             | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

--=20
2.25.1


