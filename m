Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F90C47088
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 13:37:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20286.1669210643186696662
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 05:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38DB623A;
	Wed, 23 Nov 2022 05:37:29 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.38.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D39D03F73D;
	Wed, 23 Nov 2022 05:37:21 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH langdale 1/1] kas/corstone1000-base.yml: set refspec for Corstone1000 release
Date: Wed, 23 Nov 2022 13:37:13 +0000
Message-Id: <20221123133713.561237-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123133713.561237-1-emekcan.aras@arm.com>
References: <20221123133713.561237-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 13:37:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4162

From: Emekcan Aras <Emekcan.Aras@arm.com>

Sets refspec for meta-openembedded and poky for upcoming
Corstone1000 release. These SHAs are tested.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 kas/corstone1000-base.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 5fe7f4da..19aeaa07 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -16,6 +16,7 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
+    refspec: 79434a17eb4835e85fcd477baec08c8ce49a4c14
     layers:
       meta:
       meta-poky:
@@ -23,6 +24,7 @@ repos:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    refspec: c5668905a6d8a78fb72c2cbf8b20e91e686ceb86
     layers:
       meta-oe:
       meta-python:
--=20
2.25.1


