Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74C3C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 12:07:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13501.1721304428380688456
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 05:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF4C106F;
	Thu, 18 Jul 2024 05:07:32 -0700 (PDT)
Received: from PW05BKJD.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DFE93F766;
	Thu, 18 Jul 2024 05:07:06 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-m: corstone1000: Increase PS size
Date: Thu, 18 Jul 2024 13:06:42 +0100
Message-Id: <20240718120643.1181-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 12:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5893

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

The size of PS storage is increased in Secure Flash to minimize
the possibilities of it to run out of memory.

During testing of SecureBoot and SIE tests on MPS3, it has been
observed failures due to secure flash is running out of memory.

Ali Can Ozaslan (1):
  arm-bsp/trusted-firmware-m: corstone1000: Increase PS size

 ...tone1000-Increase-flash-PS-area-size.patch | 34 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-platform-corstone1000-Increase-flash-PS-area-size.patch

--=20
2.34.1


