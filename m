Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE4DC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:53:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1563.1645113235287774980
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC814113E;
	Thu, 17 Feb 2022 07:53:54 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C13A43F718;
	Thu, 17 Feb 2022 07:53:53 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/2] arm-bsp/security: replace mbedcrypto with mbedtls
Date: Thu, 17 Feb 2022 15:53:44 +0000
Message-Id: <20220217155346.2566392-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3004

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit replaces mbedcrpyto with mbedtls on the trusted-service recip=
e.

Signed-off-by: Vishnu Banavath vishnu.banavath@arm.com

Vishnu Banavath (2):
  arm-bsp/security: replace mbedcrypto with mbedtls
  arm-bsp/tf-m: update git SHA

 .../trusted-firmware-m-corstone1000.inc         |  3 ++-
 .../trusted-services/ts-corstone1000.inc        | 17 ++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

--=20
2.25.1


