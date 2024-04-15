Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2B8C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:26:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16732.1713173198805705823
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 02:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4562F4;
	Mon, 15 Apr 2024 02:27:06 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.76.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C12BA3F64C;
	Mon, 15 Apr 2024 02:26:37 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/1] Disable multiconfig for CS1000 firmware build
Date: Mon, 15 Apr 2024 11:26:26 +0200
Message-Id: <20240415092627.341741-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 09:26:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5541

From: Bence Balogh <bence.balogh@arm.com>


Bence Balogh (1):
  kas: corstone1000: disable multiconfig for firmware builds

 kas/corstone1000-firmware-only.yml | 2 ++
 1 file changed, 2 insertions(+)

--
2.25.1


