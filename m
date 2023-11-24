Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60465C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 15:08:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.138900.1700838484922083483
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 07:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15D791063;
	Fri, 24 Nov 2023 07:08:51 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.35.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774A33F73F;
	Fri, 24 Nov 2023 07:08:03 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/3] kas: corstone1000: pin the SHAs
Date: Fri, 24 Nov 2023 15:07:50 +0000
Message-Id: <20231124150750.81497-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124150750.81497-1-emekcan.aras@arm.com>
References: <20231124150750.81497-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 15:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5278

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Upgrade the Corstone-1000 YMLs as follows:

- Set the layers SHAs
- Align with Kas v4
- Update the layers list

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 11 ++++++-----
 kas/corstone1000-fvp.yml  |  2 +-
 kas/corstone1000-mps3.yml |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 5e4ae7e4..1ab65455 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 env:
   DISPLAY: ""
@@ -8,7 +8,7 @@ distro: poky-tiny
=20
 defaults:
   repos:
-    refspec: master
+    branch: nanbield
=20
 repos:
   meta-arm:
@@ -19,21 +19,22 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: 31dd418207f6c95ef0aad589cd03cd2a4c9a8bf2
+    commit: 2e9c2a2381105f1306bcbcb54816cbc5d8110eff
     layers:
       meta:
       meta-poky:
-      meta-yocto-bsp:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: 5a01ab461c9bcabcbb2298236602373948f8f073
+    commit: 1750c66ae8e4268c472c0b2b94748a59d6ef866d
     layers:
       meta-oe:
       meta-python:
+      meta-perl:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
+    commit: e29165a1031dcf601edbed1733cedd64826672a5
     layers:
       meta:
       meta-signing-key:
diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index b3e21cd4..abf40703 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - kas/corstone1000-base.yml
     - kas/fvp-eula.yml
diff --git a/kas/corstone1000-mps3.yml b/kas/corstone1000-mps3.yml
index 53be4382..7d63a185 100644
--- a/kas/corstone1000-mps3.yml
+++ b/kas/corstone1000-mps3.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - kas/corstone1000-base.yml
=20
--=20
2.25.1


