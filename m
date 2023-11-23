Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35701C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:47:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.99063.1700761643104288562
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 09:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB2821042;
	Thu, 23 Nov 2023 09:48:08 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B34003F7A6;
	Thu, 23 Nov 2023 09:47:21 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH nanbield 0/5] arm-bsp/corstone1000-fvp: Various FVP fixes and updates
Date: Thu, 23 Nov 2023 17:47:06 +0000
Message-Id: <20231123174711.2175145-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 17:47:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5265

From: Emekcan Aras <emekcan.aras@arm.com>

This patchset enables various fixes for the new corstone1000-fvp, and ena=
bles
virtio-net in corstone1000-fvp which is a new feature in the new FVP.

Emekcan Aras (5):
  arm/fvp-corstone1000: upgrade to 11.23_25
  arm-bsp/corstone1000-fvp: Add virtio-net configuration
  arm-bsp/corstone1000-fvp: add unpadded image support for MMC card
    config
  arm-bsp/corstone1000-fvp: Disable Time Annotation
  arm-bsp/u-boot: corstone1000: enable virtio-net support for FVP

 .../conf/machine/corstone1000-fvp.conf        | 14 ++-
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...rstone1000-enable-virtio-net-support.patch | 97 +++++++++++++++++++
 .../recipes-devtools/fvp/fvp-corstone1000.bb  |  6 +-
 4 files changed, 114 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
042-corstone1000-enable-virtio-net-support.patch

--=20
2.25.1


