Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19588CE7B19
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 18:36:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.540.1695926194246666291
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 11:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9EE81FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 28 Sep 2023 11:37:11 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77C423F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 28 Sep 2023 11:36:33 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] README: remove reference to meta-arm-autonomy
Date: Thu, 28 Sep 2023 13:36:28 -0500
Message-Id: <20230928183628.3839203-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Sep 2023 18:36:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5079

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 README.md | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/README.md b/README.md
index 77792585..82c326de 100644
--- a/README.md
+++ b/README.md
@@ -6,10 +6,6 @@ This repository contains the Arm layers for OpenEmbedded=
.
=20
   This layer contains general recipes for the Arm architecture, such as =
firmware, FVPs, and Arm-specific integration.
=20
-* meta-arm-autonomy
-
-  This layer is the distribution for a reference stack for autonomous sy=
stems.
-
 * meta-arm-bsp
=20
   This layer contains machines for Arm reference platforms, for example =
FVP Base, N1SDP, and Juno.
--=20
2.30.2


