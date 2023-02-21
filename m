Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4AFC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:51:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.49515.1677001897828359896
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 09:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E05C1650;
	Tue, 21 Feb 2023 09:52:20 -0800 (PST)
Received: from e126544.cambridge.arm.com (unknown [10.1.199.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 823803F881;
	Tue, 21 Feb 2023 09:51:36 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/2] Fixing psa-api-tests by increasing number of assets
Date: Tue, 21 Feb 2023 17:51:27 +0000
Message-Id: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 17:51:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4433

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

As Corstone1000 stores at boot time few efi variables.
Therefore, number of assets is increased to compansate this early usage.

In order to comply with isolation level 2, SPM backend should be set to I=
PC.
TF-M provides IPC as a SPM backend which gives SPM and each Secure Partit=
ion
it's own execution context. And provides higher isolation levels.


Mohamed Omar Asaker (2):
  arm-bsp/trusted-firmware-m:corstone1000: Increase number of assets
  arm-bsp/trusted-firmware-m:corstone1000: Set SPM backend to IPC

 ...rstone1000-Increase-number-of-assets.patch | 38 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  8 ++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-corstone1000-Increase-number-of-assets.patch

--=20
2.25.1


