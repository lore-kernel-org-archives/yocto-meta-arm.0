Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D1EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 16:52:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29844.1688662339355219136
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 09:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CE13D75;
	Thu,  6 Jul 2023 09:53:00 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.35.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7ACE3F762;
	Thu,  6 Jul 2023 09:52:16 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH mickledore] kas: set the SHAs for 2023.06 release
Date: Thu,  6 Jul 2023 17:52:08 +0100
Message-Id: <20230706165208.1288867-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 16:52:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4864

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

set poky and meta-openembedded SHAs

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 6594caa5..ea62f42c 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -16,6 +16,7 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
+    refspec: 31dd418207f6c95ef0aad589cd03cd2a4c9a8bf2
     layers:
       meta:
       meta-poky:
@@ -23,6 +24,7 @@ repos:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    refspec: 5a01ab461c9bcabcbb2298236602373948f8f073
     layers:
       meta-oe:
       meta-python:
--=20
2.25.1


