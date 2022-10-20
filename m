Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93B4C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 16:42:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11949.1666284132370722727
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 09:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB4EB1FB;
	Thu, 20 Oct 2022 09:42:17 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.37.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A91423F792;
	Thu, 20 Oct 2022 09:42:10 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/1] arm-bsp/u-boot: corstone1000: support 32bit ffa direct 
Date: Thu, 20 Oct 2022 17:41:53 +0100
Message-Id: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Oct 2022 16:42:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3989

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

This patch Adds support of 32bit ffa direct messaging mode=20

Mohamed Omar Asaker (1):
  arm-bsp/u-boot: corstone1000: support 32bit ffa direct messaging

 ...-support-for-32-bit-direct-messaging.patch | 182 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +-
 2 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-ffa-add-support-for-32-bit-direct-messaging.patch

--=20
2.25.1


