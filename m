Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19491C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:59:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19543.1714492774014872582
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 099E62F4;
	Tue, 30 Apr 2024 09:00:00 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6AFE3F73F;
	Tue, 30 Apr 2024 08:59:32 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/5] Add back U-Boot capsule generation with fixes
Date: Tue, 30 Apr 2024 17:59:19 +0200
Message-Id: <20240430155924.799192-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5655

From: Bence Balogh <bence.balogh@arm.com>

The following commits were reverted because it had a build race
condition:
  arm-bsp/corstone1000-flash-firmware-image: add nopt generation
  arm/uefi_capsule: use U-Boot for capsule generation
  arm-bsp/documentation: corstone1000: update capsule generation steps

The race-condition is fixed now: the uefi capsule image is depending
on the linux-yocto's do_deploy task correctly.

The core-image-minimal is also replaced so the initramfs' do_testimage
task can be skipped.

Abdellatif El Khlifi (1):
  arm-bsp/corstone1000-recovery-image: replace core-image-minimal

Bence Balogh (4):
  arm-bsp/corstone1000-flash-firmware-image: add nopt generation
  arm/uefi_capsule: use U-Boot for capsule generation
  arm-bsp/documentation: corstone1000: update capsule generation steps
  arm-bsp/corstone1000-flash-firmware-image: fix capsule dependency
    issue

 kas/corstone1000-image-configuration.yml      |  9 +-
 .../documentation/corstone1000/user-guide.rst | 95 ++++++++-----------
 .../corstone1000-firmware-deploy-image.inc    |  2 +-
 .../corstone1000-flash-firmware-image.bb      | 44 ++++++++-
 .../images/corstone1000-recovery-image.bb     |  7 ++
 ...h-firmware-image-capsule-update-image.json | 11 ---
 meta-arm/classes/uefi_capsule.bbclass         | 49 +++++-----
 7 files changed, 116 insertions(+), 101 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-recovery=
-image.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-fl=
ash-firmware-image-capsule-update-image.json

--
2.25.1


