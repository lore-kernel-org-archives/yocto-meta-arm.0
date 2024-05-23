Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F304C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:37:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.185.1716475057486421233
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 May 2024 07:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2538ADA7;
	Thu, 23 May 2024 07:38:01 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.82.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774213F766;
	Thu, 23 May 2024 07:37:36 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 1/1] kas: corstone1000: set branch to scarthgap
Date: Thu, 23 May 2024 16:37:22 +0200
Message-Id: <20240523143722.118544-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523143722.118544-1-bence.balogh@arm.com>
References: <20240523143722.118544-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 May 2024 14:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5763

From: Bence Balogh <bence.balogh@arm.com>

The default branch will be scarthgap so the poky and
openembedded will follow this branch.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index a8b98603..045a5473 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: scarthgap
=20
 repos:
   meta-arm:
--=20
2.25.1


