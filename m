Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A20C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 12:38:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8510.1643891930467529786
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 04:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1660811D4;
	Thu,  3 Feb 2022 04:38:50 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com
 [10.1.37.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCCDC3F774;
	Thu,  3 Feb 2022 04:38:48 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/psa-arch-tests: corstone1000: fetching
 linux-trusted-services repo 
Date: Thu,  3 Feb 2022 12:38:38 +0000
Message-Id: <20220203123839.33950-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Feb 2022 12:38:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2942

From: Emekcan Aras <Emekcan.Aras@arm.com>

Fetching the repo at fetch task level. This makes sure CMake
does not fetch the code by its own.

Abdellatif El Khlifi (1):
  arm-bsp/psa-arch-tests: corstone1000: fetching linux-trusted-services
    repo

 .../trusted-services/psa-arch-tests-corstone1000.inc     | 9 +++++++++
 1 file changed, 9 insertions(+)

--=20
2.25.1


