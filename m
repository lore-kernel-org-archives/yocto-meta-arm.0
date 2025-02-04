Return-Path: <Philip.Puk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87731C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 15:07:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.118179.1738681672667900519
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 07:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: philip.puk@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1960611FB;
	Tue,  4 Feb 2025 07:08:16 -0800 (PST)
Received: from e125751.cambridge.arm.com (e125751.cambridge.arm.com [10.1.199.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFC2D3F63F;
	Tue,  4 Feb 2025 07:07:51 -0800 (PST)
From: Philip.puk@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Philip Puk <philip.puk@arm.com>
Subject: [PATCH 0/1] arm-bsp/u-boot: corstone1000: Reserve memory for RSS comm pointer access protocol
Date: Tue,  4 Feb 2025 15:05:26 +0000
Message-Id: <20250204150527.326455-1-Philip.puk@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Feb 2025 15:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6366

From: Philip Puk <philip.puk@arm.com>

This memory was used by OpenAMP to establish communication between
the Secure Enclave and Trusted Services. After transitioning from
OpenAMP to RSE_COMMS, this shared memory is now configured for the
pointer access protocol in RSE_COMMS.

Since this memory may be still used by a user-space application
in linux as U-Boot is passing an EFI memory map starting from
0x80000000, this memory range should be reserved as the
pointer access protocol may be enabled on corstone1000 in the future.

Philip Puk (1):
  arm-bsp/u-boot: corstone1000: Reserve memory for RSS comm pointer
    access protocol

 .../u-boot/u-boot-corstone1000.inc            |  1 +
 .../0052-reserve-memory-for-se-comm.patch     | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
052-reserve-memory-for-se-comm.patch

--=20
2.25.1


