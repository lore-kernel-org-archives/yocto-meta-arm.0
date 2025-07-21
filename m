Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3EBC83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 11:45:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38358.1753098319295620389
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 04:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB79B153B;
	Mon, 21 Jul 2025 04:45:12 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.53.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEE183F6A8;
	Mon, 21 Jul 2025 04:45:17 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 0/3] Updates Upstream Status
Date: Mon, 21 Jul 2025 12:45:02 +0100
Message-ID: <20250721114506.120457-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Jul 2025 11:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6616

Updates the upstream status for various patches related to OP-TEE.

Frazer Carsley (3):
  arm/optee: Updates upstream status.
  arm-bsp/optee: Updates upstream status
  arm/scp-firmware: Updates upstream status

 .../0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch       | 2 +-
 .../scp-firmware/files/0001-OPTEE-Private-Includes.patch        | 2 +-
 .../0001-tee-supplicant-update-udev-systemd-install-code.patch  | 2 +-
 .../optee/optee-os/0003-optee-enable-clang-support.patch        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)


