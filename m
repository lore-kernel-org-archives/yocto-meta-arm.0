Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BACC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 18:27:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1645.1708367219882633480
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 10:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB47DFEC;
	Mon, 19 Feb 2024 10:27:38 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.93.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4E153F73F;
	Mon, 19 Feb 2024 10:26:57 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH nanbield 0/1] arm-bsp/optee: Improve PIN counter handling robustness
Date: Mon, 19 Feb 2024 18:26:36 +0000
Message-Id: <20240219182637.530206-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Feb 2024 18:27:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5385

From: Emekcan Aras <Emekcan.Aras@arm.com>

This patches a security issue discovered lately in OP-TEE version
earlier than v4.1. The detailed report can be found here:

https://github.com/OP-TEE/optee_os/security/advisories/GHSA-2f5m-q4w3-865=
p

Emekcan Aras (1):
  arm-bsp/optee: Improve PIN counter handling robustness

 ...rove-PIN-counter-handling-robustness.patch | 205 ++++++++++++++++++
 .../recipes-security/optee/optee-os_3.22.0.bb |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0=
005-ta-pkcs11-Improve-PIN-counter-handling-robustness.patch

--=20
2.25.1


