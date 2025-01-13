Return-Path: <Philip.Puk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96560C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:35:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21767.1736786109559381667
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: philip.puk@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BF1112FC;
	Mon, 13 Jan 2025 08:35:37 -0800 (PST)
Received: from e125751.cambridge.arm.com (e125751.cambridge.arm.com [10.1.199.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B5E03F673;
	Mon, 13 Jan 2025 08:35:08 -0800 (PST)
From: philip.puk@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Philip Puk <philip.puk@arm.com>
Subject: [PATCH 0/1] arm-bsp/recipes-security: Add protobuf interface to crypto-sp in corstone1000
Date: Mon, 13 Jan 2025 16:34:26 +0000
Message-Id: <20250113163427.564404-1-philip.puk@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6319

From: Philip Puk <philip.puk@arm.com>

Adds protobuf interface to se-proxy-sp as the main crypto-sp uses it and
parsec service 1.4 also switch using protobuf interface.

Signed-off-by: Philip Puk philip.puk@arm.com

Philip Puk (1):
  arm-bsp/recipes-security: Add protobuf interface to crypto-sp in
    corstone1000

 .../0020-se-proxy-protobuf-change.patch       | 65 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0020-se-proxy-protobuf-change.patch

--=20
2.25.1


