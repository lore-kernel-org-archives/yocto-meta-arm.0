Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8964C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:36:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7286.1655904996245197618
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081951477;
	Wed, 22 Jun 2022 06:36:36 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.85.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CCBE3F534;
	Wed, 22 Jun 2022 06:36:34 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	jiamei.xie@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/3] arm-bsp/docs: Update fvp-baser-aemv8r64 U-Boot version to
 2022.04
Date: Wed, 22 Jun 2022 14:36:19 +0100
Message-Id: <20220622133620.1524265-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622133620.1524265-1-peter.hoyes@arm.com>
References: <20220622133620.1524265-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 13:36:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3526

From: Peter Hoyes <Peter.Hoyes@arm.com>

Issue-Id: SCM-4388
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Id75f5fd56c04039da3ff976c85776b5e1706939a
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 26024aa..6986afd 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -29,7 +29,7 @@ and run:
=20
  - FVP_Base_AEMv8R: v11.18.16
  - boot-wrapper-aarch64: provides PSCI support
- - U-Boot: v2022.01 - provides UEFI services
+ - U-Boot: v2022.04 - provides UEFI services
  - Linux kernel: linux-yocto-5.15
  - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.15
=20
--=20
2.25.1


