Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:24:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.409.1634228645322303559
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Oct 2021 09:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5A5E11D4;
	Thu, 14 Oct 2021 09:24:04 -0700 (PDT)
Received: from e126543.cambridge.arm.com (unknown [10.1.195.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C9E03F66F;
	Thu, 14 Oct 2021 09:24:04 -0700 (PDT)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH honister] kas/fvp-baser-aemv8r64: use honister as default
 branch
Date: Thu, 14 Oct 2021 17:23:56 +0100
Message-Id: <20211014162356.35519-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Oct 2021 16:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2270

Issue-Id: SCM-3532
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I05b529da0f5bbdcee038476d07c42f1b6ac0526f
---
 kas/fvp-baser-aemv8r64-bsp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index 5a45575..1ae05ed 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -6,7 +6,7 @@ machine: fvp-baser-aemv8r64
=20
 defaults:
   repos:
-    refspec: master
+    refspec: honister
=20
 repos:
   meta-arm:
--=20
2.25.1


