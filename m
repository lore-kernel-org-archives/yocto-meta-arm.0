Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CC1C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:34:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12766.1676561634685050097
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 07:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B861042;
	Thu, 16 Feb 2023 07:34:36 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A97053F703;
	Thu, 16 Feb 2023 07:33:53 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm,arm-bsp/classes: Move wic_nopt to meta-arm
Date: Thu, 16 Feb 2023 15:33:39 +0000
Message-Id: <20230216153340.1211690-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 15:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4406

From: Peter Hoyes <Peter.Hoyes@arm.com>

To support using the wic_nopt bbclass from BSP layers other than
meta-arm-bsp, move it to meta-arm.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 {meta-arm-bsp =3D> meta-arm}/classes/wic_nopt.bbclass | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arm-bsp =3D> meta-arm}/classes/wic_nopt.bbclass (100%)

diff --git a/meta-arm-bsp/classes/wic_nopt.bbclass b/meta-arm/classes/wic=
_nopt.bbclass
similarity index 100%
rename from meta-arm-bsp/classes/wic_nopt.bbclass
rename to meta-arm/classes/wic_nopt.bbclass
--=20
2.34.1


