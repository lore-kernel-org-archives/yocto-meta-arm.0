Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750DBC3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:51:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.80920.1746550286088338637
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 May 2025 09:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5135339;
	Tue,  6 May 2025 09:51:15 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [10.1.36.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3AC03F5A1;
	Tue,  6 May 2025 09:51:24 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 0/1] corstone1000: Align PSA crypto structs with TF-M
Date: Tue,  6 May 2025 17:50:44 +0100
Message-Id: <20250506165045.509-1-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 May 2025 16:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6486

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

The TF-M was upgraded to v2.1.1 for the Corstone-1000. The TS had to be
aligned with it.

Ali Can Ozaslan (1):
  arm-bsp/trusted-services: corstone1000: Align PSA crypto structs with
    TF-M

 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch | 29 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch

--=20
2.34.1


