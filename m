Return-Path: <delane.brandy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F2C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 09:56:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44988.1693821386235896925
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 02:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: delane.brandy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5CBE143D;
	Mon,  4 Sep 2023 02:57:03 -0700 (PDT)
Received: from e127094.arm.com (unknown [10.57.92.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2183F793;
	Mon,  4 Sep 2023 02:56:24 -0700 (PDT)
From: delane.brandy@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com
Cc: nd@arm.com,
	Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone1000: mmc2-enablement
Date: Mon,  4 Sep 2023 10:56:14 +0100
Message-Id: <20230904095615.516245-1-delane.brandy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Sep 2023 09:56:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5017

From: Delane Brandy <delane.brandy@arm.com>

Enables the support of a second mmc card, which enables distro installati=
on.

Delane Brandy (1):
  arm-bsp/corstone1000: mmc2-enablement

 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 7 +++++++
 1 file changed, 7 insertions(+)

--=20
2.34.1


