Return-Path: <qi.feng@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F59C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 10:24:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19825.1675247084049856487
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 02:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: qi.feng@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 929384B3;
	Wed,  1 Feb 2023 02:25:25 -0800 (PST)
Received: from a015967.shanghai.arm.com (a015967.shanghai.arm.com [10.169.190.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 190653F882;
	Wed,  1 Feb 2023 02:24:41 -0800 (PST)
From: Qi Feng <qi.feng@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Robbie.Cao@arm.com,
	qi.feng@arm.com
Subject: [PATCH][langdale] kas/fvp-baser-aemv8r64: Use langdale as kas default refspec
Date: Wed,  1 Feb 2023 18:24:32 +0800
Message-Id: <20230201102432.82144-1-qi.feng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Feb 2023 10:24:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4344

The default refspec for the repos used by kas is now langdale.

Signed-off-by: Qi Feng <qi.feng@arm.com>
---
 kas/fvp-baser-aemv8r64-bsp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index dd175d03..70a58bed 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -6,7 +6,7 @@ machine: fvp-baser-aemv8r64
=20
 defaults:
   repos:
-    refspec: master
+    refspec: langdale
=20
 repos:
   meta-arm:
--=20
2.25.1


