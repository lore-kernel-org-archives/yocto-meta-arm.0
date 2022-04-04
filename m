Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50008C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.34216.1649074891990195358
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 05:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9099AD6E;
	Mon,  4 Apr 2022 05:21:31 -0700 (PDT)
Received: from e127954.cambridge.arm.com (e127954.cambridge.arm.com
 [10.1.195.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D56FF3F5A1;
	Mon,  4 Apr 2022 05:21:30 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 0/1] plat/corstone1000: add support for SDCard
Date: Mon,  4 Apr 2022 13:21:20 +0100
Message-Id: <20220404122121.1904063-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3235

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to add SDCard support for corstone1000 FVP.

Vishnu Banavath (1):
  arm-bsp/u-boot: add SDCard support for corstone1000 FVP

 ...-corstone1000-add-support-for-SDCard.patch | 166 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
053-plat-corstone1000-add-support-for-SDCard.patch

--=20
2.25.1


