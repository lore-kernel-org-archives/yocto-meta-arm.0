Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860F3C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:13:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7947.1646406806223110364
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 07:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4016143D;
	Fri,  4 Mar 2022 07:13:25 -0800 (PST)
Received: from e127418.cambridge.arm.com (e127418.cambridge.arm.com
 [10.1.25.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 936373F73D;
	Fri,  4 Mar 2022 07:13:24 -0800 (PST)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH 0/1] arm/fvp-corstone1000: update to latest version
Date: Fri,  4 Mar 2022 15:11:33 +0000
Message-Id: <20220304151134.21729-1-harry.moulton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 15:13:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3115

From: Harry Moulton <harry.moulton@arm.com>

This patch is to update the Corstone1000 FVP from version 11.16.21 to 11.=
17.23,
update the SHA256, update the license and set the correct FVP_ARCH.

Harry Moulton (1):
  arm/fvp-corstone1000: update to latest version

 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--=20
2.25.1


