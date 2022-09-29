Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C852BC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:17:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9236.1664450267139555617
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 04:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFE1015BF;
	Thu, 29 Sep 2022 04:17:52 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73CF93F73B;
	Thu, 29 Sep 2022 04:17:45 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH kirkstone 0/1] arm-bsp/n1sdp: update linux-yocto patches
Date: Thu, 29 Sep 2022 12:17:34 +0100
Message-Id: <20220929111735.1517124-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 11:17:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3868

From: Adam Johnston <adam.johnston@arm.com>

Update N1SDP patches after linux-yocto update from oe-core

Jon Mason (1):
  arm-bsp/n1sdp: update linux-yocto patches

 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 18 ++++------
 ...irk-add-acs-override-for-PCI-devices.patch | 23 ++++++-------
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 33 +++++++++----------
 ...uirk-support-enabling-remote-chip-PC.patch | 31 ++++++++---------
 ...list-early-Arm-Neoverse-N1-revisions.patch | 17 ++++------
 5 files changed, 53 insertions(+), 69 deletions(-)

--=20
2.37.3


