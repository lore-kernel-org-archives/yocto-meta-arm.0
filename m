Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC2BC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:14:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18307.1721394888194865341
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 06:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20C711042;
	Fri, 19 Jul 2024 06:15:13 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 455FC3F762;
	Fri, 19 Jul 2024 06:14:47 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>
Subject: [PATCH scarthgap] kas: Update kas configuration for fvp-base.yml file
Date: Fri, 19 Jul 2024 14:14:34 +0100
Message-Id: <20240719131434.2272392-1-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 13:14:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5913

From: Amr Mohamed <amr.mohamed@arm.com>

Change defaults repo refspec in fvp-base.yml file from master to
scarthgap.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
---
 kas/fvp-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/fvp-base.yml b/kas/fvp-base.yml
index 18b9134b..0825a176 100644
--- a/kas/fvp-base.yml
+++ b/kas/fvp-base.yml
@@ -14,7 +14,7 @@ machine: fvp-base
=20
 defaults:
   repos:
-    refspec: master
+    refspec: scarthgap
=20
 repos:
   meta-arm:
--=20
2.25.1


