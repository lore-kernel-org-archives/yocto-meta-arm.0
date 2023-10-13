Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E6CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:29:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.35408.1697192944931838439
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 03:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2BA611FB;
	Fri, 13 Oct 2023 03:29:44 -0700 (PDT)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42753F762;
	Fri, 13 Oct 2023 03:29:03 -0700 (PDT)
From: vikas.katariya@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH 0/1] *** Fix RSA key generation issue for Corstone-1000 ***
Date: Fri, 13 Oct 2023 11:28:53 +0100
Message-Id: <20231013102854.2623711-1-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 10:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5113

From: Vikas Katariya <vikas.katariya@arm.com>

This patch changes the default size for `ITS_MAX_ASSET_SIZE` on
Trusted-firmware-m for Corstone-1000 platform

Vikas Katariya (1):
  arm-bsp/corstone1000: Fix RSA key generation issue

 ...tone1000-increase-ITS-max-asset-size.patch | 29 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-platform-corstone1000-increase-ITS-max-asset-size.patch

--=20
2.25.1


