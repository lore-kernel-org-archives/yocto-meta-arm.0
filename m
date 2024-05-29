Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2811DC25B7C
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 17:25:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21401.1717003492378741390
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 May 2024 10:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06561339;
	Wed, 29 May 2024 10:25:16 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.86.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F3F73F792;
	Wed, 29 May 2024 10:24:50 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-m: corstone1000: remove capsule update reset
Date: Wed, 29 May 2024 19:24:36 +0200
Message-Id: <20240529172437.698680-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 May 2024 17:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5771

From: Bence Balogh <bence.balogh@arm.com>

The reset on the TF-M side caused issues after the capsule update has
finished. The CapsuleApplication already does the proper reset after
capsule update finishes so no need resetting twice

Bence Balogh (1):
  arm-bsp/trusted-firmware-m: corstone1000: remove capsule update reset

 ...00-Remove-reset-after-capsule-update.patch | 28 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-corstone1000-Remove-reset-after-capsule-update.patch

--
2.25.1


