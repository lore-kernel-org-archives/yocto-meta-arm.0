Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2146AC04AB6
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 17:10:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1200.1695229841071126603
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 10:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12F681FB;
	Wed, 20 Sep 2023 10:11:17 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F15C3F67D;
	Wed, 20 Sep 2023 10:10:39 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone1000: bump kernel version to v6.4
Date: Wed, 20 Sep 2023 18:10:32 +0100
Message-Id: <20230920171033.3139478-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Sep 2023 17:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5066

From: Xueliang Zhong <xueliang.zhong@arm.com>

Bump kernel version to v6.4 and rebase the patches on top of this new
version.

Xueliang Zhong (1):
  arm-bsp/corstone1000: bump kernel version to v6.4

 .../conf/machine/include/corstone1000.inc       |  2 +-
 .../0002-Add-external-system-driver.patch       | 17 ++++++++---------
 ...0003-Add-rpmsg-driver-for-corstone1000.patch |  7 ++-----
 .../0004-rpmsg-arm-fix-return-value.patch       |  7 ++-----
 ...-update-chrdev-to-ctrldev-registration.patch |  7 ++-----
 ...-Adds-workaround-for-cs1k-specific-bug.patch | 11 ++++-------
 6 files changed, 19 insertions(+), 32 deletions(-)

--=20
2.25.1


