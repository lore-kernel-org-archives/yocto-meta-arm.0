Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96F9C3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 11:55:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77878.1720439714169346731
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 04:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DC551042;
	Mon,  8 Jul 2024 04:55:38 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88DB3F766;
	Mon,  8 Jul 2024 04:55:12 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/2] Update OP-TEE OS to v4.2 for Corstone-1000
Date: Mon,  8 Jul 2024 13:54:58 +0200
Message-Id: <20240708115500.660234-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Jul 2024 11:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5868

From: Bence Balogh <bence.balogh@arm.com>


Bence Balogh (2):
  arm-bsp/optee:corstone1000: Update optee to v4.2
  arm-bsp/optee: Remove OP-TEE OS v4.1 recipe

 meta-arm-bsp/conf/machine/include/corstone1000.inc    |  2 +-
 meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.1.0.bb

--
2.25.1


