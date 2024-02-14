Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42057C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:03:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41634.1707919390394038582
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 06:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 022881FB;
	Wed, 14 Feb 2024 06:03:51 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0DCF3F5A1;
	Wed, 14 Feb 2024 06:03:08 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 0/4] Corstone-1000 Configuration changes
Date: Wed, 14 Feb 2024 14:02:59 +0000
Message-ID: <20240214140303.38535-1-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 14:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5379

From: Drew Reed <Drew.Reed@arm.com>

Move a large number of image and recipe specific items out of the machine
configuration to make it easier to modify the settings when building with
different images.
In addition Corstone-1000 now uses the poky distrobution for building the
initramfs image stored in flash.

Drew Reed (4):
  bsp: Move Corstone-1000 U-Boot configuration entries
  bsp: Move machine settings
  bsp,ci: Switch to poky distro
  bsp: Rename corstone1000-image

 ci/corstone1000-common.yml                    | 33 ++++++++-
 .../conf/machine/include/corstone1000.inc     | 72 ++++++-------------
 ...b =3D> corstone1000-flash-firmware-image.bb} | 30 ++++++--
 .../images/corstone1000-initramfs-image.bb    | 25 -------
 ...-firmware-image-capsule-update-image.json} |  0
 .../u-boot/u-boot-corstone1000.inc            | 12 +++-
 ...wks =3D> corstone1000-flash-firmware.wks.in} |  0
 7 files changed, 85 insertions(+), 87 deletions(-)
 rename meta-arm-bsp/recipes-bsp/images/{corstone1000-image.bb =3D> corst=
one1000-flash-firmware-image.bb} (56%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-initramf=
s-image.bb
 rename meta-arm-bsp/recipes-bsp/images/files/{corstone1000-image-capsule=
-update-image.json =3D> corstone1000-flash-firmware-image-capsule-update-=
image.json} (100%)
 rename meta-arm-bsp/wic/{corstone1000-image.corstone1000.wks =3D> corsto=
ne1000-flash-firmware.wks.in} (100%)

--
2.43.0


