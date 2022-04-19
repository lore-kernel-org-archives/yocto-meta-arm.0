Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D387C4167D
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1968.1650357689627581373
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 01:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4044C1042;
	Tue, 19 Apr 2022 01:41:28 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.10.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 780223F5A1;
	Tue, 19 Apr 2022 01:41:27 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux: corstone1000: Handle compatibility with
 different firmware versions
Date: Tue, 19 Apr 2022 09:41:04 +0100
Message-Id: <20220419084105.30820-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3274

From: Emekcan Aras <Emekcan.Aras@arm.com>

A kernel patch that fixes FFA version compatibility issues.

Abdellatif El Khlifi (1):
  arm-bsp/linux: corstone1000: Handle compatibility with different
    firmware versions

 ...e-arm_ffa-Handle-compatibility-with-.patch | 90 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch

--=20
2.25.1


