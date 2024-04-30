Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556DCC19F4F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20347.1714494608425590514
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6353B2F4;
	Tue, 30 Apr 2024 09:30:34 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62A313F73F;
	Tue, 30 Apr 2024 09:30:07 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/6]  Add support for using the systemready layer to Corstone-1000 
Date: Tue, 30 Apr 2024 17:29:51 +0100
Message-Id: <20240430162957.94499-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5665

From: Emekcan Aras <Emekcan.Aras@arm.com>

Adds support for using the systemready layer and create ESP partition for=
=20
corstone1000.

Drew Reed (6):
  arm-systemready: Fix regex in arm-systemready-ir-acs recipe
  arm: Handle nodistro in firmware deployment
  arm-bsp: corstone1000: Configure Corstone-1000 to use the
    meta-arm-systemready layer
  arm-bsp: corstone1000: Make ESP partition available to Corstone-1000
  arm-bsp/corstone1000: Update Corstone-1000 user guide
  ci: Add Corstone-1000 to the SystemReady ACS build

 .gitlab-ci.yml                                |  14 ++
 .../conf/machine/corstone1000-fvp.conf        |  10 +-
 .../conf/machine/include/corstone1000.inc     |  11 +-
 .../documentation/corstone1000/user-guide.rst | 132 ++++--------------
 .../images/corstone1000-esp-image.bb          |  25 ++++
 .../corstone1000-flash-firmware-image.bb      |   2 +-
 meta-arm-bsp/wic/efi-disk-esp-only.wks.in     |   9 ++
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |   4 +-
 .../arm-systemready-ir-acs.bb                 |   2 +-
 .../images/firmware-deploy-image.bb           |   3 +-
 10 files changed, 96 insertions(+), 116 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-esp-imag=
e.bb
 create mode 100644 meta-arm-bsp/wic/efi-disk-esp-only.wks.in

--=20
2.25.1


