Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9375C67871
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 10:28:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4868.1666866527317964301
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 03:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8142B1FB;
	Thu, 27 Oct 2022 03:28:52 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.36.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ABC93F445;
	Thu, 27 Oct 2022 03:28:44 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH langdale 0/1] arm-bsp/corstone1000: add msd configs for fvp
Date: Thu, 27 Oct 2022 11:28:35 +0100
Message-Id: <20221027102836.649982-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 10:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4048

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

This patch is to add p_max_block_count and
pl180_fifo_depth config paramters in the fvp machine
config file

Mohamed Omar Asaker (1):
  arm-bsp/corstone1000: add msd configs for fvp

 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 2 ++
 1 file changed, 2 insertions(+)

--=20
2.25.1


