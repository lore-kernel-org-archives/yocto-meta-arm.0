Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BF0C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 12:43:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.199054.1698324191184711597
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 05:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AFF62F4;
	Thu, 26 Oct 2023 05:43:52 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D19CD3F738;
	Thu, 26 Oct 2023 05:43:09 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/2] arm-bsp/u-boot: corstone1000: on-disk capsule update
Date: Thu, 26 Oct 2023 13:43:01 +0100
Message-Id: <20231026124303.2433202-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 12:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5176

From: Emekcan Aras <emekcan.aras@arm.com>

This patchset enables on-disk capsule update and fixes few missing flag c=
hecks
for capsule-update.

Emekcan Aras (2):
  arm-bsp/u-boot: corstone1000: enable on-disk capsule update
  arm-bsp/u-boot: corstone1000: fix runtime capsule update flag checks

 .../u-boot/u-boot-corstone1000.inc            |  2 +
 ...nables-ondisk-capsule-update-feature.patch | 33 +++++++++++
 ...-runtime-capsule-update-flags-checks.patch | 56 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-enables-ondisk-capsule-update-feature.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-fix-runtime-capsule-update-flags-checks.patch

--=20
2.25.1


