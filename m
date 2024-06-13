Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6736C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 16:21:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13101.1718295655337242018
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 09:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C951480;
	Thu, 13 Jun 2024 09:21:19 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.83.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D1443F73B;
	Thu, 13 Jun 2024 09:20:53 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH scarthgap 3/3] kas: update the layers SHAs
Date: Thu, 13 Jun 2024 17:20:41 +0100
Message-Id: <20240613162041.346761-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613162041.346761-1-abdellatif.elkhlifi@arm.com>
References: <20240613162041.346761-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Jun 2024 16:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5805

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

set the tested SHAs

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 045a5473..33f64f11 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -16,14 +16,14 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
-    # commit: 2e9c2a2381105f1306bcbcb54816cbc5d8110eff
+    commit: c5df9c829a549ca002c36afd6bdf23639831502e
     layers:
       meta:
       meta-poky:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    # commit: 1750c66ae8e4268c472c0b2b94748a59d6ef866d
+    commit: 6de0ab744341ad61b0661aa28d78dc6767ce0786
     layers:
       meta-oe:
       meta-python:
@@ -31,7 +31,7 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    # commit: e29165a1031dcf601edbed1733cedd64826672a5
+    commit: 13cb4867fb1245581c80da3b94b72c4b4f15d67e
     layers:
       meta-secure-core-common:
       meta-signing-key:
--=20
2.25.1


