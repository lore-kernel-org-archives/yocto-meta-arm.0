Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D680C46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31822.1701871219568527053
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A75051474;
	Wed,  6 Dec 2023 06:01:04 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0D4A3F5A1;
	Wed,  6 Dec 2023 06:00:17 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/optee: corstone1000: Update optee to v4.0
Date: Wed,  6 Dec 2023 14:00:05 +0000
Message-Id: <20231206140006.36213-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5294

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change updates the optee version to v4.0

Harsimran Singh Tungal (1):
  corstone1000:arm-bsp/optee: Update optee to v4.0

 meta-arm-bsp/conf/machine/include/corstone1000.inc          | 2 +-
 meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bbappend | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.0.0.bb=
append

--=20
2.25.1


