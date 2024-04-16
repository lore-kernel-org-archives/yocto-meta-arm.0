Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4024C04FF8
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 16:15:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25352.1713284096718271944
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 09:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7348339;
	Tue, 16 Apr 2024 09:15:23 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E09D93F792;
	Tue, 16 Apr 2024 09:14:54 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/3] Use U-Boot tools for capsule generation
Date: Tue, 16 Apr 2024 18:14:43 +0200
Message-Id: <20240416161446.217376-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 16:15:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5550

From: Bence Balogh <bence.balogh@arm.com>

The existing capsule generation class was modified to use the
tools provided by U-Boot.
The intermediate nopt image generation was added to Corstone-1000.

Bence Balogh (3):
  arm-bsp/corstone1000-flash-firmware-image: add nopt generation
  arm/uefi_capsule: use U-Boot for capsule generation
  arm-bsp/documentation: corstone1000: update capsule generation steps

 kas/corstone1000-image-configuration.yml      |  5 +
 .../documentation/corstone1000/user-guide.rst | 95 ++++++++-----------
 .../corstone1000-firmware-deploy-image.inc    |  2 +-
 .../corstone1000-flash-firmware-image.bb      | 43 ++++++++-
 ...h-firmware-image-capsule-update-image.json | 11 ---
 meta-arm/classes/uefi_capsule.bbclass         | 49 +++++-----
 6 files changed, 106 insertions(+), 99 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-fl=
ash-firmware-image-capsule-update-image.json

--
2.25.1


