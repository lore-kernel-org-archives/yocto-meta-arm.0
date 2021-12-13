Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F975C4321E
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:26:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13344.1639412792426074639
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAD5B1FB;
	Mon, 13 Dec 2021 08:26:30 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8276B3F73B;
	Mon, 13 Dec 2021 08:26:29 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 5/6] kas: corstone1000: update for new Kas include semantics
 in kas folder
Date: Mon, 13 Dec 2021 16:26:09 +0000
Message-Id: <20211213162610.31273-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
References: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:26:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2647

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

With Kas 2.6 included YAML files need to be relative to the repository,
not the including file:

https://kas.readthedocs.io/en/latest/format-changelog.html#version-11

Change-Id: I851c9137d1f70f754d1a70a1fc14828c39ff3de7
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 kas/corstone1000-fvp.yml  | 4 ++--
 kas/corstone1000-mps3.yml | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 31a92c4..faf2599 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
 
 distro: poky-tiny
 
diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index 0f6cde2..133749d 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - corstone1000-base.yml
+    - kas/corstone1000-base.yml
 
 repos:
   run-scripts:
diff --git a/kas/corstone1000-mps3.yml b/kas/corstone1000-mps3.yml
index 06e5962..53be438 100644
--- a/kas/corstone1000-mps3.yml
+++ b/kas/corstone1000-mps3.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - corstone1000-base.yml
+    - kas/corstone1000-base.yml
 
 machine: corstone1000-mps3
-- 
2.17.1


