Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2754FC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:14:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4817.1652879647521588740
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B06EF23A;
	Wed, 18 May 2022 06:14:06 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.2.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60EFA3F73D;
	Wed, 18 May 2022 06:14:05 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/3] arm/trusted-firmware-a: upgrade mbedtls to 2.28
Date: Wed, 18 May 2022 14:13:53 +0100
Message-Id: <20220518131356.86191-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3432

From: Emekcan Aras <Emekcan.Aras@arm.com>

This patchset upgrades the mbedtls to 2.28 and fixes issues in the
corstone1000 and TC due to the upgrade.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>

emeara01 (3):
  arm/trusted-firmware-a: upgrade mbedtls to 2.28
  arm-bsp/trusted-firmware-a: corstone1000: fix FF-A Version in SPMC
    manifest
  arm-bsp/trusted-firmware-a: increase BL2 size for TC

 ...01-Fix-FF-A-version-in-SPMC-manifest.patch | 34 +++++++++
 ...01-plat-tc-Increase-maximum-BL2-size.patch |  4 +-
 .../trusted-firmware-a-corstone1000.inc       |  4 ++
 ...uild-deps-upgrade-to-mbed-TLS-2.28.0.patch | 72 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 +-
 .../trusted-firmware-a_2.6.bb                 |  6 +-
 6 files changed, 118 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0001-Fix-FF-A-version-in-SPMC-manifest.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/build-d=
eps-upgrade-to-mbed-TLS-2.28.0.patch

--=20
2.25.1


