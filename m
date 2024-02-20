Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F905C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:47:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16433.1708444069461456227
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4C2FEC;
	Tue, 20 Feb 2024 07:48:28 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3556A3F7F4;
	Tue, 20 Feb 2024 07:47:48 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 0/4] Enable Corstone-1000 multiconfig builds
Date: Tue, 20 Feb 2024 15:47:37 +0000
Message-ID: <20240220154741.66754-1-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5387

From: Drew Reed <Drew.Reed@arm.com>

To enable greater testing of Corstone-1000 using mass storage image to ov=
ercome
the rootfs size limitation of the standard flash based image.  This patch=
set
now enables us to continue to build Corstone-1000 as we always have done =
but
the CI system now builds and uses a larger test mass storage image capabl=
e of
running the standard testimage test set.

Drew Reed (4):
  meta-arm: Support firmware building under a multiconfig
  bsp,ci: Build Corstone-1000 firmware under multiconfig
  bsp: Restore the ability to build firmware only
  ci: Add back testing of firmware only builds

 .gitlab-ci.yml                                | 10 ++++--
 ci/corstone1000-common.yml                    | 28 +++++++++-------
 ci/corstone1000-firmware-only.yml             | 25 ++++++++++++++
 ci/corstone1000-fvp.yml                       |  5 ---
 .../conf/machine/corstone1000-fvp.conf        |  3 +-
 .../conf/machine/include/corstone1000.inc     | 14 ++++++--
 .../corstone1000-firmware-deploy-image.inc    | 11 +++++++
 .../images/firmware-deploy-image.bbappend     |  4 +++
 .../linux/files/corstone1000/defconfig        | 33 +++++++++++++++++++
 .../wic/corstone1000-flash-firmware.wks.in    |  2 +-
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      | 10 ++++++
 meta-arm/conf/multiconfig/firmware.conf       | 13 ++++++++
 .../images/firmware-deploy-image.bb           | 31 +++++++++++++++++
 13 files changed, 166 insertions(+), 23 deletions(-)
 create mode 100644 ci/corstone1000-firmware-only.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-firmware=
-deploy-image.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/firmware-deploy-image=
.bbappend
 create mode 100644 meta-arm-bsp/wic/efi-disk-no-swap.wks.in
 create mode 100644 meta-arm/conf/multiconfig/firmware.conf
 create mode 100644 meta-arm/recipes-bsp/images/firmware-deploy-image.bb

--
2.43.0


