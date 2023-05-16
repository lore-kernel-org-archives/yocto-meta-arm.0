Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A20AC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:13:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26245.1684253629415854528
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 837A51FB;
	Tue, 16 May 2023 09:14:33 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.38.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1EBA3F7BD;
	Tue, 16 May 2023 09:13:47 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH mickledore] kas: corstone1000: set branches to mickledore
Date: Tue, 16 May 2023 17:13:38 +0100
Message-Id: <20230516161338.984470-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 May 2023 16:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4656

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

point poky/meta-openembedded to mickledore

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 6fda343b..6594caa5 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,7 +5,7 @@ distro: poky-tiny
=20
 defaults:
   repos:
-    refspec: master
+    refspec: mickledore
=20
 repos:
   meta-arm:
--=20
2.25.1


