Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0238C71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:47:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23904.1750052834757681626
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 15 Jun 2025 22:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DAC2175D;
	Sun, 15 Jun 2025 22:46:53 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.48.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901C83F673;
	Sun, 15 Jun 2025 22:47:13 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH walnascar 2/2] kas: corstone-1000: pin Yocto layer dependencies for CORSTONE1000-2025-05 release
Date: Mon, 16 Jun 2025 06:47:05 +0100
Message-Id: <20250616054705.4041036-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
References: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 05:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6552

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Set the tested SHAs of the dependent community layers from
the Walnascar branch of each layer.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-base.yml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index c36b294a..9f66b966 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: walnascar
=20
 repos:
   meta-arm:
@@ -16,14 +16,14 @@ repos:
=20
   poky:
     url: https://git.yoctoproject.org/git/poky
-    # commit: 5465094be9a61a1639e1dab6d2b4ebea2bee7440
+    commit: ee0d8d8a61d8e22a3dd00c32cde58ee6e8ec458f
     layers:
       meta:
       meta-poky:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    # commit: 461d85a1831318747af5abe86da193bcde3fd9b4
+    commit: 2169c9afcc0945045bea49f58011080942d4ddb4
     layers:
       meta-oe:
       meta-python:
@@ -31,7 +31,7 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    # commit: 59d7e90542947c342098863b9998693ac79352b0
+    commit: 423bc85b050594cc42fe3f2e0d0229960e70b94e
     layers:
       meta-secure-core-common:
       meta-signing-key:

