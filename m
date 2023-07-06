Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB99DEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:42:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25755.1688654549422747401
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 07:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33CB71480;
	Thu,  6 Jul 2023 07:43:11 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.27.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2626C3F762;
	Thu,  6 Jul 2023 07:42:28 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH mickledore 1/2] arm-bsp/documentation: corstone1000: update the release note
Date: Thu,  6 Jul 2023 15:42:16 +0100
Message-Id: <20230706144217.70023-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706144217.70023-1-emekcan.aras@arm.com>
References: <20230706144217.70023-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 14:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4862

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Updates the release note copyright.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/release-notes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 1d8ca5ac..62e3f8ff 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -196,4 +196,4 @@ For all security issues, contact Arm by email at arm-=
security@arm.com.
=20
 --------------
=20
-*Copyright (c) 2022, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2023, Arm Limited. All rights reserved.*
--=20
2.25.1


